class WelcomeController < ApplicationController
  def index
        @apps = App.all
  end

  def about
  end

  def faq
  end

  def contact
  end
end
