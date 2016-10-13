local _, namespace = ...

local Mail = {};
Mail.__index = Mail;

setmetatable(Mail, {
__call = function(cls, ...)
return cls.new(...)
end,
})

function Mail.new(user, subject, messageText)
    local self = setmetatable({}, Mail);
    self.user = user;
    self.subject = subject;
    self.messageText = messageText;
    return self;
end

function Mail:mailAll()
    local count = 1;
    for bag = 0,4,1 do
        for slot = 1, GetContainerNumSlots(bag), 1 do
            local name = GetContainerItemLink(bag,slot);
            if name then
                UseContainerItem(bag,slot);
                count = 1 + count;
                if count > 12 then
                    count = 1;
                    SendMail(self.user, self.subject, self.messageText);
                end;
            end;
        end;
    end;
end;

namespace.CRTX.Mail = Mail;
