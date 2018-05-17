class LandmarksController < ApplicationController
  set :views, Proc.new { File.join(root, "../views/landmarks") }
  #index
  get '/landmarks' do
    @landmarks = Landmark.all
    erb :index
  end

  #   new
  #   GET
  #   ‘/posts/new’
  #   displays create post form

  get '/landmarks/new' do
    # view shouldn't interact directly with models
    @titles = Title.all
    @landmarks = Landmark.all

    erb :new
  end

  #show
  get '/landmarks/:id' do
    @landmark = Landmark.find(params["id"])
    erb :show
  end

  # create
  #   POST
  #   ‘/posts’
  #   creates one blog post
  post '/landmarks' do
    @landmark = Landmark.create(params["landmark"])

    redirect "/landmarks/#{@landmark.id}"
  end

  # edit
  #   GET
  #   ‘/posts/:id/edit’
  #   displays edit form based on ID in the url

  get '/landmarks/:id/edit' do
    @landmark = Landmark.find(params["id"])

    erb :edit
  end
  # edit
  #   PATCH
  #   ‘/posts/:id’
  #   edits an existing blog post based on ID in the url
  #

  patch '/landmarks/:id' do
    @landmark = Landmark.find(params["id"])
    @landmark.update(params["landmark"])

    redirect "/landmarks/#{@landmark.id}"
  end

  # update
  #   GET
  #   ‘/posts/:id/update’
  #   displays update form blog post based on ID in the url
  #
  # update
  #   PUT
  #   ‘/posts/:id’
  #   replaces an existing blog post based on ID in the url
  #
  # delete
  #   DELETE
  #   ‘/posts/:id/delete’
  #   deletes one blog post based on ID in the url

end
