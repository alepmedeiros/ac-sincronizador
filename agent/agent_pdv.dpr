program agent_pdv;

uses
  Vcl.Forms,
  Unit5 in 'Unit5.pas' {Form5},
  agent.conexao in 'agent.conexao.pas',
  agent.configuracao in 'agent.configuracao.pas',
  agent.ports in 'agent.ports.pas',
  agent.interfaces in 'agent.interfaces.pas',
  agent.Alert in 'agent.Alert.pas',
  Unit6 in 'Unit6.pas' {Form6},
  Unit7 in 'Unit7.pas' {Form7};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm5, Form5);
  Application.CreateForm(TForm6, Form6);
  Application.CreateForm(TForm7, Form7);
  Application.Run;
end.
