class PagesController < ApplicationController
  before_action :authenticate_usuario!, :only => :secret

  def welcome
  end

  def secret
  end
end
