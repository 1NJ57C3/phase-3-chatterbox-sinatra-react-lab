class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'
  
  # Add routes
  get '/messages' do
    Message.order(:created_at).to_json
  end

  post '/messages' do
    new_msg = Message.create(body: params[:body], username: params[:username])
    new_msg.to_json
  end

  patch '/messages/:id' do
    edit_msg = Message.find(params[:id])
    edit_msg.update(body: params[:body])
    edit_msg.to_json
  end

  delete '/messages/:id' do
    del_msg = Message.find(params[:id]).delete
  end
  
end
