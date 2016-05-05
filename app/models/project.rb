class Project < ActiveRecord::Base

  validates :title, presence: true, length: { minimum: 1 }
end
