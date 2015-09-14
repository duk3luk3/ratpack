class SystemsController < ApplicationController
  
  def index
  end

  def import
    SystemImportWorker.perform_async
    redirect_to action: 'index', notice: 'import scheduled'
  end

  def search
    search_term = params[:term].downcase
    systems = System.where('name like ?', "#{params[:term]}%").limit(10).pluck(:name)
    puts "SYSTEMS: #{systems.to_json}"
    render json: systems.to_json
  end

  def show
    @system = System.find params[:id]
  end

end
