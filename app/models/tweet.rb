class Tweet < ActiveRecord::Base
  # users.password_hash in the database is a :string
  belongs_to :user
  validates_length_of :content, :maximum => 140, :allow_blank => false
end