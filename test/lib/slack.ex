defmodule Slack do

	use HTTPoison.Base

	@endpoint "https://slack.com"

   def process_url(url) do
     @endpoint <> url
   end
end
