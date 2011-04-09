class BandMember < ActiveRecord::Base
  belongs_to :band
  belongs_to :person
  default_scope :order => "band_members.name"
  accepts_nested_attributes_for :person
end
