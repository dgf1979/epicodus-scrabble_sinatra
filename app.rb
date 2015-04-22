require('sinatra')
require('sinatra/reloader')
require('./lib/scrabble')
also_reload('lib/**/*.rb')

get('/') do
  erb(:index)
end

get('/scrabble') do
  @scrabble_word = params.fetch('scrabble_box').scrabble()
  erb(:score)
end
