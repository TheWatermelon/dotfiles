document.getElementsByClassName("o-ckm-header-wrapper")[0].style["display"] = "none";

var imgs = document.getElementsByTagName("img");
for (var i = 0; i<imgs.length; i++) { 
	if((imgs[i].getAttribute("width") === "71") | (imgs[i].getAttribute("width") === "90")) { 
		imgs[i].setAttribute("width", "15"); 
	} 
}
