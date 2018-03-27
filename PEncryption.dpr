program PEncryption;

uses
  Vcl.Forms,
  UMain in 'UMain.pas' {FMain},
  UVigenere in 'UVigenere.pas',
  UCaesar in 'UCaesar.pas',
  UEncryption in 'UEncryption.pas',
  UEnigma in 'UEnigma.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFMain, FMain);
  Application.Run;
end.
