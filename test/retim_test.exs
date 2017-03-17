defmodule RetimTest do
  use ExUnit.Case
  doctest Retim
 

  test "uppercase converts the second word to uppercase" do
    assert(Retim.count("foo bar") == "1 minute")
  end

   test "asdasdasddfdf converts the second word to uppercase" do
    assert(Retim.count("Elixir is the best !", 2) == "3 minutes")
  end

  test "asdasdasd converts the second word to uppercase" do
    assert(Retim.count_file("hello.md") == "8 minutes")
  end

  test "upsadfasdf converts the second word to uppercase" do
    assert(Retim.count_file("hello.md", 120) == "13 minutes")
  end
end
