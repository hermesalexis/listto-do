require 'sinatra'
require 'make_todo'

get '/' do
 @tasks = Tarea.all #Recovery all tasks in a array of hashes
 erb:index
end

post '/done' do 
 Tarea.update(params[:id]) #update state of task (id)
 @tasks = Tarea.all #Recovery all tasks whit the new state
 erb:index
end