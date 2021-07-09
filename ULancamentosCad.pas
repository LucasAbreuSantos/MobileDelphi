unit ULancamentosCad;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Objects,
  FMX.Controls.Presentation, FMX.StdCtrls, FMX.Layouts, FMX.Edit,
  FMX.DateTimeCtrls;

type
  TFrmLancamentosCad = class(TForm)
    LayoutTop: TLayout;
    lblTitulo: TLabel;
    ImgFotoVoltar: TImage;
    Image1: TImage;
    RectExcluir: TRectangle;
    LayoutDespesa: TLayout;
    lblDespesa: TLabel;
    EdtDespesa: TEdit;
    LineDespesa: TLine;
    LayoutValor: TLayout;
    lblValor: TLabel;
    EdtValor: TEdit;
    LineValor: TLine;
    LayoutCategoria: TLayout;
    LblCategoria: TLabel;
    EdtCategoria: TEdit;
    LineCategoria: TLine;
    LayoutData: TLayout;
    LblData: TLabel;
    LineData: TLine;
    DateEdit1: TDateEdit;
    ImgHoje: TImage;
    ImgOntem: TImage;
    ImgExcluir: TImage;
    procedure ImgFotoVoltarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmLancamentosCad: TFrmLancamentosCad;

implementation

{$R *.fmx}

uses UPrincipal;

procedure TFrmLancamentosCad.ImgFotoVoltarClick(Sender: TObject);
begin
  Close;
end;

end.
