program sincronizador_server;

uses
  Vcl.Forms,
  Unit4 in 'Unit4.pas' {Form4},
  sincronizador_server.conexao in 'sincronizador_server.conexao.pas',
  sincronizador_server.configuracao in 'sincronizador_server.configuracao.pas',
  sincronizador_server.interfaces in 'sincronizador_server.interfaces.pas',
  sincronizador_server.ports in 'sincronizador_server.ports.pas',
  sincronizador_server.formconfiguracao in 'sincronizador_server.formconfiguracao.pas' {FormConfiguracao},
  sincronizador_server.controller in 'sincronizador_server.controller.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm4, Form4);
  Application.Run;
end.
