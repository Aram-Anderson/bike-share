class Trip < ActiveRecord::Base

  validates :duration, presence: true
  validates :start_date, presence: true
  validates :start_station_name, presence: true
  validates :start_station_id, presence: true
  validates :end_date, presence: true
  validates :end_station_name, presence: true
  validates :end_station_id, presence: true
  validates :bike_id, presence: true
  validates :subscription_type, presence: true

  def self.convert_csv_to_trip_attributes
    a = Time.now
    trips = []
    CSV.foreach("db/csv/trip.csv", {headers: true, header_converters: :symbol}) do |row|
      row[:zip_code] = 0 if row[:zip_code].to_s.length != 5
      trips << Trip.new(duration:            row[:duration],
                        start_date:          Date.strptime(row[:start_date], '%m/%e/%Y'),
                        start_station_name:  row[:start_station_name],
                        start_station_id:    row[:start_station_id],
                        end_date:            Date.strptime(row[:end_date], '%m/%e/%Y'),
                        end_station_name:    row[:end_station_name],
                        end_station_id:      row[:end_station_id],
                        bike_id:             row[:bike_id],
                        subscription_type:   row[:subscription_type],
                        zip_code:            row[:zip_code])
    end
    b = Time.now
    puts "Creating the trips array took #{b - a} seconds"
    trips
  end

  def self.average_duration
    secs = Trip.average(:duration).to_i
    (secs / 60)
  end

  def self.longest_ride
    secs = Trip.maximum(:duration)
    (secs / 60)
  end

  def self.shortest_ride
    secs = Trip.minimum(:duration)
    (secs / 60)
  end

  def self.station_with_most_rides_as_starting_point
    Trip.group('start_station_name').order('count(*)').pluck(:start_station_name).last
  end

  def self.station_with_the_most_rides_as_end_point
    Trip.group('end_station_name').order('count(*)').pluck(:end_station_name).last
  end

  def self.chart_it_brah
    Trip.group_by_month(:start_date).count
  end

  def self.most_ridden_bike_id
    id = Trip.group('bike_id').order("count(*)").pluck(:bike_id).last
    Trip.get_bike_trip_count(id)
  end

  def self.get_bike_trip_count(id)
    b = Trip.group('bike_id').order('count(*)').count[id]
    "bike ##{id}, with #{b} rides."
  end

  def self.least_ridden_bike_id
    id = Trip.group('bike_id').order('count(*)').pluck(:bike_id).first
    Trip.get_bike_trip_count(id)
  end

  def self.highest_date
    date = Trip.group('start_date').order("count(*)").pluck(:start_date).last
    Trip.get_bike_trips_by_date(date)
  end

  def self.get_bike_trips_by_date(date)
    b = Trip.group('start_date').order('count(*)').count[date]
    "#{date}, there were #{b} rides."
  end

  def self.lowest_date
    date = Trip.group('start_date').order("count(*)").pluck(:start_date).first
    Trip.get_bike_trips_by_date(date)
  end

  def self.most_used_sub_type
    Trip.get_sub_count(sub_type.last)
  end

  def self.sub_type
    group(:subscription_type).order("count(*)").pluck('subscription_type')
  end

  def self.get_sub_count(sub_type)
    b = Trip.group('subscription_type').order('count(*)').count[sub_type]
    total = Trip.all.count
    "There are #{b} #{sub_type} subscriptions, which accounts for #{((b.to_f / total.to_f) * 100).round(2)} percent of the total."
  end

  def self.least_used_sub_type
    sub_type = Trip.group('subscription_type').order("count(*)").pluck(:subscription_type).first
    Trip.get_sub_count(sub_type)
  end

end
