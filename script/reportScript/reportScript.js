var currentString = "";
var currentDate = new Date();
var currentPeriodType = "";

function parseDate(str) {
  var parts = str.split("-");
  return new Date(parts[2], parts[1] - 1, parts[0]);
  
}

function downloadEnded(tuple) {
    document.querySelector('#tasksPanel').insertAdjacentHTML('beforeend', `
    <div  class="task">
        
        <img class = "taskImg" id ="endedDeleteImg" src = "../style/img/trash-can-solid.png"   onClick="deleteEndedTask(event);">
        </img>
        <input type="text" readonly id="endedTaskname" value="${tuple.title}" maxlength="25">
       

        <input type="number"  id="endedPomos" value= "${tuple.pomodori}" readonly  min="1">
       
        <img id = "endedOptionImg" src  = "../style/img/sliders-solid.png" onclick = "endedOption(event)">
        </img>
  
     
        <div id="hiddenOption">
          <textarea name="taskNote" readonly class="hiddenNote" cols="40" rows="3" placeholder="updateNote" maxlength="115">${tuple.note}</textarea>
        </div>    
       
    
    </div>
`)
  currentDate = parseDate(tuple.dat);
}


function endedOption(e) {
    var button = e.currentTarget;
    var hiddenBox = button.nextElementSibling;
    var computedStyle = window.getComputedStyle(hiddenBox);
    if (computedStyle.display === "block") {
        hiddenBox.style.display = "none";
    }
    else {
        hiddenBox.style.display = "block";
    }
}


function load(s) {
    var url;
    if(s == 'daily') {
      url = "dailyLoad.php";
      currentPeriodType = "day";
    }
    else if(s == 'weekly') {
      url = "weeklyLoad.php";
      currentPeriodType = "week";
    }
    else if(s == 'all') {
      url = "allLoad.php";
      currentPeriodType = "none";
    }
    console.log(currentPeriodType);
    document.getElementById("tasksPanel").innerHTML = '';
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
            downloadEnded(tuple);
          });
        }
      }
    };
    httpRequest.send();
  }

function increaseDay(s) {
  if(s == "+") {
    currentDate.setDate(currentDate.getDate() + 1);
  }
  else if (s == "-") {
    currentDate.setDate(currentDate.getDate() - 1);
  }
  var day = JSON.parse(currentDate.getDate());
  var month = JSON.parse(currentDate.getMonth()+1);
  var year = JSON.parse(currentDate.getFullYear());
  if (day<10)
    day = "0"+day;
  if (month<10)
    month = "0"+month;
  
  currentString = day+"-"+month+"-"+year;
}

function increaseWeek(s) {
  if(s == "+") {
    currentDate.setDate(currentDate.getDate() + 7);
  }
  else if (s == "-") {
    currentDate.setDate(currentDate.getDate() - 7);
  }
  var day = JSON.parse(currentDate.getDate());
  var month = JSON.parse(currentDate.getMonth()+1);
  var year = JSON.parse(currentDate.getFullYear());
  if (day<10)
    day = "0"+day;
  if (month<10)
    month = "0"+month;
  
  currentString = day+"-"+month+"-"+year;
}

















function increase() {
  document.getElementById("tasksPanel").innerHTML = '';
  var typeReq = "POST";
  if(currentPeriodType == "day") {
    increaseDay("+");
    var php = "../server/dailyLoadIncrease.php";
  }
  else if(currentPeriodType == "week") {
    increaseWeek("+");
    var php = "../server/increaseWeek.php";
  }
  $.ajax({
    url: php,
    type: typeReq,
    data: {currentString: currentString},
    success: function(result) {
        // Aggiornamento eseguito con successo
        var endedTasks = JSON.parse(result);

        if(endedTasks.length != 0) {
          for(var i = 0; i<endedTasks.length; i++) {
            downloadEnded(endedTasks[i]);
          }
        }
    },
    error: function(xhr, status, error) {
        // Errore nell'aggiornamento
        console.error(error);
    }
});
}

function decrease() {
  document.getElementById("tasksPanel").innerHTML = '';
  var typeReq = "POST";
  if(currentPeriodType == "day") {
    increaseDay("-");
    var php = "../server/dailyLoadIncrease.php";
  }
  else if(currentPeriodType == "week") {
    increaseWeek("-");
    var php = "../server/increaseWeek.php";
  }
  $.ajax({
    url: php,
    type: typeReq,
    data: {currentString: currentString},
    success: function(result) {
        // Aggiornamento eseguito con successo
        var endedTasks = JSON.parse(result);

        if(endedTasks.length != 0) {
          for(var i = 0; i<endedTasks.length; i++) {
            downloadEnded(endedTasks[i]);
          }
        }
    },
    error: function(xhr, status, error) {
        // Errore nell'aggiornamento
        console.error(error);
    }
});
}
