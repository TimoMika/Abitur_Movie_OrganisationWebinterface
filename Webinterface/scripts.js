
function getSQLforSchauspieler(name){
  //datum as Datum, uhrzeit as Uhrzeit, id_scene as Szene, ort as Ort, dauer as Dauer, schauspieler_anweisung as Anweisung
  //WHERE (id_schuspieler = " + String(id) + ") and (takes.id = id_take)
  //connector_schauspieler_takes
  var sql = "select abkuerzung as 'Abk.', DATE(datum) as Datum, uhrzeit as Uhrzeit, id_scene as Szene, ort as Ort, dauer as Dauer, schauspieler_anweisung as Anweisung ";
  sql +=  "from schauspieler, takes, connector_schauspieler_takes WHERE (schauspieler.name = '" + name + "') and (takes.id = id_take or id_take = 0)  "
  sql += "and (schauspieler.id = id_schauspieler)";
  return sql;
  //return "select id as SchauspielerID, abkuerzung as 'Namens kuerzel' from schauspieler";
}
function getSQLfordropdown(){
  return "select name FROM schauspieler GROUP BY name";
}

//fillDropdown(document.getElementById("mySelect").selectedIndex)
function load(){
  fillDropdowns();

  //hier muss nach den richtigen cvaiablen gesucht werden in z.b. textfeldern oder dropdownmenues und dann die richtige abfrage gestartet werden
}

function nachSchauspielerSuchen(){
  var table = document.getElementById("SQLres");
  while(table.childNodes.length>0){
    table.removeChild(table.childNodes[0]);
  }
  console.log(document.getElementById("schauspielerSelect").value);
  fillTableSchauspieler(document.getElementById("schauspielerSelect").value);
}
function drehtageTablle(){

}





function fillDropdowns(){
  console.log("fill Dropdown");
  var sql = getSQLfordropdown();
  console.log(sql);
  MySql.Execute(
    "sql7.freemysqlhosting.net",
    "sql7112264",
    "733eEW24Nr",
    "sql7112264",
    sql,
    fillDropdownHTML//function (data) {/*result = data;*/console.log(data)}
  );
}

function fillDropdownHTML(data){
  console.log("adshf waere toll zu sehen");
  if(!data.Success){
    alert("Failed to acces the database please message Mika oder toger5!!");
  }
  else{
    var dropDonwnMenue = document.getElementById("schauspielerSelect");
    var resultArray = data.Result;
    for(i in resultArray){
      var name = document.createTextNode(resultArray[i].name);
      var schauspielerOption = document.createElement("option");
      schauspielerOption.appendChild(name);
      dropDonwnMenue.appendChild(schauspielerOption);
    }
  }
}

function fillTableSchauspieler(id){
  var sql = getSQLforSchauspieler(id);
  console.log(sql);
  MySql.Execute(
    "sql7.freemysqlhosting.net",
    "sql7112264",
    "733eEW24Nr",
    "sql7112264",
    sql,
    fillTableSchauspielerHTML//function (data) {/*result = data;*/console.log(data)}
  );
}

function fillTableSchauspielerHTML(data){
  console.log("beide ?");
  console.log(data)
  if(!data.Success){
    alert("Failed to acces the database please message Mika oder toger5!!");
  }
  else{
    var SQLres = document.getElementById("SQLres");
    var resultArray = data.Result;

    var headerRow = document.createElement("tr");
    for (rowName in resultArray[0]) {
      var thText = document.createTextNode(rowName);
      var tableHeaderData = document.createElement("th");
      tableHeaderData.appendChild(thText);
      headerRow.appendChild(tableHeaderData);
    }
    SQLres.appendChild(headerRow);

    for (i = 0;i < resultArray.length;i++){
      var tableRow = document.createElement("tr");
      var rowData = resultArray[i];
      for (td in rowData) {
        value = rowData[td];
        if(td == "Datum"){
          datestr = value.split("T");
          value = datestr[0]
        }
        var tdText = document.createTextNode(value);
        var tableData = document.createElement("td");
        tableData.appendChild(tdText);
        tableRow.appendChild(tableData);
      }
      SQLres.appendChild(tableRow);
    }




  }
}
