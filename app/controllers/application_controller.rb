require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    set :method_override, true 
  end

  get "/" do
    
    erb :welcome
    

  end

  get '/artists' do
    @artists = Artist.all
    erb :index
    

  end
  
  get '/artists/new' do 
    erb :new

  end 
  get '/artists/:id' do 
    
    @artists = Artist.find(params[:id])
    erb :show
      
  end 

  post '/artists' do 
   @artists = Artist.create(params)
   redirect("/artists/#{@artists.id}")
  end
   
  get '/artists/:id/edit' do 

  @artists = Artist.find(params[:id])
   erb :edit
end 

patch '/artists/:id' do

@artists = Artist.find(params[:id])
@artists.update(params[:artistInformation])
redirect "/artists"

end 

delete "/artists/:id" do 

@artists = Artist.find(params[:id])
@artists.destroy
redirect "/artists"
end 

end
