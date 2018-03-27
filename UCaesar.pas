unit UCaesar;

interface

uses
    Classes, Vcl.Dialogs, System.SysUtils, UEncryption;

type
    TCaesar = class(TEncryption)
    private
        ALPHABET: Array[1..26] of Char;
        procedure CreateAlphabet();
    public
        constructor Create(C: TComponent);
        procedure Decrypt; override;
        procedure Encrypt; override;
        procedure SetKey(value: string); override;
    end;

implementation

constructor TCaesar.Create(C: TComponent);
begin
    inherited Create(C);
    CreateAlphabet;
end;

procedure TCaesar.CreateAlphabet();
var i, j: Integer;
begin
    j := 1;
    for i := 65 to 90 do begin
        ALPHABET[j] := Chr(i);
        Inc(j);
    end;
end;

procedure TCaesar.SetKey(Value: String);
var i: Integer;
begin
    for i := 1 to Length(Value) do
        if not(Value[i] in ['0'..'9']) then begin
            ShowMessage('The Key to need a number Integer!');
            Exit;
        end;
    FKey := Value;
end;

procedure TCaesar.Encrypt();
var i, j, k, idx: Integer;
    aux: String;
    save: Array of String;
begin
    SetLength(save, Lines.Count);
    for i := 0 to Lines.Count -1 do begin
        aux := Lines[i];
        for j := 1 to Length(aux) do begin
            if (aux[j]=' ') then Continue;
            for k := 1 to 26 do
                if (UpCase(aux[j])=ALPHABET[k]) then begin
                    if ((StrToInt(Key)+k)>26) then
                        idx := (StrToInt(Key)+k) - 26
                    else
                        idx := (StrToInt(Key)+k);

                    if (aux[j]=LowerCase(aux[j])) then
                        aux[j] := LowerCase(ALPHABET[idx])[1]
                    else
                        aux[j] := ALPHABET[idx];
                    Break;
                end;
        end;
        save[i] := aux;
    end;
    Lines.Clear;
    for i := 0 to High(save) do
        Lines.Add(save[i]);
end;

procedure TCaesar.Decrypt();
var i, j, k, idx: Integer;
    aux: String;
    save: Array of String;
begin
    SetLength(save, Lines.Count);
    for i := 0 to Lines.Count -1 do begin
        aux := Lines[i];
        for j := 1 to Length(aux) do begin
            if (aux[j]=' ') then Continue;
            for k := 1 to 26 do
                if (UpCase(aux[j])=ALPHABET[k]) then begin
                    if (k-StrToInt(Key)<1) then
                        idx := Abs(k-StrToInt(Key)+26)
                    else
                        idx := Abs(k-StrToInt(Key));

                    if (aux[j]=LowerCase(aux[j])) then
                        aux[j] := LowerCase(ALPHABET[idx])[1]
                    else
                        aux[j] := ALPHABET[idx];
                    Break;
                end;
        end;
        save[i] := aux;
    end;
    Lines.Clear;
    for i := 0 to High(save) do
        Lines.Add(save[i]);
end;

end.
