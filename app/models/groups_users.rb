class GroupsUsers < ActiveRecord::Base
  attr_accessible :group_id, :user_id

  belongs_to :users
  belongs_to :group
end
