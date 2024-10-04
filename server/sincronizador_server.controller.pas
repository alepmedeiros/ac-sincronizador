unit sincronizador_server.controller;

interface

uses
  Horse;

type
  IController = interface
    function Start: IController;
    function Stop: IController;
    function Registrar: IController;
  end;

  TController = class(TInterfacedObject, IController)
  private

  public
    class function New: IController;

    function Start: IController;
    function Stop: IController;
    function Registrar: IController;
  end;

implementation

class function TController.New: IController;
begin
  Result := Self.Create;
end;

function TController.Registrar: IController;
begin
  THorse.Post('sincronizar/:tabela',
  procedure(Req: THorseRequest; Res: THorseResponse)
  begin

  end)
  .Get('sincronizado/:tabela/:id',
  procedure(Req: THorseRequest; Res: THorseResponse)
  begin

  end);
end;

function TController.Start: IController;
begin
  THorse.Listen(9000);
end;

function TController.Stop: IController;
begin
  THorse.StopListen;
end;

end.
