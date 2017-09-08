require "sinatra"
require "pry"
require "CSV"

set :bind, '0.0.0.0'

get '/' do
  redirect '/grocery-list'
end

get '/grocery-list' do
  @list_items = CSV.readlines("grocery_list.csv", headers: true)
  erb :grocery_list
end


post '/grocery-list' do
  @name = params['Name']
  if @name.strip.empty?
    redirect '/'
    else
    CSV.open('grocery_list.csv', 'a') do |csv|
      csv << [@name]
    end
  end
  redirect '/'
end
