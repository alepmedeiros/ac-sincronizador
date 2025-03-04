unit agent.ports;

interface

uses
  agent.interfaces;

type
  TPorts = class(TInterfacedObject, IPorts)
  private
    FConn: IConexao;
    FConf: IConfiguracao;
  public
    class function New: IPorts;

    function Configuracao: IConfiguracao;
    function Conexao: IConexao;
  end;

implementation

uses
  agent.Configuracao,
  agent.Conexao;

function TPorts.Conexao: IConexao;
begin
  if not Assigned(FConn) then
    FConn := TConexao.New(Self.Configuracao);
  Result := FConn;
end;

function TPorts.Configuracao: IConfiguracao;
begin
  if not Assigned(FConf) then
    FConf := TConfiguracao.New;
  Result := FConf;
end;

class function TPorts.New: IPorts;
begin
  Result := Self.Create;
end;

end.
