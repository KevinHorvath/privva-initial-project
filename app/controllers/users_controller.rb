class UsersController < ApplicationController
  set_tab :users

  def index
    @users = User.includes(:reported_issues, :assigned_issues)
  end
end
