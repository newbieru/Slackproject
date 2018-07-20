defmodule Token do
  @moduledoc """
  Documentation for Test.
  """

	def read do
		token=String.replace(File.read!("lib/token.txt"),"\n","")
    token
	end
end
