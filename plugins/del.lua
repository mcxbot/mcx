do

function run(msg, matches)
      if msg.reply_to_message_id_ and is_sudo(msg) then
      tdcli.deleteMessages(msg.chat_id_, {[0] = msg.id_}, dl_cb, nil)
    tdcli.deleteMessages(msg.chat_id_, {[0] = msg.reply_to_message_id_}, dl_cb, nil)
      else
    return 
    end
end

return {
    description = "", 
    usage = "",
    patterns = {
      "^([dD]el)$",
      "^[/!#]([dD]el)$"
    }, 
    run = run 
}

end