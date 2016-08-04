require 'sinatra'
require 'make_todo'

def tasks_by_state(state)
  completed_task = []	
  Tarea.all.each do |task|
    completed_task << task if task.fetch('done') == state  
  end
  completed_task
end


get '/' do
 @tasks = Tarea.all #Recovery all tasks in a array of hashes
 erb:index
end

post '/done' do 
 Tarea.update(params[:id]) #update state of task (id)
 @tasks = Tarea.all #Recovery all tasks whit the new state
 erb:index
end

