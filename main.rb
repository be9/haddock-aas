require 'rubygems'
require 'bundler/setup'
require 'sinatra'
require 'haddock'

class HaddockAsAService < Sinatra::Base
  include Haddock

  get '/' do
    "Use GET #{request.url}password to generate password with default length (8) or GET #{request.url}password/LENGTH to customize length"
  end

  get '/password/?:length?' do
    generate_password((params[:length] || 8).to_i)
  end

  def generate_password(length)
    Password.generate(length)
  end
end
