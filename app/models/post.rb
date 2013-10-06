class Post < ActiveRecord::Base
	has_many :comments, dependent: :destroy
	validates :title, presence: true, length: { minimum: 5 }
	include ActiveModel::ForbiddenAttributesProtection
  attr_accessible :text, :title
end
