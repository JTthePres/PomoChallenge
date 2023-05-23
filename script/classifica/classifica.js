function downloadClassifica(tuple) {
    var user =tuple.username;
    var points = tuple.points;
    document.querySelector("#classificaBox").insertAdjacentHTML('beforeend', `
        <div class="classifica-item" data-value=${user}>
            <span class="elemClassifica" id = "utenteClassifica">${user}</span>
            <span class="elemClassifica" id="oreClassifica">${points}</span>
            <button class="visitaProfiloButton" onClick="openProfilePopUp(event);">Profilo</button>
        </div>
    `);
}
function downloadGlobalClass(){
    document.querySelector("#classificaBox").innerHTML="";
    var url ="getGlobalClass.php";
    var httpRequest = new XMLHttpRequest();
    httpRequest.open("GET", url, true);
    httpRequest.setRequestHeader('Content-Type', 'application/json');
    httpRequest.onreadystatechange = function() {
      if (httpRequest.readyState === 4 && httpRequest.status === 200) {
        var response = JSON.parse(httpRequest.responseText);
        if ('error' in response) {
          console.log(response.error);
        } else {
            response.forEach(function(tuple) {
              downloadClassifica(tuple);
          });          
        }
      }
    };
    httpRequest.send();
  }
function downloadAmiciClass(){
    document.querySelector("#classificaBox").innerHTML="";
    var url ="getAmiciClass.php";
    var httpRequest = new XMLHttpRequest();
    httpRequest.open("GET", url, true);
    httpRequest.setRequestHeader('Content-Type', 'application/json');
    httpRequest.onreadystatechange = function() {
      if (httpRequest.readyState === 4 && httpRequest.status === 200) {
        var response = JSON.parse(httpRequest.responseText);
        if ('error' in response) {
          console.log(response.error);
        } else {
            response.forEach(function(tuple) {
              downloadClassifica(tuple);
          });          
        }
      }
    };
    httpRequest.send();
  }