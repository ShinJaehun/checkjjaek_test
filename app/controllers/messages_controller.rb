class MessagesController < ApplicationController
  before_action :set_message

  def new
    @message = Message.new
    @message.posts.new
  end

  def create
    @message = Message.create(
      sender_id: message_params[:sender_id],
      receiver_id: message_params[:receiver_id])
    post = @message.posts.new(content: message_params[:posts_attributes]['0'][:content])
    post.user_id = message_params[:posts_attributes]['0'][:user_id]
    post.save

    redirect_to root_path
  end

  private

  def set_message
  end

  def message_params
    params.require(:message).permit(:sender_id, :receiver_id, posts_attributes: [:user_id, :content])
  end
end
