unit sincronizador_server.formconfiguracao;

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
  Vcl.ExtCtrls,
  Vcl.StdCtrls,
  sincronizador_server.interfaces;

type
  TFormConfiguracao = class(TForm)
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
    Button2: TButton;
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private

  public
    { Public declarations }
  end;

implementation

uses
  sincronizador_server.ports;

{$R *.dfm}

procedure TFormConfiguracao.Button1Click(Sender: TObject);
begin
  TPorts.New.Configuracao
    .DataBase(edtDataBase.Text)
    .Server(edtServer.Text)
    .UserName(edtUserName.Text)
    .Password(edtPassword.Text)
    .Port(edtPort.Text)
    .LibHome(edtLibHome.Text)
    .Lib(edtLib.Text)
    .DriverId(edtDriverID.Text)
    .CharacterSet(edtCharacterSet.Text)
    .MetaDefSchema(edtMetaDefSchema.Text)
    .Salvar;
  Self.Button1.ModalResult := mrOk;
end;

procedure TFormConfiguracao.FormCreate(Sender: TObject);
begin
  var lConf := TPorts.New.Configuracao;
  edtLibHome.Text := lConf.LibHome;
  edtDataBase.Text := lConf.DataBase;
  edtServer.Text := lConf.Server;
  edtPort.Text := lConf.Port;
  edtUserName.Text := lConf.UserName;
  edtPassword.Text := lConf.Password;
  edtLib.Text := lConf.Lib;
  edtCharacterSet.Text := lConf.CharacterSet;
  edtMetaDefSchema.Text := lConf.MetaDefSchema;
  edtDriverID.Text := lConf.DriverId;
end;

end.
