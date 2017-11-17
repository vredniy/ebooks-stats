defmodule EbooksStats.Format.FB2 do
  import SweetXml

  def character_count(file) do
    File.read!(Path.expand(file))
    |> SweetXml.parse
    |> xpath(~x"//body[1]//*"l)
    |> Enum.map(fn (t) -> xpath(t, ~x"./text()"s) end)
    |> Enum.map(&String.trim/1)
    |> Enum.reject(fn(x) -> String.length(x) == 0 end)
    |> Enum.to_list
    |> Enum.join("\n")
    |> String.length
  end
end