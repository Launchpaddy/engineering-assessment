defmodule TrevikPetersonPeckAssessment.MobileRestarantFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `TrevikPetersonPeckAssessment.MobileRestarant` context.
  """

  @doc """
  Generate a truck.
  """
  def truck_fixture(attrs \\ %{}) do
    {:ok, truck} =
      attrs
      |> Enum.into(%{
        address: "some address",
        applicant: "some applicant",
        approved: "some approved",
        block: "some block",
        block_lot: "some block_lot",
        cnn: 42,
        dayshours: "some dayshours",
        expiration_date: "some expiration_date",
        facility_type: "some facility_type",
        fire_prevention_districts: 42,
        food_items: "some food_items",
        latitude: 120.5,
        location: "some location",
        location_description: "some location_description",
        location_id: 42,
        longitude: 120.5,
        lot: "some lot",
        neighborhoods_old: 42,
        noi_sent: "some noi_sent",
        permit: "some permit",
        police_districts: 42,
        prior_permit: "some prior_permit",
        received: "some received",
        schedule: "some schedule",
        status: "some status",
        supervisor_districts: 42,
        x: 120.5,
        y: 120.5,
        zip_codes: "some zip_codes"
      })
      |> TrevikPetersonPeckAssessment.MobileRestarant.create_truck()

    truck
  end
end
