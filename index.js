var request = require("request");
var express = require("express");
var app = express();
app.set("view engine", "ejs");

app.get("/", function(req, res){
    res.render("search");
})

app.get("/results", function(req, res){
    var movieName = req.query.movieName;
    var url = "http://omdbapi.com/?s=" + movieName + "&apikey=thewdb"
    request(url, function(error, response, body){
        if(!error && response.statusCode == 200){
            var results = JSON.parse(body);
            res.render("results", {results: results});
        }
    })
});

app.listen(3000, function(){
    console.log("Running on port 3000");
})
