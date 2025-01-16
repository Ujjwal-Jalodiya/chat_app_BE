class MessagesChannel < ApplicationCable::Channel
  def subscribed
    # Stream from a unique channel for the chat
    chat = Chat.find(params[:chat_id])
    stream_for chat
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
