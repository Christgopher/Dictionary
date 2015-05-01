require('sinatra')
require('sinatra/reloader')
also_reload('lib/**/*.rb')
require('./lib/word')
require('./lib/definition')

get('/') do
  erb(:index)
end

get('/words/new') do
  erb(:word_form)
end

get('/words') do
  @words = Word.all()
  erb(:words)
end

post('/words') do
  word = params.fetch('word')
  @word = Word.new(:word => word)
  @word.save()
  @words = Word.all
  erb(:success)
end

get('/words/:id') do
  @word = Word.find(params.fetch('id').to_i())
  erb(:word)
end

post('/definition') do
  word = Word.find(params.fetch('word_id').to_i())
  definition_here = params.fetch('definition')
  definition = Definition.new(:definition => definition_here)
  word.add_definition(definition)
  erb(:success2)
end
