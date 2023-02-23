class ApplicationController < Sinatra::Base

  set :default_content_type, 'application/json'

  get '/' do
    { message: "Hello world" }.to_json
  end

  get '/games' do
    games = Game.all.order(:title)
    games.to_json
  end

  get '/games_with_reviews' do
    games = Game.all.order(:title)
    games.to_json(include: :reviews)
  end

  get '/games/:id' do
    game = Game.find(params[:id])
    game.to_json(include: { reviews: { include: :user } })
  end

  # get '/games/:id' do
  #   game = if params[:id] == 'rand'
  #     Game.find(rand(1..50))
  #   else
  #     Game.find(params[:id])
  #   end
  #   game.to_json
  # end

end
