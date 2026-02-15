-- https://warcraft.wiki.gg/wiki/Patch_11.0.0/API_changes
-- @todo
local AddonName,Addon = ...;

Addon.FRAMES = CreateFrame( 'Frame' );

Addon.FRAMES.Debug = function( self,... )
    local Prefix = CreateColor(
        Addon.Theme.Text.Colors.Debug.r,
        Addon.Theme.Text.Colors.Debug.g,
        Addon.Theme.Text.Colors.Debug.b
    ):WrapTextInColorCode( AddonName..' Debug' );

    _G[ 'DEFAULT_CHAT_FRAME' ]:AddMessage( string.join( ' ', Prefix, ... ) );
end

Addon.FRAMES.Notify = function( self,... )
    local Prefix = CreateColor(
        Addon.Theme.Text.Colors.Highlight.r,
        Addon.Theme.Text.Colors.Highlight.g,
        Addon.Theme.Text.Colors.Highlight.b
    ):WrapTextInColorCode( AddonName );

    _G[ 'DEFAULT_CHAT_FRAME' ]:AddMessage( string.join( ' ', Prefix, ... ) );
end

Addon.FRAMES.Warn = function( self,... )
    local Prefix = CreateColor(
        Addon.Theme.Text.Colors.Warn.r,
        Addon.Theme.Text.Colors.Warn.g,
        Addon.Theme.Text.Colors.Warn.b
    ):WrapTextInColorCode( AddonName );

    _G[ 'DEFAULT_CHAT_FRAME' ]:AddMessage( string.join( ' ', Prefix, ... ) );
end

Addon.FRAMES.Error = function( self,... )
    local Prefix = CreateColor(
        Addon.Theme.Text.Colors.Error.r,
        Addon.Theme.Text.Colors.Error.g,
        Addon.Theme.Text.Colors.Error.b
    ):WrapTextInColorCode( AddonName );

    _G[ 'DEFAULT_CHAT_FRAME' ]:AddMessage( string.join( ' ', Prefix, ... ) );
end

Addon.FRAMES.AddLocked = function( self,VarData,Parent )
    local FontString = Parent:CreateFontString( nil,'ARTWORK','GameFontHighlightSmall' );
    FontString:SetFont( Addon.Theme.Font.Family, Addon.Theme.Font.Normal, Addon.Theme.Font.Flags );
    FontString:SetText( VarData.DisplayText );
    FontString:SetTextColor( 
        Addon.Theme.Text.Colors.Error.r,
        Addon.Theme.Text.Colors.Error.g,
        Addon.Theme.Text.Colors.Error.b,
        Addon.Theme.Text.Alpha
    );
    FontString:SetJustifyH( 'left' );
    FontString:SetJustifyV( 'top' );
    return FontString;
end

Addon.FRAMES.AddLabel = function( self,VarData,Parent,Color )
    local FontString = Parent:CreateFontString( nil,'ARTWORK','GameFontHighlightSmall' );
    FontString:SetFont( Addon.Theme.Font.Family, Addon.Theme.Font.Normal, Addon.Theme.Font.Flags );
    FontString:SetText( VarData.DisplayText );
    if( VarData.Flagged ) then
        FontString:SetTextColor( 
            Addon.Theme.Text.Colors.Disabled.r,
            Addon.Theme.Text.Colors.Disabled.g,
            Addon.Theme.Text.Colors.Disabled.b,
            Addon.Theme.Text.Alpha
        );
    else
        local Color = Color or Addon.Theme.Text.Colors.Default;
        FontString:SetTextColor( 
            Color.r,
            Color.g,
            Color.b,
            Addon.Theme.Text.Alpha
        );
    end
    FontString:SetJustifyH( 'left' );
    FontString:SetJustifyV( 'top' );
    return FontString;
end

Addon.FRAMES.AddTip = function( self,VarData,Parent,Color )
    local FontString = Parent:CreateFontString( nil,'ARTWORK','GameFontHighlightSmall' );
    FontString:SetFont( Addon.Theme.Font.Family, Addon.Theme.Font.Normal, Addon.Theme.Font.Flags );
    FontString:SetText( VarData.DisplayText );
    if( VarData.Flagged ) then
        FontString:SetTextColor( 
            Addon.Theme.Text.Colors.Disabled.r,
            Addon.Theme.Text.Colors.Disabled.g,
            Addon.Theme.Text.Colors.Disabled.b
        );
    else
        local Color = Color or Addon.Theme.Text.Colors.Default;
        FontString:SetTextColor( 
            Color.r,
            Color.g,
            Color.b,
            Addon.Theme.Text.Alpha
        );
    end
    FontString:SetJustifyH( 'left' );
    FontString:SetJustifyV( 'top' );
    Parent.DataKeys = {
        Name = VarData.Name,
        DisplayText = VarData.DisplayText,
        Description = VarData.Description,
        Parent = FontString
    };
    Parent:SetScript( 'OnEnter',function( self )
        GameTooltip:SetOwner( self.DataKeys.Parent,'ANCHOR_NONE',0,0 );
        GameTooltip:AddLine( self.DataKeys.DisplayText,nil,nil,nil,false );
        GameTooltip:AddLine( self.DataKeys.Description,1,1,1,true );
        GameTooltip:SetPoint( 'topright',self.DataKeys.Parent,'bottomleft',0,0 );
        GameTooltip:Show();
    end );
    Parent:SetScript( 'OnLeave',function( self )
        GameTooltip:Hide();
    end );
    return FontString;
end

Addon.FRAMES.AddSeparator = function( self,Parent )
  local Texture = Parent:CreateTexture( nil,'BACKGROUND',nil,2 );
  Texture:SetColorTexture(
        Addon.Theme.Seperator.Colors.Default.r,
        Addon.Theme.Seperator.Colors.Default.g,
        Addon.Theme.Seperator.Colors.Default.b,
        Addon.Theme.Seperator.Alpha
  );
  Texture:SetSize( Parent:GetWidth(),.5 );
  return Texture;
end

Addon.FRAMES.AddBackGround = function( self,Parent )
    local Texture = Parent:CreateTexture( nil,'BACKGROUND',nil,2 );
    Texture:SetColorTexture( 
        Addon.Theme.Background.Colors.Default.r,
        Addon.Theme.Background.Colors.Default.g,
        Addon.Theme.Background.Colors.Default.b,
        Addon.Theme.Background.Alpha
    );
    return Texture;
end

Addon.FRAMES.AddRange = function( self,VarData,Parent,Handler,Color )
    local Key = AddonName..'Slider';
    if( VarData and VarData.Name ) then
        Key = string.lower( VarData.Name );
    end
    local Frame = CreateFrame( 'Slider',Key..'Range',Parent,'UISliderTemplateWithLabels' );
    local Color = Color or Addon.Theme.Text.Colors.Default;
    Frame.Text:SetTextColor( 
        Addon.Theme.Text.Colors.Highlight.r,
        Addon.Theme.Text.Colors.Highlight.g,
        Addon.Theme.Text.Colors.Highlight.b,
        Addon.Theme.Text.Alpha
    );
    Frame.Low:SetTextColor( 
        Addon.Theme.Text.Colors.Default.r,
        Addon.Theme.Text.Colors.Default.g,
        Addon.Theme.Text.Colors.Default.b,
        Addon.Theme.Text.Alpha
    );
    Frame.High:SetTextColor( 
        Addon.Theme.Text.Colors.Default.r,
        Addon.Theme.Text.Colors.Default.g,
        Addon.Theme.Text.Colors.Default.b,
        Addon.Theme.Text.Alpha
    );

    --[[
    local SliderBackdrop  = {
        bgFile = "Interface\\Buttons\\UI-SliderBar-Background",
        edgeFile = "Interface\\Buttons\\UI-SliderBar-Border",
        tile = true, tileSize = 8, edgeSize = 8,
        insets = { left = 3, right = 3, top = 6, bottom = 6 }
    };
    ]]
    Frame:SetMinMaxValues( VarData.KeyPairs.Low.Value,VarData.KeyPairs.High.Value );
    Frame:SetObeyStepOnDrag( true );
    Frame:SetValueStep( VarData.Step );
    Frame:SetOrientation( VarData.Orientation or 'HORIZONTAL' );

    Frame.minValue,Frame.maxValue = Frame:GetMinMaxValues();

    Frame.Low:SetText( VarData.KeyPairs.Low.Value );
    Frame.High:SetText( VarData.KeyPairs.High.Value );

    local Point,RelativeFrame,RelativePoint,X,Y = Frame.Low:GetPoint();
    Frame.Low:SetPoint( Point,RelativeFrame,RelativePoint,X+5,Y-5 );

    local Point,RelativeFrame,RelativePoint,X,Y = Frame.High:GetPoint();
    Frame.High:SetPoint( Point,RelativeFrame,RelativePoint,X-5,Y-5 );

    -- Convert to numerical value
    local Value = tonumber( Handler.Get( Key ) );
    if( Value == nil ) then
        Value = 0;
    end
    --[[
    local Working,Error = pcall( Frame.SetValue,Value,TreatAsMouseEvent );
    if( not Working ) then
        print( 'FAILED!','Frame:SetValue',Key,Value,Error );
    end
    ]]
    Frame:SetValue( Value );
    Frame.keyValue = Key;
    if( VarData.Flagged ) then
        Frame:Disable();
    end
    --[[
    local ManualBackdrop = {
        bgFile = "Interface\\ChatFrame\\ChatFrameBackground",
        edgeFile = "Interface\\ChatFrame\\ChatFrameBackground",
        tile = true, edgeSize = 1, tileSize = 5,
    };
    ]]

    --Frame.EditBox:SetBackdrop( ManualBackdrop );
    --[[    
    Frame.EditBox:HookScript( 'OnTextChanged',function( self )
        local Value = self:GetText();
        if( tonumber( Value ) ) then
            self:GetParent():SetValue( Value );
        end
    end );
    ]]

    --[[
    Frame:HookScript( 'OnMouseWheel',function( self,Value )
        print( 'OnMouseWheel',Value )
    end );
    ]]

    Frame.EditBox = CreateFrame( 'EditBox',Key..'SliderEditBox',Frame,'InputBoxTemplate' --[[and BackdropTemplate]] );
    Frame.EditBox:SetSize( 50,15 );
    --Frame.EditBox:GetFontString():SetJustifyH( 'center' );
    Frame.EditBox:ClearAllPoints();
    Frame.EditBox:SetPoint( 'center',Frame,'center',5,-14 );
    Frame.EditBox:SetText( Value );
    Frame.EditBox:SetTextInsets( 10,10,2,2 );
    Frame.EditBox:SetCursorPosition( 0 );
    Frame.EditBox:SetFont(
        Addon.Theme.Font.Family, Addon.Theme.Font.Normal, Addon.Theme.Font.Flags
    );
    Frame.EditBox:SetTextColor( 
        Color.r,
        Color.g,
        Color.b,
        Addon.Theme.Text.Alpha
    );
    Frame.EditBox:Disable();

    Frame:SetScript( 'OnValueChanged',function( self,Value,UserInput )
        --print( 'OnValueChanged',Value,UserInput )
        if( UserInput ) then
            -- Manually set by the user dragging slider
        else
            -- Set from a script
        end

        --print( self.keyValue,Addon:SliderRound( self:GetValue(),VarData.Step ) )
        self.EditBox:SetText( Addon:SliderRound( self:GetValue(),VarData.Step ) );
        Handler.Set( self.keyValue,Addon:SliderRound( self:GetValue(),VarData.Step ) );
    end );

    Frame:SetSize( 144,15 );
    return Frame;
end

Addon.FRAMES.AddToggle = function( self,VarData,Parent )
    local Key = AddonName..'Toggle';
    if( VarData and VarData.Name ) then
        Key = string.lower( VarData.Name );
    end
    local Frame = CreateFrame( 'CheckButton',Key..'Toggle',Parent,'UICheckButtonTemplate' );
    if( VarData.Flagged ) then
        Frame:Disable();
    end
    Frame:SetSize( 25,25 );
    return Frame;
end

Addon.FRAMES.AddVarToggle = function( self,VarData,Parent,Handler )
    local Key = AddonName..'VarToggle';
    if( VarData and VarData.Name ) then
        Key = string.lower( VarData.Name );
    end
    local Frame = CreateFrame( 'CheckButton',Key..'Toggle',Parent,'UICheckButtonTemplate' );
    Frame:SetChecked( Addon:Int2Bool( Handler:GetVarValue( Key ) ) );
    Frame.keyValue = Key;
    Frame:HookScript( 'OnClick',function( self )
         Handler:SetVarValue( self.keyValue,Addon:BoolToInt( self:GetChecked() ) );
    end );
    if( VarData.Flagged ) then
        Frame:Disable();
    end
    Frame:SetSize( 25,25 );
    return Frame;
end

Addon.FRAMES.AddRadio = function( self,VarData,Parent,Handler )
-- @todo: not implemented yet
end

Addon.FRAMES.AddCheckBox = function( self,VarData,Parent,Handler )
    local Key = AddonName..'CheckBox';
    if( VarData and VarData.Name ) then
        Key = string.lower( VarData.Name );
    end
    local Frame = CreateFrame( 'CheckButton',Key..'Toggle',Parent,'ChatConfigCheckButtonTemplate' );
    Frame:SetChecked( Addon:Int2Bool( Handler:GetVarValue( Key ) ) );
    Frame.keyValue = Key;
    if( VarData.DisplayText ) then
        Frame.Text:SetText( VarData.DisplayText );
    end
    if( VarData.Description ) then
        Frame.tooltip = VarData.Description;
    end
    Frame:HookScript( 'OnClick',function( self )
         Handler:SetVarValue( self.keyValue,Addon:BoolToInt( self:GetChecked() ) );
    end );
    if( VarData.Flagged ) then
        Frame:Disable();
    end
    Frame:SetSize( 25,25 );
    return Frame;
end

Addon.FRAMES.AddButton = function( self,VarData,Parent )
    local Key = AddonName..'Button';
    if( VarData and VarData.Name ) then
        Key = string.lower( VarData.Name );
    end
    local Frame = CreateFrame( 'Button',Key..'Butt',Parent,'UIPanelButtonTemplate' );
    if( VarData.Flagged ) then
        Frame:Disable();
    end

    Frame.Text = Frame:CreateFontString( nil,'ARTWORK','GameFontHighlightSmall' )
    Frame.Text:SetFont( 
        Addon.Theme.Font.Family, Addon.Theme.Font.Normal, Addon.Theme.Font.Flags 
    );
    Frame.Text:SetTextColor( 
        Addon.Theme.Text.Colors.Default.r,
        Addon.Theme.Text.Colors.Default.g,
        Addon.Theme.Text.Colors.Default.b,
        Addon.Theme.Text.Alpha
    );
    Frame.Text:SetPoint( 'center' );
    Frame.Text:SetText( VarData.DisplayText );

    Frame.Texture = Frame:CreateTexture();
    Frame.Texture:SetAllPoints( Frame );
    Frame.Texture:SetColorTexture(
        Addon.Theme.Button.Colors.Default.r,
        Addon.Theme.Button.Colors.Default.g,
        Addon.Theme.Button.Colors.Default.b,
        Addon.Theme.Button.Alpha
    );
    Frame:DisableDrawLayer( 'BACKGROUND' );

    return Frame;
end

Addon.FRAMES.AddEdit = function( self,VarData,Parent,Handler )
    local Key = AddonName..'Edit';
    if( VarData and VarData.Name ) then
        Key = string.lower( VarData.Name );
    end
    local Frame = CreateFrame( 'EditBox',Key..'Edit',Parent,'InputBoxTemplate' );
    Frame:SetAutoFocus( false );
    Frame:ClearFocus();
    --Frame:SetTextInsets( 10,10,10,10 );
    if( VarData.Flagged ) then
        Frame:Disable();
    end
    Frame:SetFont( 
        Addon.Theme.Font.Family, Addon.Theme.Font.Normal, Addon.Theme.Font.Flags 
    );
    Frame:SetText( VarData.Value );
    Frame.keyValue = Key;
    Frame:HookScript( 'OnEnterPressed',function( self )
        local Value = self:GetText();
        if( Value ) then
            Handler:SetVarValue( self.keyValue,Value );
        end
    end );
    Frame:SetScript( 'OnEditFocusGained',function( self )
        self:HighlightText( 0 );
    end );

    Frame.Texture = Frame:CreateTexture();
    Frame.Texture:SetAllPoints( Frame );
    Frame.Texture:SetColorTexture( 
        Addon.Theme.Background.Colors.Default.r,
        Addon.Theme.Background.Colors.Default.g,
        Addon.Theme.Background.Colors.Default.g,
        Addon.Theme.Background.Alpha
    );

    return Frame;
end

Addon.FRAMES.AddMultiEdit = function( self,VarData,Parent,Handler )
    local Key = AddonName..'MultiEdit';
    if( VarData and VarData.Name ) then
        Key = string.lower( VarData.Name );
    end
    local Frame = CreateFrame( 'ScrollFrame',Key..'ScrollFrame',Parent,'UIPanelScrollFrameTemplate' );
    Frame:SetPoint( 'topleft',Parent,'topleft',0,0 );

    Frame.Input = CreateFrame( 'EditBox',Key..'Edit',Parent,'InputBoxTemplate' );
    Frame.Input:SetTextInsets( 10,10,10,10 );
    Frame.Input:DisableDrawLayer( 'BACKGROUND' );
    Frame.Input:SetPoint( 'topleft',Frame,'topleft',10,-10 );
    Frame.Input:SetAutoFocus( false );
    Frame.Input:SetMultiLine( true );
    Frame.Input:SetCursorPosition( 0 );
    Frame.Input:SetTextInsets( 0,0,3,3 );
    if( VarData.Flagged ) then
        Frame.Input:Disable();
    end
    Frame.Input:ClearFocus();
    Frame.Input:SetFont( 
        Addon.Theme.Font.Family, Addon.Theme.Font.Normal, Addon.Theme.Font.Flags 
    );
    Frame.Input:SetText( VarData.Value );
    Frame.Input:SetCursorPosition( 0 );
    Frame.Input.keyValue = Key;
    Frame.Input:HookScript( 'OnTextChanged',function( self )
        local Value = self:GetText();
        if( Value ) then

        end
    end );
    Frame.Input:SetScript( 'OnEditFocusGained',function( self )
        self:HighlightText( 0 );
    end );

    Frame.Texture = Frame:CreateTexture();
    Frame.Texture:SetAllPoints( Frame );
    Frame.Texture:SetColorTexture( 
        Addon.Theme.Background.Colors.Default.r,
        Addon.Theme.Background.Colors.Default.g,
        Addon.Theme.Background.Colors.Default.g,
        Addon.Theme.Background.Alpha
    );
    Frame:SetScrollChild( Frame.Input );

    return Frame;
end

Addon.FRAMES.AddSelect = function( self,VarData,Parent,Handler,Color )
    local Key = AddonName..'Select';
    if( VarData and VarData.Name ) then
        Key = string.lower( VarData.Name );
    end
    local Frame = CreateFrame( 'DropdownButton',Key..'Select',Parent,'WowStyle1DropdownTemplate' );
    local Color = Color or Addon.Theme.Text.Colors.Default;

    Frame:SetupMenu(function( DropDown,Interface )
        for i,v in pairs( VarData.KeyPairs ) do

            if( tostring( v.Value ) == tostring( Handler:GetVarValue( Key ) ) ) then
                Frame:SetDefaultText( v.Description );
            end

            -- OnChange event
            Interface:CreateButton( v.Description,function()
                Handler:SetVarValue( Key,v.Value );
            end );

        end
    end );
    if( Addon:IsClassic() ) then
        Frame:SetWidth( 120 );
    end

    local MyDropdownFont = CreateFont( 'MyDropdownFont' );
    MyDropdownFont:SetFont(
        Addon.Theme.Font.Family, Addon.Theme.Font.Normal, Addon.Theme.Font.Flags
    );

    if( Frame.Text ) then
        Frame.Text:SetFontObject( MyDropdownFont );
        Frame:SetNormalFontObject( MyDropdownFont );
        Frame:SetHighlightFontObject( MyDropdownFont );

        Frame.Text:SetTextColor(
            Color.r,
            Color.g,
            Color.b,
            Addon.Theme.Text.Alpha
        );
    end

    return Frame;
end

Addon.FRAMES.AddFrame = function( self,VarData,Parent )
    local Key = AddonName..'Frame';
    if( VarData and VarData.Name ) then
        Key = string.lower( VarData.Name );
    end
    local Frame = CreateFrame( 'Frame',Key..'Frame',Parent or UIParent );
    Frame:SetSize( 300,150 );
    Frame:SetPoint( 'CENTER' );
    Frame:SetClampedToScreen( true );

    return Frame;
end

Addon.FRAMES.AddMovable = function( self,VarData,Parent )
    local Frame = self:AddFrame( VarData,Parent );
    Frame:EnableMouse( true );
    Frame:SetMovable( true );
    Frame:SetResizable( true );
    Frame:RegisterForDrag( 'LeftButton' );
    Frame:SetScript( 'OnDragStart',function( self )
        self:StartMoving();
    end );
    Frame:SetScript( 'OnDragStop',function( self )
        self:StopMovingOrSizing();
        self:SetUserPlaced( true );
    end );

    return Frame;
end

Addon.FRAMES.AddMovableResizable = function( self,VarData,Parent )
    local Key = AddonName..'MovableResizable';
    if( VarData and VarData.Name ) then
        Key = string.lower( VarData.Name );
    end
    local Frame = self:AddMovable( VarData,Parent );
    Frame:SetResizable( true );
    Frame.Resizer = CreateFrame( 'Button',Key..'Resizer', Frame );
    Frame.Resizer:SetPoint( 'bottomright' );
    Frame.Resizer:SetSize( 16,16 );
    Frame.Resizer:SetNormalTexture( 'Interface\\ChatFrame\\UI-ChatIM-SizeGrabber-Down' );
    Frame.Resizer:SetHighlightTexture( 'Interface\\ChatFrame\\UI-ChatIM-SizeGrabber-Highlight' );
    Frame.Resizer:SetPushedTexture( 'Interface\\ChatFrame\\UI-ChatIM-SizeGrabber-Up' );

    Frame.Resizer:EnableMouse( true );
    Frame.Resizer:RegisterForDrag( 'LeftButton' );
    Frame.Resizer:SetScript( 'OnDragStart',function( self )
        Frame:StartSizing( 'bottomright' );
    end );
    Frame.Resizer:SetScript( 'OnDragStop',function( self )
        Frame:StopMovingOrSizing();
    end );

    return Frame;
end

Addon.FRAMES.AddAcknowledge = function( self,VarData,Parent )
    local Frame = self:AddMovable( VarData,Parent );
    Frame:SetFrameStrata( 'TOOLTIP' );

    local Text = Frame:CreateFontString( nil,'ARTWORK','GameFontNormalSmall' );

    if( VarData.Label ) then
        Frame.Label = Frame:CreateFontString( nil,'ARTWORK','GameFontNormalSmall' );
            Frame.Label:SetTextColor( 
            Addon.Theme.Background.Colors.Default.r,
            Addon.Theme.Background.Colors.Default.g,
            Addon.Theme.Background.Colors.Default.g,
            Addon.Theme.Background.Alpha
        );
        Frame.Label:SetSize( Frame:GetWidth()/2,0 );
        Frame.Label:SetPoint( 'TOPLEFT',Frame,'TOPLEFT',0,-10 );
        Frame.Label:SetText( VarData.Label );
    end

    Text:SetTextColor( 
        Addon.Theme.Text.Colors.Default.r,
        Addon.Theme.Text.Colors.Default.g,
        Addon.Theme.Text.Colors.Default.g,
        Addon.Theme.Text.Alpha
    );
    Text:SetSize( Frame:GetWidth()-10,0 );
    Text:SetJustifyH( 'CENTER' );
    Text:SetJustifyV( 'MIDDLE' );
    Text:SetNonSpaceWrap( true );
    Text:SetWordWrap( true );
    Text:SetPoint( 'CENTER' );
    Text:SetText( VarData.Value );

    Frame.Butt = CreateFrame( 'Button',nil,Frame,'UIPanelButtonTemplate' );
    Frame.Butt:SetSize( 32,32 );
    Frame.Butt:SetText( 'OK' );
    Frame.Butt:SetScript( 'OnClick',function( self )
        self:GetParent():Hide();
    end );
    Frame.Butt:SetPoint( 'topright',Frame,'topright',-10,-10 );
    Frame.Butt:RegisterForClicks( 'AnyDown','AnyUp' );

    Frame:Show();

    return Frame;
end

Addon.FRAMES.AddSearch = function( self,VarData,Parent )
    local Key = AddonName..'Search';
    if( VarData and VarData.Name ) then
        Key = string.lower( VarData.Name );
    end
    local Frame = CreateFrame( 'EditBox',Key..'Search',Parent or UIParent,'SearchBoxTemplate' );
    Frame:SetSize( 145,20 );
    Frame.clearButton:Hide();
    Frame:ClearFocus();
    Frame:SetAutoFocus( false );

    -- Input
    local SearchFont = Frame:GetFontObject();
    if( SearchFont ) then
        SearchFont:SetFont( 
            Addon.Theme.Font.Family,Addon.Theme.Font.Normal,Addon.Theme.Font.Flags 
        );
    end
    Frame:SetTextColor(
        Addon.Theme.Text.Colors.Default.r,
        Addon.Theme.Text.Colors.Default.g,
        Addon.Theme.Text.Colors.Default.b,
        Addon.Theme.Text.Alpha
    );

    -- Instructions
    local InstructionFont = Frame.Instructions:GetFontObject();
    if( SearchFont ) then
        SearchFont:SetFont( 
            Addon.Theme.Font.Family,Addon.Theme.Font.Normal,Addon.Theme.Font.Flags 
        );
    end
    Frame.Instructions:SetTextColor(
        Addon.Theme.Text.Colors.Default.r,
        Addon.Theme.Text.Colors.Default.g,
        Addon.Theme.Text.Colors.Default.b,
        Addon.Theme.Text.Alpha
    );

    return Frame;
end