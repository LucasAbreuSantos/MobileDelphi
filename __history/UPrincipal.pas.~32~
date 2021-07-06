unit UPrincipal;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Objects,
  FMX.Layouts, FMX.Controls.Presentation, FMX.StdCtrls, FMX.ListView.Types,
  FMX.ListView.Appearances, FMX.ListView.Adapters.Base, FMX.ListView;

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
    LayoutIndCenter: TLayout;
    LayoutIndReceitas: TLayout;
    Img_Receita: TImage;
    lblReceita: TLabel;
    lblReceitaDesc: TLabel;
    LayoutIndDespesas: TLayout;
    Img_Despesa: TImage;
    lblDespesas: TLabel;
    lblDespesasDesc: TLabel;
    RectBottom: TRectangle;
    ImgAdd: TImage;
    RectInformacao: TRectangle;
    LayoutOpcInformacao: TLayout;
    lblUltLanc: TLabel;
    lblVerTodos: TLabel;
    lvLancamento: TListView;
    Image_Categoria: TImage;
    procedure FormShow(Sender: TObject);
    procedure lvLancamentoUpdateObjects(const Sender: TObject;
      const AItem: TListViewItem);
    procedure lvLancamentoItemClick(const Sender: TObject;
      const AItem: TListViewItem);
    procedure lvLancamentoItemClickEx(const Sender: TObject; ItemIndex: Integer;
      const LocalClickPos: TPointF; const ItemObject: TListItemDrawable);
    procedure lvLancamentoPaint(Sender: TObject; Canvas: TCanvas;
      const ARect: TRectF);
  private
    { Private declarations }
    procedure AddLancamento(id_lancamento, descricao, categoria : String; dt: TDateTime; Valor : Double; Foto : TStream);
  public
    { Public declarations }
  end;

var
  FrmPrincipal: TFrmPrincipal;

implementation

{$R *.fmx}

procedure TFrmPrincipal.AddLancamento(id_lancamento,
                                      descricao,
                                      categoria : String;
                                      dt: TDateTime;
                                      Valor: Double;
                                      Foto: TStream);
var
   txt : TListItemText;
   img : TListItemImage;
   bmp : TBitmap;
begin

   With lvLancamento.Items.Add do
   Begin
     //Adiciona a tagstring da list_view
     TagString := id_lancamento;

     //Dessa forma
     txt := TListItemText(Objects.FindDrawable('txtDescricao'));
     txt.Text := descricao;

     // ou dessa forma mais simples..
     TListItemText(Objects.FindDrawable('txtCategoria')).Text := categoria;
     TListItemText(Objects.FindDrawable('txtValor')).Text     := FormatFloat('#,##0.00',Valor);
     TListItemText(Objects.FindDrawable('txtData')).Text      := FormatDateTime('dd/mm',dt);

     //Imagem
     img := TListItemImage(Objects.FindDrawable('ImageIcone'));

     if Foto <> nil then
     Begin

       //Quem vai destruir nesse caso é o proprio delphi na ListView
       bmp := TBitmap.Create;
       bmp.LoadFromStream(Foto);

       img.OwnsBitmap := True;
       img.Bitmap := bmp;

     End;


   End;

end;

procedure TFrmPrincipal.FormShow(Sender: TObject);
var
  Foto : TStream;
  I: Integer;
begin

  //Instancia a stream da foto e porenquanto carrega a foto do image;
  //O "Foto.Position" garante que a imagem vai ser carregada da posição zero dela.

  Foto := TMemoryStream.Create;
  Image_Categoria.Bitmap.SaveToStream(Foto); // Salva a Bitmap da imagem na Stream Foto;
  Foto.Position := 0;

  for I := 1 to 10 do
   AddLancamento('0001','Código de Passagem','Tranporte', date ,-45, foto);

  Foto.DisposeOf; //Destroi a variavel TStream;

end;

procedure TFrmPrincipal.lvLancamentoItemClick(const Sender: TObject;
  const AItem: TListViewItem);
begin
   //Adicionado ao adicionar o Item
   //ShowMessage(AItem.TagString);

   //Ex: Aumenta e diminui o Item...
   {if(AItem.Height > 199)then
     AItem.Height := 60
    else
     AItem.Height := 200;}

end;

procedure TFrmPrincipal.lvLancamentoItemClickEx(const Sender: TObject;
  ItemIndex: Integer; const LocalClickPos: TPointF;
  const ItemObject: TListItemDrawable);
begin
  //Clique do Objeto do Item da ListView
  if(TListView(Sender).Selected <> nil)then
  Begin
    if(ItemObject is TListItemImage)then
    Begin
      //Verifica se é um objeto imagem.
      //Ex de uso:
      //Img_Despesa.Bitmap := TListItemImage(ItemObject).Bitmap;
    End
    else if (ItemObject is TListItemText) then
    Begin
      //Verifica se é um objeto de Texto
      //Ex de uso:
      //ShowMessage(TListItemText(ItemObject).Text);
    End;
  End;
end;

procedure TFrmPrincipal.lvLancamentoPaint(Sender: TObject; Canvas: TCanvas;
  const ARect: TRectF);
begin
  //List View infinito carregando a cada ultimos 4 itens = "lvLancamento.Items.Count - 4".
  if(lvLancamento.Items.Count > 0)then
  Begin
     if(lvLancamento.GetItemRect(lvLancamento.Items.Count - 4).Bottom <= lvLancamento.Height)then
     Begin
       //Aqui carregaria com mais itens..
       AddLancamento('0001','Compra Supermercado','Transporte', 45.0, date, nil);
       AddLancamento('0001','Compra Supermercado','Transporte', 45.0, date, nil);
     End;
  End;
end;

procedure TFrmPrincipal.lvLancamentoUpdateObjects(const Sender: TObject;
  const AItem: TListViewItem);
var
  txt : TListItemText;
  //img : TListItemImage;
begin

  //Usando a variavel
  txt := TListItemText(AItem.Objects.FindDrawable('txtDescricao'));
  txt.Width := lvLancamento.Width - txt.PlaceOffset.X - 90;

  {img := TListItemImage(AItem.Objects.FindDrawable('ImageIcone'));

  if(lvLancamento.Width < 200)then
  Begin
    img.Visible := False;
    txt.PlaceOffset.X := 3;
    //Fazendo direto
    TListItemText(AItem.Objects.FindDrawable('txtCategoria')).PlaceOffset.X := 3;
  End; }

end;

end.
