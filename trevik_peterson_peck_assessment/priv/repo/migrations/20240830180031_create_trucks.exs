defmodule TrevikPetersonPeckAssessment.Repo.Migrations.CreateTrucks do
  use Ecto.Migration

  def change do
    create table(:trucks) do
      add :location_id, :integer
      add :applicant, :string
      add :facility_type, :string
      add :cnn, :integer
      add :location_description, :text
      add :address, :string
      add :block_lot, :text
      add :block, :text
      add :lot, :string
      add :permit, :string
      add :status, :string
      add :food_items, :text
      add :x, :float
      add :y, :float
      add :latitude, :float
      add :longitude, :float
      add :schedule, :text
      add :dayshours, :string
      add :noi_sent, :string
      add :approved, :string
      add :received, :string
      add :prior_permit, :string
      add :expiration_date, :string
      add :location, :string
      add :fire_prevention_districts, :integer
      add :police_districts, :integer
      add :supervisor_districts, :integer
      add :zip_codes, :string
      add :neighborhoods_old, :integer

      timestamps(type: :utc_datetime)
    end
  end
end
