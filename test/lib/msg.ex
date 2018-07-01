defmodule Msg do
  @moduledoc """
  Documentation for Test.
  """
	HTTPoison.start
	use HTTPoison.Base

	 def put_msg do
		token= Token.read()
		id=""
		text=""
		IO.puts("Please enter id:")
		id =IO.gets id
		id =String.replace(id,"\n","")
		# id

		IO.puts("Please enter message:")
		text= IO.gets text
		method="/api/chat.postMessage"
		body= Poison.encode!(%{channel: id, text: text, as_user: true})
		headers=[{"Content-Type", "application/json; charset=utf-8"},{"Authorization","Bearer #{token}"}]
		# IO.puts method
		# IO.puts body
		# IO.puts headers
		Slack.post!(method,body,headers)
	 end
end

# names_list= Names.nm(user_list)
