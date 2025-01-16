class ChatSerializer
  include JSONAPI::Serializer
  attributes :id, :user1_id, :user2_id

  attribute :user do |object, params|
    current_user = params[:current_user]
    object.user1 == current_user ? object.user2 : object.user1
  end

  attribute :last_message do |object|
    object.messages.last
  end

  attribute :messages do |object|
    object.messages
  end
end
