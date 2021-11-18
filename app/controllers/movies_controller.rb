class MoviesController < ApplicationController
  def index
    @movies = Movie.all
    @movies = @movies.select { |movie| movie.title.downcase.include? params[:search].downcase } if params[:search]
    @title = params[:search] ? "Movies containing '#{params[:search].downcase}'" : 'All movies'
  end
end
