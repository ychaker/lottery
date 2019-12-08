defmodule Lottery do
  # alias Lottery.PossiblePicksGenerator, as: Generator
  alias Lottery.WinningNumbersParser,   as: Parser
  alias Lottery.RandomLotteryPicker,    as: Picker

  def run do
    # Only do this once
    # Generator.possibilities_to_file

    numbers = Parser.parse_file

    IO.puts inspect numbers

    pick      = Picker.pick_numbers |> Enum.sort
    megaball  = Picker.pick_megaball

    IO.puts inspect pick
    IO.puts inspect megaball
  end
end
