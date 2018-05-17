class FiguresController < ApplicationController
  # index
  get '/figures' do
    @figures = Figure.all
    erb :'figures/index'
  end

  # new
  get '/figures/new' do
    @titles = Title.all
    @landmarks = Landmark.all
    erb :'figures/new'
  end

  # show
  get '/figures/:id' do
    @figure = Figure.find(params["id"])
    erb :'figures/show'
  end

  # edit
  get '/figures/:id/edit' do
    @figure = Figure.find(params["id"])
    erb :'figures/edit'
  end

  # create
  post '/figures' do
    binding.pry
    figure = Figure.create(params["figure"])
    redirect "figures/#{figure.id}"
  end

  # update
  patch '/figures/:id' do
    @figure = Figure.find(params["id"])
    @figure.update(clean_params["figure"])
    redirect "figures/#{@figure.id}"
  end


  # delete
  delete '/figures/:id' do
    @figure = Figure.find(params["id"])
    @figure.destroy
    redirect '/figures'
  end

  private

  def clean_params
    copy = params.dup
    copy.delete "_method"
    copy.delete "id"
    copy
  end
end
