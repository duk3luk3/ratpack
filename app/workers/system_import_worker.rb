require "net/https"

class SystemImportWorker
  include Sidekiq::Worker

  DATA_SOURCE = URI('http://eddb.io/archive/v3/systems.json')

  def perform
    Net::HTTP.start(DATA_SOURCE.host, DATA_SOURCE.port) do |http|
      request = Net::HTTP::Get.new DATA_SOURCE
      response = http.request request
      data = JSON.parse(response.body)
      data.each do |system|
        imported_system = System.new(system)
        imported_system.api_id = system[:id]
        imported_system.api_updated_at = system[:updated_at]
        imported_system.save
      end
    end
  end
end