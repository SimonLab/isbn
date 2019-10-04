defmodule IsbnTest do
  use ExUnit.Case
  doctest Isbn

  test "check command line argument" do
    assert ISBN.CLI.parse_args(["--help"]) == :help
    assert ISBN.CLI.parse_args([]) == :help

    assert ISBN.CLI.parse_args(["--isbn", "1234567891234"]) ==
             1_234_567_891_234

    assert ISBN.CLI.parse_args(["-i", "1234567891"]) == 1_234_567_891
    assert ISBN.CLI.parse_args(["--isbn", "123"]) == :help
  end
end
