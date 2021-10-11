object Form1: TForm1
  Left = 234
  Top = 133
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #1047#1072#1096#1080#1092#1088#1086#1074#1072#1085#1085#1099#1081' '#1044#1080#1089#1082
  ClientHeight = 229
  ClientWidth = 562
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -14
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 120
  TextHeight = 16
  object Label3: TLabel
    Left = 9
    Top = 9
    Width = 224
    Height = 16
    Caption = #1055#1091#1090#1100' '#1082' '#1092#1072#1081#1083#1091' '#1074#1080#1088#1090#1091#1072#1083#1100#1085#1086#1075#1086' '#1076#1080#1089#1082#1072
  end
  object Label4: TLabel
    Left = 9
    Top = 90
    Width = 91
    Height = 16
    Caption = #1056#1072#1079#1084#1077#1088' '#1076#1080#1089#1082#1072
  end
  object Label5: TLabel
    Left = 177
    Top = 90
    Width = 49
    Height = 16
    Caption = #1055#1072#1088#1086#1083#1100
  end
  object Button1: TButton
    Left = 282
    Top = 187
    Width = 129
    Height = 31
    Caption = #1057#1084#1086#1085#1090#1080#1088#1086#1074#1072#1090#1100
    TabOrder = 0
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 425
    Top = 187
    Width = 129
    Height = 31
    Caption = #1056#1072#1079#1084#1086#1085#1090#1080#1088#1086#1074#1072#1090#1100
    TabOrder = 1
    OnClick = Button2Click
  end
  object Edit1: TEdit
    Left = 9
    Top = 32
    Width = 371
    Height = 25
    TabOrder = 2
  end
  object Edit2: TEdit
    Left = 177
    Top = 113
    Width = 206
    Height = 24
    TabOrder = 3
  end
  object Edit3: TEdit
    Left = 9
    Top = 113
    Width = 54
    Height = 24
    TabOrder = 4
    Text = '250'
  end
  object ComboBox1: TComboBox
    Left = 70
    Top = 113
    Width = 70
    Height = 24
    Style = csDropDownList
    ItemHeight = 16
    ItemIndex = 1
    TabOrder = 5
    Text = 'MB'
    Items.Strings = (
      'KB'
      'MB'
      'GB')
  end
  object Button3: TButton
    Left = 406
    Top = 32
    Width = 148
    Height = 31
    Caption = #1054#1090#1082#1088#1099#1090#1100' '#1060#1072#1081#1083'...'
    TabOrder = 6
    OnClick = Button3Click
  end
  object Button4: TButton
    Left = 406
    Top = 69
    Width = 148
    Height = 31
    Caption = #1057#1086#1079#1076#1072#1090#1100' '#1053#1086#1074#1099#1081'...'
    TabOrder = 7
    OnClick = Button4Click
  end
  object OpenDialog1: TOpenDialog
    Left = 362
    Top = 14
  end
  object SaveDialog1: TSaveDialog
    Left = 366
    Top = 114
  end
  object XPManifest1: TXPManifest
    Left = 310
    Top = 142
  end
end
