defmodule Lottery.WinningNumbersParser do
  @moduledoc """
  Reads a `.txt` file of winning numbers and parses them into objects
  that can be understood and manipulated

  ## Examples

      ```
      // winning_numbers.txt
      10/27/2015; 9,26,27,29,74; Mega Ball: 4
      10/23/2015; 25,32,37,45,70; Mega Ball: 1
      10/20/2015; 6,25,35,38,52; Mega Ball: 4
      ```

      Would be split out into structs of the format:

      ```
      %{date: "10/27/2015", money_ball: "4", numbers: "9,26,27,29,74"}
      ```

  """

  # require Lottery.WinningNumber
  alias Lottery.WinningNumber
  @file_name "winning_numbers.txt"


  @doc """
  Parses the whole `.txt` file and then parses each line in the file.
  """
  def parse_file do
    path = Path.join "src", @file_name

    File.stream!(path) |>  Enum.map(fn line ->
      parse_line(line)
    end)
  end

  defp parse_line line do
    parts = String.split(line, ";", trim: true)

    [ date | [ numbers | [ money_ball_string | _ ] ] ] = parts

    money_ball_parts  = String.split(money_ball_string, ":", trim: true)
    money_ball        = List.last(money_ball_parts) |> String.strip

    %WinningNumber{
      date: String.strip(date),
      numbers: String.strip(numbers),
      money_ball: money_ball
    }
  end
end
