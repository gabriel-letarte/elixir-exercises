defmodule PatternMatching do
  @doc """
  a = [1, 2, 3]
  """
  def eg1 do a = [1, 2, 3] end

  @doc """
  a = 4
  """
  def eg2 do a = 4 end

  @doc """
  a = [[1, 2, 3]]
  """
  def eg3 do a = [[1, 2, 3]] end

  @doc """
  [a] = [[1, 2, 3]]
  """
  def eg4 do [a] = [[1, 2, 3]] end

  @doc """
  Pin value of `b` to 4

  b = 4
  [a, ^b] = [1, 4]
  [a, ^b] = [1, 2] # err
  """
  def eg5 do
    b = 4
    [a, ^b] = [1, 4]
    [a, ^b] = [1, 2] # err
  end

  def run do
    PatternMatching
    |> Code.get_docs(:docs)
    |> Enum.each(fn doc ->
      fn_name =
        Tuple.to_list(doc)
        |> Enum.at(0)
        |> Tuple.to_list
        |> Enum.at(0)

      fn_doc =
        Tuple.to_list(doc)
        |> Enum.at(4)

    _execute(fn_name, fn_doc)

    end)
  end

  def _execute(:run, _) do end
  def _execute(:_execute, _) do end
  def _execute(fn_name, fn_doc) do
    IO.puts("  ")
    IO.puts("| #{fn_name} -----------------------------------------------------------")
    IO.puts(fn_name)
    IO.puts(fn_doc)

    apply(PatternMatching, fn_name, [])
    |> to_string
    |> IO.inspect
  end
end

IO.puts "Pattern Matching Examples"
