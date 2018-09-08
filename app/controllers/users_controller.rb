class UsersController < ApplicationController
  set_tab :users

  def index
    @users = User.all
  end
end
