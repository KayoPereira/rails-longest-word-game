require "open-uri"
require "json"

class GamesController < ApplicationController
  def new
    @letters = ('a'..'z').to_a.sample(10)
  end

  def score
    @user_score = params[:value]
    response = open("https://wagon-dictionary.herokuapp.com/#{@user_score}")
    @json = JSON.parse(response.read)
    @json['found']
    @json['word']
  end
end
