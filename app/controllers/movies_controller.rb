class MoviesController < ApplicationController
  def index
    filter = { gender_id: params[:gender] } if params[:gender]
    filter = { director_id: params[:director] } if params[:director]
    @movies = Movie.where(filter)    
  end
  
  def show
    @movie = Movie.find(params[:id])
  end
  
  def new
    @movie = Movie.new
  end

  def create
    @movie = Movie.new(title: params[:movie][:title],
                      release_year: params[:movie][:release_year], 
                      synopsis: params[:movie][:synopsis], 
                      country_of_origin: params[:movie][:country_of_origin], 
                      duration: params[:movie][:duration], 
                      director_id: params[:movie][:director_id], 
                      gender_id: params[:movie][:gender_id]
    )

    if @movie.save 
      return redirect_to movie_path(@movie.id)
    else  
      render :new
    end
  end

  def edit
    @movie = Movie.find(params[:id])    
  end

  def update
    @movie = Movie.find(params[:id])

    if @movie.update(title: params[:movie][:title],
                    release_year: params[:movie][:release_year], 
                    synopsis: params[:movie][:synopsis], 
                    country_of_origin: params[:movie][:country_of_origin], 
                    duration: params[:movie][:duration], 
                    director_id: params[:movie][:director_id], 
                    gender_id: params[:movie][:gender_id])
    
      return redirect_to movie_path
    end

    render :edit
  end

  def destroy
    @movie = Movie.find(params[:id])
    @movie.destroy   
    redirect_to movies_path
  end
end