class MoviesController < ApplicationController 
  # GET    /songs(.:format)     songs#index
  def index
      # render({:json => "hi"})

      # query_string = "SELECT * FROM songs;"
      # results = ActiveRecord::Base.connection.execute(query_string)
      # render json: results
      
      movies = Movie.all
      render json: {status: 200, movies: movies}
  end

  # GET    /songs/:id(.:format) songs#show
  def show
      puts "show route: params #{params}"
      song = Movie.find(params[:id])
      render json: {status: 200, song: song}
  end

  # POST   /movies(.:format)     songs
  def create
      puts "create route: params #{params[:movie]}"
      # song_params = {title: params[:title], artist_name: params[:artist_name], artwork: params[:artwork]}
      # Song.create(song_params)

      movie = Movie.new(movie_params)

      if movie.save
          render(status: 201, json: {status: 201, movie: movie})
      else 
          render(status: 422, json: {status: 422, movie: movie})
      end

  end

  def update
      movie = Movie.find(params[:id])
      movie.update(movie_params)
      render(status: 201, json: {status: 201, movie: movie})
  end

  def destroy
      movie = Movie.destroy(params[:id])
      render(status: 204, json: {status: 204})
  end

  private

  def movie_params
      params.require(:movie).permit(:title, :user_id)
  end

end