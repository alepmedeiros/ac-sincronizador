unit agent.interfaces;

interface

uses
  System.Classes,
  Data.DB, FireDAC.Comp.Client;

type
  IConexao = interface
    function SQL(Value: String): IConexao;
    function Params(aParams: String; aValue: Variant): IConexao;
    function Open: IConexao;
    function ExecSQL: IConexao;
    function DataSet: TDataSet;
    function Connection: TCustomConnection;
  end;

  IConfiguracao = interface
    function DataBase(Value: String): IConfiguracao; overload;
    function DataBase: String; overload;
    function Server(Value: String): IConfiguracao; overload;
    function Server: String; overload;
    function UserName(Value: String): IConfiguracao; overload;
    function UserName: String; overload;
    function Password(Value: String): IConfiguracao; overload;
    function Password: String; overload;
    function Port(Value: String): IConfiguracao; overload;
    function Port: String; overload;
    function LibHome(Value: String): IConfiguracao; overload;
    function LibHome: String; overload;
    function Lib(Value: String): IConfiguracao; overload;
    function Lib: String; overload;
    function DriverId(Value: string): IConfiguracao; overload;
    function DriverId: string; overload;
    function CharacterSet(Value: string): IConfiguracao; overload;
    function CharacterSet: string; overload;
    function MetaDefSchema(Value: String): IConfiguracao; overload;
    function MetaDefSchema: String; overload;
    procedure Salvar;
  end;

  IPorts = interface
    function Configuracao: IConfiguracao;
    function Conexao: IConexao;
  end;

implementation

end.
