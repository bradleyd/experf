defmodule ExperfTest do
  use ExUnit.Case

  test "correct arguments passed in" do
    restuls = Experf.main(["--n", "1", "--url", "http://www.sdhflsjfsljfsldfjsdfjlsfjls.com"])
    #assert expected == actual
  end
end
