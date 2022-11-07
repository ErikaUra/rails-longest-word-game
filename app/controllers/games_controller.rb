require 'open-uri'

class GamesController < ApplicationController
  def new
    @letters = ('a'..'z').to_a.sample(10)
  end

  def score
    @word = params[:word]
    url = "https://wagon-dictionary.herokuapp.com/#{@word}"
    doc = URI.open(url).read
    doc = JSON.parse(doc)
    @found = doc['found']
    @letters = params[:letters].split
    @included = @word.chars.all? { |letter| @letters.include?(letter) }
  end
end
