class API::EventsController < ApplicationController

  skip_before_action :verify_authenticity_token

  def create
    app = App.find_by(url: request.env['HTTP_ORIGIN'])

    if !app
      render json: "Unregistered application", status: :unprocessable_entity
    else
      @event = app.events.new(event_params)
      if @event.save
        render json: @event, status: :created
      else
        render @event.errors, status: :unprocessable_entity
      end
    end
  end


  private

  def event_params 
    params.require(:event).permit(:event_name)
  end


end

