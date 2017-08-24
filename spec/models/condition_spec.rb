RSpec.describe Condition do
  describe "Validations" do
    it "is valid with all information" do
      condition = Condition.new(date: "2013-08-29", max_temperature_f: 74.0, mean_temperature_f: 68.0, min_temperature_f: 61.0, mean_humidity: 75.0, mean_visibility_miles: 10.0, mean_wind_speed_mph: 11.0, precipitation_inches: 0.0)

      expect(condition).to be_valid
    end

    it "is invalid without a date" do
      condition = Condition.new(max_temperature_f: 74.0, mean_temperature_f: 68.0, min_temperature_f: 61.0, mean_humidity: 75.0, mean_visibility_miles: 10.0, mean_wind_speed_mph: 11.0, precipitation_inches: 0.0)

      expect(condition).to_not be_valid
    end

    it "is invalid without a max_temperature_f" do
      condition = Condition.new(date: "2013-08-29", mean_temperature_f: 68.0, min_temperature_f: 61.0, mean_humidity: 75.0, mean_visibility_miles: 10.0, mean_wind_speed_mph: 11.0, precipitation_inches: 0.0)

      expect(condition).to_not be_valid
    end
    it "is invalid without a mean_temperature_f" do
      condition = Condition.new(date: "2013-08-29", max_temperature_f: 74.0, min_temperature_f: 61.0, mean_humidity: 75.0, mean_visibility_miles: 10.0, mean_wind_speed_mph: 11.0, precipitation_inches: 0.0)

      expect(condition).to_not be_valid
    end
    it "is invalid without a min_temperature_f" do
      condition = Condition.new(date: "2013-08-29", max_temperature_f: 74.0, mean_temperature_f: 68.0, mean_humidity: 75.0, mean_visibility_miles: 10.0, mean_wind_speed_mph: 11.0, precipitation_inches: 0.0)

      expect(condition).to_not be_valid
    end
    it "is invalid without a mean_humidity" do
      condition = Condition.new(date: "2013-08-29", max_temperature_f: 74.0, mean_temperature_f: 68.0, min_temperature_f: 61.0, mean_visibility_miles: 10.0, mean_wind_speed_mph: 11.0, precipitation_inches: 0.0)

      expect(condition).to_not be_valid
    end
    it "is invalid without a mean_visibility_miles" do
      condition = Condition.new(date: "2013-08-29", max_temperature_f: 74.0, mean_temperature_f: 68.0, min_temperature_f: 61.0, mean_humidity: 75.0, mean_wind_speed_mph: 11.0, precipitation_inches: 0.0)

      expect(condition).to_not be_valid
    end
    it "is invalid without a mean_wind_speed_mph" do
      condition = Condition.new(date: "2013-08-29", max_temperature_f: 74.0, mean_temperature_f: 68.0, min_temperature_f: 61.0, mean_humidity: 75.0, mean_visibility_miles: 10.0, precipitation_inches: 0.0)

      expect(condition).to_not be_valid
    end
    it "is invalid without a precipitation_inches" do
      condition = Condition.new(date: "2013-08-29", max_temperature_f: 74.0, mean_temperature_f: 68.0, min_temperature_f: 61.0, mean_humidity: 75.0, mean_visibility_miles: 10.0, mean_wind_speed_mph: 11.0)

      expect(condition).to_not be_valid
    end
  end

  describe "Class Methods" do
    it "will show breakdown of average number of rides per 10 degrees" do
      start_station = Station.create(name: "Station_1", dock_count: 20, city: "bike town", installation_date: "3/4/15")
      end_station   = Station.create(name: "Station_2", dock_count: 30, city: "cityville", installation_date: "3/5/15")
      subscription  = SubscriptionType.create(subscription_type: "Customer")

      Trip.create(duration: 49, start_date: "2017-08-20 19:20:22", start_station_id: start_station.id, end_date: "2017-08-20 19:20:22", end_station_id: end_station.id, bike_id: 4, subscription_type: subscription, zip_code: 99000)
      Trip.create(duration: 49, start_date: "2017-08-20 19:20:22", start_station_id: start_station.id, end_date: "2017-08-20 19:20:22", end_station_id: end_station.id, bike_id: 4, subscription_type: subscription, zip_code: 99000)
      Trip.create(duration: 40, start_date: "2017-08-05 19:20:22", start_station_id: start_station.id, end_date: "2017-08-05 19:20:22", end_station_id: end_station.id, bike_id: 520, subscription_type: subscription, zip_code: 12345)
      Condition.create(date: "2017-08-05 19:20:22", max_temperature_f: 74.0, mean_temperature_f: 68.0, min_temperature_f: 61.0, max_humidity: nil, mean_humidity: 75.0, mean_visibility_miles: 10.0, mean_wind_speed_mph: 11.0, precipitation_inches: 0.0)
      Condition.create(date: "2017-08-20 19:20:22", max_temperature_f: 72.0, mean_temperature_f: 68.0, min_temperature_f: 61.0, max_humidity: nil, mean_humidity: 75.0, mean_visibility_miles: 10.0, mean_wind_speed_mph: 11.0, precipitation_inches: 0.0)

      expect(Condition.get_average_rides_temp(70..79)).to eq(1)
    end

    it "will show breakdown of lowest number of rides per 10 degrees" do
      start_station = Station.create(name: "Station_1", dock_count: 20, city: "bike town", installation_date: "3/4/15")
      end_station   = Station.create(name: "Station_2", dock_count: 30, city: "cityville", installation_date: "3/5/15")
      subscription  = SubscriptionType.create(subscription_type: "Customer")

      Trip.create(duration: 49, start_date: "2017-08-20 19:20:22", start_station_id: start_station.id, end_date: "2017-08-20 19:20:22", end_station_id: end_station.id, bike_id: 4, subscription_type: subscription, zip_code: 99000)
      Trip.create(duration: 49, start_date: "2017-08-20 19:20:22", start_station_id: start_station.id, end_date: "2017-08-20 19:20:22", end_station_id: end_station.id, bike_id: 4, subscription_type: subscription, zip_code: 99000)
      Trip.create(duration: 40, start_date: "2017-08-05 19:20:22", start_station_id: start_station.id, end_date: "2017-08-05 19:20:22", end_station_id: end_station.id, bike_id: 520, subscription_type: subscription, zip_code: 12345)
      Condition.create(date: "2017-08-05 19:20:22", max_temperature_f: 70.0, mean_temperature_f: 68.0, min_temperature_f: 61.0, max_humidity: nil, mean_humidity: 75.0, mean_visibility_miles: 10.0, mean_wind_speed_mph: 11.0, precipitation_inches: 0.0)
      Condition.create(date: "2017-08-20 19:20:22", max_temperature_f: 79.0, mean_temperature_f: 68.0, min_temperature_f: 61.0, max_humidity: nil, mean_humidity: 75.0, mean_visibility_miles: 10.0, mean_wind_speed_mph: 11.0, precipitation_inches: 0.0)

      expect(Condition.get_worst_day_temp(70..79)).to eq(1)
    end

    it "will show breakdown of lowest number of rides per 10 degrees" do
      start_station = Station.create(name: "Station_1", dock_count: 20, city: "bike town", installation_date: "3/4/15")
      end_station   = Station.create(name: "Station_2", dock_count: 30, city: "cityville", installation_date: "3/5/15")
      subscription  = SubscriptionType.create(subscription_type: "Customer")

      Trip.create(duration: 49, start_date: "2017-08-20 19:20:22", start_station_id: start_station.id, end_date: "2017-08-20 19:20:22", end_station_id: end_station.id, bike_id: 4, subscription_type: subscription, zip_code: 99000)
      Trip.create(duration: 49, start_date: "2017-08-20 19:20:22", start_station_id: start_station.id, end_date: "2017-08-20 19:20:22", end_station_id: end_station.id, bike_id: 4, subscription_type: subscription, zip_code: 99000)
      Trip.create(duration: 40, start_date: "2017-08-05 19:20:22", start_station_id: start_station.id, end_date: "2017-08-05 19:20:22", end_station_id: end_station.id, bike_id: 520, subscription_type: subscription, zip_code: 12345)
      Condition.create(date: "2017-08-05 19:20:22", max_temperature_f: 70.0, mean_temperature_f: 68.0, min_temperature_f: 61.0, max_humidity: nil, mean_humidity: 75.0, mean_visibility_miles: 10.0, mean_wind_speed_mph: 11.0, precipitation_inches: 0.0)
      Condition.create(date: "2017-08-20 19:20:22", max_temperature_f: 79.0, mean_temperature_f: 68.0, min_temperature_f: 61.0, max_humidity: nil, mean_humidity: 75.0, mean_visibility_miles: 10.0, mean_wind_speed_mph: 11.0, precipitation_inches: 0.0)

      expect(Condition.get_best_day_temp(70..79)).to eq(2)
    end

    it "will show breakdown of average number of rides per .5 inch" do
      start_station = Station.create(name: "Station_1", dock_count: 20, city: "bike town", installation_date: "3/4/15")
      end_station   = Station.create(name: "Station_2", dock_count: 30, city: "cityville", installation_date: "3/5/15")
      subscription  = SubscriptionType.create(subscription_type: "Customer")

      Trip.create(duration: 49, start_date: "2017-08-20 19:20:22", start_station_id: start_station.id, end_date: "2017-08-20 19:20:22", end_station_id: end_station.id, bike_id: 4, subscription_type: subscription, zip_code: 99000)
      Trip.create(duration: 49, start_date: "2017-08-20 19:20:22", start_station_id: start_station.id, end_date: "2017-08-20 19:20:22", end_station_id: end_station.id, bike_id: 4, subscription_type: subscription, zip_code: 99000)
      Trip.create(duration: 40, start_date: "2017-08-05 19:20:22", start_station_id: start_station.id, end_date: "2017-08-05 19:20:22", end_station_id: end_station.id, bike_id: 520, subscription_type: subscription, zip_code: 12345)
      Condition.create(date: "2017-08-05 19:20:22", max_temperature_f: 74.0, mean_temperature_f: 68.0, min_temperature_f: 61.0, max_humidity: nil, mean_humidity: 75.0, mean_visibility_miles: 10.0, mean_wind_speed_mph: 11.0, precipitation_inches: 0.5)
      Condition.create(date: "2017-08-20 19:20:22", max_temperature_f: 72.0, mean_temperature_f: 68.0, min_temperature_f: 61.0, max_humidity: nil, mean_humidity: 75.0, mean_visibility_miles: 10.0, mean_wind_speed_mph: 11.0, precipitation_inches: 0.4)

      expect(Condition.get_average_rides_percip(0.0..0.5)).to eq(1)
    end

    it "will show breakdown of lowest number of rides per .5 inch" do
      start_station = Station.create(name: "Station_1", dock_count: 20, city: "bike town", installation_date: "3/4/15")
      end_station   = Station.create(name: "Station_2", dock_count: 30, city: "cityville", installation_date: "3/5/15")
      subscription  = SubscriptionType.create(subscription_type: "Customer")

      Trip.create(duration: 49, start_date: "2017-08-20 19:20:22", start_station_id: start_station.id, end_date: "2017-08-20 19:20:22", end_station_id: end_station.id, bike_id: 4, subscription_type: subscription, zip_code: 99000)
      Trip.create(duration: 49, start_date: "2017-08-20 19:20:22", start_station_id: start_station.id, end_date: "2017-08-20 19:20:22", end_station_id: end_station.id, bike_id: 4, subscription_type: subscription, zip_code: 99000)
      Trip.create(duration: 40, start_date: "2017-08-05 19:20:22", start_station_id: start_station.id, end_date: "2017-08-05 19:20:22", end_station_id: end_station.id, bike_id: 520, subscription_type: subscription, zip_code: 12345)
      Condition.create(date: "2017-08-05 19:20:22", max_temperature_f: 70.0, mean_temperature_f: 68.0, min_temperature_f: 61.0, max_humidity: nil, mean_humidity: 75.0, mean_visibility_miles: 10.0, mean_wind_speed_mph: 11.0, precipitation_inches: 0.5)
      Condition.create(date: "2017-08-20 19:20:22", max_temperature_f: 79.0, mean_temperature_f: 68.0, min_temperature_f: 61.0, max_humidity: nil, mean_humidity: 75.0, mean_visibility_miles: 10.0, mean_wind_speed_mph: 11.0, precipitation_inches: 0.4)

      expect(Condition.get_worst_day_percip(0.0..0.5)).to eq(1)
    end

    it "will show breakdown of lowest number of rides per .5 inch" do
      start_station = Station.create(name: "Station_1", dock_count: 20, city: "bike town", installation_date: "3/4/15")
      end_station   = Station.create(name: "Station_2", dock_count: 30, city: "cityville", installation_date: "3/5/15")
      subscription  = SubscriptionType.create(subscription_type: "Customer")

      Trip.create(duration: 49, start_date: "2017-08-20 19:20:22", start_station_id: start_station.id, end_date: "2017-08-20 19:20:22", end_station_id: end_station.id, bike_id: 4, subscription_type: subscription, zip_code: 99000)
      Trip.create(duration: 49, start_date: "2017-08-20 19:20:22", start_station_id: start_station.id, end_date: "2017-08-20 19:20:22", end_station_id: end_station.id, bike_id: 4, subscription_type: subscription, zip_code: 99000)
      Trip.create(duration: 40, start_date: "2017-08-05 19:20:22", start_station_id: start_station.id, end_date: "2017-08-05 19:20:22", end_station_id: end_station.id, bike_id: 520, subscription_type: subscription, zip_code: 12345)
      Condition.create(date: "2017-08-05 19:20:22", max_temperature_f: 70.0, mean_temperature_f: 68.0, min_temperature_f: 61.0, max_humidity: nil, mean_humidity: 75.0, mean_visibility_miles: 10.0, mean_wind_speed_mph: 11.0, precipitation_inches: 0.4)
      Condition.create(date: "2017-08-20 19:20:22", max_temperature_f: 79.0, mean_temperature_f: 68.0, min_temperature_f: 61.0, max_humidity: nil, mean_humidity: 75.0, mean_visibility_miles: 10.0, mean_wind_speed_mph: 11.0, precipitation_inches: 0.5)

      expect(Condition.get_best_day_percip(0.0..0.5)).to eq(2)
    end
  end
end
