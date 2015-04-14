class AppsController < ApplicationController
  def index
    @apps = App.all
    @myapps = current_user.apps
    authorize @apps
  end

  def show
    @apps = App.find(params[:id])
    @events = @apps.events
    @grouped = @events.group(:event_name).count
  end

  def new
      @app = App.new
      authorize @app
  end

  def create
    @app = App.new(app_params)
    @app.user = current_user
    authorize @app
     if @app.save
       flash[:notice] = "App registered successfully!"
       redirect_to @app
     else
       flash[:error] = "There was an issue registering your app :("
     end
  end


  def edit
  end

  def destroy 
    @app = App.find(params[:id])
    name = @app.app_name
    authorize @app
    if @app.destroy
       flash[:notice] = "#{name} successfully!"
       redirect_to @app
     else
       flash[:error] = "There was an issue deleting #{name}"
     end
  end

  


  private

  def app_params
    params.require(:app).permit(:app_name, :url)
  end



end
