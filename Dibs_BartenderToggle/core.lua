BINDING_HEADER_BT4_TOGGLE = "Bartender4 Bar Toggle"

local buttons = {}
local function Init()
 for i = 1, 10 do
 _G["BINDING_NAME_CLICK BartenderBarToggleButton".. i ..":LeftButton"] = "Toggle bar ".. i
 local f = buttons[i]
 if not f then 
 f = CreateFrame("Button", "BartenderBarToggleButton".. i, UIParent, "SecureHandlerMouseUpDownTemplate")
 buttons[i] = f
 end
 local bar = _G["BT4Bar"..i]
 if bar then
 f:SetFrameRef("bar", bar)
 f:SetAttribute("_onmousedown", [=[ -- (self, button)
 self:GetFrameRef("bar"):Show()
 ]=])
 f:SetAttribute("_onmouseup", [=[ -- (self, button)
 self:GetFrameRef("bar"):Hide()
 ]=])
 end
 end
end

local BT4_AB = Bartender4:GetModule("ActionBars")
hooksecurefunc(BT4_AB, "OnEnable", Init)
hooksecurefunc(BT4_AB, "EnableBar", Init)