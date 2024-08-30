defmodule TrevikPetersonPeckAssessmentWeb.TruckLive.Index do
  use TrevikPetersonPeckAssessmentWeb, :live_view

  alias TrevikPetersonPeckAssessment.MobileRestarant
  alias TrevikPetersonPeckAssessment.MobileRestarant.Truck
  alias TrevikPetersonPeckAssessmentWeb.Router.Helpers, as: Routes

  @impl true
  def mount(_params, _session, socket) do
    %{
      entries: entries,
      page_number: page_number,
      page_size: page_size,
      total_entries: total_entries,
      total_pages: total_pages
    } =
      if connected?(socket), do: MobileRestarant.paginate_trucks(), else: %Scrivener.Page{}

    socket =
      socket
      |> assign(page_number: page_number || 0)
      |> assign(page_size: page_size || 0)
      |> assign(total_entries: total_entries || 0)
      |> assign(total_pages: total_pages || 0)

    {:ok, stream(socket, :trucks, entries)}
  end

  @impl true
  def handle_params(params, _url, socket) do
    %{
      entries: entries,
      page_number: page_number,
      page_size: page_size,
      total_entries: total_entries,
      total_pages: total_pages
    } =
      if connected?(socket), do: MobileRestarant.paginate_trucks(), else: %Scrivener.Page{}

    socket =
      socket
      |> assign(page_number: page_number || 0)
      |> assign(page_size: page_size || 0)
      |> assign(total_entries: total_entries || 0)
      |> assign(total_pages: total_pages || 0)
    {:noreply, apply_action(socket, socket.assigns.live_action, params)}
  end

  defp apply_action(socket, :edit, %{"id" => id}) do
    socket
    |> assign(:page_title, "Edit Truck")
    |> assign(:truck, MobileRestarant.get_truck!(id))
  end

  defp apply_action(socket, :new, _params) do
    socket
    |> assign(:page_title, "New Truck")
    |> assign(:truck, %Truck{})
  end

  defp apply_action(socket, :index, _params) do
    socket
    |> assign(:page_title, "Listing Trucks")
    |> assign(:truck, nil)
  end

  @impl true
  def handle_info(
        {TrevikPetersonPeckAssessmentWeb.TruckLive.FormComponent, {:saved, truck}},
        socket
      ) do
    {:noreply, stream_insert(socket, :trucks, truck)}
  end

  @impl true
  def handle_event("delete", %{"id" => id}, socket) do
    truck = MobileRestarant.get_truck!(id)
    {:ok, _} = MobileRestarant.delete_truck(truck)

    {:noreply, stream_delete(socket, :trucks, truck)}
  end

  def handle_event("nav", %{"page" => _page}, socket) do
    {:noreply, socket}
  end
end
