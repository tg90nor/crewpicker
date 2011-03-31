class LocationSchedulesController < ApplicationController
  def get_events
    events = []
    LocationSchedule.all(:conditions => [ "location_id = ? AND slot = ?", params[:id], params[:slot]]).each do |location_schedule|
      events << {:id => location_schedule.id, :title => location_schedule.fireguard.name, :start => "#{location_schedule.from.iso8601}", :end => "#{location_schedule.to.iso8601}", :allDay => false, :recurring => false}
    end
    render :json => events.to_json
  end
  def show_schedule
    @events = Fireguard.find(:all, :order => "name")
    if params[:id]
      @location = Location.find(params[:id])
    end
    else if params[:name]
      @location = Location.find_by_name(params[:name].capitalize)
    end
  end
  def create
    fireguard = Fireguard.find(params[:fireguard_id])
    location = Location.find(params[:id])
    location_schedule = LocationSchedule.new
    location_schedule.from = DateTime.civil(params[:year].to_i, params[:month].to_i, params[:day].to_i, params[:hour].to_i, params[:minute].to_i)
    location_schedule.to = DateTime.civil(params[:year].to_i, params[:month].to_i, params[:day].to_i, params[:hour].to_i, params[:minute].to_i)
    location_schedule.to = location_schedule.to.advance(:minutes => 120)
    location_schedule.slot = params[:slot]
    fireguard.location_schedules << location_schedule
    location.location_schedules << location_schedule
    location_schedule.save
    render :json => {:id => location_schedule.id.to_json}
  end
  def move
    location_schedule = LocationSchedule.find(params[:event_id])
    location_schedule.from = location_schedule.from.advance(:days => params[:day_delta].to_i, :minutes => params[:minute_delta].to_i)
    location_schedule.to = location_schedule.to.advance(:days => params[:day_delta].to_i, :minutes => params[:minute_delta].to_i)
    location_schedule.slot = params[:slot]
    location_schedule.save
  end
  def delete
    location_schedule = LocationSchedule.find(params[:event_id])
    location_schedule.destroy
    slot = params[:slot]
    render :update do |page|
      page<<"$('#calendar-#{slot}').fullCalendar( 'refetchEvents' )"
    end
  end
end
