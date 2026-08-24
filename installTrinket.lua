function sleep(n)
  os.execute("sleep " .. tonumber(n))
end

local shell = require("shell")
local arg, ops = shell.parse(...) 
local internet = require("internet")
local fs = require("filesystem")
function readurl(url)
  r = ""
  for chunk in internet.request("https://" .. url) do r = r .. chunk end
  return tostring(r)
end
function saveUrlToFile(url, fn)
  local f = io.open(fn, "w")
  print("GET "..url)
  f:write(readurl(url))
  f:close()
end
print("Innstalling to " .. arg[1] .. "...")
saveUrlToFile("https://raw.githubusercontent.com/mechanikate/trinket/refs/heads/main/init.lua", arg[1] .. "/init.lua")
sleep(3)
saveUrlToFile("https://raw.githubusercontent.com/mechanikate/trinket/refs/heads/main/keys.lua", arg[1] .. "/keys.lua")
sleep(3)
saveUrlToFile("https://raw.githubusercontent.com/mechanikate/trinket/refs/heads/main/lib.lua", arg[1] .. "/lib.lua")
sleep(3)
saveUrlToFile("https://raw.githubusercontent.com/mechanikate/trinket/refs/heads/main/terminal.lua", arg[1] .. "/terminal.lua")
sleep(3)
saveUrlToFile("https://raw.githubusercontent.com/mechanikate/trinket/refs/heads/main/texteditor.lua", arg[1] .. "/texteditor.lua")
sleep(3)
saveUrlToFile("https://raw.githubusercontent.com/mechanikate/trinket/refs/heads/main/loop.lua", arg[1] .. "/loop.lua")
print("Install should be done. Shutdown computer, remove OpenOS HDD, then boot up again!")
