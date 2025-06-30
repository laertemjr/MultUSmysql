unit uGlobal;

interface

uses
  Winapi.Windows, System.SysUtils, Vcl.Forms, System.Win.Registry, System.Classes;


function GetVersionInfo(const app:string):string;
function MsgPergunta(pMsg:String; pFocoBotaoSim:Boolean=True):Boolean;

var
   sVerInfo : string;
   bAbortar : Boolean;
   valueNames : TStringList;

implementation


function GetVersionInfo(const app:string):string;
type
  TVersionInfo = packed record
    Dummy: array[0..7] of Byte;
    V2, V1, V4, V3: Word;
  end;
var
  Zero, Size: Cardinal;
  Data: Pointer;
  VersionInfo: ^TVersionInfo;
begin
  Size := GetFileVersionInfoSize(Pointer(app), Zero);
  if Size = 0 then
    Result := ''
  else
  begin
    GetMem(Data, Size);
    try
      GetFileVersionInfo(Pointer(app), 0, Size, Data);
      VerQueryValue(Data, '\', Pointer(VersionInfo), Size);
      Result := VersionInfo.V1.ToString + '.' + VersionInfo.V2.ToString + '.' + VersionInfo.V3.ToString + '.' + VersionInfo.V4.ToString;
    finally
      FreeMem(Data);
    end;
  end;
end;

function MsgPergunta(pMsg:String; pFocoBotaoSim:Boolean=True):Boolean;
begin
   if pFocoBotaoSim then
   begin
      Result := Application.MessageBox(PChar(pMsg), 'Informar:', MB_ICONQUESTION + MB_YESNO) = IDYES;
   end
   else
   begin
      Result := Application.MessageBox(PChar(pMsg), 'Informar:', MB_ICONQUESTION + MB_YESNO + MB_DEFBUTTON2) = IDYES;
   end;
end;

end.
