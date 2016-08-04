require 'sinatra'
require 'make_todo'

	
def tasks_by_state(state)
  completed_task = []	
  Tarea.all.each do |task|
    completed_task << task if task.fetch('done') == state  
  end
  completed_task
end

def join_tasks
 tasks_completed = tasks_by_state(true)
 tasks_incompleted = tasks_by_state(false)	
 tasks_incompleted.concat tasks_completed
end


get '/' do
 @tasks = join_tasks
 erb:index
end

post '/done' do 
 Tarea.update(params[:id]) #Actualiza el estado de las tareas(id)
 @tasks = join_tasks
 erb:index
end



