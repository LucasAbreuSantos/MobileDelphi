program Financeiro;

uses
  System.StartUpCopy,
  FMX.Forms,
  ULogin in 'ULogin.pas' {FrmLogin},
  u99Permissions in 'Units\u99Permissions.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TFrmLogin, FrmLogin);
  Application.Run;
end.
