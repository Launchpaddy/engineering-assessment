defmodule TrevikPetersonPeckAssessment.Repo do
  use Ecto.Repo,
    otp_app: :trevik_peterson_peck_assessment,
    adapter: Ecto.Adapters.Postgres

  use Scrivener, page_size: 10
end
