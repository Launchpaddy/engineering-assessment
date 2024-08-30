defmodule TrevikPetersonPeckAssessment.MobileRestarantTest do
  use TrevikPetersonPeckAssessment.DataCase

  alias TrevikPetersonPeckAssessment.MobileRestarant

  describe "trucks" do
    alias TrevikPetersonPeckAssessment.MobileRestarant.Truck

    import TrevikPetersonPeckAssessment.MobileRestarantFixtures

    @invalid_attrs %{block: nil, status: nil, address: nil, permit: nil, location: nil, approved: nil, y: nil, x: nil, location_id: nil, applicant: nil, facility_type: nil, cnn: nil, location_description: nil, block_lot: nil, lot: nil, food_items: nil, latitude: nil, longitude: nil, schedule: nil, dayshours: nil, noi_sent: nil, received: nil, prior_permit: nil, expiration_date: nil, fire_prevention_districts: nil, police_districts: nil, supervisor_districts: nil, zip_codes: nil, neighborhoods_old: nil}

    test "list_trucks/0 returns all trucks" do
      truck = truck_fixture()
      assert MobileRestarant.list_trucks() == [truck]
    end

    test "get_truck!/1 returns the truck with given id" do
      truck = truck_fixture()
      assert MobileRestarant.get_truck!(truck.id) == truck
    end

    test "create_truck/1 with valid data creates a truck" do
      valid_attrs = %{block: "some block", status: "some status", address: "some address", permit: "some permit", location: "some location", approved: "some approved", y: 120.5, x: 120.5, location_id: 42, applicant: "some applicant", facility_type: "some facility_type", cnn: 42, location_description: "some location_description", block_lot: "some block_lot", lot: "some lot", food_items: "some food_items", latitude: 120.5, longitude: 120.5, schedule: "some schedule", dayshours: "some dayshours", noi_sent: "some noi_sent", received: "some received", prior_permit: "some prior_permit", expiration_date: "some expiration_date", fire_prevention_districts: 42, police_districts: 42, supervisor_districts: 42, zip_codes: "some zip_codes", neighborhoods_old: 42}

      assert {:ok, %Truck{} = truck} = MobileRestarant.create_truck(valid_attrs)
      assert truck.block == "some block"
      assert truck.status == "some status"
      assert truck.address == "some address"
      assert truck.permit == "some permit"
      assert truck.location == "some location"
      assert truck.approved == "some approved"
      assert truck.y == 120.5
      assert truck.x == 120.5
      assert truck.location_id == 42
      assert truck.applicant == "some applicant"
      assert truck.facility_type == "some facility_type"
      assert truck.cnn == 42
      assert truck.location_description == "some location_description"
      assert truck.block_lot == "some block_lot"
      assert truck.lot == "some lot"
      assert truck.food_items == "some food_items"
      assert truck.latitude == 120.5
      assert truck.longitude == 120.5
      assert truck.schedule == "some schedule"
      assert truck.dayshours == "some dayshours"
      assert truck.noi_sent == "some noi_sent"
      assert truck.received == "some received"
      assert truck.prior_permit == "some prior_permit"
      assert truck.expiration_date == "some expiration_date"
      assert truck.fire_prevention_districts == 42
      assert truck.police_districts == 42
      assert truck.supervisor_districts == 42
      assert truck.zip_codes == "some zip_codes"
      assert truck.neighborhoods_old == 42
    end

    test "create_truck/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = MobileRestarant.create_truck(@invalid_attrs)
    end

    test "update_truck/2 with valid data updates the truck" do
      truck = truck_fixture()
      update_attrs = %{block: "some updated block", status: "some updated status", address: "some updated address", permit: "some updated permit", location: "some updated location", approved: "some updated approved", y: 456.7, x: 456.7, location_id: 43, applicant: "some updated applicant", facility_type: "some updated facility_type", cnn: 43, location_description: "some updated location_description", block_lot: "some updated block_lot", lot: "some updated lot", food_items: "some updated food_items", latitude: 456.7, longitude: 456.7, schedule: "some updated schedule", dayshours: "some updated dayshours", noi_sent: "some updated noi_sent", received: "some updated received", prior_permit: "some updated prior_permit", expiration_date: "some updated expiration_date", fire_prevention_districts: 43, police_districts: 43, supervisor_districts: 43, zip_codes: "some updated zip_codes", neighborhoods_old: 43}

      assert {:ok, %Truck{} = truck} = MobileRestarant.update_truck(truck, update_attrs)
      assert truck.block == "some updated block"
      assert truck.status == "some updated status"
      assert truck.address == "some updated address"
      assert truck.permit == "some updated permit"
      assert truck.location == "some updated location"
      assert truck.approved == "some updated approved"
      assert truck.y == 456.7
      assert truck.x == 456.7
      assert truck.location_id == 43
      assert truck.applicant == "some updated applicant"
      assert truck.facility_type == "some updated facility_type"
      assert truck.cnn == 43
      assert truck.location_description == "some updated location_description"
      assert truck.block_lot == "some updated block_lot"
      assert truck.lot == "some updated lot"
      assert truck.food_items == "some updated food_items"
      assert truck.latitude == 456.7
      assert truck.longitude == 456.7
      assert truck.schedule == "some updated schedule"
      assert truck.dayshours == "some updated dayshours"
      assert truck.noi_sent == "some updated noi_sent"
      assert truck.received == "some updated received"
      assert truck.prior_permit == "some updated prior_permit"
      assert truck.expiration_date == "some updated expiration_date"
      assert truck.fire_prevention_districts == 43
      assert truck.police_districts == 43
      assert truck.supervisor_districts == 43
      assert truck.zip_codes == "some updated zip_codes"
      assert truck.neighborhoods_old == 43
    end

    test "update_truck/2 with invalid data returns error changeset" do
      truck = truck_fixture()
      assert {:error, %Ecto.Changeset{}} = MobileRestarant.update_truck(truck, @invalid_attrs)
      assert truck == MobileRestarant.get_truck!(truck.id)
    end

    test "delete_truck/1 deletes the truck" do
      truck = truck_fixture()
      assert {:ok, %Truck{}} = MobileRestarant.delete_truck(truck)
      assert_raise Ecto.NoResultsError, fn -> MobileRestarant.get_truck!(truck.id) end
    end

    test "change_truck/1 returns a truck changeset" do
      truck = truck_fixture()
      assert %Ecto.Changeset{} = MobileRestarant.change_truck(truck)
    end
  end
end
