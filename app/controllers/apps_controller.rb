class AppsController < ApplicationController
  def index
    @apps = App.all


  end

  def show
  end

  def new
  end

  def edit
  end
end
