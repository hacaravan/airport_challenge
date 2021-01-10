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

  def remove_plane(plane)
    @planes -= [plane]
  end

  def full?
    @planes.length > 100
  end
end

class Plane
  attr_reader :airport

  def initialize(airport = nil)
    check_valid_airport_ignore_nil(airport)
    @airport = airport
    add_plane_unless_nil
  end

  def land(airport)
    can_land?(airport)
    airport.add_plane(self)
    self
  end

  def take_off
    can_take_off?
    @airport.remove_plane(self)
    "#{self} has taken off from #{@airport}"
  end

  def check_valid_airport_ignore_nil(airport)
    raise "Not a valid airport" if airport && !airport.is_a?(Airport)
  end

  def check_valid_airport(airport)
    raise "Not a valid airport" unless airport.is_a?(Airport)
  end

  def add_plane_unless_nil
    @airport.add_plane(self) unless airport.nil?
  end

  def can_take_off?
    raise "Can't take off when not in airport" if flying?
  end

  def can_land?(airport)
    raise "Can't land when in an airport" unless flying?
    check_valid_airport(airport)
    raise "Airport full" if airport.full?
  end

  def flying?
    @airport.nil?
  end
end
