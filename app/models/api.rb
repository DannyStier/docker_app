class Api

  def is_authorized?(customer, hmac_hash)
    secret = 'test'
    timestamp, hmac_hash = hmac_hash.split(':')

    digest = OpenSSL::Digest.new('sha256')
    our_hash = OpenSSL::HMAC.hexdigest(digest, secret, timestamp + customer)
    if our_hash == hmac_hash
      return true
    else
      return false
    end
  end

  def message_type?
    test_request = Rails.root.to_s + '/doc/examples/request.xml'
    doc =  Nokogiri::XML(File.open(test_request))
    # hmac = doc.xpath("pa:GetPriceAndAvailability")
  end
end