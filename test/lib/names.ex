defmodule Names do
  @moduledoc """
  Documentation for Test.
  """
	HTTPoison.start
	use HTTPoison.Base

	def nm(list) do

		fun=&(Extr.mklist(&1))
		names_list=Enum.map(list, fun)
		names_list
	end
end
# user_list_length=length(user_list)
