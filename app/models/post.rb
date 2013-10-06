class Post < ActiveRecord::Base
	validates :title, presence: true, length: { minimum: 5 }
	include ActiveModel::ForbiddenAttributesProtection
  attr_accessible :text, :title
end
