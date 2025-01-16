class ChatsController < ApplicationController
  before_action :set_chat, only: %i[ show ]

  def index
    convo = current_user.chats
    render json: ChatSerializer.new(convo, { params: { current_user: current_user } }).serializable_hash, status: :ok
  end

  def show
    render json: ChatSerializer.new(@chat, { params: { current_user: current_user } }).serializable_hash, status: :ok if @chat.present?
  end

  private
    def set_chat
      @chat = Chat.find_by(id: params[:id])
    end

    def chat_params
      params.fetch(:chat, {})
    end
end
