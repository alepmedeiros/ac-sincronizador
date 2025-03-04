unit agent.Alert;

interface

uses
  System.JSON,
  agent.interfaces,
  FireDAC.Comp.Client;

type
  IAlerts = interface
    function Names(Value: String): IAlerts;
    function Server(Value: String): IAlerts;
    function Ports(Value: String): IAlerts;
    function Sincronizar(Value: TJSONObject): IAlerts;
    function RegistrarEvento: IAlerts;
  end;

  TAlerts = class(TInterfacedObject, IAlerts)
  private
    FDEventAlerter: TFDEventAlerter;
    FServer: String;
    FPorts: String;
    FJSON: TJSONObject;

    procedure Alert(ASender: TFDCustomEventAlerter; const AEventName: string;
      const AArgument: Variant);

    procedure PostEvent(Value: String);

    constructor Create(Conexao: TFDConnection);
    destructor Destroy; override;
  public
    class function New(Conexao: TFDConnection): IAlerts;

    function Names(Value: String): IAlerts;
    function Server(Value: String): IAlerts;
    function Ports(Value: String): IAlerts;
    function Sincronizar(Value: TJSONObject): IAlerts;
    function RegistrarEvento: IAlerts;
  end;

implementation

uses
  System.SysUtils,
  System.Variants,
  RESTRequest4D,
  agent.Ports;

procedure TAlerts.Alert(ASender: TFDCustomEventAlerter;
  const AEventName: string; const AArgument: Variant);
begin
  PostEvent(AEventName);
end;

constructor TAlerts.Create(Conexao: TFDConnection);
begin
  FDEventAlerter := TFDEventAlerter.Create(nil);
  FDEventAlerter.Connection := Conexao;
end;

destructor TAlerts.Destroy;
begin
  FDEventAlerter.Free;
  inherited;
end;

function TAlerts.Names(Value: String): IAlerts;
begin
  Result := Self;
  FDEventAlerter.Names.Add(Value);
end;

class function TAlerts.New(Conexao: TFDConnection): IAlerts;
begin
  Result := Self.Create(Conexao);
end;

function TAlerts.Ports(Value: String): IAlerts;
begin
  Result := Self;
  FPorts := Value;
end;

procedure TAlerts.PostEvent(Value: String);
begin
  TRequest.New.BaseURL(Format('http://%s:%s/sincronizar/%s',
    [FServer, FPorts, Value])).ContentType('application/json')
    .AddBody(FJSON).Post;
end;

function TAlerts.RegistrarEvento: IAlerts;
begin
  FDEventAlerter.Options.Kind := '';
  FDEventAlerter.Options.Synchronize := True;
  FDEventAlerter.OnAlert := Alert;
  FDEventAlerter.Register;
  FDEventAlerter.Active := True;
end;

function TAlerts.Server(Value: String): IAlerts;
begin
  Result := Self;
  FServer := Value;
end;

function TAlerts.Sincronizar(Value: TJSONObject): IAlerts;
begin
  Result := Self;
  FJSON := Value;
end;

end.
