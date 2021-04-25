defmodule InmanaWeb.RestaurantsControllerTest do
  use InmanaWeb.ConnCase, async: true

  describe "create/2" do
    test "when params are valid, creates the restaurant", %{conn: conn} do
      params = %{name: "Matan", email: "matan@gmail.com"}

      response =
        conn
        |> post(Routes.restaurants_path(conn, :create, params))
        |> json_response(:created)

      assert %{
               "message" => "Restaurant Created",
               "restaurant" => %{
                 "email" => "matan@gmail.com",
                 "id" => _id,
                 "name" => "Matan"
               }
             } = response
    end

    test "when there are invalide params, returns an error", %{conn: conn} do
      params = %{email: "matan@gmail.com"}
      expected_response = %{"message" => %{"name" => ["can't be blank"]}}

      response =
        conn
        |> post(Routes.restaurants_path(conn, :create, params))
        |> json_response(:bad_request)

      assert response == expected_response
    end
  end
end
