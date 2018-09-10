object Form_login: TForm_login
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  Caption = #20013#22830#24211#23384#31649#29702#31995#32479
  ClientHeight = 234
  ClientWidth = 348
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -16
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 19
  object cxLabel1: TcxLabel
    Left = 78
    Top = 46
    Caption = #29992#25143#21517
    ParentFont = False
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -16
    Style.Font.Name = 'Tahoma'
    Style.Font.Style = [fsBold]
    Style.IsFontAssigned = True
    Transparent = True
  end
  object cxLookupComboBox1: TcxLookupComboBox
    Left = 139
    Top = 45
    ParentFont = False
    Properties.DropDownRows = 15
    Properties.KeyFieldNames = #22995#21517
    Properties.ListColumns = <
      item
        FieldName = #22995#21517
      end>
    Properties.ListOptions.ShowHeader = False
    Properties.ListSource = ds_list
    Properties.OnCloseUp = cxLookupComboBox1PropertiesCloseUp
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -16
    Style.Font.Name = 'Tahoma'
    Style.Font.Style = []
    Style.LookAndFeel.NativeStyle = False
    Style.LookAndFeel.SkinName = 'Black'
    Style.IsFontAssigned = True
    StyleDisabled.LookAndFeel.NativeStyle = False
    StyleDisabled.LookAndFeel.SkinName = 'Black'
    StyleFocused.LookAndFeel.NativeStyle = False
    StyleFocused.LookAndFeel.SkinName = 'Black'
    StyleHot.LookAndFeel.NativeStyle = False
    StyleHot.LookAndFeel.SkinName = 'Black'
    TabOrder = 1
    OnKeyPress = cxLookupComboBox1KeyPress
    Width = 121
  end
  object cxTextEdit1: TcxTextEdit
    Left = 139
    Top = 103
    Properties.EchoMode = eemPassword
    TabOrder = 2
    OnKeyPress = cxTextEdit1KeyPress
    Width = 121
  end
  object cxLabel2: TcxLabel
    Left = 95
    Top = 104
    Caption = #23494#30721
    ParentFont = False
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -16
    Style.Font.Name = 'Tahoma'
    Style.Font.Style = [fsBold]
    Style.IsFontAssigned = True
    Transparent = True
  end
  object cxButton1: TcxButton
    Left = 86
    Top = 160
    Width = 75
    Height = 33
    Caption = #30331#24405
    LookAndFeel.SkinName = 'Black'
    TabOrder = 4
    OnClick = cxButton1Click
  end
  object cxButton2: TcxButton
    Left = 201
    Top = 160
    Width = 75
    Height = 33
    Caption = #36864#20986
    LookAndFeel.SkinName = 'Black'
    TabOrder = 5
    OnClick = cxButton2Click
  end
  object ADOQuery_list: TADOQuery
    Connection = DataModule1.ADOCon_ALi
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'SELECT['#32534#21495'],['#23494#30721']'
      '      ,['#21592#24037#32534#21495']'
      '      ,['#22995#21517']'
      '  FROM ['#21592#24037#34920']'
      'where '#26159#21542#20316#24223' = 0 and '#25805#20316#36719#20214'=1')
    Left = 40
    Top = 8
  end
  object ds_list: TDataSource
    DataSet = ADOQuery_list
    Left = 32
    Top = 56
  end
end
