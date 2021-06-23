unit UPrincipal;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Objects,
  FMX.Layouts, FMX.Controls.Presentation, FMX.StdCtrls;

type
  TFrmPrincipal = class(TForm)
    LayoutPrincipal: TLayout;
    LayoutTop1: TLayout;
    Img_Menu: TImage;
    C_avatar: TCircle;
    Img_Notificacao: TImage;
    lblTitulo: TLabel;
    LayoutSaldo: TLayout;
    Label1: TLabel;
    Label2: TLabel;
    LayoutIndicadores: TLayout;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmPrincipal: TFrmPrincipal;

implementation

{$R *.fmx}

end.
