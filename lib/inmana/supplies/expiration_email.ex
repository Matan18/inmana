defmodule Inmana.Supplies.ExpirationEmail do
  import Bamboo.Email

  alias Inmana.Supply

  def create(to_email, supplies) do
    new_email(
      to: to_email,
      from: "mateusandriola@matandriola.com",
      subject: "Supplies that are about do expire",
      text_body: email_text(supplies)
    )
  end

  defp email_text(supplies) do
    initial_text = "------ Supplies that are about to expire ----- \n"

    supplies
    |> Enum.reduce(initial_text, fn supply, text ->
      text <> suppliy_string(supply)
    end)
  end

  defp suppliy_string(%Supply{
         description: description,
         responsible: responsible,
         expiration_date: expiration_date
       }) do
    "Decription: #{description}, Expiration date: #{expiration_date}, Responsible: #{responsible}.\n"
  end
end
