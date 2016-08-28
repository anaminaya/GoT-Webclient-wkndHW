class Game
  attr_accessor :id, :name, :house, :city

  def initialize(input)
    @id = input["id"]
    @name = input["name"]
    @house = input["house"]
    @city = input["city"]

  end

  def self.find_by(options)
    game_hash = Unirest.get("http://localhost:3000/api/v1/characters/#{options[:id]}.json").body
    Game.new(game_hash)
  end

  def self.all
    api_got = Unirest.get('http://localhost:3000/api/v1/characters.json').body
    games = []
    api_got.each do |api_got|
      games << Game.new(api_got)
    end
    games
  end

  def create
    @game = Unirest.post('http://localhost:3000/api/v1/characters',
    headers: {"Accept" => "application/json"},
    parameters: {name: params[:name],
                city: params[:city],
                house: params[:house]
              }
    ).body
  end

  def update
    @game = Unirest.patch('http://localhost:3000/api/v1/characters/' + id.to_s,
    headers: {"Accept" => "application/json"},
    parameters: {name: params[:name],
                city: params[:city],
                house: params[:house]
              }
    ).body
  end

  def destroy
    Unirest.delete('http://localhost:3000/api/v1/characters/' + id.to_s,
    headers: {"Accept" => "application/json"}
    ).body
  end


end
