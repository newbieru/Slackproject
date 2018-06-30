defmodule Extr do
  @moduledoc """
  Documentation for Test.
  """
	HTTPoison.start
	use HTTPoison.Base

	def mklist(item) do
		token= Token.read()
		resp1=Slack.get!("/api/users.info?token=#{token}&user=#{item}&pretty=1")
		info= Poison.Parser.parse!(resp1.body, keys: :atoms)
		name=info.user.name
		name
	end
end
# user=Enum.at(user_list,count)
# user_list_length=length(user_list)
