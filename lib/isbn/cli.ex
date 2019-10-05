defmodule ISBN.CLI do
  @moduledoc """
  Parse command line arguments.
  """

  @doc """
  Process isbn argument
  """
  def main(argv) do
    argv
    |> parse_args()
    |> process()
  end

  @doc """
  Returs :help or isbn
  """
  def parse_args(argv) do
    argv
    |> OptionParser.parse(
      switches: [help: :boolean, isbn: :integer],
      aliases: [h: :help, i: :isbn]
    )
    |> elem(0)
    |> args_to_isbn()
    |> validate_isbn()
  end

  defp args_to_isbn(isbn: isbn), do: isbn
  defp args_to_isbn(_), do: nil

  def valid_isbn?(isbn) when is_integer(isbn) do
    digits = Integer.digits(isbn)
    length(digits) == 10 or length(digits) == 13
  end

  def valid_isbn?(_), do: false

  defp validate_isbn(isbn) do
    if valid_isbn?(isbn) do
      isbn
    else
      :help
    end
  end

  def process(:help) do
    IO.puts("""
    usage: isbn --isbn <isbn>
    """)

    System.halt(0)
  end

  def process(isbn) do
    IO.puts("fetch isbn title")
  end
end
