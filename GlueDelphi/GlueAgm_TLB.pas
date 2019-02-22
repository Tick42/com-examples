unit GlueAgm_TLB;

// ************************************************************************ //
// WARNING                                                                    
// -------                                                                    
// The types declared in this file were generated from data read from a       
// Type Library. If this type library is explicitly or indirectly (via        
// another type library referring to this type library) re-imported, or the   
// 'Refresh' command of the Type Library Editor activated while editing the   
// Type Library, the contents of this file will be regenerated and all        
// manual modifications will be lost.                                         
// ************************************************************************ //

// $Rev: 52393 $
// File generated on 2019-02-21 5:50:17 PM from Type Library described below.

// ************************************************************************  //
// Type Lib: C:\Users\Xaoc\AppData\Local\Tick42\GlueSDK\GlueCOM\GlueAgm.dll (1)
// LIBID: {87131215-BF8F-4C80-8B37-8A94EF9F0771}
// LCID: 0
// Helpfile: 
// HelpString: Tick42 Glue for COM (VBA)
// DepndLst: 
//   (1) v2.0 stdole, (C:\Windows\SysWOW64\stdole2.tlb)
//   (2) v2.4 mscorlib, (C:\Windows\Microsoft.NET\Framework\v4.0.30319\mscorlib.tlb)
// SYS_KIND: SYS_WIN32
// Errors:
//   Hint: Parameter 'type' of IAgm.CreateContextValue changed to 'type_'
//   Hint: Symbol 'type' renamed to 'type_'
// ************************************************************************ //
{$TYPEDADDRESS OFF} // Unit must be compiled without type-checked pointers. 
{$WARN SYMBOL_PLATFORM OFF}
{$WRITEABLECONST ON}
{$VARPROPSETTER ON}
{$ALIGN 4}

interface

uses Winapi.Windows, mscorlib_TLB, System.Classes, System.Variants, System.Win.StdVCL, Vcl.Graphics, Vcl.OleServer, Winapi.ActiveX;
  


// *********************************************************************//
// GUIDS declared in the TypeLibrary. Following prefixes are used:        
//   Type Libraries     : LIBID_xxxx                                      
//   CoClasses          : CLASS_xxxx                                      
//   DISPInterfaces     : DIID_xxxx                                       
//   Non-DISP interfaces: IID_xxxx                                        
// *********************************************************************//
const
  // TypeLibrary Major and minor versions
  GlueAgmMajorVersion = 1;
  GlueAgmMinorVersion = 56;

  LIBID_GlueAgm: TGUID = '{87131215-BF8F-4C80-8B37-8A94EF9F0771}';

  DIID_IAgmEventStreamSubscriberCollection: TGUID = '{45985A17-F7D2-1D07-7558-15A9D2F39900}';
  DIID_IAgmEventStreamSubscriber: TGUID = '{45801A31-F7D2-4A09-8451-30A4D8F29991}';
  DIID_IAgmNameValuePair: TGUID = '{566CD647-A692-12CA-76A1-D57D2743746D}';
  DIID_IAgmReadOnlyCollection: TGUID = '{52D98747-A132-24C4-3B41-D54D247C6439}';
  DIID_IAgmServerEventStream: TGUID = '{45915A17-F2D1-410D-7453-35A4D3F29923}';
  DIID_IAgmServerStreamMethod: TGUID = '{04A53141-54D2-CD09-B4B8-1943D8325AD1}';
  DIID_IAgmServerStreamMethodEvents: TGUID = '{536CD047-A631-91C9-3DA8-D13D48A76463}';
  DIID_IAgmStickyWindowsHandlesCollection: TGUID = '{45545C57-83D2-D509-A458-34A4D2F47924}';
  DIID_IAgmStickyWindowsCollection: TGUID = '{45505C37-82D2-DD09-1458-38A4D2F27920}';
  DIID_IAgmStickyWindow: TGUID = '{5E3FF027-38B1-4BE5-A008-DBCC6E4032EF}';
  DIID_IAgmStickyWindowsApplication: TGUID = '{0231B36F-6864-4C7D-BB4D-F26FB7E3C59F}';
  DIID_IAgmStickyWindowsControllerEvents: TGUID = '{C4BA7996-C469-4585-8C39-BD0D7E238173}';
  DIID_IAgmStreamStatus: TGUID = '{42442B7D-4236-74C1-484D-A5DD2D53643D}';
  DIID_IAgmStreamSubscription: TGUID = '{4949AB71-4696-849A-419D-A49D2D43692D}';
  DIID_IAgmStreamSubscriptionEvents: TGUID = '{533CDA57-A652-A5C9-3654-D15D5443595D}';
  DIID_IAgmWindowBounds: TGUID = '{91539C1A-3AF8-425B-8D9A-D5583370D346}';
  DIID_IAgm: TGUID = '{64905467-F2D2-4909-7468-3533D2F298D6}';
  DIID_IAgmClientMethod: TGUID = '{64624647-5B22-4969-A4B6-3536D2F5344A}';
  DIID_IAgmClientMethodCollection: TGUID = '{50906147-FA32-4909-A4B8-3533D2F2F4D0}';
  DIID_IAgmClientMethodEvents: TGUID = '{533CDA87-A612-A2C9-3694-D55D2443691D}';
  DIID_IAgmConfiguration: TGUID = '{14904147-F24A-4909-A4B8-35C42F264B02}';
  DIID_IAgmDisplayContext: TGUID = '{0530D847-92D2-4C13-AC44-A53874966829}';
  DIID_IAgmError: TGUID = '{6720D197-AD32-4D1A-A488-7533D2969A29}';
  DIID_IAgmEvents: TGUID = '{736CDA27-A6D2-8269-C6A4-B68D2443666D}';
  DIID_IAgmInstance: TGUID = '{0540D247-A232-A219-AC44-753324966429}';
  DIID_IAgmServerInstanceCollection: TGUID = '{50903147-FA32-49A9-A45C-3583D272FAD0}';
  DIID_IAgmMethodParameter: TGUID = '{34905147-F2A2-4909-7443-35336DF298C0}';
  DIID_IAgmMethodParameterCollection: TGUID = '{45905A37-F2D2-4D09-7458-35A4D2F29920}';
  DIID_IAgmMethodRequest: TGUID = '{55D06C47-A832-83C9-3CA4-D53D349C6497}';
  DIID_IAgmArgsCollection: TGUID = '{536CDA47-A632-82C9-36A4-D53D2443646D}';
  DIID_IAgmMethodSignature: TGUID = '{44905149-12D2-C90B-14B4-3433D2F278D8}';
  DIID_IAgmServerInstance: TGUID = '{5520DA47-A962-8DC9-3C4A-6A3D249C34C7}';
  IID_IAgmServerMethodRequestHandler: TGUID = '{896F2C00-EEB2-4D3B-9065-0F54639FD53E}';
  IID_IAgmServerMethodResultHandler: TGUID = '{6BAEC0DB-2F6E-4678-893C-39291BF73835}';
  DIID_IAgmServerMethod: TGUID = '{04A53147-52D2-AD09-A4B8-3943DA3254D0}';
  DIID_IAgmServerMethodEvents: TGUID = '{536CD047-A631-92C9-3DA4-D53D28A36468}';
  DIID_IAgmMethodResult: TGUID = '{55D4DA47-A842-82C9-3C44-D45D249C69C7}';
  DIID_IAgmMethodResultCollection: TGUID = '{52D05447-A832-23C9-3A44-D53D249C6465}';
  DIID_IAgmContextValue: TGUID = '{566CD944-A593-14CA-46A4-D17D2143716D}';
  DIID_IAgmStickyWindowsController: TGUID = '{1121DFC4-D256-4B6B-B6E5-7180D88E9D70}';
  CLASS_AgmEventStreamSubscriber: TGUID = '{45801A31-F7D2-4A09-8451-30A4D8F29986}';
  CLASS_AgmNameValuePair: TGUID = '{777CAD49-3836-D1C3-47A8-46DA2D4B641D}';
  CLASS_AgmServerEventStream: TGUID = '{45915A17-F2D1-410D-7453-35A4D3F29948}';
  CLASS_AgmServerStreamMethod: TGUID = '{526C2A49-2635-8923-32A4-71DD7844689D}';
  CLASS_Agm: TGUID = '{676C8A49-A935-12C3-39A4-A6DD2643616D}';
  CLASS_AgmArgsCollection: TGUID = '{574CAB49-3636-89C3-41A8-A6DD2D43647D}';
  CLASS_AgmClientMethod: TGUID = '{566C7A61-A665-87C3-39A1-69D9244B649D}';
  CLASS_AgmClientMethodCollection: TGUID = '{578CA449-B635-86C1-39A4-86DD2343696D}';
  CLASS_AgmConfiguration: TGUID = '{966C5A49-B635-B2C3-36A4-D7DD2473649D}';
  CLASS_AgmDisplayContext: TGUID = '{9768AA4C-A835-12C7-38A4-16DD0443846D}';
  CLASS_AgmError: TGUID = '{176C0A89-B635-C0C3-38A4-16D02443546D}';
  CLASS_AgmInstance: TGUID = '{57CCA449-A435-84C3-41A4-D6DD4444644D}';
  CLASS_AgmMethodParameter: TGUID = '{516C4A4A-A435-12C3-B1A4-A6DA2423616D}';
  CLASS_AgmMethodParameterCollection: TGUID = '{126CA149-A235-12C2-35A4-16D42423641D}';
  CLASS_AgmMethodRequest: TGUID = '{39668A43-A435-69C9-33A4-66DD0443946D}';
  CLASS_AgmMethodSignature: TGUID = '{B76BAA4B-A6B5-82B3-3BA4-DBDD2B4364BD}';
  CLASS_AgmServerInstanceCollection: TGUID = '{571CAB4B-B635-82B3-31B4-DB6D24B3686D}';
  CLASS_AgmServerInstance: TGUID = '{536CA149-1635-81C3-38A4-16DD1443616B}';
  CLASS_AgmServerMethod: TGUID = '{526C2A49-2635-8223-34A4-76DD7443647D}';
  CLASS_AgmMethodResult: TGUID = '{593CA749-A735-87C7-3564-D7DD2746647A}';
  CLASS_AgmMethodResultCollection: TGUID = '{589CA249-8635-89C3-91A4-D69D2943649D}';
  CLASS_AgmStreamStatus: TGUID = '{4744AB79-4636-84C3-414D-A4DD2D73644D}';
  CLASS_AgmStreamSubscription: TGUID = '{1941AB41-4196-149A-119D-A19D2B436C2D}';
  CLASS_AgmWindowBounds: TGUID = '{42C9A175-7B18-4B3A-A4F4-A034964C853C}';
  IID__GlueAgmException: TGUID = '{6273310E-1CFA-3E0C-9BE2-6716D01EF289}';
  CLASS_AgmContextValue: TGUID = '{771CDD49-3436-D153-A7A8-76D82DAB681D}';
  CLASS_ReflectBase: TGUID = '{596CA749-8635-A1C3-98A4-D6DD1448616B}';
  IID__Glue42: TGUID = '{AA2EDA42-C803-3626-A1E1-AA8ECE118938}';
  IID_IGlueContext: TGUID = '{E36214AA-00E9-4057-8DB3-B381C8839735}';
  IID_IGlueContextBuilder: TGUID = '{E6BF93F6-3277-4BFD-8F30-4B76E72745E2}';
  IID_IGlueContextHandler: TGUID = '{E7DF128A-1584-49F9-87FE-06FA062DA1FB}';
  IID_IGlueContextUpdate: TGUID = '{FCA1B294-A416-4533-AFAF-3640FDE02B1A}';
  IID_IGlueEvents: TGUID = '{A9B9392C-14B9-42BC-8BCD-7B07EF36003C}';
  IID_IGlueContextBuilderCallback: TGUID = '{0856C290-92E8-49A3-ADD9-741E551BD70F}';
  IID_IGlueWindow: TGUID = '{2F432B71-D338-419B-B150-E5E111F3D9A3}';
  IID_IGlue42: TGUID = '{DB20C8DA-CD98-4D75-8B9A-18284B7EE0D1}';
  IID_IGlueServerSubscriptionCallback: TGUID = '{1CE0C9B4-C1D2-4F0D-A5A5-57EA027424BE}';
  IID_IGlueStream: TGUID = '{311F7E47-8BFD-4174-B493-8FA9F9192464}';
  IID_IGlueStreamBranch: TGUID = '{C770A188-815A-4D61-89BA-5F283F698A07}';
  IID_IGlueStreamHandler: TGUID = '{A384126A-06D1-41CE-942C-4376D4574F4B}';
  IID_IGlueStreamSubscriber: TGUID = '{71587A98-0C44-4973-8EC6-74D71BA62F90}';
  IID_IGlueStreamSubscription: TGUID = '{E1ADF3C1-D11C-4E96-B9E9-D0B52B02DBCD}';
  IID_IGlueSubscriptionHandler: TGUID = '{DAA04777-BD8E-4180-9021-48A0807A2E1D}';
  IID_IGlueRequestHandler: TGUID = '{81671796-A690-476B-85EA-94326B7CA2B5}';
  IID_IGlueServerMethodResultCallback: TGUID = '{2497D4E6-C398-4DBB-904D-83B55F701E46}';
  IID_IGlueInvocationResultHandler: TGUID = '{3549297E-57A9-4F65-9183-D95232E55469}';
  IID_IGlueWindowEventHandler: TGUID = '{FBCB4411-153C-4AAC-8DC8-DB696C931FEB}';
  CLASS_GlueAgmException: TGUID = '{504E1717-4E71-3C9C-8DFF-769900037CCE}';
  CLASS_Glue42: TGUID = '{556D7D1B-7E89-454A-8575-85B1ABE35941}';

// *********************************************************************//
// Declaration of Enumerations defined in Type Library                    
// *********************************************************************//
// Constants for enum StickyWindowState
type
  StickyWindowState = TOleEnum;
const
  StickyWindowState_Normal = $00000000;
  StickyWindowState_Minimized = $00000001;
  StickyWindowState_Maximized = $00000002;

// Constants for enum AgmMethodFlags
type
  AgmMethodFlags = TOleEnum;
const
  AgmMethodFlags_None = $00000000;
  AgmMethodFlags_ReturnsResult = $00000001;
  AgmMethodFlags_IsGuiOperation = $00000002;
  AgmMethodFlags_IsUserSpecific = $00000004;
  AgmMethodFlags_IsMachineSpecific = $00000008;
  AgmMethodFlags_OutsideDomain = $00000010;
  AgmMethodFlags_SupportsStreaming = $00000020;

// Constants for enum AgmMethodInvocationStatus
type
  AgmMethodInvocationStatus = TOleEnum;
const
  AgmMethodInvocationStatus_Succeeded = $00000000;
  AgmMethodInvocationStatus_Failed = $00000001;
  AgmMethodInvocationStatus_TimedOut = $00000002;
  AgmMethodInvocationStatus_NotAvailable = $00000003;
  AgmMethodInvocationStatus_Started = $00000004;

// Constants for enum AgmInstanceState
type
  AgmInstanceState = TOleEnum;
const
  AgmInstanceState_Pending = $00000000;
  AgmInstanceState_Live = $00000001;
  AgmInstanceState_Stale = $00000002;
  AgmInstanceState_Inactive = $00000003;

// Constants for enum AgmState
type
  AgmState = TOleEnum;
const
  AgmState_Pending = $00000000;
  AgmState_Stale = $00000001;
  AgmState_Opened = $00000002;
  AgmState_Closed = $00000003;
  AgmState_SubscriptionRejected = $00000004;
  AgmState_SubscriptionFailed = $00000005;

// Constants for enum AgmValueType
type
  AgmValueType = TOleEnum;
const
  AgmValueType_Bool = $00000000;
  AgmValueType_Int = $00000001;
  AgmValueType_Double = $00000002;
  AgmValueType_Long = $00000003;
  AgmValueType_String = $00000004;
  AgmValueType_DateTime = $00000005;
  AgmValueType_Tuple = $00000006;
  AgmValueType_Composite = $00000007;

// Constants for enum AgmInstanceIdentity
type
  AgmInstanceIdentity = TOleEnum;
const
  AgmInstanceIdentity_None = $00000000;
  AgmInstanceIdentity_MachineName = $00000001;
  AgmInstanceIdentity_ApplicationName = $00000002;
  AgmInstanceIdentity_UserName = $00000004;
  AgmInstanceIdentity_Environment = $00000008;
  AgmInstanceIdentity_Region = $00000010;
  AgmInstanceIdentity_ServiceName = $00000020;
  AgmInstanceIdentity_Instance = $00000007;
  AgmInstanceIdentity_LocalizedInstance = $0000001F;
  AgmInstanceIdentity_Full = $0000003F;
  AgmInstanceIdentity_Pid = $00000040;
  AgmInstanceIdentity_InstanceId = $00000080;

// Constants for enum TextMatch
type
  TextMatch = TOleEnum;
const
  TextMatch_Contains = $00000000;
  TextMatch_Exact = $00000001;
  TextMatch_BeginWith = $00000002;
  TextMatch_EndWith = $00000003;
  TextMatch_Regex = $00000004;

// Constants for enum GlueState
type
  GlueState = TOleEnum;
const
  GlueState_Unknown = $00000000;
  GlueState_Pending = $00000001;
  GlueState_Connected = $00000002;
  GlueState_Disconnected = $00000003;
  GlueState_Inactive = $00000004;

// Constants for enum GlueStreamState
type
  GlueStreamState = TOleEnum;
const
  GlueStreamState_Pending = $00000000;
  GlueStreamState_Stale = $00000001;
  GlueStreamState_Opened = $00000002;
  GlueStreamState_Closed = $00000003;
  GlueStreamState_SubscriptionRejected = $00000004;
  GlueStreamState_SubscriptionFailed = $00000005;

type

// *********************************************************************//
// Forward declaration of types defined in TypeLibrary                    
// *********************************************************************//
  IAgmEventStreamSubscriberCollection = dispinterface;
  IAgmEventStreamSubscriber = dispinterface;
  IAgmNameValuePair = dispinterface;
  IAgmReadOnlyCollection = dispinterface;
  IAgmServerEventStream = dispinterface;
  IAgmServerStreamMethod = dispinterface;
  IAgmServerStreamMethodEvents = dispinterface;
  IAgmStickyWindowsHandlesCollection = dispinterface;
  IAgmStickyWindowsCollection = dispinterface;
  IAgmStickyWindow = dispinterface;
  IAgmStickyWindowsApplication = dispinterface;
  IAgmStickyWindowsControllerEvents = dispinterface;
  IAgmStreamStatus = dispinterface;
  IAgmStreamSubscription = dispinterface;
  IAgmStreamSubscriptionEvents = dispinterface;
  IAgmWindowBounds = dispinterface;
  IAgm = dispinterface;
  IAgmClientMethod = dispinterface;
  IAgmClientMethodCollection = dispinterface;
  IAgmClientMethodEvents = dispinterface;
  IAgmConfiguration = dispinterface;
  IAgmDisplayContext = dispinterface;
  IAgmError = dispinterface;
  IAgmEvents = dispinterface;
  IAgmInstance = dispinterface;
  IAgmServerInstanceCollection = dispinterface;
  IAgmMethodParameter = dispinterface;
  IAgmMethodParameterCollection = dispinterface;
  IAgmMethodRequest = dispinterface;
  IAgmArgsCollection = dispinterface;
  IAgmMethodSignature = dispinterface;
  IAgmServerInstance = dispinterface;
  IAgmServerMethodRequestHandler = interface;
  IAgmServerMethodResultHandler = interface;
  IAgmServerMethod = dispinterface;
  IAgmServerMethodEvents = dispinterface;
  IAgmMethodResult = dispinterface;
  IAgmMethodResultCollection = dispinterface;
  IAgmContextValue = dispinterface;
  IAgmStickyWindowsController = dispinterface;
  _GlueAgmException = interface;
  _GlueAgmExceptionDisp = dispinterface;
  _Glue42 = interface;
  _Glue42Disp = dispinterface;
  IGlueContext = interface;
  IGlueContextDisp = dispinterface;
  IGlueContextBuilder = interface;
  IGlueContextBuilderDisp = dispinterface;
  IGlueContextHandler = interface;
  IGlueContextUpdate = interface;
  IGlueContextUpdateDisp = dispinterface;
  IGlueEvents = interface;
  IGlueContextBuilderCallback = interface;
  IGlueWindow = interface;
  IGlueWindowDisp = dispinterface;
  IGlue42 = interface;
  IGlue42Disp = dispinterface;
  IGlueServerSubscriptionCallback = interface;
  IGlueServerSubscriptionCallbackDisp = dispinterface;
  IGlueStream = interface;
  IGlueStreamDisp = dispinterface;
  IGlueStreamBranch = interface;
  IGlueStreamBranchDisp = dispinterface;
  IGlueStreamHandler = interface;
  IGlueStreamSubscriber = interface;
  IGlueStreamSubscriberDisp = dispinterface;
  IGlueStreamSubscription = interface;
  IGlueStreamSubscriptionDisp = dispinterface;
  IGlueSubscriptionHandler = interface;
  IGlueRequestHandler = interface;
  IGlueServerMethodResultCallback = interface;
  IGlueServerMethodResultCallbackDisp = dispinterface;
  IGlueInvocationResultHandler = interface;
  IGlueWindowEventHandler = interface;

// *********************************************************************//
// Declaration of CoClasses defined in Type Library                       
// (NOTE: Here we map each CoClass to its Default Interface)              
// *********************************************************************//
  AgmEventStreamSubscriber = IAgmEventStreamSubscriber;
  AgmNameValuePair = IAgmNameValuePair;
  AgmServerEventStream = IAgmServerEventStream;
  AgmServerStreamMethod = IAgmServerStreamMethod;
  Agm = IAgm;
  AgmArgsCollection = IAgmArgsCollection;
  AgmClientMethod = IAgmClientMethod;
  AgmClientMethodCollection = IAgmClientMethodCollection;
  AgmConfiguration = IAgmConfiguration;
  AgmDisplayContext = IAgmDisplayContext;
  AgmError = IAgmError;
  AgmInstance = IAgmInstance;
  AgmMethodParameter = IAgmMethodParameter;
  AgmMethodParameterCollection = IAgmMethodParameterCollection;
  AgmMethodRequest = IAgmMethodRequest;
  AgmMethodSignature = IAgmMethodSignature;
  AgmServerInstanceCollection = IAgmServerInstanceCollection;
  AgmServerInstance = IAgmServerInstance;
  AgmServerMethod = IAgmServerMethod;
  AgmMethodResult = IAgmMethodResult;
  AgmMethodResultCollection = IAgmMethodResultCollection;
  AgmStreamStatus = IAgmStreamStatus;
  AgmStreamSubscription = IAgmStreamSubscription;
  AgmWindowBounds = IAgmWindowBounds;
  AgmContextValue = IAgmContextValue;
  ReflectBase = IReflect;
  GlueAgmException = _GlueAgmException;
  Glue42 = _Glue42;


// *********************************************************************//
// Declaration of structures, unions and aliases.                         
// *********************************************************************//
{$ALIGN 8}
  GlueInstance = record
    InstanceId: WideString;
    Version: WideString;
    MachineName: WideString;
    ProcessId: Integer;
    ProcessStartTime: Int64;
    UserName: WideString;
    ApplicationName: WideString;
    Environment: WideString;
    Region: WideString;
    ServiceName: WideString;
    MetricsRepositoryId: WideString;
    Metadata: PSafeArray;
  end;

{$ALIGN 4}
  GlueContext = record
    Name: WideString;
    Id: WideString;
  end;

{$ALIGN 8}
  GlueValue = record
    GlueType: AgmValueType;
    isArray: WordBool;
    BoolValue: WordBool;
    LongValue: Int64;
    DoubleValue: Double;
    StringValue: WideString;
    BoolArray: PSafeArray;
    LongArray: PSafeArray;
    DoubleArray: PSafeArray;
    StringArray: PSafeArray;
    Tuple: PSafeArray;
    CompositeValue: PSafeArray;
  end;

  GlueMethod = record
    Name: WideString;
    Input: WideString;
    Output: WideString;
    Instance: GlueInstance;
    RegistrationCookie: WideString;
    Flags: AgmMethodFlags;
    ObjectTypes: PSafeArray;
  end;

{$ALIGN 4}
  GlueResult = record
    Values: PSafeArray;
    Status: AgmMethodInvocationStatus;
    Message: WideString;
    LogDetails: WideString;
  end;

{$ALIGN 8}
  GlueInvocationResult = record
    Method: GlueMethod;
    Result: GlueResult;
  end;

  GlueContextValue = record
    Name: WideString;
    Value: GlueValue;
  end;


// *********************************************************************//
// DispIntf:  IAgmEventStreamSubscriberCollection
// Flags:     (4096) Dispatchable
// GUID:      {45985A17-F7D2-1D07-7558-15A9D2F39900}
// *********************************************************************//
  IAgmEventStreamSubscriberCollection = dispinterface
    ['{45985A17-F7D2-1D07-7558-15A9D2F39900}']
    function GetEnumerator: IEnumVARIANT; dispid -4;
    property _Default[index: Integer]: IAgmEventStreamSubscriber readonly dispid 0; default;
    property Count: Integer readonly dispid 1610743810;
  end;

// *********************************************************************//
// DispIntf:  IAgmEventStreamSubscriber
// Flags:     (4096) Dispatchable
// GUID:      {45801A31-F7D2-4A09-8451-30A4D8F29991}
// *********************************************************************//
  IAgmEventStreamSubscriber = dispinterface
    ['{45801A31-F7D2-4A09-8451-30A4D8F29991}']
    property Subscription: IAgmMethodRequest readonly dispid 1610743808;
    property EventStream: IAgmServerEventStream readonly dispid 1610743809;
    property BranchKey: OleVariant readonly dispid 1610743810;
    procedure Unregister; dispid 1610743811;
    function Push(const eventData: IAgmContextValue): WordBool; dispid 1610743812;
  end;

// *********************************************************************//
// DispIntf:  IAgmNameValuePair
// Flags:     (4096) Dispatchable
// GUID:      {566CD647-A692-12CA-76A1-D57D2743746D}
// *********************************************************************//
  IAgmNameValuePair = dispinterface
    ['{566CD647-A692-12CA-76A1-D57D2743746D}']
    property Name: WideString readonly dispid 1610743808;
    property Value: OleVariant readonly dispid 0;
  end;

// *********************************************************************//
// DispIntf:  IAgmReadOnlyCollection
// Flags:     (4096) Dispatchable
// GUID:      {52D98747-A132-24C4-3B41-D54D247C6439}
// *********************************************************************//
  IAgmReadOnlyCollection = dispinterface
    ['{52D98747-A132-24C4-3B41-D54D247C6439}']
    function GetEnumerator: IEnumVARIANT; dispid -4;
    property _Default[key: Integer]: OleVariant readonly dispid 0; default;
    property Count: Integer readonly dispid 1610743810;
  end;

// *********************************************************************//
// DispIntf:  IAgmServerEventStream
// Flags:     (4096) Dispatchable
// GUID:      {45915A17-F2D1-410D-7453-35A4D3F29923}
// *********************************************************************//
  IAgmServerEventStream = dispinterface
    ['{45915A17-F2D1-410D-7453-35A4D3F29923}']
    property EventStreamCookie: OleVariant readonly dispid 1610743808;
    property Server: IAgmServerInstance readonly dispid 1610743809;
    property EventStreamingMethod: IAgmServerStreamMethod readonly dispid 1610743810;
    procedure Close; dispid 1610743811;
    procedure CloseBranch(BranchKey: OleVariant); dispid 1610743812;
    procedure Push(const eventData: IAgmContextValue; BranchKey: OleVariant); dispid 1610743813;
    procedure Broadcast(const eventData: IAgmContextValue); dispid 1610743814;
    function GetBranchKeys: {NOT_OLEAUTO(PSafeArray)}OleVariant; dispid 1610743815;
    function GetBranchSubscribers(BranchKey: OleVariant): IAgmEventStreamSubscriberCollection; dispid 1610743816;
    function GetAllSubscribers: IAgmEventStreamSubscriberCollection; dispid 1610743817;
  end;

// *********************************************************************//
// DispIntf:  IAgmServerStreamMethod
// Flags:     (4096) Dispatchable
// GUID:      {04A53141-54D2-CD09-B4B8-1943D8325AD1}
// *********************************************************************//
  IAgmServerStreamMethod = dispinterface
    ['{04A53141-54D2-CD09-B4B8-1943D8325AD1}']
    property EventStream: IAgmServerEventStream readonly dispid 1610743808;
  end;

// *********************************************************************//
// DispIntf:  IAgmServerStreamMethodEvents
// Flags:     (4096) Dispatchable
// GUID:      {536CD047-A631-91C9-3DA8-D13D48A76463}
// *********************************************************************//
  IAgmServerStreamMethodEvents = dispinterface
    ['{536CD047-A631-91C9-3DA8-D13D48A76463}']
    function SubscriptionRequest(const serverEventStream: IAgmServerEventStream; 
                                 const SubscriptionRequest: IAgmMethodRequest; 
                                 streamCookie: OleVariant): OleVariant; dispid 2;
    procedure Subscribed(const serverEventStream: IAgmServerEventStream; 
                         const subscriber: IAgmEventStreamSubscriber; BranchKey: OleVariant; 
                         streamCookie: OleVariant); dispid 3;
    procedure Unsubscribed(const serverEventStream: IAgmServerEventStream; 
                           const subscriber: IAgmEventStreamSubscriber; BranchKey: OleVariant; 
                           streamCookie: OleVariant); dispid 4;
  end;

// *********************************************************************//
// DispIntf:  IAgmStickyWindowsHandlesCollection
// Flags:     (4096) Dispatchable
// GUID:      {45545C57-83D2-D509-A458-34A4D2F47924}
// *********************************************************************//
  IAgmStickyWindowsHandlesCollection = dispinterface
    ['{45545C57-83D2-D509-A458-34A4D2F47924}']
    function GetEnumerator: IEnumVARIANT; dispid -4;
    property _Default[index: Integer]: OleVariant readonly dispid 0; default;
    property Count: Integer readonly dispid 1610743810;
  end;

// *********************************************************************//
// DispIntf:  IAgmStickyWindowsCollection
// Flags:     (4096) Dispatchable
// GUID:      {45505C37-82D2-DD09-1458-38A4D2F27920}
// *********************************************************************//
  IAgmStickyWindowsCollection = dispinterface
    ['{45505C37-82D2-DD09-1458-38A4D2F27920}']
    function GetEnumerator: IEnumVARIANT; dispid -4;
    property _Default[index: Integer]: IAgmStickyWindow readonly dispid 0; default;
    property Count: Integer readonly dispid 1610743810;
  end;

// *********************************************************************//
// DispIntf:  IAgmStickyWindow
// Flags:     (4096) Dispatchable
// GUID:      {5E3FF027-38B1-4BE5-A008-DBCC6E4032EF}
// *********************************************************************//
  IAgmStickyWindow = dispinterface
    ['{5E3FF027-38B1-4BE5-A008-DBCC6E4032EF}']
    property AgmId: WideString readonly dispid 1610743808;
    property Application: IAgmStickyWindowsApplication readonly dispid 1610743809;
    property Bounds: IAgmWindowBounds readonly dispid 1610743810;
    property Group: WideString readonly dispid 1610743811;
    property Handle: Integer readonly dispid 1610743813;
    property IsLocal: WordBool readonly dispid 1610743814;
    property IsSticky: WordBool dispid 1610743815;
    property IsValid: WordBool readonly dispid 1610743817;
    property WindowState: StickyWindowState readonly dispid 1610743818;
  end;

// *********************************************************************//
// DispIntf:  IAgmStickyWindowsApplication
// Flags:     (4096) Dispatchable
// GUID:      {0231B36F-6864-4C7D-BB4D-F26FB7E3C59F}
// *********************************************************************//
  IAgmStickyWindowsApplication = dispinterface
    ['{0231B36F-6864-4C7D-BB4D-F26FB7E3C59F}']
    property Environment: WideString dispid 1610743808;
    property Group: WideString dispid 1610743810;
    property IsRemote: WordBool readonly dispid 1610743812;
    property Machine: WideString readonly dispid 1610743813;
    property Name: WideString dispid 1610743814;
    property ProcessId: Integer readonly dispid 1610743816;
    property ProcessName: WideString readonly dispid 1610743817;
    property Region: WideString dispid 1610743819;
    property User: WideString readonly dispid 1610743821;
  end;

// *********************************************************************//
// DispIntf:  IAgmStickyWindowsControllerEvents
// Flags:     (4096) Dispatchable
// GUID:      {C4BA7996-C469-4585-8C39-BD0D7E238173}
// *********************************************************************//
  IAgmStickyWindowsControllerEvents = dispinterface
    ['{C4BA7996-C469-4585-8C39-BD0D7E238173}']
    procedure ApplicationAdded(const Application: IAgmStickyWindowsApplication); dispid 1;
    procedure ApplicationRemoved(const Application: IAgmStickyWindowsApplication); dispid 2;
    procedure WindowAdded(const Application: IAgmStickyWindowsApplication; 
                          const window: IAgmStickyWindow); dispid 3;
    procedure WindowRemoved(const Application: IAgmStickyWindowsApplication; 
                            const window: IAgmStickyWindow); dispid 4;
    procedure GroupWindowAdded(const window: IAgmStickyWindow; 
                               const groupWindows: IAgmStickyWindowsCollection); dispid 5;
    procedure GroupWindowRemoved(const window: IAgmStickyWindow; 
                                 const groupWindows: IAgmStickyWindowsCollection); dispid 6;
  end;

// *********************************************************************//
// DispIntf:  IAgmStreamStatus
// Flags:     (4096) Dispatchable
// GUID:      {42442B7D-4236-74C1-484D-A5DD2D53643D}
// *********************************************************************//
  IAgmStreamStatus = dispinterface
    ['{42442B7D-4236-74C1-484D-A5DD2D53643D}']
    property Message: WideString readonly dispid 1610743808;
    property AgmState: AgmState readonly dispid 1610743809;
    property Details: WideString readonly dispid 1610743810;
  end;

// *********************************************************************//
// DispIntf:  IAgmStreamSubscription
// Flags:     (4096) Dispatchable
// GUID:      {4949AB71-4696-849A-419D-A49D2D43692D}
// *********************************************************************//
  IAgmStreamSubscription = dispinterface
    ['{4949AB71-4696-849A-419D-A49D2D43692D}']
    property Result: IAgmMethodResult readonly dispid 1610743808;
    procedure Subscribe(const Args: IAgmArgsCollection; target: OleVariant); dispid 1610743809;
    procedure Unsubscribe; dispid 1610743810;
  end;

// *********************************************************************//
// DispIntf:  IAgmStreamSubscriptionEvents
// Flags:     (4096) Dispatchable
// GUID:      {533CDA57-A652-A5C9-3654-D15D5443595D}
// *********************************************************************//
  IAgmStreamSubscriptionEvents = dispinterface
    ['{533CDA57-A652-A5C9-3654-D15D5443595D}']
    procedure DataReceived(const Subscription: IAgmStreamSubscription; 
                           const Server: IAgmServerInstance; const Result: IAgmMethodResult); dispid 1;
    procedure StatusChanged(const Subscription: IAgmStreamSubscription; 
                            const Server: IAgmServerInstance; const prevStatus: IAgmStreamStatus; 
                            const newStatus: IAgmStreamStatus); dispid 2;
  end;

// *********************************************************************//
// DispIntf:  IAgmWindowBounds
// Flags:     (4096) Dispatchable
// GUID:      {91539C1A-3AF8-425B-8D9A-D5583370D346}
// *********************************************************************//
  IAgmWindowBounds = dispinterface
    ['{91539C1A-3AF8-425B-8D9A-D5583370D346}']
    property WindowTop: Integer dispid 1610743808;
    property WindowLeft: Integer dispid 1610743810;
    property WindowWidth: Integer dispid 1610743812;
    property WindowHeight: Integer dispid 1610743814;
  end;

// *********************************************************************//
// DispIntf:  IAgm
// Flags:     (4096) Dispatchable
// GUID:      {64905467-F2D2-4909-7468-3533D2F298D6}
// *********************************************************************//
  IAgm = dispinterface
    ['{64905467-F2D2-4909-7468-3533D2F298D6}']
    property AllServers: OleVariant readonly dispid 1610743808;
    property Identity: AgmInstanceIdentity readonly dispid 1610743809;
    property Instance: IAgmInstance readonly dispid 1610743810;
    property Configuration: IAgmConfiguration readonly dispid 1610743811;
    property StickyWindowsController: IAgmStickyWindowsController readonly dispid 1610743812;
    procedure Start; dispid 1610743813;
    procedure Stop; dispid 1610743814;
    function Methods(const methodName: WideString; const Server: IAgmInstance; 
                     const Signature: WideString; const resultSignature: WideString; 
                     const ObjectType: WideString; const ObjectTypes: IEnumerable; 
                     const ServiceName: WideString; Flags: AgmMethodFlags): OleVariant; dispid 1610743815;
    function Servers(const MachineName: WideString; const UserName: WideString; 
                     const ApplicationName: WideString; const Environment: WideString; 
                     const Region: WideString; const ServiceName: WideString; ProcessId: Integer): IAgmServerInstanceCollection; dispid 1610743816;
    function HasMethod(const methodName: WideString): WordBool; dispid 1610743817;
    function Register(const methodName: WideString; const Signature: WideString; 
                      const resultSignature: WideString; const DisplayName: WideString; 
                      const Description: WideString; const ServiceName: WideString; 
                      Flags: AgmMethodFlags; const ObjectType: WideString; 
                      const ObjectTypes: IEnumerable): IAgmServerMethod; dispid 1610743818;
    function RegisterAsync(const methodName: WideString; 
                           const requestHandler: IAgmServerMethodRequestHandler; 
                           const Signature: WideString; const resultSignature: WideString; 
                           const DisplayName: WideString; const Description: WideString; 
                           const ServiceName: WideString; Flags: AgmMethodFlags; 
                           const ObjectType: WideString; const ObjectTypes: IEnumerable): IAgmServerMethod; dispid 1610743819;
    procedure Unregister(Method: OleVariant); dispid 1610743820;
    function CreateContextValue(const Name: WideString; type_: AgmValueType; isArray: WordBool; 
                                Value: OleVariant): OleVariant; dispid 1610743821;
    function RegisterStream(const methodName: WideString; const Signature: WideString; 
                            const resultSignature: WideString; const DisplayName: WideString; 
                            const Description: WideString; const ServiceName: WideString; 
                            Flags: AgmMethodFlags; const ObjectType: WideString; 
                            const ObjectTypes: IEnumerable): IAgmServerStreamMethod; dispid 1610743822;
    function ParseJson(const jsonString: WideString): OleVariant; dispid 1610743823;
    function StringifyJson(const jsonObject: IAgmContextValue): WideString; dispid 1610743824;
  end;

// *********************************************************************//
// DispIntf:  IAgmClientMethod
// Flags:     (4096) Dispatchable
// GUID:      {64624647-5B22-4969-A4B6-3536D2F5344A}
// *********************************************************************//
  IAgmClientMethod = dispinterface
    ['{64624647-5B22-4969-A4B6-3536D2F5344A}']
    property Name: WideString readonly dispid 1610743808;
    property DisplayName: WideString readonly dispid 1610743809;
    property Description: WideString readonly dispid 1610743810;
    property ServiceName: WideString readonly dispid 1610743811;
    property Flags: AgmMethodFlags readonly dispid 1610743812;
    property Signature: IAgmMethodSignature readonly dispid 1610743813;
    property Servers: IAgmServerInstanceCollection readonly dispid 1610743814;
    property IsLocal: WordBool readonly dispid 1610743815;
    property IsValid: WordBool readonly dispid 1610743816;
    property ObjectTypes: IAgmReadOnlyCollection readonly dispid 1610743817;
    function CreateArgs: OleVariant; dispid 1610743818;
    function InvokeSync(const Args: IAgmArgsCollection; target: OleVariant; timeout: OleVariant; 
                        fireAndForget: WordBool; const ObjectType: WideString; 
                        const callbackContext: WideString; const displayContext: IAgmDisplayContext): IAgmMethodResult; dispid 1610743819;
    procedure InvokeAsync(const Args: IAgmArgsCollection; target: OleVariant; timeout: OleVariant; 
                          fireAndForget: WordBool; cookie: OleVariant; 
                          const ObjectType: WideString; const callbackContext: WideString; 
                          const displayContext: IAgmDisplayContext); dispid 1610743820;
    procedure InvokeAsyncWithCallback(const resultHandler: IAgmServerMethodResultHandler; 
                                      const Args: IAgmArgsCollection; target: OleVariant; 
                                      timeout: OleVariant; cookie: OleVariant; 
                                      const ObjectType: WideString; 
                                      const callbackContext: WideString; 
                                      const displayContext: IAgmDisplayContext); dispid 1610743821;
    property IsStreaming: WordBool readonly dispid 1610743822;
    function CreateSubscription: IAgmStreamSubscription; dispid 1610743823;
  end;

// *********************************************************************//
// DispIntf:  IAgmClientMethodCollection
// Flags:     (4096) Dispatchable
// GUID:      {50906147-FA32-4909-A4B8-3533D2F2F4D0}
// *********************************************************************//
  IAgmClientMethodCollection = dispinterface
    ['{50906147-FA32-4909-A4B8-3533D2F2F4D0}']
    function GetEnumerator: IEnumVARIANT; dispid -4;
    property _Default[key: OleVariant]: IAgmClientMethod readonly dispid 0; default;
    property Count: Integer readonly dispid 1610743810;
    function Contains(const methodName: WideString): WordBool; dispid 1610743811;
  end;

// *********************************************************************//
// DispIntf:  IAgmClientMethodEvents
// Flags:     (4096) Dispatchable
// GUID:      {533CDA87-A612-A2C9-3694-D55D2443691D}
// *********************************************************************//
  IAgmClientMethodEvents = dispinterface
    ['{533CDA87-A612-A2C9-3694-D55D2443691D}']
    procedure InvocationCompleted(Args: OleVariant; const Result: IAgmMethodResult; 
                                  cookie: OleVariant); dispid 1;
    procedure Added(const Server: IAgmServerInstance); dispid 2;
    procedure Removed(const Server: IAgmServerInstance); dispid 3;
    procedure Available(const Server: IAgmServerInstance); dispid 4;
    procedure Unavailable(const Server: IAgmServerInstance); dispid 5;
  end;

// *********************************************************************//
// DispIntf:  IAgmConfiguration
// Flags:     (4096) Dispatchable
// GUID:      {14904147-F24A-4909-A4B8-35C42F264B02}
// *********************************************************************//
  IAgmConfiguration = dispinterface
    ['{14904147-F24A-4909-A4B8-35C42F264B02}']
    property ConfigurationFile: WideString dispid 1610743808;
    property MetricsConfigurationFile: WideString dispid 1610743810;
    property StickyWindowsConfigurationFile: WideString dispid 1610743812;
    property ApplicationName: WideString dispid 1610743814;
    property InstanceId: WideString dispid 1610743816;
    property DefaultInvocationTimeout: Double dispid 1610743818;
  end;

// *********************************************************************//
// DispIntf:  IAgmDisplayContext
// Flags:     (4096) Dispatchable
// GUID:      {0530D847-92D2-4C13-AC44-A53874966829}
// *********************************************************************//
  IAgmDisplayContext = dispinterface
    ['{0530D847-92D2-4C13-AC44-A53874966829}']
    property UserFocusX: Integer readonly dispid 1610743808;
    property UserFocusY: Integer readonly dispid 1610743809;
    property WindowHandle: Integer readonly dispid 1610743810;
    property SourceWindow: IAgmWindowBounds readonly dispid 1610743811;
    property TakeFocus: WordBool readonly dispid 1610743812;
    property TopMost: WordBool readonly dispid 1610743813;
    property TargetWindow: IAgmWindowBounds readonly dispid 1610743814;
    property TargetWindowName: WideString readonly dispid 1610743815;
    property TargetWindowTitle: WideString readonly dispid 1610743816;
    property MoveTargetWindow: WordBool readonly dispid 1610743817;
  end;

// *********************************************************************//
// DispIntf:  IAgmError
// Flags:     (4096) Dispatchable
// GUID:      {6720D197-AD32-4D1A-A488-7533D2969A29}
// *********************************************************************//
  IAgmError = dispinterface
    ['{6720D197-AD32-4D1A-A488-7533D2969A29}']
    property Status: AgmMethodInvocationStatus readonly dispid 1610743808;
    property Message: WideString readonly dispid 1610743809;
    property LogDetails: WideString readonly dispid 1610743810;
  end;

// *********************************************************************//
// DispIntf:  IAgmEvents
// Flags:     (4096) Dispatchable
// GUID:      {736CDA27-A6D2-8269-C6A4-B68D2443666D}
// *********************************************************************//
  IAgmEvents = dispinterface
    ['{736CDA27-A6D2-8269-C6A4-B68D2443666D}']
    procedure AgmConnected; dispid 1;
    procedure AgmDisconnected; dispid 2;
    procedure MethodAdded(const Method: IAgmClientMethod; const Server: IAgmServerInstance); dispid 3;
    procedure MethodRemoved(const Method: IAgmClientMethod; const Server: IAgmServerInstance); dispid 4;
    procedure MethodServerAvailable(const Method: IAgmClientMethod; const Server: IAgmServerInstance); dispid 5;
    procedure MethodServerUnavailable(const Method: IAgmClientMethod; 
                                      const Server: IAgmServerInstance); dispid 6;
    procedure ServerAdded(const Server: IAgmServerInstance); dispid 7;
    procedure ServerRemoved(const Server: IAgmServerInstance); dispid 8;
  end;

// *********************************************************************//
// DispIntf:  IAgmInstance
// Flags:     (4096) Dispatchable
// GUID:      {0540D247-A232-A219-AC44-753324966429}
// *********************************************************************//
  IAgmInstance = dispinterface
    ['{0540D247-A232-A219-AC44-753324966429}']
    property MachineName: WideString readonly dispid 1610743808;
    property ProcessId: Integer readonly dispid 1610743809;
    property ProcessStartTime: TDateTime readonly dispid 1610743810;
    property UserName: WideString readonly dispid 1610743811;
    property ApplicationName: WideString readonly dispid 1610743812;
    property Environment: WideString readonly dispid 1610743813;
    property Region: WideString readonly dispid 1610743814;
    property ServiceName: WideString readonly dispid 1610743815;
    property MetricsRepositoryId: WideString readonly dispid 1610743816;
    property State: AgmInstanceState readonly dispid 1610743817;
    property AsString: WideString readonly dispid 1610743818;
    function Equals(const Instance: IAgmInstance): WordBool; dispid 1610743819;
  end;

// *********************************************************************//
// DispIntf:  IAgmServerInstanceCollection
// Flags:     (4096) Dispatchable
// GUID:      {50903147-FA32-49A9-A45C-3583D272FAD0}
// *********************************************************************//
  IAgmServerInstanceCollection = dispinterface
    ['{50903147-FA32-49A9-A45C-3583D272FAD0}']
    function GetEnumerator: IEnumVARIANT; dispid -4;
    property _Default[index: Integer]: IAgmServerInstance readonly dispid 0; default;
    property Count: Integer readonly dispid 1610743810;
  end;

// *********************************************************************//
// DispIntf:  IAgmMethodParameter
// Flags:     (4096) Dispatchable
// GUID:      {34905147-F2A2-4909-7443-35336DF298C0}
// *********************************************************************//
  IAgmMethodParameter = dispinterface
    ['{34905147-F2A2-4909-7443-35336DF298C0}']
    property Name: WideString readonly dispid 1610743808;
    property Description: WideString readonly dispid 1610743809;
    property type_: AgmValueType readonly dispid 1610743810;
    property isArray: WordBool readonly dispid 1610743811;
    property IsRequired: WordBool readonly dispid 1610743812;
    property Schema: IAgmMethodParameterCollection readonly dispid 1610743813;
  end;

// *********************************************************************//
// DispIntf:  IAgmMethodParameterCollection
// Flags:     (4096) Dispatchable
// GUID:      {45905A37-F2D2-4D09-7458-35A4D2F29920}
// *********************************************************************//
  IAgmMethodParameterCollection = dispinterface
    ['{45905A37-F2D2-4D09-7458-35A4D2F29920}']
    function GetEnumerator: IEnumVARIANT; dispid -4;
    property _Default[index: Integer]: IAgmMethodParameter readonly dispid 0; default;
    property Count: Integer readonly dispid 1610743810;
  end;

// *********************************************************************//
// DispIntf:  IAgmMethodRequest
// Flags:     (4096) Dispatchable
// GUID:      {55D06C47-A832-83C9-3CA4-D53D349C6497}
// *********************************************************************//
  IAgmMethodRequest = dispinterface
    ['{55D06C47-A832-83C9-3CA4-D53D349C6497}']
    property Client: IAgmInstance readonly dispid 1610743808;
    property Method: IAgmServerMethod readonly dispid 1610743809;
    property Result: IAgmMethodResult dispid 1610743810;
    property Args: IAgmArgsCollection readonly dispid 1610743812;
  end;

// *********************************************************************//
// DispIntf:  IAgmArgsCollection
// Flags:     (4096) Dispatchable
// GUID:      {536CDA47-A632-82C9-36A4-D53D2443646D}
// *********************************************************************//
  IAgmArgsCollection = dispinterface
    ['{536CDA47-A632-82C9-36A4-D53D2443646D}']
    function GetEnumerator: IEnumVARIANT; dispid -4;
    property _Default[key: OleVariant]: OleVariant readonly dispid 0; default;
    property Count: Integer readonly dispid 1610743810;
    property ArgumentNames: {NOT_OLEAUTO(PSafeArray)}OleVariant readonly dispid 1610743811;
    property ArgumentValues: {NOT_OLEAUTO(PSafeArray)}OleVariant readonly dispid 1610743812;
    property displayContext: IAgmDisplayContext dispid 1610743813;
    function Contains(const Name: WideString): WordBool; dispid 1610743815;
  end;

// *********************************************************************//
// DispIntf:  IAgmMethodSignature
// Flags:     (4096) Dispatchable
// GUID:      {44905149-12D2-C90B-14B4-3433D2F278D8}
// *********************************************************************//
  IAgmMethodSignature = dispinterface
    ['{44905149-12D2-C90B-14B4-3433D2F278D8}']
    property Parameters: IAgmMethodParameterCollection readonly dispid 1610743808;
    property Results: IAgmMethodParameterCollection readonly dispid 1610743809;
  end;

// *********************************************************************//
// DispIntf:  IAgmServerInstance
// Flags:     (4096) Dispatchable
// GUID:      {5520DA47-A962-8DC9-3C4A-6A3D249C34C7}
// *********************************************************************//
  IAgmServerInstance = dispinterface
    ['{5520DA47-A962-8DC9-3C4A-6A3D249C34C7}']
    property Methods: IAgmClientMethodCollection readonly dispid 1610743808;
  end;

// *********************************************************************//
// Interface: IAgmServerMethodRequestHandler
// Flags:     (256) OleAutomation
// GUID:      {896F2C00-EEB2-4D3B-9065-0F54639FD53E}
// *********************************************************************//
  IAgmServerMethodRequestHandler = interface(IUnknown)
    ['{896F2C00-EEB2-4D3B-9065-0F54639FD53E}']
    function HandleRequest(const request: IAgmMethodRequest; 
                           const resultHandler: IAgmServerMethodResultHandler): HResult; stdcall;
  end;

// *********************************************************************//
// Interface: IAgmServerMethodResultHandler
// Flags:     (256) OleAutomation
// GUID:      {6BAEC0DB-2F6E-4678-893C-39291BF73835}
// *********************************************************************//
  IAgmServerMethodResultHandler = interface(IUnknown)
    ['{6BAEC0DB-2F6E-4678-893C-39291BF73835}']
    function HandleResult(const Result: IAgmMethodResult): HResult; stdcall;
  end;

// *********************************************************************//
// DispIntf:  IAgmServerMethod
// Flags:     (4096) Dispatchable
// GUID:      {04A53147-52D2-AD09-A4B8-3943DA3254D0}
// *********************************************************************//
  IAgmServerMethod = dispinterface
    ['{04A53147-52D2-AD09-A4B8-3943DA3254D0}']
    property Name: WideString readonly dispid 1610743808;
    property DisplayName: WideString readonly dispid 1610743809;
    property Description: WideString readonly dispid 1610743810;
    property ServiceName: WideString readonly dispid 1610743811;
    property Flags: AgmMethodFlags readonly dispid 1610743812;
    property ObjectTypes: IEnumerable readonly dispid 1610743813;
  end;

// *********************************************************************//
// DispIntf:  IAgmServerMethodEvents
// Flags:     (4096) Dispatchable
// GUID:      {536CD047-A631-92C9-3DA4-D53D28A36468}
// *********************************************************************//
  IAgmServerMethodEvents = dispinterface
    ['{536CD047-A631-92C9-3DA4-D53D28A36468}']
    procedure Invoked(request: OleVariant); dispid 1;
  end;

// *********************************************************************//
// DispIntf:  IAgmMethodResult
// Flags:     (4096) Dispatchable
// GUID:      {55D4DA47-A842-82C9-3C44-D45D249C69C7}
// *********************************************************************//
  IAgmMethodResult = dispinterface
    ['{55D4DA47-A842-82C9-3C44-D45D249C69C7}']
    property Error: IAgmError readonly dispid 1610743808;
    property HasError: WordBool readonly dispid 1610743809;
    property Server: IAgmServerInstance readonly dispid 1610743810;
    property Value: OleVariant dispid 0;
  end;

// *********************************************************************//
// DispIntf:  IAgmMethodResultCollection
// Flags:     (4096) Dispatchable
// GUID:      {52D05447-A832-23C9-3A44-D53D249C6465}
// *********************************************************************//
  IAgmMethodResultCollection = dispinterface
    ['{52D05447-A832-23C9-3A44-D53D249C6465}']
    function GetEnumerator: IEnumVARIANT; dispid -4;
    property _Default[key: OleVariant]: OleVariant readonly dispid 0; default;
    property Count: Integer readonly dispid 1610743810;
  end;

// *********************************************************************//
// DispIntf:  IAgmContextValue
// Flags:     (4096) Dispatchable
// GUID:      {566CD944-A593-14CA-46A4-D17D2143716D}
// *********************************************************************//
  IAgmContextValue = dispinterface
    ['{566CD944-A593-14CA-46A4-D17D2143716D}']
    property CompositeName: WideString dispid 1610743811;
    property CompositeValue: OleVariant readonly dispid 1610743814;
    property isArray: WordBool readonly dispid 1610743809;
    property type_: AgmValueType readonly dispid 1610743813;
    property IsComposite: WordBool readonly dispid 1610743810;
    function GetEnumerator: IEnumVARIANT; dispid -4;
    property _Default[key: OleVariant]: OleVariant readonly dispid 0; default;
    property Count: Integer readonly dispid 1610743808;
    property MemberNames: {NOT_OLEAUTO(PSafeArray)}OleVariant readonly dispid 1610743812;
    property MemberValues: {NOT_OLEAUTO(PSafeArray)}OleVariant readonly dispid 1610743815;
    procedure Add(item: OleVariant); dispid 1610743819;
  end;

// *********************************************************************//
// DispIntf:  IAgmStickyWindowsController
// Flags:     (4096) Dispatchable
// GUID:      {1121DFC4-D256-4B6B-B6E5-7180D88E9D70}
// *********************************************************************//
  IAgmStickyWindowsController = dispinterface
    ['{1121DFC4-D256-4B6B-B6E5-7180D88E9D70}']
    function Register(window: OleVariant; const groupName: WideString; const AgmId: WideString; 
                      IsSticky: WordBool): IAgmStickyWindow; dispid 1610743808;
    procedure Unregister(windowOrStickyWindow: OleVariant); dispid 1610743809;
    function GetStickyWindow(window: OleVariant): IAgmStickyWindow; dispid 1610743810;
    function FindWindowsByCaption(const titleText: WideString; TextMatch: TextMatch): IAgmStickyWindowsHandlesCollection; dispid 1610743811;
    procedure Start; dispid 1610743812;
    procedure Stop; dispid 1610743813;
  end;

// *********************************************************************//
// Interface: _GlueAgmException
// Flags:     (4432) Hidden Dual OleAutomation Dispatchable
// GUID:      {6273310E-1CFA-3E0C-9BE2-6716D01EF289}
// *********************************************************************//
  _GlueAgmException = interface(IDispatch)
    ['{6273310E-1CFA-3E0C-9BE2-6716D01EF289}']
  end;

// *********************************************************************//
// DispIntf:  _GlueAgmExceptionDisp
// Flags:     (4432) Hidden Dual OleAutomation Dispatchable
// GUID:      {6273310E-1CFA-3E0C-9BE2-6716D01EF289}
// *********************************************************************//
  _GlueAgmExceptionDisp = dispinterface
    ['{6273310E-1CFA-3E0C-9BE2-6716D01EF289}']
  end;

// *********************************************************************//
// Interface: _Glue42
// Flags:     (4432) Hidden Dual OleAutomation Dispatchable
// GUID:      {AA2EDA42-C803-3626-A1E1-AA8ECE118938}
// *********************************************************************//
  _Glue42 = interface(IDispatch)
    ['{AA2EDA42-C803-3626-A1E1-AA8ECE118938}']
  end;

// *********************************************************************//
// DispIntf:  _Glue42Disp
// Flags:     (4432) Hidden Dual OleAutomation Dispatchable
// GUID:      {AA2EDA42-C803-3626-A1E1-AA8ECE118938}
// *********************************************************************//
  _Glue42Disp = dispinterface
    ['{AA2EDA42-C803-3626-A1E1-AA8ECE118938}']
  end;

// *********************************************************************//
// Interface: IGlueContext
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {E36214AA-00E9-4057-8DB3-B381C8839735}
// *********************************************************************//
  IGlueContext = interface(IDispatch)
    ['{E36214AA-00E9-4057-8DB3-B381C8839735}']
    function GetContextInfo: GlueContext; safecall;
    function GetData: PSafeArray; safecall;
    procedure SetContextData(data: PSafeArray); safecall;
    procedure BuildAndSetContextData(const builderCallback: IGlueContextBuilderCallback); safecall;
    procedure UpdateContextData(data: PSafeArray); safecall;
    procedure BuildAndUpdateContextData(const builderCallback: IGlueContextBuilderCallback); safecall;
    procedure Close; safecall;
  end;

// *********************************************************************//
// DispIntf:  IGlueContextDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {E36214AA-00E9-4057-8DB3-B381C8839735}
// *********************************************************************//
  IGlueContextDisp = dispinterface
    ['{E36214AA-00E9-4057-8DB3-B381C8839735}']
    function GetContextInfo: {NOT_OLEAUTO(GlueContext)}OleVariant; dispid 1610743808;
    function GetData: {NOT_OLEAUTO(PSafeArray)}OleVariant; dispid 1610743809;
    procedure SetContextData(data: {NOT_OLEAUTO(PSafeArray)}OleVariant); dispid 1610743810;
    procedure BuildAndSetContextData(const builderCallback: IGlueContextBuilderCallback); dispid 1610743811;
    procedure UpdateContextData(data: {NOT_OLEAUTO(PSafeArray)}OleVariant); dispid 1610743812;
    procedure BuildAndUpdateContextData(const builderCallback: IGlueContextBuilderCallback); dispid 1610743813;
    procedure Close; dispid 1610743814;
  end;

// *********************************************************************//
// Interface: IGlueContextBuilder
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {E6BF93F6-3277-4BFD-8F30-4B76E72745E2}
// *********************************************************************//
  IGlueContextBuilder = interface(IDispatch)
    ['{E6BF93F6-3277-4BFD-8F30-4B76E72745E2}']
    procedure AddBool(const Name: WideString; Value: WordBool); safecall;
    procedure AddDatetime(const Name: WideString; Value: Int64); safecall;
    procedure AddString(const Name: WideString; const Value: WideString); safecall;
    procedure AddInt(const Name: WideString; Value: Integer); safecall;
    procedure AddLong(const Name: WideString; Value: Int64); safecall;
    procedure AddDouble(const Name: WideString; Value: Double); safecall;
    procedure AddBoolArray(const Name: WideString; Value: PSafeArray); safecall;
    procedure AddStringArray(const Name: WideString; Value: PSafeArray); safecall;
    procedure AddIntArray(const Name: WideString; Value: PSafeArray); safecall;
    procedure AddDatetimeArray(const Name: WideString; Value: PSafeArray); safecall;
    procedure AddLongArray(const Name: WideString; Value: PSafeArray); safecall;
    procedure AddDoubleArray(const Name: WideString; Value: PSafeArray); safecall;
    procedure BuildComposite(const Name: WideString; const callback: IGlueContextBuilderCallback; 
                             isArray: WordBool); safecall;
    procedure BuildTuple(const Name: WideString; const callback: IGlueContextBuilderCallback); safecall;
    procedure AddComposite(const Name: WideString; composite: PSafeArray; isArray: WordBool); safecall;
    procedure AddTuple(const Name: WideString; Tuple: PSafeArray); safecall;
    procedure AddContextValue(GlueContextValue: GlueContextValue); safecall;
    procedure AddGlueValue(const Name: WideString; Value: GlueValue); safecall;
    procedure AddTupleValue(Value: GlueValue); safecall;
    procedure Clear; safecall;
  end;

// *********************************************************************//
// DispIntf:  IGlueContextBuilderDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {E6BF93F6-3277-4BFD-8F30-4B76E72745E2}
// *********************************************************************//
  IGlueContextBuilderDisp = dispinterface
    ['{E6BF93F6-3277-4BFD-8F30-4B76E72745E2}']
    procedure AddBool(const Name: WideString; Value: WordBool); dispid 1610743808;
    procedure AddDatetime(const Name: WideString; Value: Int64); dispid 1610743809;
    procedure AddString(const Name: WideString; const Value: WideString); dispid 1610743810;
    procedure AddInt(const Name: WideString; Value: Integer); dispid 1610743811;
    procedure AddLong(const Name: WideString; Value: Int64); dispid 1610743812;
    procedure AddDouble(const Name: WideString; Value: Double); dispid 1610743813;
    procedure AddBoolArray(const Name: WideString; Value: {NOT_OLEAUTO(PSafeArray)}OleVariant); dispid 1610743814;
    procedure AddStringArray(const Name: WideString; Value: {NOT_OLEAUTO(PSafeArray)}OleVariant); dispid 1610743815;
    procedure AddIntArray(const Name: WideString; Value: {NOT_OLEAUTO(PSafeArray)}OleVariant); dispid 1610743816;
    procedure AddDatetimeArray(const Name: WideString; Value: {NOT_OLEAUTO(PSafeArray)}OleVariant); dispid 1610743817;
    procedure AddLongArray(const Name: WideString; Value: {NOT_OLEAUTO(PSafeArray)}OleVariant); dispid 1610743818;
    procedure AddDoubleArray(const Name: WideString; Value: {NOT_OLEAUTO(PSafeArray)}OleVariant); dispid 1610743819;
    procedure BuildComposite(const Name: WideString; const callback: IGlueContextBuilderCallback; 
                             isArray: WordBool); dispid 1610743820;
    procedure BuildTuple(const Name: WideString; const callback: IGlueContextBuilderCallback); dispid 1610743821;
    procedure AddComposite(const Name: WideString; composite: {NOT_OLEAUTO(PSafeArray)}OleVariant; 
                           isArray: WordBool); dispid 1610743822;
    procedure AddTuple(const Name: WideString; Tuple: {NOT_OLEAUTO(PSafeArray)}OleVariant); dispid 1610743823;
    procedure AddContextValue(GlueContextValue: {NOT_OLEAUTO(GlueContextValue)}OleVariant); dispid 1610743824;
    procedure AddGlueValue(const Name: WideString; Value: {NOT_OLEAUTO(GlueValue)}OleVariant); dispid 1610743825;
    procedure AddTupleValue(Value: {NOT_OLEAUTO(GlueValue)}OleVariant); dispid 1610743826;
    procedure Clear; dispid 1610743827;
  end;

// *********************************************************************//
// Interface: IGlueContextHandler
// Flags:     (256) OleAutomation
// GUID:      {E7DF128A-1584-49F9-87FE-06FA062DA1FB}
// *********************************************************************//
  IGlueContextHandler = interface(IUnknown)
    ['{E7DF128A-1584-49F9-87FE-06FA062DA1FB}']
    function HandleContext(const context: IGlueContext): HResult; stdcall;
    function HandleContextUpdate(const contextUpdate: IGlueContextUpdate): HResult; stdcall;
  end;

// *********************************************************************//
// Interface: IGlueContextUpdate
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {FCA1B294-A416-4533-AFAF-3640FDE02B1A}
// *********************************************************************//
  IGlueContextUpdate = interface(IDispatch)
    ['{FCA1B294-A416-4533-AFAF-3640FDE02B1A}']
    function GetContext: IGlueContext; safecall;
    function GetRemoved: PSafeArray; safecall;
    function GetAdded: PSafeArray; safecall;
    function GetUpdated: PSafeArray; safecall;
  end;

// *********************************************************************//
// DispIntf:  IGlueContextUpdateDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {FCA1B294-A416-4533-AFAF-3640FDE02B1A}
// *********************************************************************//
  IGlueContextUpdateDisp = dispinterface
    ['{FCA1B294-A416-4533-AFAF-3640FDE02B1A}']
    function GetContext: IGlueContext; dispid 1610743808;
    function GetRemoved: {NOT_OLEAUTO(PSafeArray)}OleVariant; dispid 1610743809;
    function GetAdded: {NOT_OLEAUTO(PSafeArray)}OleVariant; dispid 1610743810;
    function GetUpdated: {NOT_OLEAUTO(PSafeArray)}OleVariant; dispid 1610743811;
  end;

// *********************************************************************//
// Interface: IGlueEvents
// Flags:     (256) OleAutomation
// GUID:      {A9B9392C-14B9-42BC-8BCD-7B07EF36003C}
// *********************************************************************//
  IGlueEvents = interface(IUnknown)
    ['{A9B9392C-14B9-42BC-8BCD-7B07EF36003C}']
    function HandleConnectionStatus(State: GlueState; const Message: WideString; date: Int64): HResult; stdcall;
    function HandleInstanceStatus(Instance: GlueInstance; active: WordBool): HResult; stdcall;
    function HandleMethodStatus(Method: GlueMethod; active: WordBool): HResult; stdcall;
    function HandleGlueContext(context: GlueContext; created: WordBool): HResult; stdcall;
    function HandleException(const ex: _Exception): HResult; stdcall;
  end;

// *********************************************************************//
// Interface: IGlueContextBuilderCallback
// Flags:     (256) OleAutomation
// GUID:      {0856C290-92E8-49A3-ADD9-741E551BD70F}
// *********************************************************************//
  IGlueContextBuilderCallback = interface(IUnknown)
    ['{0856C290-92E8-49A3-ADD9-741E551BD70F}']
    function Build(const builder: IGlueContextBuilder): HResult; stdcall;
  end;

// *********************************************************************//
// Interface: IGlueWindow
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {2F432B71-D338-419B-B150-E5E111F3D9A3}
// *********************************************************************//
  IGlueWindow = interface(IDispatch)
    ['{2F432B71-D338-419B-B150-E5E111F3D9A3}']
    function GetId: WideString; safecall;
    function IsVisible: WordBool; safecall;
    procedure SetVisible(visible: WordBool); safecall;
    function GetTitle: WideString; safecall;
    procedure SetTitle(const title: WideString); safecall;
    function GetIsShowLink: WordBool; safecall;
    procedure SetShowLink(showLink: WordBool); safecall;
    function GetLinkId: WideString; safecall;
    procedure SetLinkId(const linkId: WideString); safecall;
    procedure Unregister; safecall;
  end;

// *********************************************************************//
// DispIntf:  IGlueWindowDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {2F432B71-D338-419B-B150-E5E111F3D9A3}
// *********************************************************************//
  IGlueWindowDisp = dispinterface
    ['{2F432B71-D338-419B-B150-E5E111F3D9A3}']
    function GetId: WideString; dispid 1610743808;
    function IsVisible: WordBool; dispid 1610743809;
    procedure SetVisible(visible: WordBool); dispid 1610743810;
    function GetTitle: WideString; dispid 1610743811;
    procedure SetTitle(const title: WideString); dispid 1610743812;
    function GetIsShowLink: WordBool; dispid 1610743813;
    procedure SetShowLink(showLink: WordBool); dispid 1610743814;
    function GetLinkId: WideString; dispid 1610743815;
    procedure SetLinkId(const linkId: WideString); dispid 1610743816;
    procedure Unregister; dispid 1610743817;
  end;

// *********************************************************************//
// Interface: IGlue42
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {DB20C8DA-CD98-4D75-8B9A-18284B7EE0D1}
// *********************************************************************//
  IGlue42 = interface(IDispatch)
    ['{DB20C8DA-CD98-4D75-8B9A-18284B7EE0D1}']
    procedure Start(Instance: GlueInstance); safecall;
    procedure Stop; safecall;
    function RegisterGlueWindow(hwnd: Integer; const windowEventHandler: IGlueWindowEventHandler): IGlueWindow; safecall;
    function GetInstance: GlueInstance; safecall;
    function GetKnownContexts: PSafeArray; safecall;
    procedure GetGlueContext(const contextName: WideString; const handler: IGlueContextHandler); safecall;
    function GetAllInstances: PSafeArray; safecall;
    function GetAllMethods: PSafeArray; safecall;
    function GetMethodsForInstance(Instance: GlueInstance; Identity: AgmInstanceIdentity): PSafeArray; safecall;
    procedure Subscribe(const handler: IGlueEvents); safecall;
    procedure Unsubscribe(const handler: IGlueEvents); safecall;
    function BuildGlueContextValues(const contextBuilderCallback: IGlueContextBuilderCallback): PSafeArray; safecall;
    function RegisterMethod(const methodName: WideString; 
                            const requestHandler: IGlueRequestHandler; const Input: WideString; 
                            const Output: WideString; ObjectTypes: PSafeArray): GlueMethod; safecall;
    function RegisterStream(const streamName: WideString; 
                            const subscriptionHandler: IGlueSubscriptionHandler; 
                            const Input: WideString; const Output: WideString; 
                            ObjectTypes: PSafeArray; out stream: IGlueStream): GlueMethod; safecall;
    procedure UnregisterMethod(Method: GlueMethod); safecall;
    procedure BuildAndInvoke(const Method: WideString; 
                             const builderCallback: IGlueContextBuilderCallback; 
                             targets: PSafeArray; all: WordBool; Identity: AgmInstanceIdentity; 
                             const resultHandler: IGlueInvocationResultHandler; 
                             invocationTimeoutMsecs: Int64); safecall;
    procedure InvokeMethods(const Method: WideString; invocationArgs: PSafeArray; 
                            targets: PSafeArray; all: WordBool; Identity: AgmInstanceIdentity; 
                            const resultHandler: IGlueInvocationResultHandler; 
                            invocationTimeoutMsecs: Int64); safecall;
    procedure InvokeMethod(Method: GlueMethod; invocationArgs: PSafeArray; 
                           const resultHandler: IGlueInvocationResultHandler; 
                           invocationTimeoutMsecs: Int64); safecall;
    procedure SubscribeStreams(const streamName: WideString; subscriptionRequestArgs: PSafeArray; 
                               targets: PSafeArray; all: WordBool; Identity: AgmInstanceIdentity; 
                               const streamHandler: IGlueStreamHandler; 
                               invocationTimeoutMsecs: Int64); safecall;
    procedure SubscribeStream(stream: GlueMethod; subscriptionRequestArgs: PSafeArray; 
                              const streamHandler: IGlueStreamHandler; 
                              subscriptionTimeoutMsecs: Int64); safecall;
  end;

// *********************************************************************//
// DispIntf:  IGlue42Disp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {DB20C8DA-CD98-4D75-8B9A-18284B7EE0D1}
// *********************************************************************//
  IGlue42Disp = dispinterface
    ['{DB20C8DA-CD98-4D75-8B9A-18284B7EE0D1}']
    procedure Start(Instance: {NOT_OLEAUTO(GlueInstance)}OleVariant); dispid 1610743808;
    procedure Stop; dispid 1610743809;
    function RegisterGlueWindow(hwnd: Integer; const windowEventHandler: IGlueWindowEventHandler): IGlueWindow; dispid 1610743810;
    function GetInstance: {NOT_OLEAUTO(GlueInstance)}OleVariant; dispid 1610743811;
    function GetKnownContexts: {NOT_OLEAUTO(PSafeArray)}OleVariant; dispid 1610743812;
    procedure GetGlueContext(const contextName: WideString; const handler: IGlueContextHandler); dispid 1610743813;
    function GetAllInstances: {NOT_OLEAUTO(PSafeArray)}OleVariant; dispid 1610743814;
    function GetAllMethods: {NOT_OLEAUTO(PSafeArray)}OleVariant; dispid 1610743815;
    function GetMethodsForInstance(Instance: {NOT_OLEAUTO(GlueInstance)}OleVariant; 
                                   Identity: AgmInstanceIdentity): {NOT_OLEAUTO(PSafeArray)}OleVariant; dispid 1610743816;
    procedure Subscribe(const handler: IGlueEvents); dispid 1610743817;
    procedure Unsubscribe(const handler: IGlueEvents); dispid 1610743818;
    function BuildGlueContextValues(const contextBuilderCallback: IGlueContextBuilderCallback): {NOT_OLEAUTO(PSafeArray)}OleVariant; dispid 1610743819;
    function RegisterMethod(const methodName: WideString; 
                            const requestHandler: IGlueRequestHandler; const Input: WideString; 
                            const Output: WideString; 
                            ObjectTypes: {NOT_OLEAUTO(PSafeArray)}OleVariant): {NOT_OLEAUTO(GlueMethod)}OleVariant; dispid 1610743820;
    function RegisterStream(const streamName: WideString; 
                            const subscriptionHandler: IGlueSubscriptionHandler; 
                            const Input: WideString; const Output: WideString; 
                            ObjectTypes: {NOT_OLEAUTO(PSafeArray)}OleVariant; 
                            out stream: IGlueStream): {NOT_OLEAUTO(GlueMethod)}OleVariant; dispid 1610743821;
    procedure UnregisterMethod(Method: {NOT_OLEAUTO(GlueMethod)}OleVariant); dispid 1610743822;
    procedure BuildAndInvoke(const Method: WideString; 
                             const builderCallback: IGlueContextBuilderCallback; 
                             targets: {NOT_OLEAUTO(PSafeArray)}OleVariant; all: WordBool; 
                             Identity: AgmInstanceIdentity; 
                             const resultHandler: IGlueInvocationResultHandler; 
                             invocationTimeoutMsecs: Int64); dispid 1610743823;
    procedure InvokeMethods(const Method: WideString; 
                            invocationArgs: {NOT_OLEAUTO(PSafeArray)}OleVariant; 
                            targets: {NOT_OLEAUTO(PSafeArray)}OleVariant; all: WordBool; 
                            Identity: AgmInstanceIdentity; 
                            const resultHandler: IGlueInvocationResultHandler; 
                            invocationTimeoutMsecs: Int64); dispid 1610743824;
    procedure InvokeMethod(Method: {NOT_OLEAUTO(GlueMethod)}OleVariant; 
                           invocationArgs: {NOT_OLEAUTO(PSafeArray)}OleVariant; 
                           const resultHandler: IGlueInvocationResultHandler; 
                           invocationTimeoutMsecs: Int64); dispid 1610743825;
    procedure SubscribeStreams(const streamName: WideString; 
                               subscriptionRequestArgs: {NOT_OLEAUTO(PSafeArray)}OleVariant; 
                               targets: {NOT_OLEAUTO(PSafeArray)}OleVariant; all: WordBool; 
                               Identity: AgmInstanceIdentity; 
                               const streamHandler: IGlueStreamHandler; 
                               invocationTimeoutMsecs: Int64); dispid 1610743826;
    procedure SubscribeStream(stream: {NOT_OLEAUTO(GlueMethod)}OleVariant; 
                              subscriptionRequestArgs: {NOT_OLEAUTO(PSafeArray)}OleVariant; 
                              const streamHandler: IGlueStreamHandler; 
                              subscriptionTimeoutMsecs: Int64); dispid 1610743827;
  end;

// *********************************************************************//
// Interface: IGlueServerSubscriptionCallback
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {1CE0C9B4-C1D2-4F0D-A5A5-57EA027424BE}
// *********************************************************************//
  IGlueServerSubscriptionCallback = interface(IDispatch)
    ['{1CE0C9B4-C1D2-4F0D-A5A5-57EA027424BE}']
    function Accept(const branch: WideString; Result: GlueResult): IGlueStreamBranch; safecall;
    procedure Reject(Result: GlueResult); safecall;
  end;

// *********************************************************************//
// DispIntf:  IGlueServerSubscriptionCallbackDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {1CE0C9B4-C1D2-4F0D-A5A5-57EA027424BE}
// *********************************************************************//
  IGlueServerSubscriptionCallbackDisp = dispinterface
    ['{1CE0C9B4-C1D2-4F0D-A5A5-57EA027424BE}']
    function Accept(const branch: WideString; Result: {NOT_OLEAUTO(GlueResult)}OleVariant): IGlueStreamBranch; dispid 1610743808;
    procedure Reject(Result: {NOT_OLEAUTO(GlueResult)}OleVariant); dispid 1610743809;
  end;

// *********************************************************************//
// Interface: IGlueStream
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {311F7E47-8BFD-4174-B493-8FA9F9192464}
// *********************************************************************//
  IGlueStream = interface(IDispatch)
    ['{311F7E47-8BFD-4174-B493-8FA9F9192464}']
    procedure Push(data: PSafeArray; const branch: WideString); safecall;
    procedure CloseBranch(const branch: WideString); safecall;
    procedure CloseStream; safecall;
    function GetBranchKeys: PSafeArray; safecall;
    function GetBranch(const BranchKey: WideString): IGlueStreamBranch; safecall;
  end;

// *********************************************************************//
// DispIntf:  IGlueStreamDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {311F7E47-8BFD-4174-B493-8FA9F9192464}
// *********************************************************************//
  IGlueStreamDisp = dispinterface
    ['{311F7E47-8BFD-4174-B493-8FA9F9192464}']
    procedure Push(data: {NOT_OLEAUTO(PSafeArray)}OleVariant; const branch: WideString); dispid 1610743808;
    procedure CloseBranch(const branch: WideString); dispid 1610743809;
    procedure CloseStream; dispid 1610743810;
    function GetBranchKeys: {NOT_OLEAUTO(PSafeArray)}OleVariant; dispid 1610743811;
    function GetBranch(const BranchKey: WideString): IGlueStreamBranch; dispid 1610743812;
  end;

// *********************************************************************//
// Interface: IGlueStreamBranch
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {C770A188-815A-4D61-89BA-5F283F698A07}
// *********************************************************************//
  IGlueStreamBranch = interface(IDispatch)
    ['{C770A188-815A-4D61-89BA-5F283F698A07}']
    function GetKey: WideString; safecall;
    procedure Push(data: PSafeArray); safecall;
    procedure Close; safecall;
    function GetStream: IGlueStream; safecall;
    function GetSubscribers: PSafeArray; safecall;
  end;

// *********************************************************************//
// DispIntf:  IGlueStreamBranchDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {C770A188-815A-4D61-89BA-5F283F698A07}
// *********************************************************************//
  IGlueStreamBranchDisp = dispinterface
    ['{C770A188-815A-4D61-89BA-5F283F698A07}']
    function GetKey: WideString; dispid 1610743808;
    procedure Push(data: {NOT_OLEAUTO(PSafeArray)}OleVariant); dispid 1610743809;
    procedure Close; dispid 1610743810;
    function GetStream: IGlueStream; dispid 1610743811;
    function GetSubscribers: {NOT_OLEAUTO(PSafeArray)}OleVariant; dispid 1610743812;
  end;

// *********************************************************************//
// Interface: IGlueStreamHandler
// Flags:     (256) OleAutomation
// GUID:      {A384126A-06D1-41CE-942C-4376D4574F4B}
// *********************************************************************//
  IGlueStreamHandler = interface(IUnknown)
    ['{A384126A-06D1-41CE-942C-4376D4574F4B}']
    function StreamOpened(stream: GlueMethod; const glueStreamSubscription: IGlueStreamSubscription): HResult; stdcall;
    function HandleStreamData(stream: GlueMethod; data: PSafeArray): HResult; stdcall;
    function HandleStreamStatus(stream: GlueMethod; State: GlueStreamState; 
                                const Message: WideString; dateTime: Int64): HResult; stdcall;
    function StreamClosed(stream: GlueMethod): HResult; stdcall;
  end;

// *********************************************************************//
// Interface: IGlueStreamSubscriber
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {71587A98-0C44-4973-8EC6-74D71BA62F90}
// *********************************************************************//
  IGlueStreamSubscriber = interface(IDispatch)
    ['{71587A98-0C44-4973-8EC6-74D71BA62F90}']
    function GetSubscriberInstance: GlueInstance; safecall;
    procedure Push(data: PSafeArray); safecall;
    procedure Close(data: PSafeArray); safecall;
  end;

// *********************************************************************//
// DispIntf:  IGlueStreamSubscriberDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {71587A98-0C44-4973-8EC6-74D71BA62F90}
// *********************************************************************//
  IGlueStreamSubscriberDisp = dispinterface
    ['{71587A98-0C44-4973-8EC6-74D71BA62F90}']
    function GetSubscriberInstance: {NOT_OLEAUTO(GlueInstance)}OleVariant; dispid 1610743808;
    procedure Push(data: {NOT_OLEAUTO(PSafeArray)}OleVariant); dispid 1610743809;
    procedure Close(data: {NOT_OLEAUTO(PSafeArray)}OleVariant); dispid 1610743810;
  end;

// *********************************************************************//
// Interface: IGlueStreamSubscription
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {E1ADF3C1-D11C-4E96-B9E9-D0B52B02DBCD}
// *********************************************************************//
  IGlueStreamSubscription = interface(IDispatch)
    ['{E1ADF3C1-D11C-4E96-B9E9-D0B52B02DBCD}']
    procedure Close; safecall;
  end;

// *********************************************************************//
// DispIntf:  IGlueStreamSubscriptionDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {E1ADF3C1-D11C-4E96-B9E9-D0B52B02DBCD}
// *********************************************************************//
  IGlueStreamSubscriptionDisp = dispinterface
    ['{E1ADF3C1-D11C-4E96-B9E9-D0B52B02DBCD}']
    procedure Close; dispid 1610743808;
  end;

// *********************************************************************//
// Interface: IGlueSubscriptionHandler
// Flags:     (256) OleAutomation
// GUID:      {DAA04777-BD8E-4180-9021-48A0807A2E1D}
// *********************************************************************//
  IGlueSubscriptionHandler = interface(IUnknown)
    ['{DAA04777-BD8E-4180-9021-48A0807A2E1D}']
    function HandleSubscriptionRequest(stream: GlueMethod; caller: GlueInstance; 
                                       requestValues: PSafeArray; 
                                       const callback: IGlueServerSubscriptionCallback): HResult; stdcall;
    function HandleSubscriber(subscriberInstance: GlueInstance; 
                              const glueStreamSubscriber: IGlueStreamSubscriber; 
                              requestValues: PSafeArray): HResult; stdcall;
    function HandleSubscriberLost(streamSubscriber: GlueInstance; 
                                  const glueStreamSubscriber: IGlueStreamSubscriber): HResult; stdcall;
  end;

// *********************************************************************//
// Interface: IGlueRequestHandler
// Flags:     (256) OleAutomation
// GUID:      {81671796-A690-476B-85EA-94326B7CA2B5}
// *********************************************************************//
  IGlueRequestHandler = interface(IUnknown)
    ['{81671796-A690-476B-85EA-94326B7CA2B5}']
    function HandleInvocationRequest(Method: GlueMethod; caller: GlueInstance; 
                                     requestValues: PSafeArray; 
                                     const resultCallback: IGlueServerMethodResultCallback): HResult; stdcall;
  end;

// *********************************************************************//
// Interface: IGlueServerMethodResultCallback
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {2497D4E6-C398-4DBB-904D-83B55F701E46}
// *********************************************************************//
  IGlueServerMethodResultCallback = interface(IDispatch)
    ['{2497D4E6-C398-4DBB-904D-83B55F701E46}']
    procedure SendResult(Result: GlueResult); safecall;
  end;

// *********************************************************************//
// DispIntf:  IGlueServerMethodResultCallbackDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {2497D4E6-C398-4DBB-904D-83B55F701E46}
// *********************************************************************//
  IGlueServerMethodResultCallbackDisp = dispinterface
    ['{2497D4E6-C398-4DBB-904D-83B55F701E46}']
    procedure SendResult(Result: {NOT_OLEAUTO(GlueResult)}OleVariant); dispid 1610743808;
  end;

// *********************************************************************//
// Interface: IGlueInvocationResultHandler
// Flags:     (256) OleAutomation
// GUID:      {3549297E-57A9-4F65-9183-D95232E55469}
// *********************************************************************//
  IGlueInvocationResultHandler = interface(IUnknown)
    ['{3549297E-57A9-4F65-9183-D95232E55469}']
    function HandleResult(invocationResult: PSafeArray): HResult; stdcall;
  end;

// *********************************************************************//
// Interface: IGlueWindowEventHandler
// Flags:     (256) OleAutomation
// GUID:      {FBCB4411-153C-4AAC-8DC8-DB696C931FEB}
// *********************************************************************//
  IGlueWindowEventHandler = interface(IUnknown)
    ['{FBCB4411-153C-4AAC-8DC8-DB696C931FEB}']
    function HandleChannelData(const glueWindow: IGlueWindow; 
                               const channelUpdate: IGlueContextUpdate): HResult; stdcall;
    function HandleChannelLeft(const glueWindow: IGlueWindow; const channel: IGlueContext): HResult; stdcall;
    function HandleWindowDestroyed(const glueWindow: IGlueWindow): HResult; stdcall;
  end;

// *********************************************************************//
// The Class CoAgmEventStreamSubscriber provides a Create and CreateRemote method to          
// create instances of the default interface IAgmEventStreamSubscriber exposed by              
// the CoClass AgmEventStreamSubscriber. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoAgmEventStreamSubscriber = class
    class function Create: IAgmEventStreamSubscriber;
    class function CreateRemote(const MachineName: string): IAgmEventStreamSubscriber;
  end;

// *********************************************************************//
// The Class CoAgmNameValuePair provides a Create and CreateRemote method to          
// create instances of the default interface IAgmNameValuePair exposed by              
// the CoClass AgmNameValuePair. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoAgmNameValuePair = class
    class function Create: IAgmNameValuePair;
    class function CreateRemote(const MachineName: string): IAgmNameValuePair;
  end;

// *********************************************************************//
// The Class CoAgmServerEventStream provides a Create and CreateRemote method to          
// create instances of the default interface IAgmServerEventStream exposed by              
// the CoClass AgmServerEventStream. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoAgmServerEventStream = class
    class function Create: IAgmServerEventStream;
    class function CreateRemote(const MachineName: string): IAgmServerEventStream;
  end;

// *********************************************************************//
// The Class CoAgmServerStreamMethod provides a Create and CreateRemote method to          
// create instances of the default interface IAgmServerStreamMethod exposed by              
// the CoClass AgmServerStreamMethod. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoAgmServerStreamMethod = class
    class function Create: IAgmServerStreamMethod;
    class function CreateRemote(const MachineName: string): IAgmServerStreamMethod;
  end;

// *********************************************************************//
// The Class CoAgm provides a Create and CreateRemote method to          
// create instances of the default interface IAgm exposed by              
// the CoClass Agm. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoAgm = class
    class function Create: IAgm;
    class function CreateRemote(const MachineName: string): IAgm;
  end;

// *********************************************************************//
// The Class CoAgmArgsCollection provides a Create and CreateRemote method to          
// create instances of the default interface IAgmArgsCollection exposed by              
// the CoClass AgmArgsCollection. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoAgmArgsCollection = class
    class function Create: IAgmArgsCollection;
    class function CreateRemote(const MachineName: string): IAgmArgsCollection;
  end;

// *********************************************************************//
// The Class CoAgmClientMethod provides a Create and CreateRemote method to          
// create instances of the default interface IAgmClientMethod exposed by              
// the CoClass AgmClientMethod. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoAgmClientMethod = class
    class function Create: IAgmClientMethod;
    class function CreateRemote(const MachineName: string): IAgmClientMethod;
  end;

// *********************************************************************//
// The Class CoAgmClientMethodCollection provides a Create and CreateRemote method to          
// create instances of the default interface IAgmClientMethodCollection exposed by              
// the CoClass AgmClientMethodCollection. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoAgmClientMethodCollection = class
    class function Create: IAgmClientMethodCollection;
    class function CreateRemote(const MachineName: string): IAgmClientMethodCollection;
  end;

// *********************************************************************//
// The Class CoAgmConfiguration provides a Create and CreateRemote method to          
// create instances of the default interface IAgmConfiguration exposed by              
// the CoClass AgmConfiguration. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoAgmConfiguration = class
    class function Create: IAgmConfiguration;
    class function CreateRemote(const MachineName: string): IAgmConfiguration;
  end;

// *********************************************************************//
// The Class CoAgmDisplayContext provides a Create and CreateRemote method to          
// create instances of the default interface IAgmDisplayContext exposed by              
// the CoClass AgmDisplayContext. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoAgmDisplayContext = class
    class function Create: IAgmDisplayContext;
    class function CreateRemote(const MachineName: string): IAgmDisplayContext;
  end;

// *********************************************************************//
// The Class CoAgmError provides a Create and CreateRemote method to          
// create instances of the default interface IAgmError exposed by              
// the CoClass AgmError. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoAgmError = class
    class function Create: IAgmError;
    class function CreateRemote(const MachineName: string): IAgmError;
  end;

// *********************************************************************//
// The Class CoAgmInstance provides a Create and CreateRemote method to          
// create instances of the default interface IAgmInstance exposed by              
// the CoClass AgmInstance. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoAgmInstance = class
    class function Create: IAgmInstance;
    class function CreateRemote(const MachineName: string): IAgmInstance;
  end;

// *********************************************************************//
// The Class CoAgmMethodParameter provides a Create and CreateRemote method to          
// create instances of the default interface IAgmMethodParameter exposed by              
// the CoClass AgmMethodParameter. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoAgmMethodParameter = class
    class function Create: IAgmMethodParameter;
    class function CreateRemote(const MachineName: string): IAgmMethodParameter;
  end;

// *********************************************************************//
// The Class CoAgmMethodParameterCollection provides a Create and CreateRemote method to          
// create instances of the default interface IAgmMethodParameterCollection exposed by              
// the CoClass AgmMethodParameterCollection. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoAgmMethodParameterCollection = class
    class function Create: IAgmMethodParameterCollection;
    class function CreateRemote(const MachineName: string): IAgmMethodParameterCollection;
  end;

// *********************************************************************//
// The Class CoAgmMethodRequest provides a Create and CreateRemote method to          
// create instances of the default interface IAgmMethodRequest exposed by              
// the CoClass AgmMethodRequest. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoAgmMethodRequest = class
    class function Create: IAgmMethodRequest;
    class function CreateRemote(const MachineName: string): IAgmMethodRequest;
  end;

// *********************************************************************//
// The Class CoAgmMethodSignature provides a Create and CreateRemote method to          
// create instances of the default interface IAgmMethodSignature exposed by              
// the CoClass AgmMethodSignature. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoAgmMethodSignature = class
    class function Create: IAgmMethodSignature;
    class function CreateRemote(const MachineName: string): IAgmMethodSignature;
  end;

// *********************************************************************//
// The Class CoAgmServerInstanceCollection provides a Create and CreateRemote method to          
// create instances of the default interface IAgmServerInstanceCollection exposed by              
// the CoClass AgmServerInstanceCollection. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoAgmServerInstanceCollection = class
    class function Create: IAgmServerInstanceCollection;
    class function CreateRemote(const MachineName: string): IAgmServerInstanceCollection;
  end;

// *********************************************************************//
// The Class CoAgmServerInstance provides a Create and CreateRemote method to          
// create instances of the default interface IAgmServerInstance exposed by              
// the CoClass AgmServerInstance. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoAgmServerInstance = class
    class function Create: IAgmServerInstance;
    class function CreateRemote(const MachineName: string): IAgmServerInstance;
  end;

// *********************************************************************//
// The Class CoAgmServerMethod provides a Create and CreateRemote method to          
// create instances of the default interface IAgmServerMethod exposed by              
// the CoClass AgmServerMethod. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoAgmServerMethod = class
    class function Create: IAgmServerMethod;
    class function CreateRemote(const MachineName: string): IAgmServerMethod;
  end;

// *********************************************************************//
// The Class CoAgmMethodResult provides a Create and CreateRemote method to          
// create instances of the default interface IAgmMethodResult exposed by              
// the CoClass AgmMethodResult. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoAgmMethodResult = class
    class function Create: IAgmMethodResult;
    class function CreateRemote(const MachineName: string): IAgmMethodResult;
  end;

// *********************************************************************//
// The Class CoAgmMethodResultCollection provides a Create and CreateRemote method to          
// create instances of the default interface IAgmMethodResultCollection exposed by              
// the CoClass AgmMethodResultCollection. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoAgmMethodResultCollection = class
    class function Create: IAgmMethodResultCollection;
    class function CreateRemote(const MachineName: string): IAgmMethodResultCollection;
  end;

// *********************************************************************//
// The Class CoAgmStreamStatus provides a Create and CreateRemote method to          
// create instances of the default interface IAgmStreamStatus exposed by              
// the CoClass AgmStreamStatus. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoAgmStreamStatus = class
    class function Create: IAgmStreamStatus;
    class function CreateRemote(const MachineName: string): IAgmStreamStatus;
  end;

// *********************************************************************//
// The Class CoAgmStreamSubscription provides a Create and CreateRemote method to          
// create instances of the default interface IAgmStreamSubscription exposed by              
// the CoClass AgmStreamSubscription. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoAgmStreamSubscription = class
    class function Create: IAgmStreamSubscription;
    class function CreateRemote(const MachineName: string): IAgmStreamSubscription;
  end;

// *********************************************************************//
// The Class CoAgmWindowBounds provides a Create and CreateRemote method to          
// create instances of the default interface IAgmWindowBounds exposed by              
// the CoClass AgmWindowBounds. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoAgmWindowBounds = class
    class function Create: IAgmWindowBounds;
    class function CreateRemote(const MachineName: string): IAgmWindowBounds;
  end;

// *********************************************************************//
// The Class CoAgmContextValue provides a Create and CreateRemote method to          
// create instances of the default interface IAgmContextValue exposed by              
// the CoClass AgmContextValue. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoAgmContextValue = class
    class function Create: IAgmContextValue;
    class function CreateRemote(const MachineName: string): IAgmContextValue;
  end;

// *********************************************************************//
// The Class CoReflectBase provides a Create and CreateRemote method to          
// create instances of the default interface IReflect exposed by              
// the CoClass ReflectBase. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoReflectBase = class
    class function Create: IReflect;
    class function CreateRemote(const MachineName: string): IReflect;
  end;

// *********************************************************************//
// The Class CoGlueAgmException provides a Create and CreateRemote method to          
// create instances of the default interface _GlueAgmException exposed by              
// the CoClass GlueAgmException. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoGlueAgmException = class
    class function Create: _GlueAgmException;
    class function CreateRemote(const MachineName: string): _GlueAgmException;
  end;

// *********************************************************************//
// The Class CoGlue42 provides a Create and CreateRemote method to          
// create instances of the default interface _Glue42 exposed by              
// the CoClass Glue42. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoGlue42 = class
    class function Create: _Glue42;
    class function CreateRemote(const MachineName: string): _Glue42;
  end;

implementation

uses System.Win.ComObj;

class function CoAgmEventStreamSubscriber.Create: IAgmEventStreamSubscriber;
begin
  Result := CreateComObject(CLASS_AgmEventStreamSubscriber) as IAgmEventStreamSubscriber;
end;

class function CoAgmEventStreamSubscriber.CreateRemote(const MachineName: string): IAgmEventStreamSubscriber;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_AgmEventStreamSubscriber) as IAgmEventStreamSubscriber;
end;

class function CoAgmNameValuePair.Create: IAgmNameValuePair;
begin
  Result := CreateComObject(CLASS_AgmNameValuePair) as IAgmNameValuePair;
end;

class function CoAgmNameValuePair.CreateRemote(const MachineName: string): IAgmNameValuePair;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_AgmNameValuePair) as IAgmNameValuePair;
end;

class function CoAgmServerEventStream.Create: IAgmServerEventStream;
begin
  Result := CreateComObject(CLASS_AgmServerEventStream) as IAgmServerEventStream;
end;

class function CoAgmServerEventStream.CreateRemote(const MachineName: string): IAgmServerEventStream;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_AgmServerEventStream) as IAgmServerEventStream;
end;

class function CoAgmServerStreamMethod.Create: IAgmServerStreamMethod;
begin
  Result := CreateComObject(CLASS_AgmServerStreamMethod) as IAgmServerStreamMethod;
end;

class function CoAgmServerStreamMethod.CreateRemote(const MachineName: string): IAgmServerStreamMethod;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_AgmServerStreamMethod) as IAgmServerStreamMethod;
end;

class function CoAgm.Create: IAgm;
begin
  Result := CreateComObject(CLASS_Agm) as IAgm;
end;

class function CoAgm.CreateRemote(const MachineName: string): IAgm;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_Agm) as IAgm;
end;

class function CoAgmArgsCollection.Create: IAgmArgsCollection;
begin
  Result := CreateComObject(CLASS_AgmArgsCollection) as IAgmArgsCollection;
end;

class function CoAgmArgsCollection.CreateRemote(const MachineName: string): IAgmArgsCollection;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_AgmArgsCollection) as IAgmArgsCollection;
end;

class function CoAgmClientMethod.Create: IAgmClientMethod;
begin
  Result := CreateComObject(CLASS_AgmClientMethod) as IAgmClientMethod;
end;

class function CoAgmClientMethod.CreateRemote(const MachineName: string): IAgmClientMethod;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_AgmClientMethod) as IAgmClientMethod;
end;

class function CoAgmClientMethodCollection.Create: IAgmClientMethodCollection;
begin
  Result := CreateComObject(CLASS_AgmClientMethodCollection) as IAgmClientMethodCollection;
end;

class function CoAgmClientMethodCollection.CreateRemote(const MachineName: string): IAgmClientMethodCollection;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_AgmClientMethodCollection) as IAgmClientMethodCollection;
end;

class function CoAgmConfiguration.Create: IAgmConfiguration;
begin
  Result := CreateComObject(CLASS_AgmConfiguration) as IAgmConfiguration;
end;

class function CoAgmConfiguration.CreateRemote(const MachineName: string): IAgmConfiguration;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_AgmConfiguration) as IAgmConfiguration;
end;

class function CoAgmDisplayContext.Create: IAgmDisplayContext;
begin
  Result := CreateComObject(CLASS_AgmDisplayContext) as IAgmDisplayContext;
end;

class function CoAgmDisplayContext.CreateRemote(const MachineName: string): IAgmDisplayContext;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_AgmDisplayContext) as IAgmDisplayContext;
end;

class function CoAgmError.Create: IAgmError;
begin
  Result := CreateComObject(CLASS_AgmError) as IAgmError;
end;

class function CoAgmError.CreateRemote(const MachineName: string): IAgmError;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_AgmError) as IAgmError;
end;

class function CoAgmInstance.Create: IAgmInstance;
begin
  Result := CreateComObject(CLASS_AgmInstance) as IAgmInstance;
end;

class function CoAgmInstance.CreateRemote(const MachineName: string): IAgmInstance;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_AgmInstance) as IAgmInstance;
end;

class function CoAgmMethodParameter.Create: IAgmMethodParameter;
begin
  Result := CreateComObject(CLASS_AgmMethodParameter) as IAgmMethodParameter;
end;

class function CoAgmMethodParameter.CreateRemote(const MachineName: string): IAgmMethodParameter;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_AgmMethodParameter) as IAgmMethodParameter;
end;

class function CoAgmMethodParameterCollection.Create: IAgmMethodParameterCollection;
begin
  Result := CreateComObject(CLASS_AgmMethodParameterCollection) as IAgmMethodParameterCollection;
end;

class function CoAgmMethodParameterCollection.CreateRemote(const MachineName: string): IAgmMethodParameterCollection;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_AgmMethodParameterCollection) as IAgmMethodParameterCollection;
end;

class function CoAgmMethodRequest.Create: IAgmMethodRequest;
begin
  Result := CreateComObject(CLASS_AgmMethodRequest) as IAgmMethodRequest;
end;

class function CoAgmMethodRequest.CreateRemote(const MachineName: string): IAgmMethodRequest;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_AgmMethodRequest) as IAgmMethodRequest;
end;

class function CoAgmMethodSignature.Create: IAgmMethodSignature;
begin
  Result := CreateComObject(CLASS_AgmMethodSignature) as IAgmMethodSignature;
end;

class function CoAgmMethodSignature.CreateRemote(const MachineName: string): IAgmMethodSignature;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_AgmMethodSignature) as IAgmMethodSignature;
end;

class function CoAgmServerInstanceCollection.Create: IAgmServerInstanceCollection;
begin
  Result := CreateComObject(CLASS_AgmServerInstanceCollection) as IAgmServerInstanceCollection;
end;

class function CoAgmServerInstanceCollection.CreateRemote(const MachineName: string): IAgmServerInstanceCollection;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_AgmServerInstanceCollection) as IAgmServerInstanceCollection;
end;

class function CoAgmServerInstance.Create: IAgmServerInstance;
begin
  Result := CreateComObject(CLASS_AgmServerInstance) as IAgmServerInstance;
end;

class function CoAgmServerInstance.CreateRemote(const MachineName: string): IAgmServerInstance;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_AgmServerInstance) as IAgmServerInstance;
end;

class function CoAgmServerMethod.Create: IAgmServerMethod;
begin
  Result := CreateComObject(CLASS_AgmServerMethod) as IAgmServerMethod;
end;

class function CoAgmServerMethod.CreateRemote(const MachineName: string): IAgmServerMethod;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_AgmServerMethod) as IAgmServerMethod;
end;

class function CoAgmMethodResult.Create: IAgmMethodResult;
begin
  Result := CreateComObject(CLASS_AgmMethodResult) as IAgmMethodResult;
end;

class function CoAgmMethodResult.CreateRemote(const MachineName: string): IAgmMethodResult;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_AgmMethodResult) as IAgmMethodResult;
end;

class function CoAgmMethodResultCollection.Create: IAgmMethodResultCollection;
begin
  Result := CreateComObject(CLASS_AgmMethodResultCollection) as IAgmMethodResultCollection;
end;

class function CoAgmMethodResultCollection.CreateRemote(const MachineName: string): IAgmMethodResultCollection;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_AgmMethodResultCollection) as IAgmMethodResultCollection;
end;

class function CoAgmStreamStatus.Create: IAgmStreamStatus;
begin
  Result := CreateComObject(CLASS_AgmStreamStatus) as IAgmStreamStatus;
end;

class function CoAgmStreamStatus.CreateRemote(const MachineName: string): IAgmStreamStatus;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_AgmStreamStatus) as IAgmStreamStatus;
end;

class function CoAgmStreamSubscription.Create: IAgmStreamSubscription;
begin
  Result := CreateComObject(CLASS_AgmStreamSubscription) as IAgmStreamSubscription;
end;

class function CoAgmStreamSubscription.CreateRemote(const MachineName: string): IAgmStreamSubscription;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_AgmStreamSubscription) as IAgmStreamSubscription;
end;

class function CoAgmWindowBounds.Create: IAgmWindowBounds;
begin
  Result := CreateComObject(CLASS_AgmWindowBounds) as IAgmWindowBounds;
end;

class function CoAgmWindowBounds.CreateRemote(const MachineName: string): IAgmWindowBounds;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_AgmWindowBounds) as IAgmWindowBounds;
end;

class function CoAgmContextValue.Create: IAgmContextValue;
begin
  Result := CreateComObject(CLASS_AgmContextValue) as IAgmContextValue;
end;

class function CoAgmContextValue.CreateRemote(const MachineName: string): IAgmContextValue;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_AgmContextValue) as IAgmContextValue;
end;

class function CoReflectBase.Create: IReflect;
begin
  Result := CreateComObject(CLASS_ReflectBase) as IReflect;
end;

class function CoReflectBase.CreateRemote(const MachineName: string): IReflect;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_ReflectBase) as IReflect;
end;

class function CoGlueAgmException.Create: _GlueAgmException;
begin
  Result := CreateComObject(CLASS_GlueAgmException) as _GlueAgmException;
end;

class function CoGlueAgmException.CreateRemote(const MachineName: string): _GlueAgmException;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_GlueAgmException) as _GlueAgmException;
end;

class function CoGlue42.Create: _Glue42;
begin
  Result := CreateComObject(CLASS_Glue42) as _Glue42;
end;

class function CoGlue42.CreateRemote(const MachineName: string): _Glue42;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_Glue42) as _Glue42;
end;

end.
