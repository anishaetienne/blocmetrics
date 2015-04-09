class AppsController < ApplicationController
  def index
    @apps = App.all
    authorize @apps
  end

  def show
    @apps = App.find(params[:id])
  end

  def new
  end

  def edit
  end
end
