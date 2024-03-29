class RequestsController < ApplicationController

  def new
  end

  def create
    @system = System.where(name: params['system-search']).first
    unless @system.nil?
      @request = Request.new(request_params)
      @request.system = @system
      @request.save
      redirect_to @request
    else
      redirect_to action: 'index', alert: 'System not found!'
    end
  end

  def index
    @requests = Request.all
  end

  def show
    @request = Request.find params[:id]
  end

  def search
    @request = Request.where(cmdr_name: params[:search]).first
    unless @request.nil?
      response = {
        id: @request.id,
        cmdr_name: @request.cmdr_name,
        system: @request.system.name,
        platform: @request.platform,
        emergency: @request.oxygen_timer,
        request_id: @request.id
      }
      render json: response.to_json, status: 200
    else
      render json: [].to_json, status: 404
    end
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
