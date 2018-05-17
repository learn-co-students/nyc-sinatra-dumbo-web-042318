class FiguresController < ApplicationController
  set :views, Proc.new { File.join(root, "../views/figures") }
  #index
  get '/figures' do
    @figures = Figure.all
    erb :index
  end
  #show
  get '/figures/:id' do
    @figure = Figure.find(params[:id])
    erb :show
  end
 
#   new
#   GET
#   ‘/posts/new’
#   displays create post form
#
# create
#   POST
#   ‘/posts’
#   creates one blog post
#
# edit
#   GET
#   ‘/posts/:id/edit’
#   displays edit form based on ID in the url
#
# edit
#   PATCH
#   ‘/posts/:id’
#   edits an existing blog post based on ID in the url
#
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
