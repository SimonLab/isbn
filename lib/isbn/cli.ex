defmodule ISBN.CLI do
  def main(argv) do
    parse_args(argv)
  end

  def parse_args(argv) do
    argv
    |> OptionParser.parse(switches: [help: :boolean], aliases: [h: :help])
    |> elem(1)
    |> args_to_internal_representation()
    |> process()
  end

  def args_to_internal_representation([isbn]) do
    try do
      isbn
      |> String.to_integer()
      |> Integer.digits()
      |> validate_isbn()
    rescue
      _ -> :help
    end
  end

  def args_to_internal_representation(_), do: :help

  # Check isbn length is 10 or 13
  # returns isbn or :help if not valid
  def validate_isbn(isbn) when not (length(isbn) == 10 or length(isbn) == 13), do: :help

  def validate_isbn(isbn), do: Integer.undigits(isbn)

  def process(:help) do
    IO.puts("""
    usage: isbn <isbn>
    """)

    System.halt(0)
  end

  def process(isbn) do
    IO.puts("fetch isbn title")
  end
end
