class Venue
  include Mongoid::Document

  field :name, type: String

  embeds_one :address, as: :addressable
  has_many :contests, dependent: :restrict
end
