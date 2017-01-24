----------------------------------------------------
--      ___  ___ _____            __   _____      --
--     |   \| _ )_   _|__ __ _ _ _\ \ / /_  )     --
--     | |) | _ \ | |/ -_) _` | '  \ V / / /      --
--     |___/|___/ |_|\___\__,_|_|_|_\_/ /___|     --
--                                                --
----------------------------------------------------

function send_ID_by_reply(channel_id, message_id)
    get_msg_info(channel_id, message_id, getID_by_reply_cb, false)
end

function getID_by_reply_cb(arg, msg)
    send_msg(msg.chat_id_, "`ایدی کاربر:` " .. msg.sender_user_id_ .. "\n`شناسه گروه:` " .. msg.chat_id_, "md")
end

local function run(msg, matches)
    if not msg.reply_id then
    	send_msg(msg.to.id, "`ایدی کاربر:` " .. msg.from.id .. "\n*`شناسه گروه:` " .. msg.to.id, "md")
    else
    	send_ID_by_reply(msg.to.id, msg.reply_id)
    end
end

return {
  patterns = {
    "^[!#/]id"
  },
  run = run
}
