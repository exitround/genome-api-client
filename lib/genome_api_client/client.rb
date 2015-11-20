module GenomeApi
  class Client
    include HTTParty
    base_uri ENV['GENOME_API_URL']
    format :json

    def initialize(token = nil)
      token ||= ENV['GENOME_API_TOKEN']
      self.class.headers({ 'Authorization' => "Bearer #{token}"})
    end

    def user
      self.class.get('/user').parsed_response
    end

    def users(id = nil)
      self.class.get("/users/#{id}").parsed_response
    end

    def create_user(params = {})
      self.class.post('/users', body:params).parsed_response
    end
  end
end
