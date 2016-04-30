var host = "sql7.freemysqlhosting.net";
var username = "sql7112264";
var password = "733eEW24Nr";
var database = "sql7112264";
var tableMode = 0;

var edited = false;

function getSQLforTakesDropdown(){
  return "select id FROM takes Order BY id ASC";
}

function getSQLforTakes(id) {
  return "select id as ID, id_scene as 'ID Szene', beschreibung as Beschreibung, datum as Datum, uhrzeit as Uhrzeit, dauer as Dauer, ort as Ort, orts_austattung as 'Orts Austattung', status as Status from takes where id = " + id;
}

function getSQLforTakeSave(id) {
  var takeTable = document.getElementById("takeTable");
  console.log(takeTable.rows[1].cells[0].textContent);
  var sql = "UPDATE takes SET";
  sql += " beschreibung = '" + takeTable.rows[1].cells[2].textContent;
  sql += "', id_scene = " + takeTable.rows[1].cells[1].textContent;
  sql += ", datum = '" + takeTable.rows[1].cells[3].textContent;
  sql += "', uhrzeit = '" + takeTable.rows[1].cells[4].textContent;
  sql += "', status = '" + takeTable.rows[1].cells[8].firstChild.value;
  sql += "', ort = '" + takeTable.rows[1].cells[6].textContent;
  sql += "', orts_austattung = '" + takeTable.rows[1].cells[7].textContent;
  sql += "', dauer = '" + takeTable.rows[1].cells[5].textContent;
  sql +=  "' WHERE id = " + id;
  return sql;
}

function loadEdit() {
  var psswd = prompt("Passwort eingeben:");
  if(psswd == null || psswd != "main_director") {
    close();
    return;
  }
  fillTakesDropdown();
}

function fillTakesDropdown() {
  console.log("fill Takes Dropdown");
  var sql = getSQLforTakesDropdown();
  console.log(sql);
  MySql.Execute(
    host,
    username,
    password,
    database,
    sql,
    fillTakesDropdownHTML
  );
}

function fillTakesDropdownHTML(data){
  if(!data.Success){
    alert("Failed to acces the database please message Mika oder toger5!!");
  }
  else{
    var dropDonwnMenue = document.getElementById("takeSelect");
    var resultArray = data.Result;
    for(i in resultArray){
      var name = document.createTextNode(resultArray[i].id);
      var schauspielerOption = document.createElement("option");
      schauspielerOption.appendChild(name);
      dropDonwnMenue.appendChild(schauspielerOption);
    }
  }
}

function nachTakeSuchen() {
  if(edited) {
    if(!confirm("Ungespeicherte Änderungen Verwerfen?")) {
      return;
    }
  }
  var table = document.getElementById("takeTable");
  while(table.childNodes.length>0){
    table.removeChild(table.childNodes[0]);
  }
  edited = false;
  console.log(document.getElementById("takeSelect").value);
  fillTableTakes(document.getElementById("takeSelect").value);
}

function fillTableTakes(id) {
  var sql = getSQLforTakes(id);
  console.log(sql);
  MySql.Execute(
    host,
    username,
    password,
    database,
    sql,
    fillEditTableHTML
  );
}

function fillEditTableHTML(data){
  console.log(data)
  if(!data.Success){
    alert("Failed to acces the database please message Mika oder toger5!!");
  }
  else{
    var takeTable = document.getElementById("takeTable");
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
    takeTable.appendChild(tableHeader);

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

        tableDataDiv.setAttribute("contenteditable", "true");
        tableDataDiv.addEventListener("input", inputEvent);

        tableDataDiv.appendChild(tdText);
        tableData.appendChild(tableDataDiv);
        tableRow.appendChild(tableData);
      }
      tableBody.appendChild(tableRow);
    }
    takeTable.appendChild(tableBody);
    takeTable.rows[1].cells[0].setAttribute("contenteditable", "false");

    var stateSelect = document.createElement("select");
    stateSelect.setAttribute("id", "stateSelect");

    stateSelect.appendChild(createOption("zu erledigen"));
    stateSelect.appendChild(createOption("erledigt"));
    stateSelect.appendChild(createOption("nachdreh"));

    var stateText = takeTable.rows[1].cells[8].firstChild.innerHTML;
    takeTable.rows[1].cells[8].replaceChild(stateSelect, takeTable.rows[1].cells[8].firstChild);

    if(stateText == "zu erledigen") {
      stateSelect.selectedIndex = 0;
    } else if (stateText == "erledigt") {
      stateSelect.selectedIndex = 1;
    } else if(stateText == "nachdreh") {
      stateSelect.selectedIndex = 2;
    }
    console.log("Status: " + document.getElementById("stateSelect").value);
  }
}

function createOption(text) {
  var option = document.createElement("option");
  var opText = document.createTextNode(text);
  option.appendChild(opText);
  return option;
}

function saveTake() {
  var sql = getSQLforTakeSave(document.getElementById("takeSelect").value);
  console.log(sql);
  MySql.Execute(
    host,
    username,
    password,
    database,
    sql,
    saveResult
  );
}

function saveResult(data) {
  console.log(data);
  saveUpdateSQL(getSQLforTakeSave(document.getElementById("takeSelect").value));
}

function refreshTable(data) {
  console.log(data);
  alert("Take " + document.getElementById("takeSelect").value + " wurde aktuallisiert");
  edited = false;
  nachTakeSuchen();
}

function saveUpdateSQL(anweisung) {
  // var sql = "INSERT INTO updateSQLBackup (anweisung) VALUES ('";
  // sql += anweisung + "')";
  // console.log(sql);

  // MySql.Execute(
  //   host,
  //   username,
  //   password,
  //   database,
  //   sql,
  //   refreshTable
  // );
  refreshTable();
}

function inputEvent(){
  //console.log("Edited!");
  edited = true;
}
