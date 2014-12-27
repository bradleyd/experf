defmodule ExperfHttpTest do
  use ExUnit.Case

  test "request returns ok" do
    coordinate_task = Task.async(Experf.Coordinator, :start, [1])
    results = Experf.Http.request(1, "http://www.example.com")
    Task.await(coordinate_task)
    assert results == :ok
  end

  test "request returns error" do
    coordinate_task = Task.async(Experf.Coordinator, :start, [1])
    results = Experf.Http.request(1, "http://www.iamnotarealsite.com")
    Task.await(coordinate_task)
    assert results == {:error, 1, :nxdomain}
  end
end
