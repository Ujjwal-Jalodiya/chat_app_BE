class Message < ApplicationRecord
  belongs_to :chat
  belongs_to :user

  validates :content, presence: true

  # Broadcast the message to the chat channel after it is created
  after_create_commit :broadcast_message

  private

  def broadcast_message
    # Broadcasting the message to the associated chat's channel
    MessagesChannel.broadcast_to(
      chat,
      {
        message_id: id,
        content: content,
        user_id: user_id,
        created_at: created_at
      }
    )
  end
end
