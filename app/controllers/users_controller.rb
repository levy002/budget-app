# frozen_string_literal: true

class UsersController < ApplicationController
  def index
    @user = current_user
  end
end
