unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtDlgs, XPMan;

type
  TForm1 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    ComboBox1: TComboBox;
    Button3: TButton;
    Button4: TButton;
    OpenDialog1: TOpenDialog;
    SaveDialog1: TSaveDialog;
    XPManifest1: TXPManifest;
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

function VD_Initialize(): DWORD; stdcall; external 'VirtualDisk.dll';
function VD_MountDisk(DriveLetter: Char; FileName: WideString; FileSize: TLargeInteger; Key: WideString; ReadOnly: Boolean): DWORD; stdcall; external 'VirtualDisk.dll';
function VD_UnMountDisk(DriveLetter: Char; ForceUnMount: Boolean): DWORD; stdcall; external 'VirtualDisk.dll';
function VD_QueryDiskFileName(DriveLetter: Char; var FileName: WideString): DWORD; stdcall; external 'VirtualDisk.dll';
function VD_InstallDriver(DriverPath: WideString; StartType: DWORD = $00000003): DWORD; stdcall; external 'VirtualDisk.dll';
function VD_UnInstallDriver: DWORD; stdcall; external 'VirtualDisk.dll';
function VD_StartDriver: DWORD; stdcall; external 'VirtualDisk.dll';
function VD_StopDriver: DWORD; stdcall; external 'VirtualDisk.dll';

function IsWow64Process(hProcess: THandle; var Wow64Process: BOOL): BOOL; stdcall; external kernel32 name 'IsWow64Process';

implementation

uses Math;

{$R *.dfm}

function Is64BitWindows: Boolean;
var
  IsWow64Result: BOOL;
begin
  try
{$IFDEF WIN64 }
    Result := True;
{$ELSE }
    IsWow64Process(GetCurrentProcess, IsWow64Result);
    Result := Boolean(IsWow64Result);
{$ENDIF }
  except
  end;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  Font:= Screen.HintFont;
  VD_Initialize();
  if Is64BitWindows then
    VD_InstallDriver(GetCurrentDir + '\VirtualDisk64.sys')
  else
    VD_InstallDriver(GetCurrentDir + '\VirtualDisk32.sys');
  VD_StartDriver;
end;

procedure TForm1.Button1Click(Sender: TObject);
var
  FileName: WideString;
  LastError: DWORD;
begin
  if Edit2.Text = '' then
  begin
    MessageBox(Handle, PChar('Пароль не может быть пустым!!!'), PChar(''), 0);
    Exit;
  end;

  if Edit1.Text = '' then
  begin
    MessageBox(Handle, PChar('Укажите имя файла!!!'), PChar(''), 0);
    Exit;
  end;

  if VD_QueryDiskFileName('M', FileName) <> ERROR_SUCCESS then //Диск ещё не смонтирован
  begin
    case ComboBox1.ItemIndex of
      0:
        LastError:= VD_MountDisk('M', Edit1.Text, StrToInt64(Edit3.Text) * 1024, Edit2.Text, False);
      1:
        LastError:= VD_MountDisk('M', Edit1.Text, StrToInt64(Edit3.Text) * 1024 * 1024, Edit2.Text, False);
      2:
        LastError:= VD_MountDisk('M', Edit1.Text, StrToInt64(Edit3.Text) * 1024 * 1024 * 1024, Edit2.Text, False);
    end;

    if LastError <> ERROR_SUCCESS then
      MessageBox(Handle, PChar('Невозможно смонтировать диск: ' + SysErrorMessage(LastError)), PChar('Ошибка'), 0)
    else
      MessageBox(Handle, PChar('Диск успешно смонтирован как диск M:'), PChar(''), 0)
  end
  else
  begin
    MessageBox(Handle, PChar('Диск уже смонтирован как диск M:'), PChar('Ошибка'), 0);
  end;
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  if VD_UnMountDisk('M', False) <> ERROR_SUCCESS then
  begin
    if MessageBox(Handle, PChar('Невозможно размонтировать диск!' + #13#10 + #13#10 +
       'Размонтировать диск принудительно? Данные наверняка будут повреждены!!!'), PChar('Ошибка'), MB_YESNO) = IDYES then
       VD_UnMountDisk('M', True);
  end;
end;

procedure TForm1.Button3Click(Sender: TObject);
begin
  if OpenDialog1.Execute then
    Edit1.Text:= OpenDialog1.FileName;
end;

procedure TForm1.Button4Click(Sender: TObject);
begin
  if SaveDialog1.Execute then
    Edit1.Text:= SaveDialog1.FileName;
end;

end.
