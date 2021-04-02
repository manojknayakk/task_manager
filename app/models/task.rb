class Task < ApplicationRecord
  belongs_to :user

  validates_presence_of :name, :description, :status, :deadline

  enum status: { 'backlog': 1, 'inprogress': 2, 'done': 3 }
end
