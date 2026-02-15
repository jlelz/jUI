local _,Addon = ...;

local Pink = {
    r = 255/255,
    g = 69/255,
    b = 237/255,
};
local Purple = {
    r = 86/255,
    g = 9/255,
    b = 174/255,
};
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
            Default = {         -- white
                r = 255/255,
                g = 255/255,
                b = 255/255,
            },
            Highlight = Pink,
            Disabled = {        -- grey
                r = 3/255,
                g = 3/255,
                b = 3/255,
            },
            Error = {           -- red
                r = 247/255,
                g = 8/255,
                b = 8/255,
            },
            Warn = {            -- yellow
                r = 237/255,
                g = 247/255,
                b = 8/255,
            },
            Debug = {           -- grey
                r = 161/255,
                g = 161/255,
                b = 161/255,
            },
        },
        Alpha = 0.80,
    },
    Background = {
        Colors = {
            Default = {           -- black
                r = 8/255,
                g = 8/255,
                b = 8/255,
            },
        },
        Alpha = 0.89,
    },
    Foreground = {
        Colors = {
            Default = {           -- black
                r = 18/255,
                g = 17/255,
                b = 17/255,
            },
        },
        Alpha = 0.86,
    },
    Seperator = {
        Colors = {
            Default = {         -- purple
                r = 48/255,
                g = 30/255,
                b = 56/255,
            },
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