object Form4: TForm4
  Left = 0
  Top = 0
  Caption = 'Sincronizador ERP'
  ClientHeight = 301
  ClientWidth = 542
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -19
  Font.Name = 'Segoe UI'
  Font.Style = []
  OnCreate = FormCreate
  TextHeight = 25
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 542
    Height = 301
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 0
    ExplicitWidth = 737
    ExplicitHeight = 388
    object Panel2: TPanel
      Left = 0
      Top = 0
      Width = 542
      Height = 57
      Align = alTop
      BevelOuter = bvNone
      Padding.Left = 5
      Padding.Top = 5
      Padding.Right = 5
      Padding.Bottom = 5
      TabOrder = 0
      ExplicitWidth = 737
      object Button1: TButton
        Left = 5
        Top = 5
        Width = 124
        Height = 47
        Align = alLeft
        Caption = 'Start'
        TabOrder = 0
      end
      object Button2: TButton
        AlignWithMargins = True
        Left = 275
        Top = 5
        Width = 109
        Height = 47
        Margins.Left = 0
        Margins.Top = 0
        Margins.Right = 5
        Margins.Bottom = 0
        Align = alRight
        Caption = 'Atualizar'
        TabOrder = 1
        ExplicitLeft = 470
      end
      object Button3: TButton
        AlignWithMargins = True
        Left = 134
        Top = 5
        Width = 136
        Height = 47
        Margins.Left = 0
        Margins.Top = 0
        Margins.Right = 5
        Margins.Bottom = 0
        Align = alRight
        Caption = 'Enviar Carga'
        TabOrder = 2
        ExplicitLeft = 329
      end
      object Button4: TButton
        Left = 389
        Top = 5
        Width = 148
        Height = 47
        Align = alRight
        Caption = 'Configura'#231#245'es'
        TabOrder = 3
        OnClick = Button4Click
        ExplicitLeft = 584
      end
    end
    object Panel3: TPanel
      Left = 0
      Top = 57
      Width = 542
      Height = 244
      Align = alClient
      BevelOuter = bvNone
      Padding.Left = 5
      Padding.Top = 5
      Padding.Right = 5
      Padding.Bottom = 5
      TabOrder = 1
      ExplicitWidth = 737
      ExplicitHeight = 331
      object Memo1: TMemo
        Left = 5
        Top = 5
        Width = 532
        Height = 234
        Align = alClient
        TabOrder = 0
        ExplicitLeft = 208
        ExplicitTop = 184
        ExplicitWidth = 185
        ExplicitHeight = 89
      end
    end
  end
  object TrayIcon1: TTrayIcon
    Animate = True
    BalloonFlags = bfInfo
    OnClick = TrayIcon1Click
    Left = 616
    Top = 160
  end
  object ApplicationEvents1: TApplicationEvents
    OnMinimize = ApplicationEvents1Minimize
    Left = 384
    Top = 217
  end
end
