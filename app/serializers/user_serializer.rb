class UserSerializer < ActiveModel::Serializer
  attributes :id, :user_name, :password_digest, :first_name, :last_name, :email

  has_many :lectures
end
