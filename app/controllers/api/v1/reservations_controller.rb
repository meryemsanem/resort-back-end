class Api::V1::ReservationsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_reservation, only: %i[show update destroy]

  def index
    if current_user
      @reservations = current_user.reservations.includes(:destination)

      data = @reservations.map do |reservation|
        {
          id: reservation.id,
          destination_id: reservation.destination.id,
          start_date: reservation.start_date,
          end_date: reservation.end_date,
          user: reservation.user.name,
          user_id: reservation.user.id,
          destination: {
            name: reservation.destination.name,
            city_name: reservation.destination.city_name
          }
        }
      end

      render json: data
    else
      render json: { error: 'User not authenticated' }, status: :unauthorized
    end
  end

  def show
    render json: @reservation
  end

  def create
    destination = Destination.find(params[:destination_id])

    @reservation = current_user.reservations.build(
      destination:,
      start_date: params[:start_date],
      end_date: params[:end_date]
    )

    if @reservation.save
      render json: @reservation, include: { destination: { only: %i[name city_name] } }, status: :created
    else
      render json: @reservation.errors, status: :unprocessable_entity
    end
  end

  def update
    if @reservation.update(reservation_params)
      render json: @reservation
    else
      render json: @reservation.errors, status: :unprocessable_entity
    end
  end

  def destroy
    if @reservation.destroy
      render json: { message: 'Reservation deleted successfully' }
    else
      render json: { error: 'Failed to delete reservation' }, status: :unprocessable_entity
    end
  end

  private

  def set_reservation
    @reservation = Reservation.find(params[:id])
  end

  def reservation_params
    params.require(:reservation).permit(
      :user_id,
      :destination_id,
      :start_date,
      :end_date,
      destination_attributes: %i[name city_name]
    )
  end
end
