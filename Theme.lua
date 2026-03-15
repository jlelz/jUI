local _,Addon = ...;

local Pink = {r = 255/255,g = 69/255,b = 237/255,};
local Green = {r = 0/255,g = 251/255,b = 0/255,};
local Purple = {r = 86/255,g = 9/255,b = 174/255,};
local Black = {r = 8/255,g = 8/255,b = 8/255,};
local Grey = {r = 3/255,g = 3/255,b = 3/255,};

local LightPink = {r = 255/255,g = 173/255,b = 243/255,};
local LightGreen = {r = 0/255,g = 250/255,b = 176/255};
local LightPurple = {r = 48/255,g = 30/255,b = 56/255,};
local LightBlack = {r = 18/255,g = 17/255,b = 17/255,};
local LightGrey = {r = 161/255,g = 161/255,b = 161/255,};

local Red = {r = 247/255,g = 8/255,b = 8/255,};
local White = {r = 255/255,g = 255/255,b = 255/255,};
local Yellow = {r = 237/255,g = 247/255,b = 8/255,};

Addon.Theme = {
    Font = {
        Family = 'Fonts\\FRIZQT__.TTF',
        Flags = 'OUTLINE, MONOCHROME',
        Large = 14,
        Normal = 10,
        Small = 8,
    },
    Text = {
        Colors = {
            Default = White,
            Highlight = Pink,
            Disabled = Grey,
            Error = Red,
            Warn = Yellow,
            Debug = LightGrey,
        },
        Alpha = 0.80,
    },
    Background = {
        Colors = {
            Default = Black,
        },
        Alpha = 0.89,
    },
    Foreground = {
        Colors = {
            Default = LightBlack,
        },
        Alpha = 0.86,
    },
    Seperator = {
        Colors = {
            Default = LightPurple,
        },
        Alpha = 0.90,
    },
    Button = {
        Colors = {
            Default = Purple,
        },
        Alpha = 0.50,
    },
    BookEndAlpha = 1.00,
};