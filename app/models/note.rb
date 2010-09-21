class Note
  include Mongoid::Document
  include Mongoid::Timestamps
  field :text, :type => String
  
  field :color, :type => Symbol
  COLORS = [:yellow, :green, :purple]
  validates_inclusion_of :color, :in => COLORS
  
  
  after_create :push_create
  after_update :push_update
  
  protected

  def push_create
    push_event('create')
  end
  
  def push_update
    push_event('update')
  end
  
  def push_event(event_type)
    Pusher["futu-stickies-#{Rails.env}"].trigger(event_type, 
                                   {:id => self.id.to_s, 
                                    :text => self.text, 
                                    :color => self.color})
  end

end
