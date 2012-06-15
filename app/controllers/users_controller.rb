class UsersController < ApplicationController
  def show
    @title = 'View User'
    @user = User.find(params[:id])
  end
  def index
    @tile = 'User Index'
    @all = User.all
  end
  def new
    @title = "Sign up"
  end
end
