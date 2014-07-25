class MagicSeaweed
  def self.find(spot_id)
    response = conn.get('/api/YE1dPQ2jRB4k2z8K8O72g2AW05E1XhK4/forecast', { spot_id: spot_id })
    response.body
  end

  private

  def self.conn
    @conn ||= Faraday.new(:url => 'http://magicseaweed.com') do |faraday|
      faraday.request  :url_encoded             # form-encode POST params
      faraday.response :logger                  # log requests to STDOUT
      faraday.adapter  Faraday.default_adapter  # make requests with Net::HTTP
    end
  end
end
