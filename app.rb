require 'sinatra'
require 'sinatra/activerecord'

set :database, "sqlite3://tasks.db"

class Task < ActiveRecord::Base
end

