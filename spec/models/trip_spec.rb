RSpec.describe Trip do
  describe "Validations" do
    it "is valid with all information" do
    subscription = SubscriptionType.create(subscription_type: "customer")
    station = Station.create(name: "Station_1", dock_count: 20, city: "bike town", installation_date: "3/4/15")
    trip = Trip.create(duration: 49, start_date: "2017-08-20 19:20:22", start_station_id: 1, end_date: "2017-08-20 19:20:22", end_station_id: 1, bike_id: 4, subscription_type: subscription, zip_code: 99000)

    expect(trip).to be_valid
  end

    it "is invalid without a duration" do
      subscription = SubscriptionType.create(subscription_type: "customer")
      station = Station.create(name: "Station_1", dock_count: 20, city: "bike town", installation_date: "3/4/15")
      trip = Trip.create(start_date: "2017-08-20 19:20:22", start_station_id: 1, end_date: "2017-08-20 19:20:22", end_station_id: 1, bike_id: 4, subscription_type: subscription, zip_code: 99000)

      expect(trip).to_not be_valid
    end

    it "is invalid without a start_date" do
      subscription = SubscriptionType.create(subscription_type: "customer")
      station = Station.create(name: "Station_1", dock_count: 20, city: "bike town", installation_date: "3/4/15")
      trip = Trip.create(duration: 49, start_station_id: 1, end_date: "2017-08-20 19:20:22", end_station_id: 1, bike_id: 4, subscription_type: subscription, zip_code: 99000)

      expect(trip).to_not be_valid
    end

    it "is invalid without a start_station_id" do
      subscription = SubscriptionType.create(subscription_type: "customer")
      station = Station.create(name: "Station_1", dock_count: 20, city: "bike town", installation_date: "3/4/15")
      trip = Trip.create(duration: 49, start_date: "2017-08-20 19:20:22", end_date: "2017-08-20 19:20:22", end_station_id: 1, bike_id: 4, subscription_type: subscription, zip_code: 99000)

      expect(trip).to_not be_valid
    end

    it "is invalid without a end_date" do
      subscription = SubscriptionType.create(subscription_type: "customer")
      station = Station.create(name: "Station_1", dock_count: 20, city: "bike town", installation_date: "3/4/15")
      trip = Trip.create(duration: 49, start_date: "2017-08-20 19:20:22", start_station_id: 1, end_station_id: 1, bike_id: 4, subscription_type: subscription, zip_code: 99000)

      expect(trip).to_not be_valid
    end

    it "is invalid without a end_station_id" do
      subscription = SubscriptionType.create(subscription_type: "customer")
      station = Station.create(name: "Station_1", dock_count: 20, city: "bike town", installation_date: "3/4/15")
      trip = Trip.create(duration: 49, start_date: "2017-08-20 19:20:22", start_station_id: 1, end_date: "2017-08-20 19:20:22", bike_id: 4, subscription_type: subscription, zip_code: 99000)

      expect(trip).to_not be_valid
    end

    it "is invalid without a bike_id" do
      subscription = SubscriptionType.create(subscription_type: "customer")
      station = Station.create(name: "Station_1", dock_count: 20, city: "bike town", installation_date: "3/4/15")
      trip = Trip.create(duration: 49, start_date: "2017-08-20 19:20:22", start_station_id: 1, end_date: "2017-08-20 19:20:22", end_station_id: 1, subscription_type: subscription, zip_code: 99000)

      expect(trip).to_not be_valid
    end

    it "is invalid without a subscription type" do
      subscription = SubscriptionType.create(subscription_type: "customer")
      station = Station.create(name: "Station_1", dock_count: 20, city: "bike town", installation_date: "3/4/15")
      trip = Trip.create(duration: 49, start_date: "2017-08-20 19:20:22", start_station_id: 1, end_date: "2017-08-20 19:20:22", end_station_id: 1, bike_id: 4, zip_code: 99000)

      expect(trip).to_not be_valid
    end

    it "can find average duration" do
      subscription = SubscriptionType.create(subscription_type: "Subscriber")
      station = Station.create(name: "Station_1", dock_count: 20, city: "bike town", installation_date: "3/4/15")
      trip_1 = Trip.create(duration: 50, start_date: "2017-09-20 19:20:22", start_station_id: 1, end_date: "2017-08-20 19:20:22", end_station_id: 1, bike_id: 4, subscription_type: subscription, zip_code: 99000)
      trip_2 = Trip.create(duration: 100, start_date: "2017-08-20 19:20:22", start_station_id: 1, end_date: "2017-08-20 19:20:22", end_station_id: 1, bike_id: 4, subscription_type: subscription, zip_code: 99000)

      expect(Trip.average_duration).to eq(1)
    end

    it "can find longest ride" do
      subscription = SubscriptionType.create(subscription_type: "Subscriber")
      station = Station.create(name: "Station_1", dock_count: 20, city: "bike town", installation_date: "3/4/15")
      trip_1 = Trip.create(duration: 60, start_date: "2017-09-20 19:20:22", start_station_id: 1, end_date: "2017-08-20 19:20:22", end_station_id: 1, bike_id: 4, subscription_type: subscription, zip_code: 99000)
      trip_2 = Trip.create(duration: 120, start_date: "2017-08-20 19:20:22", start_station_id: 1, end_date: "2017-08-20 19:20:22", end_station_id: 1, bike_id: 4, subscription_type: subscription, zip_code: 99000)

      expect(Trip.longest_ride).to eq(2)
    end

    it "can find shortest ride" do
      subscription = SubscriptionType.create(subscription_type: "Subscriber")
      station_1 = Station.create(name: "Station_1", dock_count: 20, city: "bike town", installation_date: "3/4/15")
      station_2 = Station.create(name: "Station_1", dock_count: 20, city: "bike town", installation_date: "3/4/15")
      trip_1 = Trip.create(duration: 60, start_date: "2017-09-20 19:20:22", start_station_id: 1, end_date: "2017-09-20 19:20:22", end_station_id: 1, bike_id: 4, subscription_type: subscription, zip_code: 99000)
      trip_2 = Trip.create(duration: 120, start_date: "2017-08-20 19:20:22", start_station_id: 1, end_date: "2017-08-20 19:20:22", end_station_id: 1, bike_id: 4, subscription_type: subscription, zip_code: 99000)
      trip_3 = Trip.create(duration: 180, start_date: "2017-07-20 19:20:22", start_station_id: 1, end_date: "2017-07-20 19:20:22", end_station_id: 1, bike_id: 4, subscription_type: subscription, zip_code: 99000)

      expect(Trip.shortest_ride).to eq(1)
    end

    it "can find station with most rides as starting point" do
      subscription = SubscriptionType.create(subscription_type: "Subscriber")
      station_1 = Station.create(name: "Station_1", dock_count: 20, city: "bike town", installation_date: "3/4/15")
      station_2 = Station.create(name: "Station_1", dock_count: 20, city: "bike town", installation_date: "3/4/15")
      trip_1 = Trip.create(duration: 60, start_date: "2017-09-20 19:20:22", start_station_id: 1, end_date: "2017-09-20 19:20:22", end_station_id: 1, bike_id: 4, subscription_type: subscription, zip_code: 99000)
      trip_2 = Trip.create(duration: 120, start_date: "2017-08-20 19:20:22", start_station_id: 1, end_date: "2017-08-20 19:20:22", end_station_id: 1, bike_id: 4, subscription_type: subscription, zip_code: 99000)
      trip_3 = Trip.create(duration: 180, start_date: "2017-07-20 19:20:22", start_station_id: 2, end_date: "2017-07-20 19:20:22", end_station_id: 2, bike_id: 4, subscription_type: subscription, zip_code: 99000)

      expect(Trip.station_with_most_rides_as_starting_point).to eq(station_1)
    end

    it "can find station most rides as end point" do
      subscription = SubscriptionType.create(subscription_type: "Subscriber")
      station_1 = Station.create(name: "Station_1", dock_count: 20, city: "bike town", installation_date: "3/4/15")
      station_2 = Station.create(name: "Station_1", dock_count: 20, city: "bike town", installation_date: "3/4/15")
      trip_1 = Trip.create(duration: 60, start_date: "2017-09-20 19:20:22", start_station_id: 1, end_date: "2017-09-20 19:20:22", end_station_id: 1, bike_id: 4, subscription_type: subscription, zip_code: 99000)
      trip_2 = Trip.create(duration: 120, start_date: "2017-08-20 19:20:22", start_station_id: 1, end_date: "2017-08-20 19:20:22", end_station_id: 1, bike_id: 4, subscription_type: subscription, zip_code: 99000)
      trip_3 = Trip.create(duration: 180, start_date: "2017-07-20 19:20:22", start_station_id: 2, end_date: "2017-07-20 19:20:22", end_station_id: 2, bike_id: 4, subscription_type: subscription, zip_code: 99000)

      expect(Trip.station_with_the_most_rides_as_end_point).to eq(station_1)
    end

    it "can find most ridden bike id" do
      subscription = SubscriptionType.create(subscription_type: "Subscriber")
      station_1 = Station.create(name: "Station_1", dock_count: 20, city: "bike town", installation_date: "3/4/15")
      station_2 = Station.create(name: "Station_1", dock_count: 20, city: "bike town", installation_date: "3/4/15")
      trip_1 = Trip.create(duration: 60, start_date: "2017-09-20 19:20:22", start_station_id: 1, end_date: "2017-09-20 19:20:22", end_station_id: 1, bike_id: 4, subscription_type: subscription, zip_code: 99000)
      trip_2 = Trip.create(duration: 120, start_date: "2017-08-20 19:20:22", start_station_id: 1, end_date: "2017-08-20 19:20:22", end_station_id: 1, bike_id: 4, subscription_type: subscription, zip_code: 99000)
      trip_3 = Trip.create(duration: 180, start_date: "2017-07-20 19:20:22", start_station_id: 2, end_date: "2017-07-20 19:20:22", end_station_id: 2, bike_id: 5, subscription_type: subscription, zip_code: 99000)

      expect(Trip.most_ridden_bike_id).to eq("bike #4, with 2 rides.")
    end

    it "can get bike trip count" do
      subscription = SubscriptionType.create(subscription_type: "Subscriber")
      station_1 = Station.create(name: "Station_1", dock_count: 20, city: "bike town", installation_date: "3/4/15")
      station_2 = Station.create(name: "Station_1", dock_count: 20, city: "bike town", installation_date: "3/4/15")
      trip_1 = Trip.create(duration: 60, start_date: "2017-09-20 19:20:22", start_station_id: 1, end_date: "2017-09-20 19:20:22", end_station_id: 1, bike_id: 4, subscription_type: subscription, zip_code: 99000)
      trip_2 = Trip.create(duration: 120, start_date: "2017-08-20 19:20:22", start_station_id: 1, end_date: "2017-08-20 19:20:22", end_station_id: 1, bike_id: 4, subscription_type: subscription, zip_code: 99000)
      trip_3 = Trip.create(duration: 180, start_date: "2017-07-20 19:20:22", start_station_id: 2, end_date: "2017-07-20 19:20:22", end_station_id: 2, bike_id: 5, subscription_type: subscription, zip_code: 99000)

      expect(Trip.get_bike_trip_count(5)).to eq("bike #5, with 1 rides.")
    end

    it "can find least ridden bike id" do
      subscription = SubscriptionType.create(subscription_type: "Subscriber")
      station_1 = Station.create(name: "Station_1", dock_count: 20, city: "bike town", installation_date: "3/4/15")
      station_2 = Station.create(name: "Station_1", dock_count: 20, city: "bike town", installation_date: "3/4/15")
      trip_1 = Trip.create(duration: 60, start_date: "2017-09-20 19:20:22", start_station_id: 1, end_date: "2017-09-20 19:20:22", end_station_id: 1, bike_id: 4, subscription_type: subscription, zip_code: 99000)
      trip_2 = Trip.create(duration: 120, start_date: "2017-08-20 19:20:22", start_station_id: 1, end_date: "2017-08-20 19:20:22", end_station_id: 1, bike_id: 4, subscription_type: subscription, zip_code: 99000)
      trip_3 = Trip.create(duration: 180, start_date: "2017-07-20 19:20:22", start_station_id: 2, end_date: "2017-07-20 19:20:22", end_station_id: 2, bike_id: 5, subscription_type: subscription, zip_code: 99000)

      expect(Trip.least_ridden_bike_id).to eq("bike #5, with 1 rides.")
    end
  end
end
