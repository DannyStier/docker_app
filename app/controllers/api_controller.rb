class ApiController < ApplicationController

  def index
    api = Api.new

    test_request = Rails.root.to_s + '/doc/examples/request.xml'
    doc =  Nokogiri::XML(File.open(test_request))
    hmac = doc.xpath("//com:SharedSecret").text
    customer = doc.xpath("//com:CustomerNumber").text
    @result = api.is_authorized?(customer, hmac)
    # @result = 
  end

end
