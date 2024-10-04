unit Unit4;

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
  Vcl.OleCtrls,
  SHDocVw,
  Vcl.ExtCtrls,
  View.WebCharts, Vcl.AppEvnts;

type
  TForm4 = class(TForm)
    TrayIcon1: TTrayIcon;
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    ApplicationEvents1: TApplicationEvents;
    Memo1: TMemo;
    procedure Button4Click(Sender: TObject);
    procedure ApplicationEvents1Minimize(Sender: TObject);
    procedure TrayIcon1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private

  public
    { Public declarations }
  end;

var
  Form4: TForm4;

implementation

{$R *.dfm}

uses sincronizador_server.formconfiguracao;

procedure TForm4.ApplicationEvents1Minimize(Sender: TObject);
begin
  hide;
  TrayIcon1.Visible := true;
  TrayIcon1.Animate := true;
  TrayIcon1.ShowBalloonHint;
end;

procedure TForm4.Button4Click(Sender: TObject);
begin
  var LConf := TFormConfiguracao.Create(nil);
  try
    if LConf.ShowModal = mrOk then
      ShowMessage('Banco configurado com sucesso '+#13+'favor enviar carga para os PDVs');
  finally
    LConf.Free;
  end;
end;

procedure TForm4.FormCreate(Sender: TObject);
begin
  hide;
  TrayIcon1.Visible := true;
  TrayIcon1.Animate := true;
  TrayIcon1.ShowBalloonHint;
end;

procedure TForm4.TrayIcon1Click(Sender: TObject);
begin
  TrayIcon1.Visible := false;
  show;
  WindowState := wsNormal;
  Application.BringToFront;
end;

end.
