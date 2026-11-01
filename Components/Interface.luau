local Library = (Abysall.UILibrary == "Linoria" and "LinoriaLib" or "Obsidian")
-- local BaseUrl = "https://raw.githubusercontent.com/mstudio45/" .. Library .. "/refs/heads/main/" -- broken since upio github got banned
local BaseUrl = "https://raw.githubusercontent.com/deividcomsono/Obsidian/refs/heads/main/"
local AbysallUrl = "https://raw.githubusercontent.com/bocaj111004/Abysall/refs/heads/main/"

local Interface = {
  Library = loadstring(game:HttpGet(BaseUrl .. "Library.lua"))(),
  SaveManager = loadstring(game:HttpGet(BaseUrl .. "addons/SaveManager.lua"))(),
  ThemeManager = loadstring(game:HttpGet(BaseUrl .. "addons/ThemeManager.lua"))(),

  ApplyInfoTab = loadstring(game:HttpGet(AbysallUrl .. "Components/InfoTab.luau"))(),
  ApplySettingsTab = loadstring(game:HttpGet(AbysallUrl .. "Components/SettingsTab.luau"))()
}

Interface.ThemeManager.BuiltInThemes = {
	-- Original Default
	["Default"]        = { 1,  { FontColor = "ffffff", MainColor = "1c1c1c", AccentColor = "0055ff", BackgroundColor = "141414", OutlineColor = "323232" } },

	-- Seasonal Themes
	["Nya~!"]                  = { 1,  { FontColor = "68ba95", MainColor = "191919", AccentColor = "bb4d4d", BackgroundColor = "000000", OutlineColor = "282828", BackgroundImage = "85834287002942", FontFace = "Code" } },
	["Valentines"]             = { 2,  { FontColor = "ffffff", MainColor = "1c1019", AccentColor = "e85b83", BackgroundColor = "100910", OutlineColor = "492333", FontFace = "Code" } },
	["St. Patrick's Day"]      = { 3,  { FontColor = "ffffff", MainColor = "071810", AccentColor = "39a96b", BackgroundColor = "030c07", OutlineColor = "24543a", FontFace = "Code" } },
	["Easter"]                 = { 4,  { FontColor = "ffffff", MainColor = "171322", AccentColor = "b68be8", BackgroundColor = "0b0912", OutlineColor = "49365e", FontFace = "Code" } },

	-- Regular Themes
	["BBot"]                   = { 5,  { FontColor = "ffffff", MainColor = "1e1e1e", AccentColor = "7e48a3", BackgroundColor = "232323", OutlineColor = "141414" } },
	["Fatality"]               = { 6,  { FontColor = "ffffff", MainColor = "1e1842", AccentColor = "c50754", BackgroundColor = "191335", OutlineColor = "3c355d" } },
	["Jester"]                 = { 7,  { FontColor = "ffffff", MainColor = "242424", AccentColor = "db4467", BackgroundColor = "1c1c1c", OutlineColor = "373737" } },
	["Mint"]                   = { 8,  { FontColor = "ffffff", MainColor = "242424", AccentColor = "3db488", BackgroundColor = "1c1c1c", OutlineColor = "373737" } },
	["Tokyo Night"]            = { 9,  { FontColor = "ffffff", MainColor = "191925", AccentColor = "6759b3", BackgroundColor = "16161f", OutlineColor = "323232" } },

	-- Halloween / Thanksgiving / Christmas
	["Spooky Scary Skeletons"] = { 10, { FontColor = "ffffff", MainColor = "050717", AccentColor = "e36600", BackgroundColor = "03040d", OutlineColor = "000000", BackgroundImage = "7428858898", FontFace = "Code" } },
	["Thanksgiving"]           = { 11, { FontColor = "ffffff", MainColor = "1c120b", AccentColor = "d88938", BackgroundColor = "0d0805", OutlineColor = "56351e", FontFace = "Code" } },
	["Christmas"]              = { 12, { FontColor = "ffffff", MainColor = "070805", AccentColor = "242599", BackgroundColor = "000000", OutlineColor = "000000", BackgroundImage = "89924308622883", FontFace = "Code" } },

	-- More Regular Themes
	["Ubuntu"]                 = { 13, { FontColor = "ffffff", MainColor = "3e3e3e", AccentColor = "e2581e", BackgroundColor = "323232", OutlineColor = "191919" } },
	["Quartz"]                 = { 14, { FontColor = "ffffff", MainColor = "232330", AccentColor = "426e87", BackgroundColor = "1d1b26", OutlineColor = "27232f" } },
	["Nord"]                   = { 15, { FontColor = "eceff4", MainColor = "3b4252", AccentColor = "88c0d0", BackgroundColor = "2e3440", OutlineColor = "4c566a" } },
	["Dracula"]                = { 16, { FontColor = "f8f8f2", MainColor = "44475a", AccentColor = "ff79c6", BackgroundColor = "282a36", OutlineColor = "6272a4" } },
	["Monokai"]                = { 17, { FontColor = "f8f8f2", MainColor = "272822", AccentColor = "f92672", BackgroundColor = "1e1f1c", OutlineColor = "49483e" } },
	["Gruvbox"]                = { 18, { FontColor = "ebdbb2", MainColor = "3c3836", AccentColor = "fb4934", BackgroundColor = "282828", OutlineColor = "504945" } },
	["Solarized"]              = { 19, { FontColor = "839496", MainColor = "073642", AccentColor = "cb4b16", BackgroundColor = "002b36", OutlineColor = "586e75" } },
	["Catppuccin"]             = { 20, { FontColor = "d9e0ee", MainColor = "302d41", AccentColor = "f5c2e7", BackgroundColor = "1e1e2e", OutlineColor = "575268" } },
	["One Dark"]               = { 21, { FontColor = "abb2bf", MainColor = "282c34", AccentColor = "c678dd", BackgroundColor = "21252b", OutlineColor = "5c6370" } },
	["Cyberpunk"]              = { 22, { FontColor = "f9f9f9", MainColor = "262335", AccentColor = "00ff9f", BackgroundColor = "1a1a2e", OutlineColor = "413c5e" } },
	["Oceanic Next"]           = { 23, { FontColor = "d8dee9", MainColor = "1b2b34", AccentColor = "6699cc", BackgroundColor = "16232a", OutlineColor = "343d46" } },
	["Material"]               = { 24, { FontColor = "eeffff", MainColor = "212121", AccentColor = "82aaff", BackgroundColor = "151515", OutlineColor = "424242" } },
}



return Interface
