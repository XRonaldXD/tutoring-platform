var x = document.getElementById("login");
var y = document.getElementById("register");
var uname = document.getElementById("user");
var pw = document.getElementById("pw");

function login(){
    x.style.left = "4px";
    y.style.right = "520px";
}

function backtologin(){
    x.style.left = "4px";
    y.style.right = "520px";
}

function register() {
    x.style.left = "-510px";
    y.style.right = "4px";
}
function tohome() {
    if(uname.value == "admin" && pw.value == "admin"){
        window.location.href = "index.html";
    } 
    if(uname.value == "user" && pw.value == "user"){
        window.location.href = "index.html";
    } 
    if(uname.value == "root" && pw.value == "root"){
        window.location.href = "index.html";
    }
    if(uname.value == " " && pw.value == " "){
        window.location.href = "index.html";
    }
}