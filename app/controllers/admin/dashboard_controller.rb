class Admin::DashboardController < ApplicationController
  
  include HttpAuthConcern

  http_basic_authenticate_with name: ENV['username'], password: ENV['password']

  def show
  end
end
