defmodule History do
  @moduledoc """
  Documentation for Test.
  """
	HTTPoison.start
	use HTTPoison.Base

	 def get(channel) do
     token=Token.read()
     request="/api/conversations.history?token=#{token}&channel=#{channel}"
     resp=Slack.get!(request)
     msg=Poison.Parser.parse!(resp.body, keys: :atoms)
		 msg=Enum.reverse msg.messages
		 inspected=inspect(msg, pretty: true)

		 {:ok, history}= File.open "#{channel}_log.txt", [:write]
		 IO.binwrite(history, inspected)
		 File.close history
		 File.read! "#{channel}_log.txt"

	 end
end

# resp.body
# msg=for item <- msg, do: Map.to_list(Map.drop(item, [:edited]))
# str=List.to_string msg
# IO.puts msg
# msg
# str
# inspected
# channel
# oldest=
# case _from_last_time do
#   1 -> Ts.read()
#   _ -> ""
# end

# request
