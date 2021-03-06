require Logger

defmodule Experf.Http  do
  def request(id, url) do
    try do
      HTTPoison.get(url) |> handle_response(id)
    rescue
      error in HTTPoison.HTTPError ->
        Logger.info "#{id}: error (#{inspect error.message})"
    after
      send Experf.Coordinator, {:finished, id}
    end 
  end

  defp handle_response({:ok, %HTTPoison.Response{status_code: 200}}, id) do
    Logger.info "#{id}: success" 
  end

  defp handle_response({_, %HTTPoison.Response{status_code: status_code}}, id) do
    Logger.info "#{id}: error (#{status_code})"
    {:error, id, status_code}
  end

  defp handle_response({:error, %HTTPoison.Error{id: _, reason: reason}}, id) do
    Logger.info "#{id}: error (#{reason})"
    {:error, id, reason}
  end
end
