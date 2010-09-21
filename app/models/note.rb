class Note
  include Mongoid::Document
  include Mongoid::Timestamps
  field :text, :type => String
  
  field :color, :type => Symbol
  COLORS = [:yellow, :green, :purple]
  validates_inclusion_of :color, :in => COLORS
  
end
