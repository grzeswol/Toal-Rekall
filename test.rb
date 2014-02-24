require 'rubygems'
require 'sinatra'
require 'active_record'

ActiveRecord::Base.establish_connection

get '/' do
	"Hello World!, it is now #{Time.now}."
end

get '/hello/:name' do
	"Hello #{params['name']}!"
end

get '/say/*/to/*' do
	params[:splat]
end


get '/download/*.*' do |path, ext|
	[path, ext]
end
