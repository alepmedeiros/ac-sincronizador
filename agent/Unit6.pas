unit Unit6;

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.Variants,
  System.Classes,
  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs,
  Vcl.StdCtrls,
  Vcl.ExtCtrls,
  Vcl.Buttons;

type
  TForm6 = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Label1: TLabel;
    edtLibHome: TEdit;
    Panel3: TPanel;
    Label2: TLabel;
    edtDataBase: TEdit;
    Panel4: TPanel;
    Panel5: TPanel;
    Label3: TLabel;
    edtServer: TEdit;
    Panel6: TPanel;
    Label4: TLabel;
    edtPort: TEdit;
    Panel7: TPanel;
    Panel8: TPanel;
    Label5: TLabel;
    edtUserName: TEdit;
    Panel9: TPanel;
    Label6: TLabel;
    edtPassword: TEdit;
    Panel10: TPanel;
    Label7: TLabel;
    edtLib: TEdit;
    Panel11: TPanel;
    Panel12: TPanel;
    Label8: TLabel;
    edtCharacterSet: TEdit;
    Panel13: TPanel;
    Label9: TLabel;
    edtMetaDefSchema: TEdit;
    Panel14: TPanel;
    Label10: TLabel;
    edtDriverID: TEdit;
    Panel15: TPanel;
    Button1: TButton;
    Panel16: TPanel;
    Label11: TLabel;
    Edit1: TEdit;
    SpeedButton1: TSpeedButton;
    Memo1: TMemo;
  private
    { Private declarations }
  public

  end;

implementation

{$R *.dfm}

end.
