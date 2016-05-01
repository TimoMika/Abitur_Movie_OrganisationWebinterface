var host = "sql7.freemysqlhosting.net";
var username = "sql7112264";
var password = "733eEW24Nr";
var database = "sql7112264";
var tableMode = 0;


function getSQLforSchauspieler(name){
  var sql = "select abkuerzung as 'Abk.', DATE(datum) as Datum, uhrzeit as Uhrzeit, id_scene as Szene, ort as Ort, dauer as Dauer, schauspieler_anweisung as Anweisung ";
  sql +=  "from schauspieler, takes, connector_schauspieler_takes WHERE (schauspieler.name = '" + name + "') and (takes.id = id_take or id_take = 0)  "
  sql += "and (schauspieler.id = id_schauspieler) Order by datum ASC, uhrzeit ASC";
  return sql;
}

function getSQLforSchauspielerAtDate(datum) {
  var sql = "select abkuerzung as 'Abk.', name as Name, uhrzeit as Uhrzeit, id_take as 'Take ID', beschreibung as Beschreibung "
  sql += "from schauspieler, takes, connector_schauspieler_takes Where takes.id = id_take and schauspieler.id = id_schauspieler "
  if(datum != "Alle Drehtage") {
    sql += " and datum = '" + datum + "' ";
  }
  sql += "Order by uhrzeit ASC"
  return sql;
}

function getSQLforSchauspielerDropdown(){
  return "select name FROM schauspieler GROUP BY name";
}

function getSQLforDrehtageDropdown(){
  return "select datum FROM takes GROUP BY datum";
}

function  getSQLforAllTakes(datum) {
  var sql = "select id_scene as Szene, beschreibung as Beschreibung, datum as Datum, uhrzeit as Uhrzeit, dauer as Dauer, ort as Ort, orts_austattung as 'Orts Austattung', id as ID, status as Status from takes "
  if(datum != "Alle Drehtage") {
    sql += "Where datum = '" + datum + "' ";
  }
  sql += "Order by datum ASC, uhrzeit ASC";
  return sql;
}

function load(){
  fillSchauspielerDropdown();
}

function printTable(){
   var divToPrint=document.getElementById("SQLres").outerHTML;
   newWin= window.open('', 'Druck Fenster');
   newWin.document.open();
   newWin.document.write('<html><head><title></title>');
   newWin.document.write('<style type="text/css"></style><link rel="stylesheet" type="text/css" href="style.css"></head><body><div class="wrapper"><h1>');
   if(tableMode == 0) {
     alert("Tabelle ist leer!");
     newWin.document.close();
     newWin.close();
   }
   else if(tableMode == 1) {
     newWin.document.write(document.getElementById("schauspielerSelect").value + ' (' + document.getElementById("SQLres").rows[1].cells[0].textContent + ')');
   }
   else if (tableMode == 2) {
     newWin.document.write(document.getElementById("spTabelleSelect").value + ' - ' + document.getElementById("drehtageSelect").value);
   }
   newWin.document.write('</h1>');
   newWin.document.write(divToPrint);
   newWin.document.write('</div></body></html>');
   newWin.document.close();

   newWin.onload=function(){console.log("Print!!"); newWin.print(); setTimeout(function () { newWin.close(); }, 100);}
   newWin.focus();
   console.log("printTable End");
}

function nachSchauspielerSuchen(){
  tableMode = 1;
  var table = document.getElementById("SQLres");
  while(table.childNodes.length>0){
    table.removeChild(table.childNodes[0]);
  }
  console.log(document.getElementById("schauspielerSelect").value);
  fillTableSchauspieler(document.getElementById("schauspielerSelect").value);
}

function spTabelle() {
  tableMode = 2;
  var table = document.getElementById("SQLres");
  while(table.childNodes.length>0){
    table.removeChild(table.childNodes[0]);
  }
  var selectedIndex = document.getElementById("spTabelleSelect").selectedIndex;
  console.log(selectedIndex);
  //Fuction bei der Auswahl: "Alle Takes"
  if(selectedIndex == 0) {
    fillTableTakesDate(document.getElementById("drehtageSelect").value);
  } else if (selectedIndex == 1) {
    fillTableSchauspielerAtDate(document.getElementById("drehtageSelect").value);
  }
}

function fillTableSchauspielerAtDate(datum) {
  console.log("fill Schauspieler for " + String(datum));
  var sql = getSQLforSchauspielerAtDate(datum);
  console.log(sql);
  MySql.Execute(
    host,
    username,
    password,
    database,
    sql,
    fillTableHTML
  );
}

function fillTableTakesDate(datum) {
  console.log("fill Takes for " + String(datum));
  var sql = getSQLforAllTakes(datum);
  console.log(sql);
  MySql.Execute(
    host,
    username,
    password,
    database,
    sql,
    fillTableHTML
  );
}


function fillDropdowns(){
  console.log("fill Dropdown");
  var sql = getSQLfordropdown();
}

function fillSchauspielerDropdown(){
  console.log("fill schauspielerSelect Dropdown");
  var sql = getSQLforSchauspielerDropdown();
  console.log(sql);
  MySql.Execute(
    host,
    username,
    password,
    database,
    sql,
    fillSchauspielerDropdownHTML
  );
}

function fillSchauspielerDropdownHTML(data){
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
  fillDrehtageDropdown();
}

function fillDrehtageDropdown(){
  console.log("fill drehtageSelect Dropdown");
  var sql = getSQLforDrehtageDropdown();
  console.log(sql);
  MySql.Execute(
    host,
    username,
    password,
    database,
    sql,
    fillDrehtageDropdownHTML
  );
}

function fillDrehtageDropdownHTML(data){
  if(!data.Success){
    alert("Failed to acces the database please message Mika oder toger5!!");
  }
  else{
    var dropDonwnMenue = document.getElementById("drehtageSelect");
    var resultArray = data.Result;
    for(i in resultArray){
      var name = document.createTextNode(resultArray[i].datum.split("T")[0]);
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
    host,
    username,
    password,
    database,
    sql,
    fillTableHTML
  );
}

//Fills the SQLres Table with the data of the SQL select result
function fillTableHTML(data){
  console.log(data)
  if(!data.Success){
    alert("Failed to acces the database please message Mika oder toger5!!");
  }
  else{
    var SQLres = document.getElementById("SQLres");
    var resultArray = data.Result;

    var tableHeader = document.createElement("thead");
    var headerRow = document.createElement("tr");
    for (rowName in resultArray[0]) {
      var thText = document.createTextNode(rowName);
      var tableHeaderData = document.createElement("th");
      tableHeaderData.appendChild(thText);
      headerRow.appendChild(tableHeaderData);
    }
    tableHeader.appendChild(headerRow);
    SQLres.appendChild(tableHeader);

    var tableBody = document.createElement("tbody");
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
        var tableDataDiv = document.createElement("div");

        tableDataDiv.appendChild(tdText);
        tableData.appendChild(tableDataDiv);
        tableRow.appendChild(tableData);
      }
      tableBody.appendChild(tableRow);
    }
    SQLres.appendChild(tableBody);
  }
}
