class Point
  attr_accessor :longitude
  attr_accessor :latitude

  class << self
    def demongoize(object)
      Point.new(object[:coordinates][0], object[:coordinates][1])
    end

    def evolve(object)
      object.is_a?(Point) ? object.mongoize : object
    end
  end

  def initialize(longitude, latitude)
    self.longitude = longitude
    self.latitude = latitude
  end

  def mongoize
    { type: "Point", coordinates: [longitude, latitude] }
  end
end
