class Friend < ActiveRecord::Base
  attr_accessible :email, :username

  validates_presence_of :email
  validates_presence_of :username 
  validates_uniqueness_of :email
  
end
