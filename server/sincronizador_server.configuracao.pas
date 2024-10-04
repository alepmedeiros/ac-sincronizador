unit sincronizador_server.configuracao;

interface

uses
  System.SysUtils,
  LocalCache4D,
  sincronizador_server.interfaces;

type
  TConfiguracao = class(TInterfacedObject, IConfiguracao)
  private
    procedure CriarExtrutura;

    constructor Create;
    destructor Destroy; override;
  public
    class function New: IConfiguracao;

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

implementation

{ TConfiguracao }

function TConfiguracao.CharacterSet(Value: string): IConfiguracao;
begin
  Result := Self;
  if Value.IsEmpty then
    Value := 'utf8';
  LocalCache.SetItem('CharacterSet', Value);
end;

function TConfiguracao.CharacterSet: string;
begin
  Result := LocalCache.GetItem('CharacterSet');
end;

constructor TConfiguracao.Create;
begin
  CriarExtrutura;
end;

procedure TConfiguracao.CriarExtrutura;
begin
  if not FileExists(ExtractFilePath(ParamStr(0))+'conf.lc4') then
  begin
    LocalCache
      .SetItem('DataBase','')
      .SetItem('Server','')
      .SetItem('UserName','')
      .SetItem('Password','')
      .SetItem('Port','')
      .SetItem('LibHome','')
      .SetItem('Lib','')
      .SetItem('DriverId','')
      .SetItem('CharacterSet','')
      .SetItem('MetaDefSchema','');
    LocalCache.SaveToStorage(ExtractFilePath(ParamStr(0))+'conf.lc4');
    exit;
  end;
  LocalCache.LoadDatabase(ExtractFilePath(ParamStr(0))+'conf.lc4');
end;

function TConfiguracao.DataBase(Value: String): IConfiguracao;
begin
  Result := Self;
  LocalCache.SetItem('DataBase',Value);
end;

function TConfiguracao.DriverId(Value: string): IConfiguracao;
begin
  Result := Self;
  LocalCache.SetItem('DriverId',Value);
end;

function TConfiguracao.Lib(Value: String): IConfiguracao;
begin
  Result := Self;
  LocalCache.SetItem('Lib', Value);
end;

function TConfiguracao.LibHome(Value: String): IConfiguracao;
begin
  Result := Self;
  LocalCache.SetItem('LibHome', Value);
end;

function TConfiguracao.MetaDefSchema(Value: String): IConfiguracao;
begin
  Result := Self;
  if Value.IsEmpty then
    Value := 'public';
  LocalCache.SetItem('MetaDefSchema', Value);
end;

class function TConfiguracao.New: IConfiguracao;
begin
  Result := Self.Create;
end;

function TConfiguracao.Password(Value: String): IConfiguracao;
begin
  Result := Self;
  LocalCache.SetItem('Password', Value);
end;

function TConfiguracao.Port(Value: String): IConfiguracao;
begin
  Result := Self;
  LocalCache.SetItem('Port', Value);
end;

function TConfiguracao.Server(Value: String): IConfiguracao;
begin
  Result := Self;
  LocalCache.SetItem('Server', Value);
end;

function TConfiguracao.UserName(Value: String): IConfiguracao;
begin
  Result := Self;
  LocalCache.SetItem('UserName', Value);
end;

function TConfiguracao.DataBase: String;
begin
  Result := LocalCache.GetItem('DataBase');
end;

destructor TConfiguracao.Destroy;
begin
  LocalCache.SaveToStorage(ExtractFilePath(ParamStr(0))+'conf.lc4');
  inherited;
end;

function TConfiguracao.DriverId: string;
begin
  Result := LocalCache.GetItem('DriverId');
end;

function TConfiguracao.Lib: String;
begin
  Result := LocalCache.GetItem('Lib');
end;

function TConfiguracao.LibHome: String;
begin
  Result := LocalCache.GetItem('LibHome');
end;

function TConfiguracao.MetaDefSchema: String;
begin
  Result := LocalCache.GetItem('MetaDefSchema');
end;

function TConfiguracao.Password: String;
begin
  Result := LocalCache.GetItem('Password');
end;

function TConfiguracao.Port: String;
begin
  Result := LocalCache.GetItem('Port');
end;

procedure TConfiguracao.Salvar;
begin
  LocalCache.SaveToStorage(ExtractFilePath(ParamStr(0))+'conf.lc4');
end;

function TConfiguracao.Server: String;
begin
  Result := LocalCache.GetItem('Server');
end;

function TConfiguracao.UserName: String;
begin
  Result := LocalCache.GetItem('UserName');
end;

end.
