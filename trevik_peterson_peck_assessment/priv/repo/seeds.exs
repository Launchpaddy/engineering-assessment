# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     TrevikPetersonPeckAssessment.Repo.insert!(%TrevikPetersonPeckAssessment.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.
File.stream!("../Mobile_Food_Facility_Permit.csv")
  |> Stream.drop(1)
  |> CSV.decode!(headers: [:location_id, :applicant, :facility_type, :cnn, :location_description, :address, :block_lot, :block, :lot, :permit, :status, :food_items, :x, :y, :latitude, :longitude, :schedule, :dayshours, :noi_sent, :approved, :received, :prior_permit, :expiration_date, :location, :fire_prevention_districts, :police_districts, :supervisor_districts, :zip_codes, :neighborhoods_old ])
  |> Enum.each(fn truck ->
    TrevikPetersonPeckAssessment.MobileRestarant.create_truck(truck)
  end)
