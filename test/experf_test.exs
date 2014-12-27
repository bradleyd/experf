defmodule ExperfTest do
  use ExUnit.Case

  test "correct arguments passed in" do
    results = Experf.main(["--n", "1", "--url", "http://www.sdhflsjfsljfsldfjsdfjlsfjls.com"])
    assert results == {:ok, "finished"}
  end
end
