unit ChannelViewer;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, GlueCOM_TLB, ActiveX, GlueHelper,
  mscorlib_tlb, ExtCtrls;

type
  TForm2 = class(TForm, IGlueApp)
    GroupBox3: TGroupBox;
    TreeView1: TTreeView;
    GroupBox7: TGroupBox;
    Edit1: TEdit;
  private
    { Private declarations }
  protected
    function SaveState(out pRetVal: GlueValue): HResult; stdcall;
    function Initialize(state: GlueValue; const glueWindow: IGlueWindow):
      HResult; stdcall;
    function Shutdown: HResult; stdcall;
  public
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation

{$R *.dfm}

{ TForm2 }

function TForm2.Initialize(state: GlueValue;
  const glueWindow: IGlueWindow): HResult;
begin
  Result := S_OK;
end;

function TForm2.SaveState(out pRetVal: GlueValue): HResult;
begin
  Result := S_OK;
end;

function TForm2.Shutdown: HResult;
begin
  Result := S_OK;
  Close;
end;

end.
