defmodule Experf do

  def main(args) do
    options = parse_args(args)
    coordinate_task = Task.async(Experf.Coordinator, :start, [options[:n]])
    do_requests(options[:n], options[:url])
    Task.await(coordinate_task, :infinity)
  end

  defp parse_args(args) do
    { options, _, _} = OptionParser.parse(args, switches: [n: :integer, url: :string])
    options    
  end

  defp do_requests(n, url) do
    Enum.each(1..n, fn(i) ->
      spawn Experf.Http, :request, [i, url]
    end)
  end
end
