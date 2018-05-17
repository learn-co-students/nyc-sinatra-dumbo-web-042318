class FiguresController < ApplicationController

  get '/figures/new' do
    @titles = Title.all
    @landmarks = Landmark.all
    erb :'figures/new'
  end

  get '/figures' do
    @figures = Figure.all
    erb :'figures/index'
  end

  post '/figures' do
    figure = Figure.create(params["figure"])

    #Titles
    if params["figure"]["title_ids"]
      params["figure"]["title_ids"].each do |id|
        id_obj = Title.find(id)
        figure.titles << id_obj
      end
    end
    if !params["title"]["name"].empty?
      title = Title.create(params["title"])
      figure.titles << title
    end

    #Landmarks
    if params["figure"]["landmark_ids"]
      params["figure"]["landmark_ids"].each do |id|
        id_obj = Landmark.find(id)
        figure.landmarks << id_obj
      end
    end
    if !params["landmark"]["name"].empty?
      landmark = Landmark.create(params["landmark"])
      figure.landmarks << landmark
    end
    redirect "/figures"
  end

  get '/figures/:id' do
    @figure = Figure.find(params["id"])
    erb :'figures/show'
  end

  get '/figures/:id/edit' do
    @figure = Figure.find(params["id"])
    @titles = Title.all
    @landmarks = Landmark.all
    erb :'figures/edit'
  end

  patch '/figures/:id' do
    figure = Figure.find(params["id"])

    figure.update(params["figure"])

    #Titles
    if params["figure"]["title_ids"]
      params["figure"]["title_ids"].each do |id|
        if !figure.titles.include?(id)
          id_obj = Title.find(id)
          figure.titles << id_obj
        end
      end
    end
    if !params["title"]["name"].empty?
      title = Title.create(params["title"])
      figure.titles << title
    end

    #Landmarks
    if params["figure"]["landmark_ids"]
      params["figure"]["landmark_ids"].each do |id|
        if !figure.landmarks.include?(id)
          id_obj = Landmark.find(id)
          figure.landmarks << id_obj
        end
      end
    end
    if !params["landmark"]["name"].empty?
      landmark = Landmark.create(params["landmark"])
      figure.landmarks << landmark
    end

    redirect "figures/#{figure.id}"
  end

end
