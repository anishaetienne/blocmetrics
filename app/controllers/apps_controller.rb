class AppsController < ApplicationController
  def index
    @apps = App.all
    @myapps = current_user.apps
    authorize @apps
  end

  def show
    @apps = App.find(params[:id])
  end

  def new
      @app = App.new
  end

  def create
    @app = App.new(params.require(:app).permit(:app_name, :url))
    @app.user = current_user
     if @app.save
       flash[:notice] = "App registered successfully!"
       redirect_to @app
     else
       flash[:error] = "There was an issue registering your app :("
       render :new
     end
  end


  def edit
  end
end
