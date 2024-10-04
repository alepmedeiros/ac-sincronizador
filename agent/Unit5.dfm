object Form5: TForm5
  Left = 0
  Top = 0
  Caption = 'Agente do PDV'
  ClientHeight = 301
  ClientWidth = 542
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -19
  Font.Name = 'Segoe UI'
  Font.Style = []
  TextHeight = 25
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 542
    Height = 301
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 0
    ExplicitLeft = -113
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
      object Button4: TButton
        Left = 389
        Top = 5
        Width = 148
        Height = 47
        Align = alRight
        Caption = 'Configura'#231#245'es'
        TabOrder = 1
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
        ExplicitWidth = 727
        ExplicitHeight = 321
      end
    end
  end
end
