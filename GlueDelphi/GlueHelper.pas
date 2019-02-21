unit GlueHelper;

interface

uses
  System.SysUtils, System.Variants, System.Classes, GlueAgm_TLB, Winapi.ActiveX,
  ComObj;

type

  PGlueContextValue = ^GlueContextValue;
  PGlueMethod = ^GlueMethod;
  PGlueValue = ^GlueValue;
  PGlueResult = ^GlueResult;
  PGlueInvocationResult = ^GlueInvocationResult;
  TGlueInvocationResultArray = array of GlueInvocationResult;
  TGlueInstanceArray = array of GlueInstance;

  TGlueResultHandler = class(TInterfacedObject, IGlueInvocationResultHandler)
  private
    FHandlerLambda: TProc<TGlueInvocationResultArray>;
  protected
    function HandleResult(invocationResult: PSafeArray): HResult; stdcall;
  public
    constructor Create(handlerLambda: TProc<TGlueInvocationResultArray>);
  end;

  TGlueRequestHandler = class(TInterfacedObject, IGlueRequestHandler)
  private
    FHandlerLambda: TProc<GlueMethod, GlueInstance, TArray<GlueContextValue>,
      IGlueServerMethodResultCallback>;
  protected
    function HandleInvocationRequest(Method: GlueMethod; caller: GlueInstance;
      requestValues: PSafeArray;
      const resultCallback: IGlueServerMethodResultCallback): HResult; stdcall;
  public
    constructor Create(handlerLambda: TProc<GlueMethod, GlueInstance,
      TArray<GlueContextValue>, IGlueServerMethodResultCallback>);
  end;

  TGlueStreamHandler = class(TInterfacedObject, IGlueStreamHandler)
  private
    FDataLambda: TProc<GlueMethod, TArray<GlueContextValue>, PSafeArray>;
  protected
    function StreamOpened(stream: GlueMethod;
      const glueStreamSubscription: IGlueStreamSubscription): HResult; stdcall;
    function HandleStreamData(stream: GlueMethod; data: PSafeArray)
      : HResult; stdcall;
    function HandleStreamStatus(stream: GlueMethod; State: GlueStreamState;
      const Message: WideString; dateTime: Int64): HResult; stdcall;
    function StreamClosed(stream: GlueMethod): HResult; stdcall;
  public
    constructor Create(dataLambda: TProc<GlueMethod, TArray<GlueContextValue>,
      PSafeArray>);
  end;

  TGlueContextHandler = class(TInterfacedObject, IGlueContextHandler)
  private
    fRemovedLambda: TProc<IGlueContext, TArray<string>>;
    fAddedLambda: TProc<IGlueContext, TArray<GlueContextValue>>;
    fUpdatedLambda: TProc<IGlueContext, TArray<GlueContextValue>>;
  protected
    function HandleContext(const context: IGlueContext): HResult; stdcall;
    function HandleContextUpdate(const contextUpdate: IGlueContextUpdate)
      : HResult; stdcall;
  public
    constructor Create(removedLambda: TProc<IGlueContext, TArray<string>>;
      addedLambda: TProc<IGlueContext, TArray<GlueContextValue>>;
      updatedLambda: TProc < IGlueContext, TArray < GlueContextValue >> );
  end;

  TSafeArrayExpander<T, TA> = class
  type
    PT = ^T;
  public
    class function AsArray(sa: PSafeArray; converter: TFunc<T, TA>): TArray<TA>;
  end;

  TSafeArrayExpander<T> = class(TSafeArrayExpander<T, T>)
  public
    class function AsArray(sa: PSafeArray): TArray<T>;

    class function AsPackedArray(sa: PSafeArray): TArray<T>;
  end;

function CreateTuple(GlueValues: TArray<GlueValue>): PSafeArray;
function CreateComposite(GlueContextValues: TArray<GlueContextValue>)
  : PSafeArray;
function CreateGlueInstanceArray(GlueInstances: TGlueInstanceArray): PSafeArray;
function CreateContextValues(GlueContextValues: TArray<GlueContextValue>)
  : PSafeArray;

procedure TraverseGlueValue(name: string; gv: GlueValue; lines: TStrings;
  level: Integer = 0);
procedure TraverseGlueContextValuesSafeArray(sa: PSafeArray; lines: TStrings;
  level: Integer = 0);

const
  UnixEpochStart: TDateTime = 25569.0; // 01/01/1970

function GlueTimeToDateTime(msecs: Int64): TDateTime;
function DateTimeToGlueTime(dt: TDateTime): Int64;

implementation

uses
  Winapi.Windows;

function GlueTimeToDateTime(msecs: Int64): TDateTime;
begin
  Result := TDateTime(((msecs / 1000) / 86400.0) + UnixEpochStart);
end;

function DateTimeToGlueTime(dt: TDateTime): Int64;
begin
  Result := Round((dt * 86400.0 * 1000) - UnixEpochStart);
end;

function CreateTuple(GlueValues: TArray<GlueValue>): PSafeArray;
var
  pri: IRecordInfo;
  hr: HResult;
  bounds: array [0 .. 1] of SAFEARRAYBOUND;
  sa: PSafeArray;
  I: Integer;
  vItem: tagVARIANT;
begin
  hr := GetRecordInfoFromGuids(LIBID_GlueAgm, 1, 56, LOCALE_USER_DEFAULT,
    StringToGUID('{93da746a-fb5d-45c4-96fb-8d7f3ca43960}'), pri);

  if Succeeded(hr) then
  begin
    bounds[0].lLbound := 0;
    bounds[0].cElements := Length(GlueValues);

    sa := SafeArrayCreate(VT_VARIANT, 1, @bounds);

    for I := 0 to Length(GlueValues) - 1 do
    begin
      ZeroMemory(@vItem, sizeof(vItem));
      vItem.vt := VT_RECORD;
      vItem.pRecInfo := pri;
      vItem.pvRecord := @GlueValues[I];
      SafeArrayPutElement(sa, I, vItem);
    end;
    Exit(sa);
  end;

  Result := nil;
end;

function CreateComposite(GlueContextValues: TArray<GlueContextValue>)
  : PSafeArray;
var
  pri: IRecordInfo;
  hr: HResult;
  bounds: array [0 .. 1] of SAFEARRAYBOUND;
  sa: PSafeArray;
  I: Integer;
  vItem: tagVARIANT;
begin
  hr := GetRecordInfoFromGuids(LIBID_GlueAgm, 1, 56, LOCALE_USER_DEFAULT,
    StringToGUID('{c74dd3d8-08a3-4b68-a41e-af04acd319bd}'), pri);

  if Succeeded(hr) then
  begin
    bounds[0].lLbound := 0;
    bounds[0].cElements := Length(GlueContextValues);

    sa := SafeArrayCreate(VT_VARIANT, 1, @bounds);

    for I := 0 to Length(GlueContextValues) - 1 do
    begin
      ZeroMemory(@vItem, sizeof(vItem));
      vItem.vt := VT_RECORD;
      vItem.pRecInfo := pri;
      vItem.pvRecord := @GlueContextValues[I];
      SafeArrayPutElement(sa, I, vItem);
    end;
    Exit(sa);
  end;

  Result := nil;
end;

function CreateGlueInstanceArray(GlueInstances: TGlueInstanceArray): PSafeArray;
var
  pri: IRecordInfo;
  hr: HResult;
  bounds: array [0 .. 1] of SAFEARRAYBOUND;
  sa: PSafeArray;
  I: Integer;
begin
  hr := GetRecordInfoFromGuids(LIBID_GlueAgm, 1, 56, LOCALE_USER_DEFAULT,
    StringToGUID('{12E47256-B411-4024-BA5C-13DF4C78C31D}'), pri);

  if Succeeded(hr) then
  begin
    bounds[0].lLbound := 0;
    bounds[0].cElements := Length(GlueInstances);

    sa := SafeArrayCreateEx(VT_RECORD, 1, @bounds, pri);

    for I := 0 to Length(GlueInstances) - 1 do
    begin
      SafeArrayPutElement(sa, I, GlueInstances[I]);
    end;
    Exit(sa);
  end;

  Result := nil;
end;

function CreateContextValues(GlueContextValues: TArray<GlueContextValue>)
  : PSafeArray;
var
  pri: IRecordInfo;
  hr: HResult;
  bounds: array [0 .. 1] of SAFEARRAYBOUND;
  sa: PSafeArray;
  I: Integer;
begin
  hr := GetRecordInfoFromGuids(LIBID_GlueAgm, 1, 56, LOCALE_USER_DEFAULT,
    StringToGUID('{c74dd3d8-08a3-4b68-a41e-af04acd319bd}'), pri);

  if Succeeded(hr) then
  begin
    bounds[0].lLbound := 0;
    bounds[0].cElements := Length(GlueContextValues);

    sa := SafeArrayCreateEx(VT_RECORD, 1, @bounds, pri);

    for I := 0 to Length(GlueContextValues) - 1 do
    begin
      SafeArrayPutElement(sa, I, GlueContextValues[I]);
    end;
    Exit(sa);
  end;

  Result := nil;
end;

procedure TraverseGlueValue(name: string; gv: GlueValue; lines: TStrings;
  level: Integer);
var
  I: Integer;
  GlueValues: TArray<GlueValue>;
  offset: string;
begin
  offset := StringOfChar(chr(9), level);

  if (gv.IsArray) then
  begin
    case gv.GlueType of
      AgmValueType_String:
        begin
          lines.Add(string.Join(',', TSafeArrayExpander<WideString,
            string>.AsArray(gv.StringArray,
            function(ws: WideString): string
            begin
              Result := ws;
            end)));
        end;
      AgmValueType_Bool:
        begin
          lines.Add(string.Join(',', TSafeArrayExpander<WordBool,
            string>.AsArray(gv.BoolArray,
            function(b: WordBool): string
            begin
              Result := BoolToStr(b);
            end)));
        end;
      AgmValueType_Int:
        lines.Add(string.Join(',', TSafeArrayExpander<Int64, string>.AsArray
          (gv.LongArray,
          function(b: Int64): string
          begin
            Result := IntToStr(b);
          end)));
      AgmValueType_Long:
        lines.Add(string.Join(',', TSafeArrayExpander<Int64, string>.AsArray
          (gv.LongArray,
          function(b: Int64): string
          begin
            Result := IntToStr(b);
          end)));
      AgmValueType_Double:
        lines.Add(string.Join(',', TSafeArrayExpander<Double, string>.AsArray
          (gv.DoubleArray,
          function(b: Double): string
          begin
            Result := FloatToStr(b);
          end)));
      AgmValueType_DateTime:
        ;
      AgmValueType_Tuple:
        begin
          lines.Add(offset + '(Tuple) ' + name + ' = ');
          GlueValues := TSafeArrayExpander<GlueValue>.AsPackedArray(gv.Tuple);
          for I := 0 to Length(GlueValues) - 1 do
          begin
            TraverseGlueValue('Tuple', GlueValues[I], lines, level + 1);
          end;
        end;
      AgmValueType_Composite:
        begin
          lines.Add(offset + 'Composite[] ' + name + ' = ');
          TraverseGlueContextValuesSafeArray(gv.CompositeValue, lines,
            level + 1);
        end;
    end;
  end
  else
  begin
    case gv.GlueType of
      AgmValueType_Bool:
        lines.Add(offset + '(Bool) ' + name + ' = ' + BoolToStr(gv.BoolValue));
      AgmValueType_String:
        lines.Add(offset + '(String) ' + name + ' = ' + gv.StringValue);
      AgmValueType_Int:
        lines.Add(offset + '(Int) ' + name + ' = ' + IntToStr(gv.LongValue));
      AgmValueType_Long:
        lines.Add(offset + '(Long) ' + name + ' = ' + IntToStr(gv.LongValue));
      AgmValueType_Double:
        lines.Add(offset + '(Double) ' + name + ' = ' +
          FloatToStr(gv.DoubleValue));
      AgmValueType_Composite:
        begin
          lines.Add(offset + 'Composite ' + name + ' = ');
          TraverseGlueContextValuesSafeArray(gv.CompositeValue, lines,
            level + 1);
        end;
    end;
  end;
end;

procedure TraverseGlueContextValuesSafeArray(sa: PSafeArray; lines: TStrings;
level: Integer = 0);
var
  pGCVs: PGlueContextValue;
  pv: PVOID;
  I, iLow, iHigh: Integer;
  pVar: PVariant;
  vt: TVarType;
  gcv: GlueContextValue;
  offset: String;
  gv: GlueValue;
begin
  offset := StringOfChar(chr(9), level);
  SafeArrayAccessData(sa, pv);
  pGCVs := pv;
  pVar := pv;

  SafeArrayGetLBound(sa, 1, iLow);
  SafeArrayGetUBound(sa, 1, iHigh);

  for I := iLow to iHigh do
  begin
    vt := varType(pVar^);

    if vt = VT_RECORD then
    begin
      gcv := PGlueContextValue(TVarData(pVar^).VRecord.PRecord)^;
    end
    else
    begin
      gcv := pGCVs^;
    end;

    gv := gcv.Value;

    TraverseGlueValue(gcv.name, gv, lines, level);

    Inc(pGCVs);
    Inc(pVar);
  end;
  SafeArrayUnaccessData(sa);
end;

constructor TGlueResultHandler.Create(handlerLambda
  : TProc<TGlueInvocationResultArray>);
begin
  FHandlerLambda := handlerLambda;
end;

function TGlueResultHandler.HandleResult(invocationResult: PSafeArray)
  : HResult; stdcall;
var
  results: PGlueInvocationResult;
  pv: PVOID;
  I, iLow, iHigh: Integer;
  glueResults: TGlueInvocationResultArray;
begin
  SafeArrayAccessData(invocationResult, pv);
  results := pv;

  SafeArrayGetLBound(invocationResult, 1, iLow);
  SafeArrayGetUBound(invocationResult, 1, iHigh);

  SetLength(glueResults, iHigh - iLow + 1);

  for I := iLow to iHigh do
  begin
    glueResults[I] := results^;
    Inc(results);
  end;

  SafeArrayUnaccessData(invocationResult);

  FHandlerLambda(glueResults);
  Result := S_OK;
end;

{ TGlueStreamHandler }

constructor TGlueStreamHandler.Create(dataLambda
  : TProc<GlueMethod, TArray<GlueContextValue>, PSafeArray>);
begin
  FDataLambda := dataLambda;
end;

function TGlueStreamHandler.HandleStreamData(stream: GlueMethod;
data: PSafeArray): HResult;
begin
  FDataLambda(stream, TSafeArrayExpander<GlueContextValue>.AsArray(data), data);
  Result := S_OK;
end;

function TGlueStreamHandler.HandleStreamStatus(stream: GlueMethod;
State: GlueStreamState; const Message: WideString; dateTime: Int64): HResult;
begin
  Result := S_OK;
end;

function TGlueStreamHandler.StreamClosed(stream: GlueMethod): HResult;
begin
  Result := S_OK;
end;

function TGlueStreamHandler.StreamOpened(stream: GlueMethod;
const glueStreamSubscription: IGlueStreamSubscription): HResult;
begin
  Result := S_OK;
end;

{ TSafeArrayExpander<T> }

class function TSafeArrayExpander<T, TA>.AsArray(sa: PSafeArray;
converter: TFunc<T, TA>): TArray<TA>;
var
  pws: PT;
  pv: PVOID;
  I, iLow, iHigh: Integer;
begin
  Result := TArray<TA>.Create();

  SafeArrayAccessData(sa, pv);
  pws := pv;
  SafeArrayGetLBound(sa, 1, iLow);
  SafeArrayGetUBound(sa, 1, iHigh);

  SetLength(Result, iHigh - iLow + 1);
  for I := 0 to iHigh - iLow do
  begin
    Result[I] := converter(pws^);
    Inc(pws);
  end;

  SafeArrayUnaccessData(sa);
end;

class function TSafeArrayExpander<T>.AsPackedArray(sa: PSafeArray): TArray<T>;
var
  pv: PVOID;
  pVar: PVariant;
  I, iLow, iHigh: Integer;
begin
  SafeArrayAccessData(sa, pv);
  pVar := pv;

  SafeArrayGetLBound(sa, 1, iLow);
  SafeArrayGetUBound(sa, 1, iHigh);

  SetLength(Result, iHigh - iLow + 1);

  for I := iLow to iHigh do
  begin
    Result[I] := PT(TVarData(pVar^).VRecord.PRecord)^;
    Inc(pVar);
  end;
  SafeArrayUnaccessData(sa);
end;

{ TSafeArrayExpander<T> }

class function TSafeArrayExpander<T>.AsArray(sa: PSafeArray): TArray<T>;
begin
  Result := TSafeArrayExpander<T, T>.AsArray(sa,
    function(I: T): T
    begin
      Result := I;
    end)
end;

{ TGlueContextHandler }

constructor TGlueContextHandler.Create(removedLambda
  : TProc<IGlueContext, TArray<string>>;
addedLambda, updatedLambda: TProc < IGlueContext,
  TArray < GlueContextValue >> );
begin
  fAddedLambda := addedLambda;
  fRemovedLambda := removedLambda;
  fUpdatedLambda := updatedLambda;
end;

function TGlueContextHandler.HandleContext(const context: IGlueContext)
  : HResult;
begin
  if Assigned(fUpdatedLambda) then
  begin
    fUpdatedLambda(context, TSafeArrayExpander<GlueContextValue>.AsArray
      (context.GetData));
  end;

  Result := S_OK;
end;

function TGlueContextHandler.HandleContextUpdate(const contextUpdate
  : IGlueContextUpdate): HResult;
begin
  if Assigned(fRemovedLambda) then
  begin
    fRemovedLambda(contextUpdate.GetContext,
      TSafeArrayExpander<WideString, string>.AsArray(contextUpdate.GetRemoved,
      function(ws: WideString): string
      begin
        Result := ws;
      end));
  end;

  if Assigned(fAddedLambda) then
  begin
    fAddedLambda(contextUpdate.GetContext,
      TSafeArrayExpander<GlueContextValue>.AsArray(contextUpdate.GetAdded));
  end;

  if Assigned(fUpdatedLambda) then
  begin
    fUpdatedLambda(contextUpdate.GetContext,
      TSafeArrayExpander<GlueContextValue>.AsArray(contextUpdate.GetUpdated));
  end;

  Result := S_OK;
end;

{ TGlueRequestHandler }

constructor TGlueRequestHandler.Create(handlerLambda
  : TProc<GlueMethod, GlueInstance, TArray<GlueContextValue>,
  IGlueServerMethodResultCallback>);
begin
  FHandlerLambda := handlerLambda;
end;

function TGlueRequestHandler.HandleInvocationRequest(Method: GlueMethod;
caller: GlueInstance; requestValues: PSafeArray;
const resultCallback: IGlueServerMethodResultCallback): HResult;
begin
  FHandlerLambda(Method, caller, TSafeArrayExpander<GlueContextValue>.AsArray
    (requestValues), resultCallback);

  Result := S_OK;
end;

end.