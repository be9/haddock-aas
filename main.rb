require 'rubygems'
require 'bundler/setup'
require 'sinatra'
require 'haddock'

Haddock::Password.diction = File.expand_path('../data/words', __FILE__)

class HaddockAsAService < Sinatra::Base
  include Haddock

  get '/' do
    "Use GET #{request.url}password to generate password with default length (12) or GET #{request.url}password/LENGTH to customize length"
  end

  get '/password/?:length?' do
    begin
      generate_password((params[:length] || 12).to_i)
    rescue Haddock::Password::LengthError
      [400, {}, "Invalid length (must be 8..31)"]
    end
  end

  def generate_password(length)
    Password.generate(length)
  end
end
