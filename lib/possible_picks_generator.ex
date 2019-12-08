defmodule Lottery.PossiblePicksGenerator do
  def combination(_, 0), do: [[]]

  def combination([], _), do: []

  def combination([x|xs], n) do
    (for y <- combination(xs, n - 1), do: [x|y]) ++ combination(xs, n)
  end

  @file_name "possibilities.txt"
  def possibilities_to_file do
    path = Path.join "src", @file_name

    possibilities  = combination(Enum.to_list(1..75), 5)

    result = Enum.map_join possibilities, "\n", fn poss ->  Enum.join(poss, ",") end

    File.write! path, result
  end
end
