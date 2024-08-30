defmodule TrevikPetersonPeckAssessmentWeb.TruckLive.FormComponent do
  use TrevikPetersonPeckAssessmentWeb, :live_component

  alias TrevikPetersonPeckAssessment.MobileRestarant

  @impl true
  def render(assigns) do
    ~H"""
    <div>
      <.header>
        <%= @title %>
        <:subtitle>Use this form to manage truck records in your database.</:subtitle>
      </.header>

      <.simple_form
        for={@form}
        id="truck-form"
        phx-target={@myself}
        phx-change="validate"
        phx-submit="save"
      >
        <.input field={@form[:location_id]} type="number" label="Location" />
        <.input field={@form[:applicant]} type="text" label="Applicant" />
        <.input field={@form[:facility_type]} type="text" label="Facility type" />
        <.input field={@form[:cnn]} type="number" label="Cnn" />
        <.input field={@form[:location_description]} type="text" label="Location description" />
        <.input field={@form[:address]} type="text" label="Address" />
        <.input field={@form[:block_lot]} type="text" label="Block lot" />
        <.input field={@form[:block]} type="text" label="Block" />
        <.input field={@form[:lot]} type="text" label="Lot" />
        <.input field={@form[:permit]} type="text" label="Permit" />
        <.input field={@form[:status]} type="text" label="Status" />
        <.input field={@form[:food_items]} type="text" label="Food items" />
        <.input field={@form[:x]} type="number" label="X" step="any" />
        <.input field={@form[:y]} type="number" label="Y" step="any" />
        <.input field={@form[:latitude]} type="number" label="Latitude" step="any" />
        <.input field={@form[:longitude]} type="number" label="Longitude" step="any" />
        <.input field={@form[:schedule]} type="text" label="Schedule" />
        <.input field={@form[:dayshours]} type="text" label="Dayshours" />
        <.input field={@form[:noi_sent]} type="text" label="Noi sent" />
        <.input field={@form[:approved]} type="text" label="Approved" />
        <.input field={@form[:received]} type="text" label="Received" />
        <.input field={@form[:prior_permit]} type="text" label="Prior permit" />
        <.input field={@form[:expiration_date]} type="text" label="Expiration date" />
        <.input field={@form[:location]} type="text" label="Location" />
        <.input field={@form[:fire_prevention_districts]} type="number" label="Fire prevention districts" />
        <.input field={@form[:police_districts]} type="number" label="Police districts" />
        <.input field={@form[:supervisor_districts]} type="number" label="Supervisor districts" />
        <.input field={@form[:zip_codes]} type="text" label="Zip codes" />
        <.input field={@form[:neighborhoods_old]} type="number" label="Neighborhoods old" />
        <:actions>
          <.button phx-disable-with="Saving...">Save Truck</.button>
        </:actions>
      </.simple_form>
    </div>
    """
  end

  @impl true
  def update(%{truck: truck} = assigns, socket) do
    {:ok,
     socket
     |> assign(assigns)
     |> assign_new(:form, fn ->
       to_form(MobileRestarant.change_truck(truck))
     end)}
  end

  @impl true
  def handle_event("validate", %{"truck" => truck_params}, socket) do
    changeset = MobileRestarant.change_truck(socket.assigns.truck, truck_params)
    {:noreply, assign(socket, form: to_form(changeset, action: :validate))}
  end

  def handle_event("save", %{"truck" => truck_params}, socket) do
    save_truck(socket, socket.assigns.action, truck_params)
  end

  defp save_truck(socket, :edit, truck_params) do
    case MobileRestarant.update_truck(socket.assigns.truck, truck_params) do
      {:ok, truck} ->
        notify_parent({:saved, truck})

        {:noreply,
         socket
         |> put_flash(:info, "Truck updated successfully")
         |> push_patch(to: socket.assigns.patch)}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign(socket, form: to_form(changeset))}
    end
  end

  defp save_truck(socket, :new, truck_params) do
    case MobileRestarant.create_truck(truck_params) do
      {:ok, truck} ->
        notify_parent({:saved, truck})

        {:noreply,
         socket
         |> put_flash(:info, "Truck created successfully")
         |> push_patch(to: socket.assigns.patch)}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign(socket, form: to_form(changeset))}
    end
  end

  defp notify_parent(msg), do: send(self(), {__MODULE__, msg})
end
