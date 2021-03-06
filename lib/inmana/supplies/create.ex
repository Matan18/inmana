defmodule Inmana.Supplies.Create do
  alias Inmana.{Supply, Repo}

  def call(params) do
    params
    |> Supply.changeset()
    |> Repo.insert()
    |> handle_insert()
  end

  def handle_insert({:ok, %Supply{}} = result), do: result
  def handle_insert({:error, result}), do: {:error, %{result: result, status: :bad_request}}
end
