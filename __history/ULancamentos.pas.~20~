unit ULancamentos;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Objects,
  FMX.Controls.Presentation, FMX.StdCtrls, FMX.Layouts, FMX.ListView.Types,
  FMX.ListView.Appearances, FMX.ListView.Adapters.Base, FMX.ListView;

type
  TFrmLancamentos = class(TForm)
    LayoutTop: TLayout;
    lblTitulo: TLabel;
    ImgFotoVoltar: TImage;
    LayoutTop1: TLayout;
    ImgAnterior: TImage;
    ImgProximo: TImage;
    ImgBotao: TImage;
    lbl_mes: TLabel;
    Rectangle1: TRectangle;
    Layout1: TLayout;
    lblReceitaDesc: TLabel;
    lblReceita: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    ImgAdd: TImage;
    lvLancamento: TListView;
    procedure ImgFotoVoltarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure lvLancamentoUpdateObjects(const Sender: TObject;
      const AItem: TListViewItem);
    procedure lvLancamentoItemClick(const Sender: TObject;
      const AItem: TListViewItem);
    procedure ImgAddClick(Sender: TObject);
  private
    { Private declarations }
    procedure EditarLancamento(id_lanc : string);
  public
    { Public declarations }
  end;

var
  FrmLancamentos: TFrmLancamentos;

implementation

{$R *.fmx}

uses UPrincipal, ULancamentosCad;

procedure TFrmLancamentos.EditarLancamento(id_lanc: string);
begin

   if not Assigned(FrmLancamentosCad) then
    Application.CreateForm(TFrmLancamentosCad,FrmLancamentosCad);

   FrmLancamentosCad.Show;

end;

procedure TFrmLancamentos.FormClose(Sender: TObject; var Action: TCloseAction);
begin

  if(Assigned(FrmLancamentosCad))then
  Begin
    FrmLancamentosCad.DisposeOf;
    FrmLancamentosCad := Nil;
  End;

end;

procedure TFrmLancamentos.FormShow(Sender: TObject);
var
  Foto : TStream;
  I: Integer;
begin

  //Instancia a stream da foto e porenquanto carrega a foto do image;
  //O "Foto.Position" garante que a imagem vai ser carregada da posição zero dela.

  Foto := TMemoryStream.Create;
  FrmPrincipal.Image_Categoria.Bitmap.SaveToStream(Foto); // Salva a Bitmap da imagem na Stream Foto;
  Foto.Position := 0;

  for I := 1 to 10 do
  Begin
     With FrmPrincipal do
     Begin
       AddLancamento(FrmLancamentos.lvLancamento,'0001','Código de Passagem','Tranporte', date ,-45, foto);
     End;
  End;

  Foto.DisposeOf; //Destroi a variavel TStream;

end;

procedure TFrmLancamentos.ImgAddClick(Sender: TObject);
begin
  EditarLancamento('');
end;

procedure TFrmLancamentos.ImgFotoVoltarClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmLancamentos.lvLancamentoItemClick(const Sender: TObject;
  const AItem: TListViewItem);
begin

  EditarLancamento('');

end;

procedure TFrmLancamentos.lvLancamentoUpdateObjects(const Sender: TObject;
  const AItem: TListViewItem);
begin
  FrmPrincipal.SetupLancamento(lvLancamento,AItem);
end;

end.
