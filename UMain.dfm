object FMain: TFMain
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Encryption'
  ClientHeight = 318
  ClientWidth = 395
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object btnQuit: TSpeedButton
    Left = 296
    Top = 276
    Width = 85
    Height = 22
    Caption = 'Quit'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Code New Roman'
    Font.Style = [fsBold]
    ParentFont = False
    OnClick = btnQuitClick
  end
  object Label1: TLabel
    Left = 15
    Top = 279
    Width = 28
    Height = 16
    Caption = 'Key:'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Code New Roman'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object FieldKey: TEdit
    Left = 49
    Top = 276
    Width = 222
    Height = 22
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
  end
  object PageControl: TPageControl
    Left = 8
    Top = 8
    Width = 377
    Height = 249
    ActivePage = TabVigenere
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Code New Roman'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
    object TabVigenere: TTabSheet
      Caption = 'Vigen'#232're'
      object btnOpenFile1: TButton
        Left = 3
        Top = 185
        Width = 85
        Height = 25
        Caption = 'Open File'
        TabOrder = 0
        OnClick = btnOpenFile1Click
      end
      object btnSave1: TButton
        Left = 94
        Top = 185
        Width = 85
        Height = 25
        Caption = 'Save'
        TabOrder = 1
        OnClick = btnSave1Click
      end
      object btnEncrypt1: TButton
        Left = 185
        Top = 185
        Width = 85
        Height = 25
        Caption = 'Encrypt'
        TabOrder = 2
        OnClick = btnEncrypt1Click
      end
      object btnDecrypt1: TButton
        Left = 276
        Top = 185
        Width = 85
        Height = 25
        Caption = 'Decrypt'
        TabOrder = 3
        OnClick = btnDecrypt1Click
      end
    end
    object TabCaesar: TTabSheet
      Caption = 'Caesar'
      ImageIndex = 1
      object btnDecrypt2: TButton
        Left = 276
        Top = 185
        Width = 85
        Height = 25
        Caption = 'Decrypt'
        TabOrder = 0
        OnClick = btnDecrypt2Click
      end
      object btnEncrypt2: TButton
        Left = 185
        Top = 185
        Width = 85
        Height = 25
        Caption = 'Encrypt'
        TabOrder = 1
        OnClick = btnEncrypt2Click
      end
      object btnSave2: TButton
        Left = 94
        Top = 185
        Width = 85
        Height = 25
        Caption = 'Save'
        TabOrder = 2
        OnClick = btnSave2Click
      end
      object btnOpenFile2: TButton
        Left = 3
        Top = 185
        Width = 85
        Height = 25
        Caption = 'Open File'
        TabOrder = 3
        OnClick = btnOpenFile2Click
      end
    end
    object TabEnigma: TTabSheet
      Caption = 'Enigma Machine'
      ImageIndex = 2
    end
  end
  object Open: TOpenDialog
    Filter = 'Text File|*.txt'
    Left = 72
    Top = 216
  end
  object Save: TSaveDialog
    DefaultExt = 'txt'
    FileName = 'C:\Users\thamo\Dropbox\Projetos\Criptografia\t'
    Filter = 'Text File|*.txt'
    Left = 160
    Top = 216
  end
end
