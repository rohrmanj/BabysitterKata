require 'pry'
require 'Time'

class BabySitter
  def initialize
    @midnight = Time.parse('12:00 AM') + (24*60*60)

    @before_bed_rate = 12
    @bed_to_midnight_rate = 8
    @midnight_to_end_rate = 16
  end
  
  def calc_pb_rate(start_time, bed_time, end_time)
    parse_time(start_time, bed_time, end_time)
    (((@bed_time - @start_time) / 3600) * @before_bed_rate).floor
  end

  def calc_ab_rate(start_time, bed_time, end_time)
    parse_time(start_time, bed_time, end_time)
    @bed_time < @midnight ? (((@midnight - @bed_time) / 3600) * @bed_to_midnight_rate).floor : 0
  end

  def calc_am_rate(start_time, bed_time, end_time)
    parse_time(start_time, bed_time, end_time)
    @end_time > @midnight ? (((@end_time - @midnight) / 3600) * @midnight_to_end_rate).floor : 0
  end

  def parse_time(start_time, bed_time, end_time)
    @start_time = Time.parse(start_time)
    @bed_time = Time.parse(bed_time)
    if end_time.end_with?("AM")
      @end_time = Time.parse(end_time) + (24*60*60)
    elsif
      @end_time = Time.parse(end_time)
    end
  end

  def calc_total
    [calc_pb_rate, calc_ab_rate, calc_am_rate].sum
  end
end

