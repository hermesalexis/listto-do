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
 tasks_by_state(false).concat tasks_by_state(true) 	
end


get '/' do
 @tasks = join_tasks
 erb:index
end

post'/create' do
 Tarea.create(params[:task])
 @tasks = join_tasks
 erb:index
end

patch '/done' do 
 Tarea.update(params[:id]) #Actualiza el estado de las tareas(id)
 @tasks = join_tasks
 erb:index
end

delete '/delete' do
 Tarea.destroy(params[:id]) #Elimina Tarea
 @tasks = join_tasks
 erb:index
end



