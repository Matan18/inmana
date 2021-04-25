defmodule Inmana.WellcomerTest do
  use ExUnit.Case, async: true

  alias Inmana.Wellcomer

  describe "wellcome/1" do
    test "when the user is special, returns a special message" do
      params = %{"name" => "banana", "age" => "42"}
      expected_result = {:ok, "You are very especial banana"}

      result = Wellcomer.wellcome(params)

      assert result == expected_result
    end

    test "when the user is not special, returns a message" do
      params = %{"name" => "matan", "age" => "42"}
      expected_result = {:ok, "Wellcome matan"}

      result = Wellcomer.wellcome(params)

      assert result == expected_result
    end

    test "when the user is under age, returns an error" do
      params = %{"name" => "matan", "age" => "17"}
      expected_result = {:error, "You shall not pass matan"}

      result = Wellcomer.wellcome(params)

      assert result == expected_result
    end
  end
end
