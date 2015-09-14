class RequestsController < ApplicationController

  def new
  end

  def create
    @system = System.where(name: params['system-search']).first
    unless @system.nil?
      @request = Request.new(request_params)
      @request.system = @system
      @request.save
      redirect_to action: 'index'
    else
      redirect_to action: 'index', alert: 'System not found!'
    end
  end

  def index
    @requests = Request.all
  end

  private 

  def request_params
    params.require(:request).permit(
      :cmdr_name,
      :platform, 
      :oxygen_timer
      )
  end

end
