class GamesController < ApplicationController

  def index
    @games = Game.all
  end

  def show
    @game = Game.find_by(id: params[:id])
  end


  def new
  end

  def create
    @game = Game.create(
                name: params[:name],
                city: params[:city],
                house: params[:house])
                
    redirect_to "/characters/#{@game['id']}"
  end

  def edit
    @game = Unirest.get("http://localhost:3000/api/v1/characters/#{params[:id]}.json").body
  end

  def update
    @game = Game.find_by(id: params[:id])
    @game.update

    redirect_to "/characters/#{@game['id']}"
  end

  def destroy
    @game = Game.find_by(id: params[:id])
    @game.destroy
    redirect_to '/characters'

  end

end
