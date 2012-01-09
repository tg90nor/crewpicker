class Band < ActiveRecord::Base
  set_primary_key "uuid"
  include UuidHelper
  has_attached_file :image, :styles => { :medium => "300x300>", :thumb => "100x100>" }
  has_many :band_members, :dependent => :destroy
  has_one :stage_schedule
  belongs_to :user
  default_scope :order => "bands.name"
end
