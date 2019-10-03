defmodule IsbnTest do
  use ExUnit.Case
  doctest Isbn

  test "check command line argument" do
    assert ISBN.CLI.args_to_internal_representation(["--help"]) == :help
    assert ISBN.CLI.args_to_internal_representation(["wrong args"]) == :help
    assert ISBN.CLI.args_to_internal_representation(["1234567891234"]) == 1_234_567_891_234
    assert ISBN.CLI.args_to_internal_representation(["1234567891"]) == 1_234_567_891
    assert ISBN.CLI.args_to_internal_representation(["123"]) == :help
  end
end
