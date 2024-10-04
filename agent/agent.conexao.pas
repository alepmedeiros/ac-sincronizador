unit agent.conexao;

interface

uses
  FireDAC.Stan.Intf,
  FireDAC.Stan.Option,
  FireDAC.Stan.Error,
  FireDAC.UI.Intf,
  FireDAC.Phys.Intf,
  FireDAC.Stan.Def,
  FireDAC.Stan.Pool,
  FireDAC.Stan.Async,
  FireDAC.Phys,
  FireDAC.VCLUI.Wait,
  FireDAC.Stan.Param,
  FireDAC.DatS,
  FireDAC.DApt.Intf,
  FireDAC.DApt,
  Data.DB,
  FireDAC.Comp.DataSet,
  FireDAC.Comp.Client,
  agent.interfaces;

type
  TConexao = class(TInterfacedObject, IConexao)
  private
    FConn: TFDConnection;
    FQuery: TFDQuery;
    FConf: IConfiguracao;

    constructor Create(Conf: IConfiguracao);
    destructor Destroy; override;
  public
    class function New(Conf: IConfiguracao): IConexao;

    function SQL(Value: String): IConexao;
    function Params(aParams: String; aValue: Variant): IConexao;
    function Open: IConexao;
    function ExecSQL: IConexao;
    function DataSet: TDataSet;
    function Connection: TCustomConnection;
  end;

implementation

uses
  System.SysUtils,
  agent.configuracao;

function TConexao.Connection: TCustomConnection;
begin
  Result := FConn;
end;

constructor TConexao.Create(Conf: IConfiguracao);
begin
  FConn := TFDConnection.Create(nil);
  FQuery := TFDQuery.Create(FConn);

  FConn.Params.DriverID := Conf.DriverID;
  FConn.Params.Database := Conf.Database;
  FConn.Params.Add('Server=' + Conf.Server);
  FConn.Params.UserName := Conf.UserName;
  FConn.Params.Password := Conf.Password;
  FConn.Params.Add('PORT=' + Conf.Port);
  FConn.Params.Add('CharacterSet=' + Conf.CharacterSet);
  FConn.Params.Add('MetaDefSchema=' + Conf.MetaDefSchema);
  FConn.Connected;
end;

function TConexao.DataSet: TDataSet;
begin
  Result := FQuery;
end;

destructor TConexao.Destroy;
begin
  FConn.Free;
  inherited;
end;

function TConexao.ExecSQL: IConexao;
begin
  Result := Self;
  FQuery.Connection.StartTransaction;
  try
    FQuery.ExecSQL;
    FQuery.Connection.Commit;
  except
    begin
      FQuery.Connection.Rollback;
      raise Exception.Create('Não foi possivel persistir os dados');
    end;
  end;
end;

class function TConexao.New(Conf: IConfiguracao): IConexao;
begin
  Result := Self.Create(Conf);
end;

function TConexao.Open: IConexao;
begin
  Result := Self;
  try
    FQuery.Open;
  except
    raise Exception.Create('Erro ao execução a ação');
  end;
end;

function TConexao.Params(aParams: String; aValue: Variant): IConexao;
begin
  Result := Self;
  FQuery.Params.Add;
  FQuery.ParamByName(aParams).Value := aValue;
end;

function TConexao.SQL(Value: String): IConexao;
begin
  Result := Self;
  FQuery.SQL.Clear;
  FQuery.SQL.Add(Value);
end;

end.
