class User < ApplicationRecord
  include Devise::JWT::RevocationStrategies::JTIMatcher

  devise :database_authenticatable, :registerable, :recoverable, :validatable, :jwt_authenticatable, jwt_revocation_strategy: self
  has_many :chats
  has_many :messages
  after_create_commit :create_chats

  def chats
    Chat.where("user1_id = :user_id OR user2_id = :user_id", user_id: self.id)
  end

  def create_chats
    users = User.where.not(id: self.id)
    if users.present?
      users.each do |user|
        Chat.create(user1_id: self.id, user2_id: user.id)
      end
    end
  end
end
