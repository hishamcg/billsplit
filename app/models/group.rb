class Group < ActiveRecord::Base
  attr_accessible :friendid, :groupname, :userid
  validates_presence_of :groupname
  has_and_belongs_to_many :users


  def self.get_all_group_members
  	Group.all
  end
end
