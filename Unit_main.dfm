object Form_main: TForm_main
  Left = 0
  Top = 0
  Caption = #20013#22830#24211#23384#31649#29702#31995#32479
  ClientHeight = 711
  ClientWidth = 1008
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -16
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poOwnerFormCenter
  WindowState = wsMaximized
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 19
  object dxRibbonStatusBar1: TdxRibbonStatusBar
    Left = 0
    Top = 688
    Width = 1008
    Height = 23
    Panels = <
      item
        PanelStyleClassName = 'TdxStatusBarTextPanelStyle'
        Text = #30331#24405#20154
        Width = 200
      end
      item
        PanelStyleClassName = 'TdxStatusBarTextPanelStyle'
        Text = #23703#20301
        Width = 100
      end>
    LookAndFeel.NativeStyle = False
    LookAndFeel.SkinName = 'Black'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clDefault
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
  end
  object dxNavBar1: TdxNavBar
    Left = 0
    Top = 0
    Width = 185
    Height = 688
    Align = alLeft
    ActiveGroupIndex = 0
    TabOrder = 1
    LookAndFeel.NativeStyle = False
    View = 17
    ViewStyle.ColorSchemeName = 'Blue'
    OptionsImage.LargeImages = DataModule1.cxImageList_main
    OptionsImage.SmallImages = DataModule1.cxImageList_main
    ExplicitLeft = -2
    object dxNavBar1Group1: TdxNavBarGroup
      Caption = #38376#24215#25552#36135#31649#29702
      SelectedLinkIndex = -1
      TopVisibleLinkIndex = 0
      Links = <
        item
          Item = dxNavBar1Item1
        end
        item
          Item = dxNavBar1Item2
        end>
    end
    object dxNavBar1Item1: TdxNavBarItem
      Caption = #25552#36135#30003#35831
      SmallImageIndex = 30
      OnClick = dxNavBar1Item1Click
    end
    object dxNavBar1Item2: TdxNavBarItem
      Caption = #20184#36135
      SmallImageIndex = 38
    end
  end
  object cxPageControl_main: TcxPageControl
    Left = 185
    Top = 0
    Width = 823
    Height = 688
    Align = alClient
    TabOrder = 2
    Properties.ActivePage = cxTabSheet1
    Properties.CustomButtons.Buttons = <>
    LookAndFeel.SkinName = 'Blue'
    ClientRectBottom = 683
    ClientRectLeft = 2
    ClientRectRight = 818
    ClientRectTop = 31
    object cxTabSheet1: TcxTabSheet
      Caption = 'cxTabSheet1'
      ImageIndex = 0
      object pnl1: TPanel
        Left = 0
        Top = 0
        Width = 816
        Height = 70
        Align = alTop
        TabOrder = 0
        object cxLabel1: TcxLabel
          Left = 29
          Top = 24
          Caption = #30003#35831#26085#26399
          Transparent = True
        end
        object cxDate_th_qishi: TcxDateEdit
          Left = 103
          Top = 22
          Properties.DisplayFormat = 'yyyy-mm-dd'
          Properties.EditFormat = 'yyyy-mm-dd'
          TabOrder = 1
          Width = 121
        end
        object cxLabel2: TcxLabel
          Left = 232
          Top = 24
          Caption = #33267
          Transparent = True
        end
        object cxDate_th_zhongzhi: TcxDateEdit
          Left = 259
          Top = 22
          Properties.DisplayFormat = 'yyyy-mm-dd'
          Properties.EditFormat = 'yyyy-mm-dd'
          TabOrder = 3
          Width = 121
        end
        object cxButton1: TcxButton
          Left = 395
          Top = 20
          Width = 75
          Height = 31
          Caption = #26597#35810
          LookAndFeel.SkinName = 'Black'
          TabOrder = 4
          OnClick = cxButton1Click
        end
        object cxButton2: TcxButton
          Left = 491
          Top = 20
          Width = 75
          Height = 31
          Caption = #26174#31034#26126#32454
          LookAndFeel.SkinName = 'Black'
          TabOrder = 5
          OnClick = cxButton2Click
        end
        object cxButton3: TcxButton
          Left = 587
          Top = 20
          Width = 99
          Height = 31
          Caption = #20840#37096#26410#20184#36135
          LookAndFeel.SkinName = 'Black'
          TabOrder = 6
          OnClick = cxButton3Click
        end
      end
      object cxPage_tihuoshenqing: TcxPageControl
        Left = 0
        Top = 70
        Width = 816
        Height = 582
        Align = alClient
        TabOrder = 1
        Properties.ActivePage = cxTabSheet3
        Properties.CustomButtons.Buttons = <>
        LookAndFeel.SkinName = 'Blue'
        ClientRectBottom = 577
        ClientRectLeft = 2
        ClientRectRight = 811
        ClientRectTop = 31
        object cxTabSheet2: TcxTabSheet
          Caption = #27719#24635
          ImageIndex = 0
          object cxGrid1: TcxGrid
            Left = 0
            Top = 0
            Width = 809
            Height = 546
            Align = alClient
            TabOrder = 0
            LookAndFeel.SkinName = 'Blue'
            object cxGrid1DBTableView1: TcxGridDBTableView
              Navigator.Buttons.CustomButtons = <>
              OnCellDblClick = cxGrid1DBTableView1CellDblClick
              DataController.DataSource = ds_thshenqing
              DataController.Summary.DefaultGroupSummaryItems = <>
              DataController.Summary.FooterSummaryItems = <>
              DataController.Summary.SummaryGroups = <>
              OptionsData.CancelOnExit = False
              OptionsData.Deleting = False
              OptionsData.DeletingConfirmation = False
              OptionsData.Editing = False
              OptionsData.Inserting = False
              OptionsView.ColumnAutoWidth = True
              OptionsView.GroupByBox = False
              object cxGrid1DBTableView1DBColumn16: TcxGridDBColumn
                DataBinding.FieldName = #20998#38498
                Width = 80
              end
              object cxGrid1DBTableView1DBColumn2: TcxGridDBColumn
                DataBinding.FieldName = #30003#35831#26085#26399
                PropertiesClassName = 'TcxDateEditProperties'
                Properties.DisplayFormat = 'yyyy-mm-dd'
                Width = 100
              end
              object cxGrid1DBTableView1DBColumn3: TcxGridDBColumn
                DataBinding.FieldName = #30003#35831#32534#21495
                Width = 80
              end
              object cxGrid1DBTableView1DBColumn17: TcxGridDBColumn
                DataBinding.FieldName = #30003#35831#35828#26126
                Width = 200
              end
              object cxGrid1DBTableView1DBColumn4: TcxGridDBColumn
                DataBinding.FieldName = #30003#35831#20154
                Width = 70
              end
              object cxGrid1DBTableView1Column1: TcxGridDBColumn
                Caption = #30003#35831#26465#25968
                DataBinding.FieldName = #30003#35831#25968
                Width = 70
              end
              object cxGrid1DBTableView1DBColumn18: TcxGridDBColumn
                Caption = #29366#24577
                DataBinding.FieldName = 'zt'
                Width = 70
              end
            end
            object cxGrid1Level1: TcxGridLevel
              GridView = cxGrid1DBTableView1
            end
          end
        end
        object cxTabSheet3: TcxTabSheet
          Caption = #26126#32454
          ImageIndex = 1
          object cxGrid2: TcxGrid
            Left = 0
            Top = 0
            Width = 809
            Height = 546
            Align = alClient
            TabOrder = 0
            LookAndFeel.SkinName = 'Blue'
            object cxGridDBTableView1: TcxGridDBTableView
              Navigator.Buttons.CustomButtons = <>
              OnCellDblClick = cxGridDBTableView1CellDblClick
              DataController.DataSource = ds_thshenqing_mx
              DataController.Summary.DefaultGroupSummaryItems = <>
              DataController.Summary.FooterSummaryItems = <>
              DataController.Summary.SummaryGroups = <>
              OptionsData.CancelOnExit = False
              OptionsData.Deleting = False
              OptionsData.DeletingConfirmation = False
              OptionsData.Editing = False
              OptionsData.Inserting = False
              OptionsView.ColumnAutoWidth = True
              OptionsView.GroupByBox = False
              object cxGridDBColumn1: TcxGridDBColumn
                DataBinding.FieldName = #20998#38498
                Width = 80
              end
              object cxGridDBColumn3: TcxGridDBColumn
                DataBinding.FieldName = #30003#35831#26085#26399
                PropertiesClassName = 'TcxDateEditProperties'
                Properties.DisplayFormat = 'yyyy-mm-dd'
                Width = 100
              end
              object cxGridDBColumn2: TcxGridDBColumn
                DataBinding.FieldName = #30003#35831#32534#21495
                Width = 80
              end
              object cxGridDBColumn4: TcxGridDBColumn
                Caption = #21517#31216
                DataBinding.FieldName = 'mc'
                Width = 150
              end
              object cxGridDBTableView1Column2: TcxGridDBColumn
                DataBinding.FieldName = #31867#21035
                Width = 70
              end
              object cxGridDBColumn6: TcxGridDBColumn
                DataBinding.FieldName = #35268#26684
                Width = 70
              end
              object cxGridDBColumn7: TcxGridDBColumn
                DataBinding.FieldName = #21333#20301
                Width = 70
              end
              object cxGridDBTableView1Column1: TcxGridDBColumn
                DataBinding.FieldName = #25968#37327
              end
              object cxGridDBTableView1Column3: TcxGridDBColumn
                Caption = #29366#24577
                DataBinding.FieldName = 'zt'
                Width = 60
              end
            end
            object cxGridLevel1: TcxGridLevel
              GridView = cxGridDBTableView1
            end
          end
        end
      end
    end
  end
  object ds_thshenqing: TDataSource
    DataSet = qry_thshenqing
    Left = 264
    Top = 264
  end
  object qry_thshenqing: TADOQuery
    Connection = DataModule1.ADOCon_ALi
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from '#27425#21345#35774#32622#34920)
    Left = 336
    Top = 256
  end
  object qry_thshenqing_mx: TADOQuery
    Connection = DataModule1.ADOCon_ALi
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from '#27425#21345#35774#32622#34920)
    Left = 280
    Top = 176
  end
  object ds_thshenqing_mx: TDataSource
    DataSet = qry_thshenqing_mx
    Left = 344
    Top = 192
  end
end
