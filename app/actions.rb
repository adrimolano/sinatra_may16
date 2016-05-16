# Homepage (Root path)
get '/' do
  erb :index
end

get '/songs' do
  @songs = song.all
  erb :'songs/index'
end

get '/songs/new' do
  @song = song.new
  erb :'songs/new'
end

get '/songs/:id' do
  @song = song.find params[:id]
  erb :'songs/show'
end

post '/songs' do
  @song = song.new(
    title:   params[:title],
    url: params[:url],
    author:  params[:author]
  )
  if @song.save
    redirect '/songs'
  else
    erb :'songs/new'
  end
end