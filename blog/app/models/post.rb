class Post < ActiveRecord::Base

  validates_presence_of :title, :body
  
  after_create :set_path_name
  before_update :change_path_name

  #For parameterize
  def to_param
    "#{id}-#{title.parameterize}"
  end

  def set_path_name
    self.post_path = to_param
    self.save!
  end

  def change_path_name
    self.post_path = to_param
  end
  
end
