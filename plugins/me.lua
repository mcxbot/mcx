-- Begin myinfo.lua
local function run(msg, matches)
	if matches[1]:lower() == 'me' then
		function get_id(arg, data)
			local username
			if data.first_name_ then
				if data.username_ then
					username = '@'..data.username_
				else
					username = '<i>No Username!</i>'
				end
				local telNum
				if data.phone_number_ then
					telNum = '+'..data.phone_number_
				else
					telNum = '----'
				end
				local lastName
				if data.last_name_ then
					lastName = data.last_name_
				else
					lastName = '----'
				end
				local rank
				if is_sudo(msg) then
					rank = 'Sudo'
				elseif is_owner(msg) then
					rank = 'Bot Owner'
				elseif is_admin(msg) then
					rank = 'Admin'
				elseif is_mod(msg) then
					rank = 'Moderator'
				else
					rank = 'Group Member'
				end
				local text = '<b>FirstName ➮</b> '..data.first_name_..'\n<b>LastName ➮</b> '..lastName..'\n<b>UserName ➮</b> '..username..'\n<b>Your ID ➮</b> <i>'..data.id_..'</i>\n<b>ID Group ➮</b> <i>'..arg.chat_id:gsub('-100','')..'</i>\n<b>Phone ➮</b> <i>'..telNum..'</i>\n<b>Rank ➮</b> <i>'..rank..'</i>'
				tdcli.sendMessage(arg.chat_id, msg.id_, 1, text, 1, 'html')
			end
		end
		tdcli_function({ ID = 'GetUser', user_id_ = msg.sender_user_id_, }, get_id, {chat_id=msg.chat_id_, user_id=msg.sendr_user_id_})
	end
end

return { patterns = 
	{ "^[/!#]([Mm][Ee])$","^([Mm][Ee])$" }, 
	run = run
	}
