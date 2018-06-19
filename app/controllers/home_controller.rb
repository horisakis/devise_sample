class HomeController < ApplicationController
  def index
    @auths = current_user.try(:auths)
  end
end
