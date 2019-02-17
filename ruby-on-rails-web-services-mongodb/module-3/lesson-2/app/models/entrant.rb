class Entrant
  include Mongoid::Document

  field :_id, type: Integer
  field :name, type: String
  field :group, type: String
  field :secs, type: Float

  embedded_in :contest
  belongs_to :racer

  validates_associated :racer

  before_create :set_racer_name

  private
    def set_racer_name
      self.name = "#{racer.last_name}, #{racer.first_name}"
    end
end
