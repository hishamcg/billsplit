class Transfer < ActiveRecord::Base
  attr_accessible :from, :to, :value
  validates_presence_of :value
end
