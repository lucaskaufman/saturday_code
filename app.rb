require 'sinatra'
require 'sinatra/reloader'

get '/' do
  erb :index
end

get '/login' do
  @username = params[:username]
  @password = params[:password]
  if @username == 'Lucas'
    if @password == 'welcome'
      redirect "/name?name=Lucas&state=Oregon"
    else
      @error = "Wrong Password"
      erb :index
    end
  else
    @error = "Wrong username"
    erb :index
  end
end

post "/login" do
  @username = params[:username]
  @password = params[:password]
  if @username== 'Lucas'
    if @password == 'welcome'
      erb :home 
    else
      @error = "stupid idiot"
      erb :index
    end 
  else
    @error = "thats not the right name"
  end
end
      
      
get '/name' do
  @name = (params[:name] || "Nobody")
  @state = params[:state]
  if @name == "collin"
    redirect 'http://www.youtube.com/watch?v=oHg5SJYRHA0'
  else
    erb :name
  end
end

