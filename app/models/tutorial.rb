class Tutorial < ActiveRecord::Base
  belongs_to :author
  
  def slug
    self.title.removeaccents.gsub(/\s+/,'-').gsub(/[^a-z0-9\-]+/i, '').downcase.squeeze('-')
  end
  
  def last?
    self.id == self.class.maximum(:id)
  end
  
end
