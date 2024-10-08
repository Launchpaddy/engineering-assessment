defmodule TrevikPetersonPeckAssessmentWeb.TruckLive.Show do
  use TrevikPetersonPeckAssessmentWeb, :live_view

  alias TrevikPetersonPeckAssessment.MobileRestarant

  @impl true
  def mount(_params, _session, socket) do
    {:ok, socket}
  end

  @impl true
  def handle_params(%{"id" => id}, _, socket) do
    {:noreply,
     socket
     |> assign(:page_title, page_title(socket.assigns.live_action))
     |> assign(:truck, MobileRestarant.get_truck!(id))}
  end

  defp page_title(:show), do: "Show Truck"
  defp page_title(:edit), do: "Edit Truck"
end
