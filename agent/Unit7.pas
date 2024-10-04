unit Unit7;

interface

uses
  System.Generics.Collections,
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
  TForm7 = class(TForm)
    Panel1: TPanel;
    Panel3: TPanel;
    Label2: TLabel;
    edtDataBase: TEdit;
    Panel15: TPanel;
    Button1: TButton;
    SpeedButton1: TSpeedButton;
    Memo1: TMemo;
    procedure SpeedButton1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    FEventos: TList<string>;
  public
    property Eventos: TList<string> read FEventos write FEventos;
  end;

implementation

{$R *.dfm}

procedure TForm7.FormCreate(Sender: TObject);
begin
  FEventos := TList<String>.Create;
end;

procedure TForm7.SpeedButton1Click(Sender: TObject);
begin
  FEventos.Add(edtDataBase.Text);
end;

end.
