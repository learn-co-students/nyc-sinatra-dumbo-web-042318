class LandmarksController < ApplicationController
  # index
  get '/landmarks' do
    @landmarks = Landmark.all
    erb :'landmarks/index'
  end

  # new
  get '/landmarks/new' do
    erb :'landmarks/new'
  end

  # show
  get '/landmarks/:id' do
    @landmark = Landmark.find(params["id"])
    erb :'landmarks/show'
  end

  # edit
  get '/landmarks/:id/edit' do
    @landmark = Landmark.find(params["id"])
    erb :'landmarks/edit'
  end

  # create
  post '/landmarks' do
    landmark = Landmark.create(params["landmark"])
    redirect "landmarks/#{landmark.id}"
  end

  # update
  patch '/landmarks/:id' do
    @landmark = Landmark.find(params["id"])
    @landmark.update(clean_params["landmark"])
    redirect "landmarks/#{@landmark.id}"
  end


  # delete
  delete '/landmarks/:id' do
    @landmark = Landmark.find(params["id"])
    @landmark.destroy
    redirect '/landmarks'
  end

  private

  def clean_params
    copy = params.dup
    copy.delete "_method"
    copy.delete "id"
    copy
  end
end
