class FiguresController < ApplicationController
  set :views, Proc.new { File.join(root, "../views/figures") }
  get '/figures' do
    @figures = Figure.all
    erb :index
  end

  get '/figures/:id' do
    @figure = Figure.find(params[:id])
    erb :show
  end

end
