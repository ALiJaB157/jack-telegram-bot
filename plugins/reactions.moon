reactions =
	"<b>¯\\_(ツ)_/¯</b>": "shrug"
	"<b>(⌐■_■)</b>": "shades"
	"👏👏👏👏👏": "clap"
	"<b>( ͡° ͜ʖ ͡°)</b>": "lenny"
	"<b>ಠ_ಠ</b>": "look"
	"<b>つ ◕_◕ ༽つ</b>": "gimme"
	"👍👍👍👍👍": "like"
	"😂😂😂😂😂": "lol"
	"<b>(╯°□°）╯︵ ┻━┻</b>": "flip"
	"<b>┬──┬◡ﾉ(° -°ﾉ)</b>": "unflip"
	"<b>┌（┌ ＾o＾）┐</b>": "homo"
	"<b>( ﾟヮﾟ)</b>": "happy"
	"<b>SHOTS FIRED</b>": "shots"

run = (msg,matches) ->
	pic = "http://icons.iconarchive.com/icons/iconsmind/outline/128/Smile-icon.png"
	text = '<b>Reactions!</b>\n'
	block = "["

	for k,v in pairs reactions
		text ..= "/#{v}:  #{k}\n"
		block ..= "#{inline_article_block v, k, "HTML", true, k, "#{pic}"}, "
		if msg.text\match v
			telegram!\sendMessage msg.chat.id, k, msg.message_id, "HTML"
			return

	if msg.chat.type == "inline"
		block ..= "#{inline_article_block "End", "End results", "Markdown", true, "End results", "#{pic}"}]"
		telegram!\sendInline msg.id,block
		return

	telegram!\sendMessage msg.chat.id, text, msg.message_id, "HTML"
	return

return {
	description: "*Reactions !*"
	usage: [[`/reactions`
	returns list of reactions
	]]
	patterns: {
	"^[!/#]shrug$"
	"^[!/#]shades$"
	"^[!/#]clap$"
	"^[!/#]lenny$"
	"^[!/#]look$"
	"^[!/#]gimme$"
	"^[!/#]like$"
	"^[!/#]lol$"
	"^[!/#]flip$"
	"^[!/#]unflip$"
	"^[!/#]homo$"
	"^[!/#]happy$"
	"^[!/#]shots$"
	"^[!/#]reactions$"
	--inline
	"^###inline[!/#]reactions$"
	}
	:run
}
