program D7_42;

uses
  Forms,
  Main in 'Main.pas' {Form1},
  GlueHelper in 'GlueHelper.pas',
  GlueCOM_TLB in 'GlueCOM_TLB.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
 end.

