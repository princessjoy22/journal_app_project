class MainController < ApplicationController
  before_action :authenticate_user!

  def home
    @categories = current_user.categories
  end
end
