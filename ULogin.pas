unit ULogin;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Layouts,
  FMX.Objects, FMX.Controls.Presentation, FMX.Edit, FMX.StdCtrls, FMX.TabControl;

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
    RoundRect3: TRoundRect;
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
    RoundRect6: TRoundRect;
    Label1: TLabel;
    LayoutCadEmail: TLayout;
    RoundRect7: TRoundRect;
    Edt_Cad_Email: TEdit;
    TabFoto: TTabItem;
    LayoutFoto: TLayout;
    Circle1: TCircle;
    LayoutBotao: TLayout;
    RoundRect8: TRoundRect;
    Label2: TLabel;
    TabEscolhaFoto: TTabItem;
    LayoutEscolha: TLayout;
    Label3: TLabel;
    ImgCamera: TImage;
    Image1: TImage;
    Label4: TLabel;
    Label5: TLabel;
    LayoutVoltarFoto: TLayout;
    ImgVoltar: TImage;
    LayoutVoltar: TLayout;
    Image2: TImage;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmLogin: TFrmLogin;

implementation

{$R *.fmx}
{$R *.LgXhdpiPh.fmx ANDROID}

end.
