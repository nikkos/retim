defmodule Retim do
  @moduledoc """
  Provide methods to estimate the reading time of a file or a setence.
  """

  @doc """
  Count the words of a file.

  ## Examples

      iex> Retim.count_file("hello.md")
      "8 minutes"

      iex> Retim.count_file("hello.md", 120)
      "13 minutes"

  """

  def count_file(setence, average_reading_time \\ 180) do
    File.read(setence)
    |> Tuple.to_list 
    |> Enum.drop(1) 
    |> List.first 
    |> String.split(~r/[\s_&!?:@$%^,\.]+/)
    |> Enum.count
    |> estimate_reading_time(average_reading_time)
    |> print_reading_time
  end

  @doc """
  Count the words of a setence

  ## Examples

      iex> Retim.count("Hello World")
      "1 minute"

      iex> Retim.count("Hello World", 120)
      "1 minute"

  """
  def count(setence, average_reading_time \\ 180) do
    setence
    |> String.split(~r/[\s_&!?:@$%^,\.]+/)
    |> Enum.count
    |> estimate_reading_time(average_reading_time)
    |> print_reading_time
  end



  @doc """
  The estimate_reading_method count the reading time.
  """
  def estimate_reading_time(setence, average_reading_time) do
    setence / average_reading_time
  end

  @doc """
  The print_reading_time method print the final result.
  """
  def print_reading_time(reading_time) do
    cond do
      reading_time <= 1 ->
        "1 minute"
      reading_time > 1  ->
        "#{round(reading_time)} minutes"
    end
 end

end
