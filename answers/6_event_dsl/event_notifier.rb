require 'date'

class CallEvent
  def initialize(title)
    @title = title
    @at = nil
  end

  def on(date)
    @date = Date.parse(date).strftime("%a %d %b %y")
  end

  def at(place)
    @at = place
  end

  def notify
    print "#{@title}に招待されました。\n 日程: #{@date}\n 場所: #{@at}\n\n"
  end

  def make_a_reservation_to_google_calender
    # API
    # 処理
    print "Google Calendarに入れました。\n\n"
  end
end


def event(title, &block)
  event_instance =  CallEvent.new(title)
  event_instance.instance_eval(&block)
  event_instance.notify
  event_instance.make_a_reservation_to_google_calender
end


Dir.glob("/Users/Shige/metapro_block/answers/6_event_dsl/**event.txt").each{ |file|
  load file
}
