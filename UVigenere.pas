unit UVigenere;

interface

uses
    Classes, Vcl.Dialogs, System.SysUtils, UEncryption;

type
    TVigenere = class(TEncryption)
    private
        TABLE_VIGENERE: Array[1..26,1..26] of Char;
        procedure CreateTableVigenere();
    public
        constructor Create(C: TComponent);
        procedure Decrypt; override;
        procedure Encrypt; override;
        procedure SetKey(value: string); override;
    end;

implementation

{ Begin > Methods class TVigenere }

constructor TVigenere.Create(C: TComponent);
begin
    inherited Create(C);
    CreateTableVigenere();
end;

procedure TVigenere.CreateTableVigenere;
var i, j, x, y: Integer;
begin
    // Table of Vigenere
    x := 1;
    for i := 65 to 90 do begin
        j := i;
        y := 1;
        while (y <= 26) do begin
            TABLE_VIGENERE[x, y] := Chr(j);
            Inc(j); Inc(y);
            if (j=91) then j := 65;
        end;
        Inc(x);
    end;
end;

procedure TVigenere.SetKey(Value: string);
var i: Integer;
begin
    for i := 1 to Length(Value) do
        if (not(UpCase(Value[i]) in ['A'..'Z'])
        and(UpCase(Value[i])<>' ')) then begin
            ShowMessage('The Key must be one word or phrase without numbers!');
            Exit;
        end;
    FKey := Trim(Value);
end;

procedure TVigenere.Encrypt();
var w, i, j, x, y, coordX, coordY: Integer;
    newLine, Line: String;
    aux: array of String;
begin
    SetLength(aux, Lines.Count);

    for w := 0 to Lines.Count -1 do begin
        newLine := '';
        y := 1;
        Line := Lines[w];
        for x := 1 to Length(Line) do begin
            coordX := -1; coordY := -1;

            // Voltar a chave ao inicio caso
            // a chave termine e a linha n�o
            if (y > Length(FKey)) then y := 1;

            // Se caso conter um espa�o na linha,
            // concatena e continua
            if (Line[x]=' ') then begin
                newLine := newLine + ' ';
                Continue;
            end;

            // Procura o caraceter correspondente
            for i := 1 to 26 do
                if (UpCase(Line[x])=TABLE_VIGENERE[1, i]) then begin coordX:=i; Break; end;
            for j := 1 to 26 do
                if (UpCase(FKey[y])=TABLE_VIGENERE[1, j]) then begin coordY:=j; Break; end;

            // Concatena o novo caracter correspondente
            // de acordo com as coordenadas encontradas
            // em I e J
            if ((coordX<>-1)and(coordY<>-1)) then begin
                if (Line[x]=LowerCase(Line[x])) then
                    newLine := newLine + LowerCase(TABLE_VIGENERE[coordX, coordY])
                else newLine := newLine + TABLE_VIGENERE[coordX, coordY];
            end else newLine := newLine + Line[x];
            Inc(y);
        end;
        aux[w] := newLine;
    end;
    Lines.Clear;
    for i := 0 to High(aux) do
        Lines.Add(aux[i]);
    FChanged := True;
end;

procedure TVigenere.Decrypt();
var w, i, j, x, y, coordX, coordY: Integer;
    Line, newLine: String;
    aux: array of String;
begin
    SetLength(aux, Lines.Count);

    for w := 0 to Lines.Count -1 do begin
        newLine := '';
        y := 1;
        Line := Lines[w];
        for x := 1 to Length(Line) do begin
            coordX := -1; coordY := -1;

            // Voltar a chave ao inicio caso
            // a chave termine e a linha n�o
            if (y > Length(FKey)) then y := 1;

            // Se caso conter um espa�o na linha,
            // concatena e continua
            if (Line[x]=' ') then begin
                newLine := newLine + ' ';
                Continue;
            end;

            for j := 1 to 26 do
                if (UpCase(FKey[y])=TABLE_VIGENERE[1, j]) then begin
                    coordY:=j;
                    for i := 1 to 26 do
                        if (UpCase(line[x])=TABLE_VIGENERE[i, j]) then begin
                            coordX:=i;
                            coordY:=1;
                            Break;
                        end;
                end;

            // Concatena o novo caracter correspondente
            // de acordo com as coordenadas encontradas
            // em I e J
            if ((coordX<>-1)and(coordY<>-1)) then begin
                if (Line[x]=LowerCase(Line[x])) then
                    newLine := newLine + LowerCase(TABLE_VIGENERE[coordX, coordY])
                else newLine := newLine + TABLE_VIGENERE[coordX, coordY];
            end else newLine := newLine + Line[x];
            Inc(y);
        end;
        aux[w] := newLine;
    end;
    Lines.Clear;
    for i := 0 to High(aux) do
        Lines.Add(aux[i]);
    FChanged := True;
end;

{ End < Methods class TVigenere }

end.
