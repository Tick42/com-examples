unit Glue42MainForm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, GlueAgm_TLB,
  Winapi.ActiveX, ComObj,
  GlueHelper, mscorlib_TLB, Vcl.ComCtrls, DateUtils;

type
  TForm1 = class(TForm, IGlueEvents, IGlueWindowEventHandler,
    IGlueRequestHandler, IGlueSubscriptionHandler)
    GroupBox1: TGroupBox;
    Edit1: TEdit;
    ListBox1: TListBox;
    GroupBox2: TGroupBox;
    btnInitGlue: TButton;
    btnGlueInvoke: TButton;
    btnSubscribe: TButton;
    btnPush: TButton;
    edtMethodName: TEdit;
    edtStreamName: TEdit;
    GroupBox3: TGroupBox;
    TreeView1: TTreeView;
    GroupBox4: TGroupBox;
    memLog: TMemo;
    procedure BtnGlueInitClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormDestroy(Sender: TObject);
    procedure btnGlueInvokeClick(Sender: TObject);
    procedure btnSubscribeClick(Sender: TObject);
    procedure btnPushClick(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ListBox1DblClick(Sender: TObject);
  private
    { Private declarations }
    glueWindow: IGlueWindow;
    stream: IGlueStream;
    G42: IGlue42;
    FMethods: TStringList;
    function CreateSampleArgs: PSafeArray;
  protected
    function HandleConnectionStatus(State: GlueState; const Message: WideString;
      date: Int64): HResult; stdcall;
    function HandleInstanceStatus(Instance: GlueInstance; active: WordBool)
      : HResult; stdcall;
    function HandleMethodStatus(Method: GlueMethod; active: WordBool)
      : HResult; stdcall;
    function HandleGlueContext(context: GlueContext; created: WordBool)
      : HResult; stdcall;
    function HandleException(const ex: _Exception): HResult; stdcall;

    function HandleChannelData(const glueWindow: IGlueWindow;
      const channelUpdate: IGlueContextUpdate): HResult; stdcall;
    function HandleChannelLeft(const glueWindow: IGlueWindow;
      const channel: IGlueContext): HResult; stdcall;
    function HandleWindowDestroyed(const glueWindow: IGlueWindow)
      : HResult; stdcall;

    function HandleInvocationRequest(Method: GlueMethod; caller: GlueInstance;
      requestValues: PSafeArray;
      const resultCallback: IGlueServerMethodResultCallback): HResult; stdcall;

    function HandleSubscriptionRequest(stream: GlueMethod; caller: GlueInstance;
      requestValues: PSafeArray;
      const callback: IGlueServerSubscriptionCallback): HResult; stdcall;
    function HandleSubscriber(subscriberInstance: GlueInstance;
      const glueStreamSubscriber: IGlueStreamSubscriber;
      requestValues: PSafeArray): HResult; stdcall;
    function HandleSubscriberLost(streamSubscriber: GlueInstance;
      const glueStreamSubscriber: IGlueStreamSubscriber): HResult; stdcall;
  public
  end;

  TGlueMethod = class
  public
    Method: GlueMethod;
    constructor Create(Method: GlueMethod);
  end;

var
  Form1: TForm1;

procedure BuildContextValueTree(arr: TArray<GlueContextValue>; tree: TTreeNodes;
  node: TTreeNode);
procedure BuildValueTree(name: string; gv: GlueValue; tree: TTreeNodes;
  node: TTreeNode);

implementation

uses
  StrUtils;

{$R *.dfm}

function TForm1.HandleInvocationRequest(Method: GlueMethod;
  caller: GlueInstance; requestValues: PSafeArray;
  const resultCallback: IGlueServerMethodResultCallback): HResult; stdcall;
var
  gr: GlueResult;
begin
  memLog.Lines.Add('Method ' + Method.name + ' invoked by ' +
    caller.ApplicationName);
  TraverseGlueContextValuesSafeArray(requestValues, memLog.Lines);
  ZeroMemory(@gr, sizeof(gr));
  gr.Status := AgmMethodInvocationStatus_Succeeded;
  gr.Values := requestValues;
  gr.Message := 'Here, take it';
  resultCallback.SendResult(gr);

  Result := S_OK;
end;

function TForm1.HandleConnectionStatus(State: GlueState;
  const Message: WideString; date: Int64): HResult;
begin
  memLog.Lines.Add(DateTimeToStr(GlueTimeToDateTime(date)) +
    ' UTC: ' + Message);
  Result := S_OK;
end;

function TForm1.HandleInstanceStatus(Instance: GlueInstance;
  active: WordBool): HResult;
begin
  memLog.Lines.Add(Instance.ApplicationName + ' is ' + BoolToStr(active, true));
  Result := S_OK;
end;

function TForm1.HandleMethodStatus(Method: GlueMethod;
  active: WordBool): HResult;
var
  glueMethodKey: System.WideString;
  ind: Integer;
begin
  try
    glueMethodKey := Method.name + ' at ' + Method.Instance.ApplicationName;
    if active then
    begin
      FMethods.AddObject(glueMethodKey, TGlueMethod.Create(Method));
    end
    else
    begin
      ind := FMethods.IndexOf(glueMethodKey);
      FMethods.Objects[ind].Free;
      FMethods.Delete(ind);
    end;

    ListBox1.Items.Assign(FMethods);
  except
    on E: Exception do
      ShowMessage(E.ClassName + ' error raised, with message : ' + E.Message);
  end;

  Result := S_OK;
end;

function TForm1.HandleSubscriber(subscriberInstance: GlueInstance;
  const glueStreamSubscriber: IGlueStreamSubscriber;
  requestValues: PSafeArray): HResult;
begin
  Result := S_OK;
end;

function TForm1.HandleSubscriberLost(streamSubscriber: GlueInstance;
  const glueStreamSubscriber: IGlueStreamSubscriber): HResult;
begin
  Result := S_OK;
end;

function TForm1.CreateSampleArgs: PSafeArray;
var
  gcv: TArray<GlueContextValue>;
  argsValues: TArray<GlueContextValue>;
begin
  SetLength(gcv, 2);
  gcv[0].name := 'One';

  ZeroMemory(@gcv[0].Value, sizeof(gcv[0].Value));
  gcv[0].Value.GlueType := AgmValueType_Int;
  gcv[0].Value.LongValue := 5;
  gcv[1].name := 'Two';

  ZeroMemory(@gcv[1].Value, sizeof(gcv[1].Value));
  gcv[1].Value.GlueType := AgmValueType_String;
  gcv[1].Value.StringValue := 'And a string for you, sirs';

  SetLength(argsValues, 1);
  argsValues[0].name := 'Level 0';

  ZeroMemory(@argsValues[0].Value, sizeof(argsValues[0].Value));
  argsValues[0].Value.GlueType := AgmValueType_Composite;
  argsValues[0].Value.CompositeValue := CreateComposite(gcv);

  Result := CreateContextValues(argsValues);
end;

procedure TForm1.Edit1Change(Sender: TObject);
var
  I: Integer;
  S: String;
begin
  ListBox1.Items.BeginUpdate;
  try
    ListBox1.Clear;
    S := Edit1.Text;
    for I := 0 to FMethods.Count - 1 do
    begin
      if (Edit1.GetTextLen <= 0) or ContainsText(FMethods[I], S) then
        ListBox1.Items.Add(FMethods[I]);
    end;
  finally
    ListBox1.Items.EndUpdate;
  end;
end;

function TForm1.HandleSubscriptionRequest(stream: GlueMethod;
  caller: GlueInstance; requestValues: PSafeArray;
  const callback: IGlueServerSubscriptionCallback): HResult;
var
  r: GlueResult;
begin
  ZeroMemory(@r, sizeof(r));
  callback.Accept('', r);
  Result := S_OK;
end;

function TForm1.HandleGlueContext(context: GlueContext;
  created: WordBool): HResult;
begin
  memLog.Lines.Add('Discovered Glue context ' + context.name);
  Result := S_OK;
end;

procedure TForm1.btnGlueInvokeClick(Sender: TObject);
var
  handler: IGlueInvocationResultHandler;
  args: PSafeArray;
  targets: TGlueInstanceArray;
begin
  handler := TGlueResultHandler.Create(
    procedure(results: TGlueInvocationResultArray)
    var
      I: Integer;
    begin
      for I := 0 to Length(results) - 1 do
      begin
        memLog.Lines.Add('Received result from ' + results[I]
          .Method.Instance.ApplicationName);
        TraverseGlueContextValuesSafeArray(results[I].Result.Values,
          memLog.Lines);
      end;
    end);
  args := CreateSampleArgs;

  // SetLength(targets, 1);
  // ZeroMemory(@targets[0], sizeof(targets[0]));
  // targets[0].ApplicationName := 'SomeApp';

  G42.InvokeMethods(edtMethodName.Text, args, nil, true,
    AgmInstanceIdentity_None, handler, 5000);

  SafeArrayDestroy(args);
end;

procedure TForm1.btnPushClick(Sender: TObject);
begin
  stream.Push(CreateSampleArgs, '');
end;

procedure TForm1.btnSubscribeClick(Sender: TObject);
var
  sub: TGlueStreamHandler;
begin
  sub := TGlueStreamHandler.Create(
    procedure(stream: GlueMethod; dataValues: TArray<GlueContextValue>;
      data: PSafeArray)
    begin
      memLog.Lines.Add('Received data pushed from ' +
        stream.Instance.ApplicationName);

      TraverseGlueContextValuesSafeArray(data, memLog.Lines);
    end);
  G42.SubscribeStreams(edtStreamName.Text, nil, nil, false,
    AgmInstanceIdentity_None, sub, -1);
end;

procedure TForm1.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if Assigned(glueWindow) then
  begin
    glueWindow.Unregister;
  end;
  if Assigned(G42) then
  begin
    G42.Stop;
  end;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  FMethods := TStringList.Create;
end;

procedure TForm1.FormDestroy(Sender: TObject);
begin
  glueWindow.Unregister;
  G42.Stop;
end;

function TForm1.HandleWindowDestroyed(const glueWindow: IGlueWindow)
  : HResult; stdcall;
begin
  Close;
  Result := S_OK;
end;

procedure BuildValueTree(name: string; gv: GlueValue; tree: TTreeNodes;
node: TTreeNode);
var
  comp: TArray<GlueContextValue>;
  stringRepresentation: string;
  tuple: TArray<GlueValue>;
  I: Integer;
begin
  if gv.IsArray then
  begin
    if gv.GlueType = AgmValueType_Tuple then
    begin
      tuple := TSafeArrayExpander<GlueValue>.AsPackedArray(gv.tuple);
      for I := 0 to Length(tuple) - 1 do
      begin
        BuildValueTree(IntToStr(I), tuple[I], tree, node);
      end;
    end
    else if gv.GlueType = AgmValueType_Composite then
    begin
      comp := TSafeArrayExpander<GlueContextValue>.AsPackedArray
        (gv.CompositeValue);
      BuildContextValueTree(comp, tree, tree.AddChild(node, name));
    end
    else
    begin
      case gv.GlueType of
        AgmValueType_String:
          begin
            stringRepresentation :=
              string.Join(',', TSafeArrayExpander<WideString, string>.AsArray
              (gv.StringArray,
              function(ws: WideString): string
              begin
                Result := ws;
              end));
          end;
        AgmValueType_Bool:
          begin
            stringRepresentation :=
              string.Join(',', TSafeArrayExpander<WordBool, string>.AsArray
              (gv.BoolArray,
              function(b: WordBool): string
              begin
                Result := BoolToStr(b);
              end));
          end;
        AgmValueType_Int:
          stringRepresentation :=
            string.Join(',', TSafeArrayExpander<Int64, string>.AsArray
            (gv.LongArray,
            function(b: Int64): string
            begin
              Result := IntToStr(b);
            end));
        AgmValueType_Long:
          stringRepresentation :=
            string.Join(',', TSafeArrayExpander<Int64, string>.AsArray
            (gv.LongArray,
            function(b: Int64): string
            begin
              Result := IntToStr(b);
            end));
        AgmValueType_Double:
          stringRepresentation :=
            string.Join(',', TSafeArrayExpander<Double, string>.AsArray
            (gv.DoubleArray,
            function(b: Double): string
            begin
              Result := FloatToStr(b);
            end));
        AgmValueType_DateTime:
          stringRepresentation :=
            string.Join(',', TSafeArrayExpander<Int64, string>.AsArray
            (gv.LongArray,
            function(d: Int64): string
            begin
              Result := DateTimeToStr(GlueTimeToDateTime(d));
            end));
      end;
      tree.AddChild(node, name + ' = ' + stringRepresentation);
    end;
  end
  else
  begin
    if gv.GlueType = AgmValueType_Composite then
    begin
      comp := TSafeArrayExpander<GlueContextValue>.AsPackedArray
        (gv.CompositeValue);
      BuildContextValueTree(comp, tree, tree.AddChild(node, name));
    end
    else
    begin
      case gv.GlueType of
        AgmValueType_String:
          stringRepresentation := gv.StringValue;
        AgmValueType_Bool:
          stringRepresentation := BoolToStr(gv.BoolValue);
        AgmValueType_Int:
          stringRepresentation := IntToStr(gv.LongValue);
        AgmValueType_Long:
          stringRepresentation := IntToStr(gv.LongValue);
        AgmValueType_Double:
          stringRepresentation := FloatToStr(gv.DoubleValue);
        AgmValueType_DateTime:
          stringRepresentation :=
            DateTimeToStr(GlueTimeToDateTime(gv.LongValue));
        AgmValueType_Tuple:
          // never - tuple is always an array
          ;
      end;
      tree.AddChild(node, name + ' = ' + stringRepresentation);
    end;
  end;
end;

procedure BuildContextValueTree(arr: TArray<GlueContextValue>; tree: TTreeNodes;
node: TTreeNode);
var
  gcv: GlueContextValue;
  I: Integer;
  gv: GlueValue;
  name: string;
begin
  for I := 0 to Length(arr) - 1 do
  begin
    gcv := arr[I];
    gv := gcv.Value;
    name := gcv.name;
    BuildValueTree(gcv.name, gv, tree, node);
  end;
end;

function TForm1.HandleChannelData(const glueWindow: IGlueWindow;
const channelUpdate: IGlueContextUpdate): HResult;
var
  gc: IGlueContext;
  channelData: PSafeArray;
  contextInfo: GlueContext;
begin
  gc := channelUpdate.GetContext;
  contextInfo := gc.GetContextInfo;
  memLog.Lines.Add('Bound to channel ' + contextInfo.name);
  channelData := gc.GetData;
  TraverseGlueContextValuesSafeArray(channelData, memLog.Lines);

  TreeView1.Items.BeginUpdate;

  TreeView1.Items.Clear;
  BuildContextValueTree(TSafeArrayExpander<GlueContextValue>.AsArray
    (channelData), TreeView1.Items, TreeView1.Items.AddChild(nil,
    contextInfo.name));

  TreeView1.Items.GetFirstNode.Expand(true);

  TreeView1.Items.EndUpdate;

  Result := S_OK;
end;

function TForm1.HandleChannelLeft(const glueWindow: IGlueWindow;
const channel: IGlueContext): HResult;
begin
  memLog.Lines.Add('Left channel ' + channel.GetContextInfo.name);
  Result := S_OK;
end;

function TForm1.HandleException(const ex: _Exception): HResult;
begin
  // NOTE: log exception
  Result := S_OK;
end;

procedure TForm1.BtnGlueInitClick(Sender: TObject);
var
  inst: GlueInstance;
begin
  G42 := CoGlue42.Create() as IGlue42;

  G42.Subscribe(self);

  ZeroMemory(@inst, sizeof(inst));
  inst.ApplicationName := 'DelphiRulez';
  inst.Metadata := nil;

  G42.Start(inst);

  try
    glueWindow := G42.RegisterGlueWindow(self.Handle, self);
    glueWindow.SetTitle('Delphi Glue Window');
  except
    on E: Exception do
      ShowMessage(E.ClassName + ' error raised, with message : ' + E.Message);
  end;

  G42.RegisterMethod('GlueDelphi', self, '', '', nil);
  G42.RegisterStream('GlueDelphiStream', self, '', '', nil, stream);

  memLog.Lines.Add('InstanceId is ' + G42.GetInstance.InstanceId);

  G42.GetGlueContext('___channel___Green', TGlueContextHandler.Create(nil,
    procedure(gc: IGlueContext; gcv: TArray<GlueContextValue>)
    begin
      TraverseGlueContextValuesSafeArray(gc.GetData, memLog.Lines);
    end, nil));
end;

procedure TForm1.ListBox1DblClick(Sender: TObject);
var
  I: Integer;
  gm: GlueMethod;
begin
  if ListBox1.ItemIndex >= 0 then
  begin
    I := FMethods.IndexOf(ListBox1.Items[ListBox1.ItemIndex]);
    if I >= 0 then
    begin
      gm := TGlueMethod(FMethods.Objects[I]).Method;

      gm.Instance.Metadata := nil;
      gm.ObjectTypes := nil;

      G42.InvokeMethod(gm, CreateSampleArgs, TGlueResultHandler.Create(
        procedure(results: TGlueInvocationResultArray)
        var
          I: Integer;
        begin
          for I := 0 to Length(results) - 1 do
          begin
            memLog.Lines.Add('Received result from ' + results[I]
              .Method.Instance.ApplicationName);
            TraverseGlueContextValuesSafeArray(results[I].Result.Values,
              memLog.Lines);
          end;
        end), -1);
    end;
  end;
end;

{ TGlueMethod }

constructor TGlueMethod.Create(Method: GlueMethod);
begin
  self.Method := Method;
end;

end.
