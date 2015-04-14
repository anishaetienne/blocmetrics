class API::EventsController < ApplicationController

  skip_before_action :verify_authenticity_token

  def create
    app = App.find_by(url: request.env['HTTP_ORIGIN'])
  end


  private

  def event_params 
    params.require(:event).permit(:event_name)
  end


end