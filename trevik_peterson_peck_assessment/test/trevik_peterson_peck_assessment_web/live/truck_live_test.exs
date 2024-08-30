defmodule TrevikPetersonPeckAssessmentWeb.TruckLiveTest do
  use TrevikPetersonPeckAssessmentWeb.ConnCase

  import Phoenix.LiveViewTest
  import TrevikPetersonPeckAssessment.MobileRestarantFixtures

  @create_attrs %{
    block: "some block",
    status: "some status",
    address: "some address",
    permit: "some permit",
    location: "some location",
    approved: "some approved",
    y: 120.5,
    x: 120.5,
    location_id: 42,
    applicant: "some applicant",
    facility_type: "some facility_type",
    cnn: 42,
    location_description: "some location_description",
    block_lot: "some block_lot",
    lot: "some lot",
    food_items: "some food_items",
    latitude: 120.5,
    longitude: 120.5,
    schedule: "some schedule",
    dayshours: "some dayshours",
    noi_sent: "some noi_sent",
    received: "some received",
    prior_permit: "some prior_permit",
    expiration_date: "some expiration_date",
    fire_prevention_districts: 42,
    police_districts: 42,
    supervisor_districts: 42,
    zip_codes: "some zip_codes",
    neighborhoods_old: 42
  }
  @update_attrs %{
    block: "some updated block",
    status: "some updated status",
    address: "some updated address",
    permit: "some updated permit",
    location: "some updated location",
    approved: "some updated approved",
    y: 456.7,
    x: 456.7,
    location_id: 43,
    applicant: "some updated applicant",
    facility_type: "some updated facility_type",
    cnn: 43,
    location_description: "some updated location_description",
    block_lot: "some updated block_lot",
    lot: "some updated lot",
    food_items: "some updated food_items",
    latitude: 456.7,
    longitude: 456.7,
    schedule: "some updated schedule",
    dayshours: "some updated dayshours",
    noi_sent: "some updated noi_sent",
    received: "some updated received",
    prior_permit: "some updated prior_permit",
    expiration_date: "some updated expiration_date",
    fire_prevention_districts: 43,
    police_districts: 43,
    supervisor_districts: 43,
    zip_codes: "some updated zip_codes",
    neighborhoods_old: 43
  }
  @invalid_attrs %{
    block: nil,
    status: nil,
    address: nil,
    permit: nil,
    location: nil,
    approved: nil,
    y: nil,
    x: nil,
    location_id: nil,
    applicant: nil,
    facility_type: nil,
    cnn: nil,
    location_description: nil,
    block_lot: nil,
    lot: nil,
    food_items: nil,
    latitude: nil,
    longitude: nil,
    schedule: nil,
    dayshours: nil,
    noi_sent: nil,
    received: nil,
    prior_permit: nil,
    expiration_date: nil,
    fire_prevention_districts: nil,
    police_districts: nil,
    supervisor_districts: nil,
    zip_codes: nil,
    neighborhoods_old: nil
  }

  defp create_truck(_) do
    truck = truck_fixture()
    %{truck: truck}
  end

  describe "Index" do
    setup [:create_truck]

    test "lists all trucks", %{conn: conn, truck: truck} do
      {:ok, _index_live, html} = live(conn, ~p"/trucks")

      assert html =~ "Listing Trucks"
      assert html =~ truck.block
    end

    test "saves new truck", %{conn: conn} do
      {:ok, index_live, _html} = live(conn, ~p"/trucks")

      assert index_live |> element("a", "New Truck") |> render_click() =~
               "New Truck"

      assert_patch(index_live, ~p"/trucks/new")

      assert index_live
             |> form("#truck-form", truck: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      assert index_live
             |> form("#truck-form", truck: @create_attrs)
             |> render_submit()

      assert_patch(index_live, ~p"/trucks")

      html = render(index_live)
      assert html =~ "Truck created successfully"
      assert html =~ "some block"
    end

    test "updates truck in listing", %{conn: conn, truck: truck} do
      {:ok, index_live, _html} = live(conn, ~p"/trucks")

      assert index_live |> element("#trucks-#{truck.id} a", "Edit") |> render_click() =~
               "Edit Truck"

      assert_patch(index_live, ~p"/trucks/#{truck}/edit")

      assert index_live
             |> form("#truck-form", truck: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      assert index_live
             |> form("#truck-form", truck: @update_attrs)
             |> render_submit()

      assert_patch(index_live, ~p"/trucks")

      html = render(index_live)
      assert html =~ "Truck updated successfully"
      assert html =~ "some updated block"
    end

    test "deletes truck in listing", %{conn: conn, truck: truck} do
      {:ok, index_live, _html} = live(conn, ~p"/trucks")

      assert index_live |> element("#trucks-#{truck.id} a", "Delete") |> render_click()
      refute has_element?(index_live, "#trucks-#{truck.id}")
    end
  end

  describe "Show" do
    setup [:create_truck]

    test "displays truck", %{conn: conn, truck: truck} do
      {:ok, _show_live, html} = live(conn, ~p"/trucks/#{truck}")

      assert html =~ "Show Truck"
      assert html =~ truck.block
    end

    test "updates truck within modal", %{conn: conn, truck: truck} do
      {:ok, show_live, _html} = live(conn, ~p"/trucks/#{truck}")

      assert show_live |> element("a", "Edit") |> render_click() =~
               "Edit Truck"

      assert_patch(show_live, ~p"/trucks/#{truck}/show/edit")

      assert show_live
             |> form("#truck-form", truck: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      assert show_live
             |> form("#truck-form", truck: @update_attrs)
             |> render_submit()

      assert_patch(show_live, ~p"/trucks/#{truck}")

      html = render(show_live)
      assert html =~ "Truck updated successfully"
      assert html =~ "some updated block"
    end
  end
end
