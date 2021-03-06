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
    StyleBook1: TStyleBook;
    procedure FormShow(Sender: TObject);
    procedure lvLancamentoUpdateObjects(const Sender: TObject;
      const AItem: TListViewItem);
    procedure lvLancamentoItemClick(const Sender: TObject;
      const AItem: TListViewItem);
    procedure lvLancamentoItemClickEx(const Sender: TObject; ItemIndex: Integer;
      const LocalClickPos: TPointF; const ItemObject: TListItemDrawable);
    procedure lvLancamentoPaint(Sender: TObject; Canvas: TCanvas;
      const ARect: TRectF);
    procedure lblVerTodosClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure AddLancamento(listView : TListView; id_lancamento, descricao, categoria : String; dt: TDateTime; Valor : Currency; Foto : TStream);
    procedure SetupLancamento(listView : TListView;item : TListViewItem);
  end;

var
  FrmPrincipal: TFrmPrincipal;

implementation

{$R *.fmx}

uses ULancamentos;

procedure TFrmPrincipal.AddLancamento(listView : TListView;
                                      id_lancamento,
                                      descricao,
                                      categoria : String;
                                      dt: TDateTime;
                                      Valor: Currency;
                                      Foto: TStream);
var
   txt : TListItemText;
   img : TListItemImage;
   bmp : TBitmap;
begin

   With listView.Items.Add do
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

       //Quem vai destruir nesse caso ? o proprio delphi na ListView
       bmp := TBitmap.Create;
       bmp.LoadFromStream(Foto);

       img.OwnsBitmap := True;
       img.Bitmap := bmp;

     End;


   End;

end;

procedure TFrmPrincipal.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  //Destroi o formulario de lan?amentos no fechamento do formulario principal;
  if(Assigned(FrmLancamentos))then
  Begin
    FrmLancamentos.DisposeOf;
    FrmLancamentos := nil;
  End;

end;

procedure TFrmPrincipal.FormShow(Sender: TObject);
var
  Foto : TStream;
  I: Integer;
begin

  //Instancia a stream da foto e porenquanto carrega a foto do image;
  //O "Foto.Position" garante que a imagem vai ser carregada da posi??o zero dela.

  Foto := TMemoryStream.Create;
  Image_Categoria.Bitmap.SaveToStream(Foto); // Salva a Bitmap da imagem na Stream Foto;
  Foto.Position := 0;

  for I := 1 to 10 do
   AddLancamento(FrmPrincipal.lvLancamento,'0001','C?digo de Passagem','Tranporte', date ,-45, foto);

  Foto.DisposeOf; //Destroi a variavel TStream;

end;

procedure TFrmPrincipal.lblVerTodosClick(Sender: TObject);
begin

   if not Assigned(FrmLancamentos) then
     Application.CreateForm(TFrmLancamentos,FrmLancamentos);

   FrmLancamentos.Show;

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
      //Verifica se ? um objeto imagem.
      //Ex de uso:
      //Img_Despesa.Bitmap := TListItemImage(ItemObject).Bitmap;
    End
    else if (ItemObject is TListItemText) then
    Begin
      //Verifica se ? um objeto de Texto
      //Ex de uso:
      //ShowMessage(TListItemText(ItemObject).Text);
    End;
  End;
end;

procedure TFrmPrincipal.lvLancamentoPaint(Sender: TObject; Canvas: TCanvas;
  const ARect: TRectF);
var
  Foto : TStream;
begin
  //List View infinito carregando a cada ultimos 4 itens = "lvLancamento.Items.Count - 4".
  if(lvLancamento.Items.Count > 0)then
  Begin
     if(lvLancamento.GetItemRect(lvLancamento.Items.Count - 4).Bottom <= lvLancamento.Height)then
     Begin

       //Aqui carregaria com mais itens..
       Foto := TMemoryStream.Create;
       Image_Categoria.Bitmap.SaveToStream(Foto);
       Foto.Position := 0;

       AddLancamento(FrmPrincipal.lvLancamento,'0001','Compra Supermercado','Transporte', date, -45, foto);
       AddLancamento(FrmPrincipal.lvLancamento,'0001','Compra Supermercado','Transporte', date, -45, foto);

       Foto.DisposeOf;

     End;
  End;
end;

procedure TFrmPrincipal.lvLancamentoUpdateObjects(const Sender: TObject;
  const AItem: TListViewItem);
begin

  SetupLancamento(lvLancamento,Aitem);

end;

procedure TFrmPrincipal.SetupLancamento(listView : TListView; item: TListViewItem);
var
  txt : TListItemText;
  //img : TListItemImage;
begin

  //Usando a variavel
  txt := TListItemText(Item.Objects.FindDrawable('txtDescricao'));
  txt.Width := listView.Width - txt.PlaceOffset.X - 90;

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
