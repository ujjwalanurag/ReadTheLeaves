class Api::EventsController < ApplicationController
  def index
    @city = City.find_by(id: params[:city_id])

    if @city
      if @city.events.length > 0
      render json: @city.events
    else
      render json: @city.errors.full_messages, status: 422
    end
  end

  def create
    @event = Event.new(event_params)

    if @event.save
      @event.host_id = current_user.id
      render :show
    else
      render json: @event.errors.full_messages, status: 422
    end
  end

  def show
    @event = Event.find_by(id: params[:id])
    @event ? render :show : render json: "Event not found", status: 422
  end

  def destroy
    event = Event.find_by(id: params[:id])
    event.destroy
    render :show
  end

  def update
  end

  private

  def event_params
    params.require(:event).permit(:date, :address, :city_id)
  end
end