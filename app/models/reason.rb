class Reason < ActiveRecord::Base
  attr_accessible :group_id, :reason_text
  validates_presence_of :reason_text
  validates_presence_of :value
end
