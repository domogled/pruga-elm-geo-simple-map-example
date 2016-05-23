
var Elm = require("./main.elm.js")

var app = Elm.Main.worker();

console.log("aplikace", app);

// const posilacka = function(word) {
// 	console.log("posílačka: ", word)
//     var suggestions = [`slovo ${word}`, "další slovo"] // spellCheck(word);
//     app.ports.suggestions.send(suggestions);
// }

// document.addEventListener('click', 
// 	(e) => {
// 		alert("kliknuto")
// 		console.log(e)
// 		posilacka(`myšnuto na ${e.clientX} ${e.clientY}`)
// 	}
// )


// app.ports.check.subscribe(posilacka);