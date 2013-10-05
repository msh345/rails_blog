class Post < ActiveRecord::Base
	include ActiveModel::ForbiddenAttributesProtection
  attr_accessible :text, :title
end
