class Airplane
  attr_reader :type, :wing_loading, :horsepower, :fuel, :engine_on, :in_flight

  def initialize(type, wing_loading, horsepower, fuel, engine_on = false, in_flight = false)
    @type = type
    @wing_loading = wing_loading
    @horsepower = horsepower
    @fuel = fuel
    @engine_on = engine_on
    @in_flight = in_flight
  end

  def start
    if @engine_on == false
      @engine_on = true
      @fuel -= 10
      "airplane started"
    else
      "airplane started"
    end
  end

  def takeoff
    if @engine_on == false
      'airplane not started, please start'
    else
      @in_flight = true
      @fuel -= 20
      'airplane launched'
    end
  end

  def land
    if @engine_on == false && @in_flight == false
      'airplane not started, please start'
    elsif @engine_on == true && @in_flight == false
      'airplane already on ground'
    elsif @engine_on == true && @in_flight == true
      @fuel -= 15
      'airplane landed'
    end
  end

  def check_fuel
    @fuel
  end
end
