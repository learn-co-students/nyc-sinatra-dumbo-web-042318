class FiguresController < ApplicationController
  #set :views, Proc.new { File.join(root, "../views/figures") }
  #index
  get '/figures' do
    @figures = Figure.all
    erb :'figures/index'
  end

  #   new
  #   GET
  #   ‘/posts/new’
  #   displays create post form

  get '/figures/new' do
    # view shouldn't interact directly with models
    @titles = Title.all
    @landmarks = Landmark.all

    erb :'figures/new'
  end

  #show
  get '/figures/:id' do
    @figure = Figure.find(params["id"])
    erb :'figures/show'
  end

  # create
  #   POST
  #   ‘/posts’
  #   creates one blog post
  post '/figures' do
    @figure = Figure.create(params["figure"])

    unless params["title"]["name"].empty?
      @title = Title.create(params["title"])
      FigureTitle.create(figure: @figure, title: @title)
    end

    unless params["landmark"]["name"].empty?
      @landmark = Landmark.create(params["landmark"])
      @figure.landmarks << @landmark
    end

    redirect "/figures/#{@figure.id}"
  end

  # edit
  #   GET
  #   ‘/posts/:id/edit’
  #   displays edit form based on ID in the url

  get '/figures/:id/edit' do
    @figure = Figure.find(params["id"])
    @landmarks = Landmark.all
    @titles = Title.all

    erb :'figures/edit'
  end
  # edit
  #   PATCH
  #   ‘/posts/:id’
  #   edits an existing blog post based on ID in the url
  #

  patch '/figures/:id' do
    @figure = Figure.find(params["id"])
    @figure.update(params["figure"])

    unless params["title"]["name"].empty?
      @title = Title.create(params["title"])
      FigureTitle.create(figure: @figure, title: @title)
    end

    unless params["landmark"]["name"].empty?
      @landmark = Landmark.create(params["landmark"])
      @figure.landmarks << @landmark
    end
    redirect "/figures/#{@figure.id}"
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
  delete '/figures/:id/delete' do
    figure = Figure.find(params[:id])
    figtitles = FigureTitle.all.select do |figtitle|
      figtitle.figure == figure
    end
    FigureTitle.destroy(figtitles)
    figure.destroy
    redirect "/figures"
  end

end
