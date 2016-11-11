class EventSchedulesController < ApplicationController
		def new
  @schedule = Schedule.new
end

def create
  @schedule = Schedule.new(schedule_params)
  if @schedule.save
    redirect_to schedule_path
  else
    render "new"
  end
end

def index
	@schedule=Schedule.all
	end

private

def schedule_params
params.require(:schedule).permit(:title,:venue,:date,:time,:description,:invitees,:status)
end
end
