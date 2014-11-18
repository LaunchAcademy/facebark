require 'sinatra'
require 'sinatra/reloader'
require 'pry'

def dogs
  [
    { name: 'Sparky', avatar_url: 'http://nextranks.com/data_images/dogs/shiba-inu/shiba-inu-07.jpg' },
    { name: 'Adam', avatar_url: 'http://s3-ec.buzzfed.com/static/enhanced/webdr01/2013/8/13/18/anigif_enhanced-buzz-8167-1376431763-2_preview.gif' },
    { name: 'Dog Bear 2', avatar_url: 'http://puppydogweb.com/gallery/shibainus/shibainu_savage.jpg' },
    { name: 'Dog Bear 3', avatar_url: 'http://www.notinthedoghouse.com/wp-content/uploads/2013/09/Shiba-Inu_5246a1173aed9.jpg' }
  ]
end

get '/' do
  @dogs = dogs

  erb :index
end

get '/dogs/:name' do
  name = params[:name]

  @dog = dogs.find do |dog|
    dog[:name] == name
  end

  erb :dog
end
