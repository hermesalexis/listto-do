require 'sinatra'
require 'make_todo'

get '/' do
 @tasks = Tarea.all
 erb:index

end