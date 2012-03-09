class Link < ActiveRecord::Base
  belongs_to :from, :class_name => 'Worker'
  belongs_to :to, :class_name => 'Worker'
  
  def to_s
    "#{from} -> #{to}"
  end
end
