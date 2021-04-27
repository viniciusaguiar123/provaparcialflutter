// VINÍCIUS AGUIAR
// 827096


import 'package:flutter/material.dart';
import 'package:prova_parcial/ImagemWidget.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'Varejão',

    theme: ThemeData(
        primaryColor: Colors.blue[900],
        fontFamily: 'Roboto',
        textTheme: TextTheme(
          headline1: TextStyle(
            fontSize: 24, 
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
          headline2: TextStyle(
            fontSize: 24, 
            fontWeight: FontWeight.bold,
          ),
          headline3: TextStyle(
            fontSize: 24, 
            fontWeight: FontWeight.normal,
          ),
        )
      ),

    //ROTAS DE NAVEGAÇÃO
    initialRoute: '/login',
    routes: {
      '/login': (context) => TelaLogin(),
      '/menu': (context) => TelaMenu(),
      '/sobre': (context) => TelaSobre(),
      '/cliente': (context) => TelaCadastroCliente(),
      '/listView': (context) => ListViewSepareted(),
      '/compra': (context) => TelaCadastroCompra()
    },
  ));
}

//
// MODELO DE DADOS
// 
class Mensagem{
  final String usuario;
  final String senha;
  Mensagem(this.usuario,this.senha);
}



//
// TELA LOGIN
//
class TelaLogin extends StatefulWidget {
  @override
  _TelaLoginState createState() => _TelaLoginState();
}

class _TelaLoginState extends State<TelaLogin> {

  var txtUsuario = TextEditingController();
  var txtSenha = TextEditingController();
  var _formId = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Tela de Login'),
      automaticallyImplyLeading: false,
      centerTitle: true,),
      body: Container(
        key: _formId,
        width: double.infinity,
        padding: EdgeInsets.all(40),
        child: Column(
           
          children: [
          Icon(Icons.account_circle, size: 100, color: Colors.blueAccent),
          SizedBox(height: 40),
            campoTexto('Usuário', txtUsuario),
          SizedBox(height: 20),
          TextField(
            controller: txtSenha,
            keyboardType: TextInputType.multiline,
            maxLines: 1,
            obscureText: true,
            decoration: InputDecoration(  
              labelText: 'Senha',
              labelStyle: Theme.of(context).textTheme.headline3,
              border: OutlineInputBorder(),
              alignLabelWithHint: true,
            ),
          ),
          SizedBox(height: 20),
          botao('Entrar'),
          SizedBox(height: 215),
          OutlinedButton(
            child: Text('sobre'),
            onPressed: () {

              Navigator.pushNamed(
                context, 
                '/sobre',

              );
            },
          ),

          //
          // TROCA DE DADOS ENTRE AS TELAS
          //
         
          SizedBox(height: 10),

 
        ]),
        
      ),
    );
  }
  Widget botao(rotulo){
    return Container(
      padding: EdgeInsets.only(top: 10),
      width: double.infinity,
      height: 50,
      child: ElevatedButton(
        child: Text(rotulo, style: Theme.of(context).textTheme.headline1),
        onPressed: (){  
              caixaDialogo('Login efetuado com sucesso!'); 
       },
       
      ),
    );

  }
  caixaDialogo(msg){
    return showDialog(
      context: context, 
      builder: (BuildContext context){
        return AlertDialog(
            title: Text('Login'),
            content: Text(msg),
            actions: [
                TextButton(
                child: Text('fechar'),
                onPressed: (){
                  var msg = Mensagem(
                txtUsuario.text,
                txtSenha.text
              );

              Navigator.pushNamed(
                context, 
                '/menu',
                arguments: msg
              );
                }
              )
            ]
        );
      }
    );
  }

  Widget campoTexto(rotulo,variavel){

    return Container(
      
      child: TextFormField(

        
        controller: variavel,
        style: Theme.of(context).textTheme.headline3,
        
        decoration: InputDecoration(
          
          labelStyle: Theme.of(context).textTheme.headline3,

          labelText: 'Usuário',
          hintStyle: Theme.of(context).textTheme.headline3,
          border: OutlineInputBorder(),
          alignLabelWithHint: true,
        ),



      ),

    );

  }

}

//
// TELA MENU
//
class TelaMenu extends StatelessWidget {

  @override
  Widget build(BuildContext context) {


    
    Mensagem msg = ModalRoute.of(context).settings.arguments;
    if (msg == null){
      msg = Mensagem('','');
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Menu'),
        
        
        automaticallyImplyLeading: false,
        
      ),
      body: Container(
        width: double.infinity,
        padding: EdgeInsets.all(40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                OutlinedButton(
                  child: Text('Anterior'),
                  
                  onPressed: () {

                    Navigator.pushNamed(
                context, 
                '/login');

                  },
                ),
            
              ],            
            ),
            Column(
            children: [
            SizedBox(height:40),
            Text('Usuário', style: TextStyle(fontSize: 18, fontStyle: FontStyle.italic)),
            Text(msg.usuario, style: TextStyle(fontSize: 24)),
            ],   
            ),
            SizedBox(height: 120),

            Column(
              
              children: [
                OutlinedButton(
                  child: Text('Cadastro de Cliente', style: Theme.of(context).textTheme.headline2),
                  
                  onPressed: () {

                    Navigator.pushNamed(
                       context, 
                      '/cliente',
                     arguments: msg
              );
                  },
                ),
                SizedBox(height:40),
                OutlinedButton(
                  child: Text('Registro de Compra',  style: Theme.of(context).textTheme.headline2),
                  
                  onPressed: () {

                    Navigator.pushNamed(
                context, 
                '/compra'
              );

                  },
                ),
                SizedBox(height:40),
                OutlinedButton(
                  child: Text('Lista de dados',  style: Theme.of(context).textTheme.headline2),
                  
                  onPressed: () {

                  Navigator.pushNamed(
                context, 
                '/listView'
              );

                  },
                ),
            
              ],            
            ),
        ]),
      ),
    );
  }
  
}


//
// TELA SOBRE
//
class TelaSobre extends StatelessWidget {
   @override
  Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          title: Text('Sobre', 
          style: Theme.of(context).textTheme.headline1
          ),
          backgroundColor: Theme.of(context).primaryColor,
        ),

        body: SingleChildScrollView(
                  child: Column(
            children: [
              ImagemWidget('Vinícius Aguiar','Varejão','Venda de Produtos','lib/imagens/pp.jpg')
       ]
      ),
        )
    );
    
  }
  
}


//
// TELA CADASTRO CLIENTE
//
class TelaCadastroCliente extends StatefulWidget {
  @override
  _TelaCadastroClienteState createState() => _TelaCadastroClienteState();
}

class _TelaCadastroClienteState extends State<TelaCadastroCliente> {

  var txtNome = TextEditingController();
  var txtCep = TextEditingController();
  var txtTelefone = TextEditingController();
  var txtCpf = TextEditingController();
  var txtSexo = TextEditingController();
  String opescolhida;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cadastro de Clientes'),
        centerTitle: true,

        
        automaticallyImplyLeading: false,
        
      ),
      body: Container(
        width: double.infinity,
        padding: EdgeInsets.all(40),
        child: Column(
          
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                OutlinedButton(
                  child: Text('Anterior'),
                  
                  onPressed: () {

                    Navigator.pop(context);

                  },
                ),
            
              ],            
            ),

          Icon(Icons.face, size: 100, color: Colors.blueAccent),
          SizedBox(height: 40),
          TextField(
            controller: txtNome,
            decoration: InputDecoration(
              labelText: 'Nome',
              border: OutlineInputBorder(),
            ),
          ),
          SizedBox(height: 20),
          TextField(
            controller: txtCep,
            keyboardType: TextInputType.multiline,
            maxLines: 1,
            decoration: InputDecoration(
              labelText: 'CEP',
              border: OutlineInputBorder(),
              alignLabelWithHint: true,
            ),
          
          ),
          SizedBox(height: 20),
          TextField(
            controller: txtTelefone,
            keyboardType: TextInputType.multiline,
            maxLines: 1,
            decoration: InputDecoration(
              labelText: 'Telefone',
              border: OutlineInputBorder(),
              alignLabelWithHint: true,
            ),
          ),
          SizedBox(height: 20),
          TextField(
            controller: txtCpf,
            keyboardType: TextInputType.multiline,
            maxLines: 1,
            decoration: InputDecoration(
              labelText: 'CPF',
              border: OutlineInputBorder(),
              alignLabelWithHint: true,
            ),
          ),
          
          Column(
          children: <Widget>[
            Text('Sexo:'),
          RadioListTile(
            title: Text("Feminino"),
            activeColor: Colors.blue,
            value:'f',
            groupValue: opescolhida,
            onChanged: (String valor){
              setState(() {
                opescolhida = valor;
              });

              //print("opcao escolhida: " + valor);
            },
          ),
          

          RadioListTile(
            title: Text("Masculino"),
            activeColor: Colors.blue,
            value:'m',
            groupValue: opescolhida,
            onChanged: (String valor){

              setState(() {
                opescolhida = valor;
              });
              //print("opcao escolhida: " + valor);
            },
          ),
          
        ],),
         
          botao('Cadastrar'),
 
       ]),
      )
      
    );
  }

//
  // BOTÃO
  //
  Widget botao(rotulo){
    return Container(
      padding: EdgeInsets.only(top: 30),
      width: double.infinity,
      height: 70,
      child: ElevatedButton(
        child: Text(rotulo, style: Theme.of(context).textTheme.headline1),
        onPressed: (){
          caixaDialogo("Cliente cadastrado com sucesso!");

        },
      ),
    );

  }

    //
  // CAIXA DE DIÁLOGO
  //
  caixaDialogo(msg){
    return showDialog(
      context: context, 
      builder: (BuildContext context){
        return AlertDialog(
            title: Text('Cadastro de Clientes'),
            content: Text(msg),
            actions: [
              TextButton(
                child: Text('fechar'),
                onPressed: (){
                  Navigator.pop(context);
                  setState(() {
              txtNome.clear();
              txtCep.clear();
              txtTelefone.clear();
              txtCpf.clear();
              opescolhida = null;
              FocusScope.of(context).unfocus();
            });
                }
              )
            ]
        );
      }
    );
  }
  
}

//LISTA DE DADOS
class ListViewSepareted extends StatefulWidget {
  @override
  _ListViewSeparetedState createState() => _ListViewSeparetedState();
}

class _ListViewSeparetedState extends State<ListViewSepareted> {

  
  var lista = [];

  var txtTarefa = TextEditingController();

  @override
  void initState(){
    super.initState();
    lista.add('Pimentão');
    lista.add('Brócolis');
    lista.add('Rúcula');
    lista.add('Pepino');
    lista.add('Alface');
    lista.add('Morango');
    lista.add('Tomate');
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Produtos'), centerTitle: true,),
      backgroundColor: Colors.grey[100],
      body: Container(
        padding: EdgeInsets.all(40),
        

        //
        // ListView.separeted
        //
        child: ListView.separated(
          

          
          itemBuilder: (context,index){
            return ListTile(
              title: Text(lista[index]),
              trailing: IconButton(
                icon: Icon(Icons.delete, color: Colors.red[100]),
                onPressed: (){
                  setState(() {
                    lista.removeAt(index);
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Produto removido com sucesso.'),
                        duration: Duration(seconds: 2),
                      )    
                    );
                  });
                },
              ),
            );
          }, 

          
          separatorBuilder: (context,index){
            return Divider(
              color: Colors.lightBlue[100],
              thickness: 2,
            );
          }, 

          
          itemCount: lista.length
          
          
        ),
      ),

      //
      // ADICIONAR PRODUTO
      //  
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        backgroundColor: Colors.blue,
        onPressed: () async {
          await showDialog(
            context: context,
            builder: (context){
              return AlertDialog(
                title: Text('Adicionar produto', style: TextStyle(fontSize: 12)),
                content: TextField(
                  controller: txtTarefa,
                  style: TextStyle(fontSize: 18),
                  decoration: InputDecoration(
                    hintText: 'Informe o produto'
                  ),
                ),
                actions: [
                  TextButton(
                    child: Text('adicionar'),
                    onPressed: (){
                      setState(() {
                        lista.add(txtTarefa.text);
                        txtTarefa.clear();
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('Produto adicionada com sucesso.'),
                            duration: Duration(seconds: 2),
                          )    
                        );
                      });
                      Navigator.pop(context);
                    },
                  ),
                  TextButton(
                    child: Text('cancelar'),
                    onPressed: (){
                      Navigator.pop(context);
                    },
                  ),
                ],

              );
            }
          );

        },
      ),

    );
  }}


//
//CADASTRO DE COMPRA
//
class TelaCadastroCompra extends StatefulWidget {
  @override
  _TelaCadastroCompraState createState() => _TelaCadastroCompraState();
}

class _TelaCadastroCompraState extends State<TelaCadastroCompra> {

  var txtNomeCliente = TextEditingController();
  var txtNomeFuncionario = TextEditingController();
  var txtProduto = TextEditingController();
  var txtCpf = TextEditingController();
  var txtValor = TextEditingController();
  bool ckpimentao = false;
  bool ckbrocolis = false;
  bool ckrucula= false;
  bool ckpepino = false;
  bool ckalface = false;
  bool ckmorango = false;
  bool cktomate = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Registro de Compra'),
        centerTitle: true,

        //Remover o ícone de Voltar
        automaticallyImplyLeading: false,
        
      ),
      body: Container(
        width: double.infinity,
        padding: EdgeInsets.all(40),
        child: Column(
          
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                OutlinedButton(
                  child: Text('Anterior'),
                  
                  onPressed: () {

                    Navigator.pop(context);

                  },
                ),
            
              ],            
            ),

          Icon(Icons.shopping_cart, size: 100, color: Colors.blueAccent),
          SizedBox(height: 10),
          TextField(
            controller: txtNomeCliente,
            decoration: InputDecoration(
              labelText: 'Nome do Cliente',
              border: OutlineInputBorder(),
            ),
          ),
          SizedBox(height: 10),
          TextField(
            controller: txtCpf,
            keyboardType: TextInputType.multiline,
            maxLines: 1,
            decoration: InputDecoration(
              labelText: 'CPF',
              border: OutlineInputBorder(),
              alignLabelWithHint: true,
              
            ),
          ),
          SizedBox(height: 5),
        Column(
          children:<Widget>[
             CheckboxListTile(
               title: Text("Pimentão - R\$ 5,00",
               style: TextStyle(fontSize: 15.0),),
               activeColor: Colors.blue,
               value:ckpimentao,
               onChanged: (bool valor){
                 setState(() {
                   ckpimentao = valor;
                 });
               },
             ), 
             CheckboxListTile(
               title: Text("Brócolis - R\$ 7,00",
               style: TextStyle(fontSize: 15.0),),
               activeColor: Colors.blue,
               value:ckbrocolis,
               onChanged: (bool valor){
                 setState(() {
                   ckbrocolis = valor;
                 });
               },
             ),
             CheckboxListTile(
               title: Text("Rúcula - R\$ 4,00",
               style: TextStyle(fontSize: 15.0),),
               activeColor: Colors.blue,
               value:ckrucula,
               onChanged: (bool valor){
                 setState(() {
                   ckrucula = valor;
                 });
               },
             ),
             CheckboxListTile(
               title: Text("Pepino - R\$ 5,00",
               style: TextStyle(fontSize: 15.0),),
               activeColor: Colors.blue,
               value:ckpepino,
               onChanged: (bool valor){
                 setState(() {
                   ckpepino = valor;
                 });
               },
             ),
             CheckboxListTile(
               title: Text("Alface - R\$ 2,00",
               style: TextStyle(fontSize: 15.0),),
               activeColor: Colors.blue,
               value:ckalface,
               onChanged: (bool valor){
                 setState(() {
                   ckalface = valor;
                 });
               },
             ),
             CheckboxListTile(
               title: Text("Morango - R\$ 6,00",
               style: TextStyle(fontSize: 15.0),),
               activeColor: Colors.blue,
               value:ckmorango,
               onChanged: (bool valor){
                 setState(() {
                   ckmorango = valor;
                 });
               },
             )
          ]
        ),
         
          botao('Confirmar'),
 
       ]),
      )
      
    );
  }

//
  // BOTÃO
  //
  Widget botao(rotulo){
    return Container(
      padding: EdgeInsets.only(top: 30),
      width: double.infinity,
      height: 70,
      child: ElevatedButton(
        child: Text(rotulo, style: Theme.of(context).textTheme.headline1),
        onPressed: (){
          caixaDialogo("Compra Efetuada com Sucesso!");

        },
      ),
    );

  }

    //
  // CAIXA DE DIÁLOGO
  //
  caixaDialogo(msg){
    return showDialog(
      context: context, 
      builder: (BuildContext context){
        return AlertDialog(
            title: Text('Registro de Compra'),
            content: Text(msg),
            actions: [
              TextButton(
                child: Text('fechar'),
                onPressed: (){
                  Navigator.pop(context);
                  setState(() {
                    txtNomeCliente.clear();
                    txtCpf.clear();
                    ckrucula = false;
                    ckpimentao = false;
                    ckbrocolis = false;
                    ckpepino = false;
                    ckmorango = false;
                    ckalface = false;
                    FocusScope.of(context).unfocus();
            });
                }
              )
            ]
        );
      }
    );
  }
  
}
