unit uDangoStringBuilder;

interface

uses
  SysUtils;

type
  TStringBuilder = class
  private
    FBuffer: array of Char;
    FLength: Integer;
    procedure EnsureCapacity(MinCapacity: Integer);
  public
    constructor Create(InitialCapacity: Integer = 16);
    procedure Append(const S: string);
    procedure AppendChar(C: Char);
    function ToString: string;
  end;

implementation

constructor TStringBuilder.Create(InitialCapacity: Integer);
begin
  inherited Create;
  if InitialCapacity < 1 then
    raise Exception.Create('InitialCapacity must be greater 0');
  SetLength(FBuffer, InitialCapacity);
  FLength := 0;
end;

procedure TStringBuilder.EnsureCapacity(MinCapacity: Integer);
var
  NewCapacity: Integer;
begin
  if MinCapacity > Length(FBuffer) then
  begin
    NewCapacity := Length(FBuffer) * 2;
    if NewCapacity < MinCapacity then
      NewCapacity := MinCapacity;
    SetLength(FBuffer, NewCapacity);
  end;
end;

procedure TStringBuilder.Append(const S: string);
var
  L: Integer;
begin
  L := Length(S);
  if L = 0  then
    Exit;
  EnsureCapacity(FLength + L);
  Move(S[1], FBuffer[FLength], L * SizeOf(Char));
  Inc(FLength, L);
end;

procedure TStringBuilder.AppendChar(C: Char);
begin
  EnsureCapacity(FLength + 1);
  FBuffer[FLength] := C;
  Inc(FLength);
end;

function TStringBuilder.ToString: string;
begin
  if FLength = 0 then
    Result := ''
  else
    SetString(Result, PChar(@FBuffer[0]), FLength);
end;

end.
