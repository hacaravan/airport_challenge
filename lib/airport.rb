class Airport

  def initialize
    @planes = []
  end

  def contains?(plane)
    @planes.include?(plane)
  end

  def add_plane(plane)
    @planes << plane
  end
end

class Plane
  attr_reader :airport

  def initialize(airport = nil)
    check_valid_airport(airport)
    @airport = airport
  end

  def land(airport)
    check_valid_airport(airport)
    airport.add_plane(self)
    self
  end

  def take_off
  end

  def check_valid_airport(airport)
    raise "Not a valid airport" if airport && !airport.is_a?(Airport)
  end
end
