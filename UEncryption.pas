unit UEncryption;

interface

uses
    StdCtrls, Classes, Vcl.Dialogs, Vcl.Controls, System.SysUtils;

type
    TEncryption = class(TMemo)
    protected
        FKey: String;
        FLog: TextFile;
        FChanged: Boolean;
    public
        constructor Create(C: TComponent);
        procedure Encrypt(); virtual; abstract;
        procedure Decrypt(); virtual; abstract;
        procedure SetKey(Value: String); virtual; abstract;
        procedure OpenFile(var Open: TOpenDialog; var Save: TSaveDialog);
        procedure SaveFile(var Save: TSaveDialog);
    published
        property Key: String read FKey write SetKey;
        property Log: TextFile read FLog write FLog;
        property Changed: Boolean read FChanged write FChanged;
    end;

implementation

constructor TEncryption.Create(C: TComponent);
begin
    inherited Create(C);
    Top := 10;
    Left := 5;
    Width := 355;
    Height := 170;
    ScrollBars := ssVertical;
end;

procedure TEncryption.OpenFile(var Open: TOpenDialog; var Save: TSaveDialog);
var texto: String;
begin
    if (Changed) then
        if (MessageDlg('Discard changes?',
            mtWarning, [mbYes, mbNo], 0)=mrNo) then begin
            SaveFile(Save);
            Exit;
        end;
    if (Open.Execute()) then begin
        AssignFile(Log, Open.FileName);
        Reset(Log);
        Clear;
        try
            while not Eof(Log) do begin
                Readln(Log, texto);
                Lines.Add(texto);
            end;
        finally
            CloseFile(Log);
        end;
    end;
end;

procedure TEncryption.SaveFile(var Save: TSaveDialog);
var line: Integer;
begin
    if (Lines.Count=0) then
        MessageDlg('The textbox is empty!', mtError, [mbOK], 0)
    else
        if (Save.Execute()) then begin
            if (Save.FileName='') then Exit;
            if FileExists(Save.FileName) then
                if ((MessageDlg('File Exists! Overwrite?',
                    mtWarning, [mbYes, mbNo], 0)=mrNo)) then Exit;

            AssignFile(Log, Save.FileName);
            Rewrite(Log);
            try
                for line := 0 to Lines.Count -1 do
                    Writeln(Log, Lines[line]);
            finally
                CloseFile(Log);
                Changed := False;
            end;
        end;
end;

end.
