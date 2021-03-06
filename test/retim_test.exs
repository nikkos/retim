defmodule RetimTest do
  use ExUnit.Case
  doctest Retim

  test "estimate the reading time of the setence" do
    assert(Retim.count("foo bar") == "1 minute")
  end

  test "change the average reading time" do
    assert(Retim.count("Elixir is the best !", "en", 2) == "3 minutes")
  end

  test "estimate the reading time of the file" do
    assert(Retim.count_file("hello.md") == "4 minutes")
  end

  test "change the average reading time(of a file)" do
    assert(Retim.count_file("hello.md", "en", 120) == "7 minutes")
  end

  test "change the default language to spanish" do
    assert(Retim.count_file("hello.md", "es", 120) == "7 minutos")
  end
end
