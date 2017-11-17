defmodule EbooksStats do
  alias EbooksStats.Format.FB2

  def character_count(file) do
    FB2.character_count(file)
  end
end