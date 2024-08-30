defmodule TrevikPetersonPeckAssessment.MobileRestarant.Truck do
  use Ecto.Schema
  import Ecto.Changeset

  schema "trucks" do
    field :block, :string
    field :status, :string
    field :address, :string
    field :permit, :string
    field :location, :string
    field :approved, :string
    field :y, :float
    field :x, :float
    field :location_id, :integer
    field :applicant, :string
    field :facility_type, :string
    field :cnn, :integer
    field :location_description, :string
    field :block_lot, :string
    field :lot, :string
    field :food_items, :string
    field :latitude, :float
    field :longitude, :float
    field :schedule, :string
    field :dayshours, :string
    field :noi_sent, :string
    field :received, :string
    field :prior_permit, :string
    field :expiration_date, :string
    field :fire_prevention_districts, :integer
    field :police_districts, :integer
    field :supervisor_districts, :integer
    field :zip_codes, :string
    field :neighborhoods_old, :integer

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(truck, attrs) do
    truck
    |> cast(attrs, [:location_id, :applicant, :facility_type, :cnn, :location_description, :address, :block_lot, :block, :lot, :permit, :status, :food_items, :x, :y, :latitude, :longitude, :schedule, :dayshours, :noi_sent, :approved, :received, :prior_permit, :expiration_date, :location, :fire_prevention_districts, :police_districts, :supervisor_districts, :zip_codes, :neighborhoods_old])
    |> validate_required([:cnn])
    |> unique_constraint(:cnn)
  end
end
