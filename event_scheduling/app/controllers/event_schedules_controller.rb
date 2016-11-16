class EventSchedulesController < ApplicationController

def new
  @schedule = Schedule.new
  @schedules = Schedule.all
  @users=User.all

end

def create
  # binding.pry
       @schedule=Schedule.new(schedule_params)
        vari = User.find(session[:user_id])
       @schedule.owner_id=vari.id
       @schedule.save
       if params[:invitee_ids]
       params[:invitee_ids].each do |t|
          @invitation=Invitation.new
          @invitation.schedule_id=@schedule.id
          @invitation.invitee_id=t
          @invitation.invited_id=params[:user_id]
          @invitation.save
              end
            end
       redirect_to schedule_path

   end



def index
	@users=User.all
  @schedules=Schedule.all

	end
def show
  @schedule=Schedule.find_by_id(params[:id])
end
def edit
  # binding.pry
  @user=User.all
      @schedule=Schedule.find_by_id(params[:id])
end


  def update
   
    @schedule=Schedule.find_by_id(params[:id])
    # binding.pry
    @schedule.update_attributes(schedule_params)
    redirect_to schedule_path
  end

private

  def schedule_params
  params.require(:schedule).permit(:title,:venue,:date,:time,:description,:status)  
  end


end


