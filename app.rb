require 'sinatra'
require 'sinatra/activerecord'
require 'rack-flash'

enable :sessions
use Rack::Flash

set :database, "sqlite3:///tasks.db"

class Task < ActiveRecord::Base
end


get '/' do
	@tasks = Task.order("created_at DESC")
	@title = 'All notes'
	erb :index
end


post '/' do
	t = Task.new
	t.content = params[:content]
	t.created_at = Time.now
	t.updated_at = Time.now
	t.save
	redirect '/'
end

get '/:id' do
	begin
	@task = Task.find params[:id]
	@title = "Edit Note ##{params[:id]}"
	erb :edit

  rescue ActiveRecord::RecordNotFound
		flash[:error] = "Note not found!"
		redirect '/' 
	end
end


put '/:id' do
	t = Task.find params[:id]
	t.content = params[:content]
	t.complete = params[:complete] ? 1 : 0
	t.updated_at = Time.now
	t.save
	redirect '/'
end


get '/:id/delete' do
	@task = Task.find params[:id]
	@title = "Confirm deletion of note ##{params[:id]}"
	erb :delete
end


delete '/:id' do
	t = Task.find params[:id]
	t.destroy
	redirect '/'
end

get '/:id/complete' do
	t = Task.find params[:id]
	t.complete = t.complete ? 0 : 1
	t.updated_at = Time.now
	t.save
	redirect '/'
end

get '/*' do
  redirect '/'
end


helpers do
	def flash_types
		[:success, :notice, :error, :warning]
	end
end
