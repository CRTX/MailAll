local _, namespace = ...

local Parser = namespace.CRTX.Parser
local Mail = namespace.CRTX.Mail

SLASH_MAILALL1 = "/ma"
SLASH_MAILALL2 = "/mailall"
SlashCmdList["MAILALL"] = function(commands)
    local Parser = Parser(commands)
    local user, subject, messageText = Parser:parseSpacedArguments(3)
    local Mail = Mail(user, subject, messageText);
    Mail:mailAll();
end
