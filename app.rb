require 'sinatra'
require 'sinatra/reloader'
require 'koala'

get '/' do
  erb :index
end

get '/login' do
  @username = params[:username]
  @password = params[:password]

end

post "/login" do
  @username = params[:username]
  @password = params[:password]
  if @username== 'Lucas'
    if @password == 'welcome'
      erb :secrets
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

get '/secrets' do
  return redirect '/' unless session[:user]
  @graph = Koala::Facebook::API.new
  @picture = @graph.get_picture('lucaskaufman.92')
  erb :secrets
end