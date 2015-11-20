module GenomeApi
  # Your code goes here...
  class Client
    include HTTParty
    base_uri ENV['GENOME_API_URL']
    format :json

    def initialize(token = nil)
      token ||= ENV['GENOME_API_TOKEN']
      self.class.headers({ 'Authorization' => "Bearer #{token}"})
    end

    def user(id)
      self.class.get("/users/#{id}")
    end

    def create_user()
      self.class.post("/users")
    end
  end
end
