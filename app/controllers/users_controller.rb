class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @title = @user.name
  end
  def index
    @tile = 'User Index'
    @all = User.all
  end
  def new
    @title = "Sign up"
  end
end
