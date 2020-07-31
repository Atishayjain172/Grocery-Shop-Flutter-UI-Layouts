class ItemPageList extends StatefulWidget {
  String data;
  bool showappbar;
  ItemPageList(this.data,this.showappbar);
  @override
  State<StatefulWidget> createState() {
    return _ItemPageList(data,showappbar);
  }
}
class _ItemPageList extends State<ItemPageList> {
  List<itemdata> vegetable=[];
 String data;
  bool showappbar;
  _ItemPageList(this.data,this.showappbar);
  void initState() {
    super.initState();
  }

  Future<List<itemdata>> _getdata() async {
// add data to your vegetable list here in this function...
   itemdata data=new itemdata('Rice','400','450','https://4.imimg.com/data4/BM/KX/MY-15922529/india-gate-basmati-rice-premium-500x500.jpg','5 kg','yes');
   vegetable.add(data);
   return vegetable;
 }


  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      appBar: showappbar?AppBar(
        centerTitle: true,
        elevation: 0,
        backgroundColor: primaryColor,
        title:
        Text('Grocery Shop', style: logoWhiteStyle, textAlign: TextAlign.center),
      ):PreferredSize(
        child: Container(),
        preferredSize: Size(0.0, 0.0),
      ),
      body: Container(
          child: FutureBuilder(
            future: _getdata(),
            builder: (BuildContext context, AsyncSnapshot snapshot){
              if(vegetable.length==0){
                return Container(
                  child: Center(
                    child: Text("Loading..."),
                  ),
                );
              }
              else{
                return ListView.builder(
                  itemCount: snapshot.data.length,
                  itemBuilder: (BuildContext context,int index){
                    return Padding(
                      padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
                      child: ListTile(
                        leading: Padding(
                          padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                          child: Image.network(
                              snapshot.data[index].picture,
                                  height: 100,
                                  width: 100,
                          ),
                        ),
                        title:Text(snapshot.data[index].name,
                        overflow: TextOverflow.ellipsis,),
                        subtitle:Text(snapshot.data[index].quantity,style: h5,),
                        trailing: Padding(
                          padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                          child: Text.rich(
                            TextSpan(
                              children: <TextSpan>[
                                TextSpan(text:snapshot.data[index].instock=="yes"?"\u20B9"+snapshot.data[index].price:snapshot.data[index].instock, style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 22
                                )),
                                TextSpan(text:snapshot.data[index].instock=="yes"?snapshot.data[index].cutprice:"", style: TextStyle(
                                    decoration: TextDecoration.lineThrough,
                                    fontSize: 15)),
                              ],
                            ),
                          )
                        ),
                        onTap: (){
                          // add ontap functionality here...
                        },
                      ),
                    );
                  },
                );
              }
            },
          ),
      ),
    );
  }
  }

class itemdata{
  String name;
  String price;
  String cutprice;
  String picture;
  String quantity;
  String instock;
  itemdata(this.name,this.price,this.cutprice,this.picture,this.quantity,this.instock);

}