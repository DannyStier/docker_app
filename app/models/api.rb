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

  def parse_soap_payload
  end
end