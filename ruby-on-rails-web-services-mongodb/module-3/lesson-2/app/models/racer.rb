class Racer
  include Mongoid::Document

  field :first_name, as: :fn, type: String
  field :last_name, as: :ln, type: String
  field :date_of_birth, as: :dob, type: Date

  embeds_one :primary_address, as: :addressable, class_name: "Address"
  has_one :medical_record, dependent: :destroy

  validates :first_name, presence: true
  validates :last_name, presence: true

  def races
    Contest.where("entrants.racer_id": id).map do |contest|
      contest.entrants.find_by(racer_id: id)
    end
  end
end
