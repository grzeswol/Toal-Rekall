require 'sinatra'
require 'sinatra/activerecord'

set :database, "sqlite3:///tasks.db"

class Task < ActiveRecord::Base
end


get '/' do
	@tasks = Task.order("created_at DESC")
	@title = 'All notes'
	erb :index
end
