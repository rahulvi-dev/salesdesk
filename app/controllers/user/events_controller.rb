class User::EventsController < ApplicationController
  def new
    @event_info = true
    @event = Event.new
    @client = Client.find(params[:client_id])
  end

  def edit
    @event = Event.find(params[:id])
    @event_info = true
  end

  def update
    @event_info = true
    @event = Event.find(params[:id])
    if @event.update_attributes(event_params)
      redirect_to root_path, notice: "Event Updated"
    else
      render 'edit'
    end
  end  

  def create
    @event_info = true
    @event = Event.create(event_params)
    if @event.save
      redirect_to root_path, notice: "Event saved"
    else
      render action: "new"
    end
  end

  private
  def event_params
    params.require(:event).permit(:client_id , :planning_date, :event_date, :start_time, :end_time, :no_of_rooms, :time_per_customer, :price, :tmms)
  end  
end