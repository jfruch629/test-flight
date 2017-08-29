require_relative "../../lib/airplane"

describe Airplane do
  let(:my_plane) { Airplane.new("cesna", 10, 150, 50) }

  describe "#initialization" do
    it "takes a type, wing loading, and horsepower as arguments" do
      expect(my_plane.type).to eq("cesna")
      expect(my_plane.wing_loading).to eq(10)
      expect(my_plane.horsepower).to eq(150)
    end
  end

  describe "#start" do
    it "turns on engine if it's not running, and returns if the engine was started or already running" do
      expect(my_plane.start).to match("airplane started")
      expect(my_plane.check_fuel).to eq(40)
    end
  end

  describe "#land" do
    it "returns 'airplane not started, please start' if the plane is not started, and thus not flying" do
      expect(my_plane.land).to match("airplane not started, please start")
    end

    it "returns 'airplane already on ground' if the plane is started, but hasn't taken off" do
      my_plane.start
      expect(my_plane.land).to match("airplane already on ground")
    end

    it "returns 'airplane landed' if plane was already in the air" do
      my_plane.start
      my_plane.takeoff
      expect(my_plane.land).to match ("airplane landed")
      expect(my_plane.check_fuel).to eq(5)

    end
  end

  describe "#takeoff" do
    it "returns 'airplane not started, please start' if the engine is not turned on" do
      expect(my_plane.takeoff).to match("airplane not started, please start")
    end

    it "returns 'airplane launched' if engine is started and attempted to take off." do
      my_plane.start
      expect(my_plane.takeoff).to match("airplane launched")
      expect(my_plane.check_fuel).to eq(20)

    end
  end
end
