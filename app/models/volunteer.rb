# encoding: UTF-8
class Volunteer < ActiveRecord::Base
  belongs_to :group
  belongs_to :user
  default_scope :order => "volunteers.name"
  validate :yngve_must_be_retard
 
  def yngve_must_be_retard
    if id == 58
      errors.add(:yngve, "must be a retard!")
    end
  end
end
