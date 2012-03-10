require 'consts'

class Worker < ActiveRecord::Base
  belongs_to :project
  has_many :params
  has_many :in_links, :foreign_key => :to_id, :class_name => 'Link'
  has_many :out_links, :foreign_key => :from_id, :class_name => 'Link'
  has_many :dependencies, :through => :in_links, :source => :from, :class_name => 'Worker'
  has_many :dependents, :through => :out_links, :source => :to, :class_name => 'Worker'
  
  def to_s
    [prefix, *params].join Consts.arg_sep
  end
  
  def as_json options={}
    super options.merge(:include => [:in_links, :out_links])
  end
end
