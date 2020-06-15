local discordia = require('discordia')
local client = discordia.Client()

local prefix = "$"

discordia.extensions()

client:on('ready', function()
	print('Logged in as '.. client.user.username)
end)

local commands = {
    [prefix .. "ping"] = {
        description = "Replies to you with pong.",
        exec = function(msg)
            msg:reply("pong!")
        end
    },
    [prefix .. "say"] = {
        description = "Speak as the bot!",
        exec = function(msg)
            local content = msg.content
            local args = content:split(" ")
            
            table.remove(args, 1)
            msg.channel:send(table.concat(args, " "))
        end
    }
}

client:on('messageCreate', function(msg)
    local content = msg.content
    local args = content:split(" ")
    local author = msg.author
    
    if author == client.user then return end
    
    local command = commands[args[1]]
    if command then
        command.exec(msg)
    end
    
    if args[1] == prefix.."help" then
        local output = {}
        for word, tbl in pairs(commands) do
            table.insert(output, "Command: " .. word .. "\nDescription: " .. tbl.description)
        end
        
        msg:reply(table.concat(output, "\n\n"))
    end
end)

client:run('Bot PUT_TOKEN_HERE') -- Because it might be misleading. When inserting your token, keep the "Bot" part and just replace the PUT_TOKEN_HERE.