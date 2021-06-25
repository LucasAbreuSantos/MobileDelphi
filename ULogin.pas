unit ULogin;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Layouts,
  FMX.Objects, FMX.Controls.Presentation, FMX.Edit, FMX.StdCtrls, FMX.TabControl,
  System.Actions, FMX.ActnList, u99Permissions, FMX.MediaLibrary.Actions,
  {$IFDEF ANDROID}
    FMX.VirtualKeyBoard, FMX.Platform,
  {$ENDIF}
  FMX.StdActns;

type
  TFrmLogin = class(TForm)
    LayoutPrincipal: TLayout;
    LayoutLogin: TLayout;
    ImgLoginLogo: TImage;
    LayoutEmail: TLayout;
    RoundRect1: TRoundRect;
    EdtLoginEmail: TEdit;
    StyleBook1: TStyleBook;
    LayoutSenha: TLayout;
    RoundRect2: TRoundRect;
    EdtSenha: TEdit;
    LayoutAcessar: TLayout;
    RectLogin: TRoundRect;
    lblAcessar: TLabel;
    TabControl: TTabControl;
    TabLogin: TTabItem;
    TabConta: TTabItem;
    LayoutCriar: TLayout;
    ImageCriarLogo: TImage;
    LayoutCadNome: TLayout;
    RoundRect4: TRoundRect;
    Edt_Cad_Nome: TEdit;
    LayoutCadSenha: TLayout;
    RoundRect5: TRoundRect;
    Edt_Cad_Senha: TEdit;
    LayoutBtnProximo: TLayout;
    Rect_Conta_Proximo: TRoundRect;
    Label1: TLabel;
    LayoutCadEmail: TLayout;
    RoundRect7: TRoundRect;
    Edt_Cad_Email: TEdit;
    TabFoto: TTabItem;
    LayoutFoto: TLayout;
    C_foto_editar: TCircle;
    LayoutBotao: TLayout;
    RoundRect8: TRoundRect;
    Label2: TLabel;
    TabEscolhaFoto: TTabItem;
    LayoutEscolha: TLayout;
    Label3: TLabel;
    ImgCamera: TImage;
    ImgGaleria: TImage;
    LayoutVoltarFoto: TLayout;
    ImgFotoVoltar: TImage;
    LayoutVoltar: TLayout;
    ImgVoltarFotoSelecao: TImage;
    LayoutLoginCriarConta_Login: TLayout;
    LayoutCenter_Login: TLayout;
    lbl_Login_tab: TLabel;
    lbl_login_conta: TLabel;
    Rectangle: TRectangle;
    ActionList1: TActionList;
    ActConta: TChangeTabAction;
    ActEscolhaFoto: TChangeTabAction;
    ActFoto: TChangeTabAction;
    ActLogin: TChangeTabAction;
    LayoutLoginCriarConta_CriarContaa: TLayout;
    LayoutCenter_CriarConta: TLayout;
    LblConta_Login: TLabel;
    Label7: TLabel;
    Rectangle1: TRectangle;
    ActLibrary: TTakePhotoFromLibraryAction;
    ActCamera: TTakePhotoFromCameraAction;
    procedure lbl_login_contaClick(Sender: TObject);
    procedure LblConta_LoginClick(Sender: TObject);
    procedure Rect_Conta_ProximoClick(Sender: TObject);
    procedure ImgFotoVoltarClick(Sender: TObject);
    procedure C_foto_editarClick(Sender: TObject);
    procedure ImgVoltarFotoSelecaoClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure ImgCameraClick(Sender: TObject);
    procedure ImgGaleriaClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure ActCameraDidFinishTaking(Image: TBitmap);
    procedure ActLibraryDidFinishTaking(Image: TBitmap);
    procedure FormKeyUp(Sender: TObject; var Key: Word; var KeyChar: Char;
      Shift: TShiftState);
    procedure RectLoginClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }

    //T99Permissions � utilizada para solicitar a permiss�o..
    permissao : T99Permissions;

    procedure TrataErroPermissao(Sender : TObject);

  public
    { Public declarations }
  end;

var
  FrmLogin: TFrmLogin;

implementation

{$R *.fmx}

uses UPrincipal;


{$R *.LgXhdpiPh.fmx ANDROID}

procedure TFrmLogin.ActCameraDidFinishTaking(Image: TBitmap);
begin
   //Adiciona a imagem ao Circulo e logo ap�s muda para TabFoto.
   C_foto_editar.Fill.Bitmap.Bitmap := Image;
   ActFoto.Execute;
end;

procedure TFrmLogin.ActLibraryDidFinishTaking(Image: TBitmap);
begin
   C_foto_editar.Fill.Bitmap.Bitmap := Image;
   ActFoto.Execute;
end;

procedure TFrmLogin.C_foto_editarClick(Sender: TObject);
begin

  ActEscolhaFoto.Execute;

end;

procedure TFrmLogin.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  //Ao fechar remove o formulario da memoria;
  Action   := TCloseAction.caFree;
  FrmLogin := nil;
end;

procedure TFrmLogin.FormCreate(Sender: TObject);
begin
  permissao := T99Permissions.Create;
end;

procedure TFrmLogin.FormDestroy(Sender: TObject);
begin
  permissao.DisposeOf;
end;

procedure TFrmLogin.FormKeyUp(Sender: TObject; var Key: Word; var KeyChar: Char;
  Shift: TShiftState);
{$IFDEF ANDROID}
 var
   FService : IFMXVirtualKeyBoardService;
{$ENDIF}
begin

  {$IFDEF ANDROID}
     if (key = vkHardwareBack) then
     Begin

       TPlatformServices.Current.SupportsPlatformService(IFMXVirtualKeyBoardService,IInterface(FService));

       if (FService <> nil) and (TVirutalKeyBoardState.Visible in FService.VirtualKeyBoardState) then
       Begin
               // Botao back pressionado e teclado visivel
               // (Apenas fecha o teclado)
       End
       Else
       Begin
               // Botao back pressionado e teclado n�o visivel

               if not (TabControl.ActiveTab <> TabLogin)then
                 Key := 0;

               if(TabControl.ActiveTab = TabConta)then
                 ActLogin.Execute
               else if (TabControl.ActiveTab = TabFoto) then
                 ActConta.Execute
               else if (TabControl.ActiveTab = TabEscolhaFoto) then
                 ActFoto.Execute
               Else
                 close;
       End;

     End;
  {$ENDIF}

end;

procedure TFrmLogin.FormShow(Sender: TObject);
begin
  TabControl.ActiveTab := TabLogin;
end;

procedure TFrmLogin.ImgCameraClick(Sender: TObject);
begin
  permissao.Camera(ActCamera,TrataErroPermissao);
end;

procedure TFrmLogin.ImgFotoVoltarClick(Sender: TObject);
begin
  ActConta.Execute;
end;

procedure TFrmLogin.ImgGaleriaClick(Sender: TObject);
begin
  permissao.PhotoLibrary(ActLibrary, TrataErroPermissao);
end;

procedure TFrmLogin.ImgVoltarFotoSelecaoClick(Sender: TObject);
begin
  ActFoto.Execute;
end;

procedure TFrmLogin.LblConta_LoginClick(Sender: TObject);
begin
  ActLogin.Execute;
end;

procedure TFrmLogin.lbl_login_contaClick(Sender: TObject);
begin
   ActConta.Execute;
end;

procedure TFrmLogin.RectLoginClick(Sender: TObject);
begin

  //Acessa o Form Principal
  if not Assigned(FrmPrincipal) then
    Application.CreateForm(TFrmPrincipal,FrmPrincipal);

  Application.MainForm := FrmPrincipal;
  FrmPrincipal.Show;

  FrmLogin.Close;

end;

procedure TFrmLogin.Rect_Conta_ProximoClick(Sender: TObject);
begin
  //Utiliza a action para fazer o efeito de Deslizar.
  ActFoto.Execute;
end;

procedure TFrmLogin.TrataErroPermissao(Sender: TObject);
begin
  //Mostra a msg para caso de erro de permissao.
  ShowMessage('Voc� n�o possui permissao de acesso para esse recurso!');
end;

end.
