class Param < ActiveRecord::Base
  belongs_to :worker
  delegate :to_s, :to => :name
end
