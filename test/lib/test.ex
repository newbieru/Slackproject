defmodule Test do
  @moduledoc """
  Documentation for Test.
  """
	HTTPoison.start
	use HTTPoison.Base

  def get_im_list do
		token=Token.read()
		resp = Slack.get!("/api/im.list?token=#{token}&pretty=1")
		list=Poison.Parser.parse!(resp.body, keys: :atoms)

		extract_u=&(&1.user)
		extract_ch=&(&1.id)

		user_list= Enum.map(list.ims, extract_u)
		ch_id_list=Enum.map(list.ims, extract_ch)
		names_list= for x <- user_list, do: Extr.mklist(x)
		names_list_a= for x <- names_list,do: String.to_atom(x)
		comb=Enum.zip(names_list_a,ch_id_list)
		# names_list
		# user_list
		# List.zip
		comb
		end
end

# print =&(IO.puts(&1))
# n=length(names_list)
# num= for i<- 1..n, do: i
# num2=Enum.each(num,&List.to_atom(&1))
# Enum.zip(Enum.each(num,))
# num2
# names_list= Names.nm(user_list)
