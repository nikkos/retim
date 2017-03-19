defmodule Retim do

  @moduledoc """
  Provide methods to estimate the reading time of a file or a setence.
  """

  @doc """
  Count the words of a file.

  ## Examples

      iex> Retim.count_file("hello.md")
      "4 minutes"

      iex> Retim.count_file("hello.md", 120)
      "7 minutes"

  """

  def count_file(setence,lang \\ "en", average_reading_time \\ 180) do
    File.read(setence)
    |> Tuple.to_list 
    |> Enum.drop(1) 
    |> List.first 
    |> String.split(~r/[\s_&!?:@$%^,\.]+/)
    |> Enum.count
    |> estimate_reading_time(average_reading_time)
    |> print_reading_time(String.downcase(lang))
  end

  @doc """
  Count the words of a setence

  ## Examples

      iex> Retim.count("Hello World")
      "1 minute"

      iex> Retim.count("Hello World", 120)
      "1 minute"

  """
  def count(setence, lang \\ "en", average_reading_time \\ 180) do
    setence
    |> String.split(~r/[\s_&!?:@$%^,\.]+/)
    |> Enum.count
    |> estimate_reading_time(average_reading_time)
    |> print_reading_time(String.downcase(lang))
  end




  defp estimate_reading_time(setence, average_reading_time) do
    setence / average_reading_time
  end

  def choose_language(lang) do
      case lang do
        "gr" -> %Retim.Language {lang: "gr", enikos: "λεπτό", plural: "λεπτά"}
        "en" -> %Retim.Language {lang: "en", enikos: "minute", plural: "minutes"}
        "es" -> %Retim.Language {lang: "es", enikos: "minuto", plural: "minutos"}
        "it" -> %Retim.Language {lang: "it", enikos: "minuto", plural: "minuti"}
        _    -> %Retim.Language {lang: "en", enikos: "minute", plural: "minutes"}
      end
  end

  defp print_reading_time(reading_time, lang) do
    message = choose_language(lang)
    cond do
      reading_time <= 1 ->
       "1 #{message.enikos}"
      reading_time > 1  ->
        "#{round(reading_time)} #{message.plural}"
    end
  end

end

