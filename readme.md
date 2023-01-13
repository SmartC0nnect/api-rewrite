
# Smart Connect
### Smart Home am Beispiel von Python, UML und Chen-notation

---

### Intention & Ablauf
Das Ziel des Projektes ist, Sensoren und Akteure über eine Software zu verbinden. 
Man soll dann einstellen können, bei welchen Sensorwerten ein Akteur eine Aufgabe
erledigen soll. Das gesamte Projekt basiert auf den Sprachen Python, C, PHP, Javascript, Html, CSS, und SQL.
Für diese GFS wurden Python, C und SQL verwendet. Die API wurde ursprünglich in Javascript/Typescript 
programmiert jedoch dann in Python übersetzt.

<br>

> ### Folgende Librarys werden verwendet, die nicht selbst programmiert sind, sondern entweder auf pypi.org veröffentlicht worden sind oder direkt durch python installiert werden.
> - flask
> - flask_cors
> - json
> - os
> - mysql *(mysql-connector-python)*

> ### Beschreibung server.py
> <br> Das Python Script läd die öffentliche Library flask und flask_cors.
> <br> Danach werden die eigene Datei Controller geladen (Im Sourcecode werden noch weitere dateien geladen, diese sind für die GFS allerdings unrelevant.)
> <br> Durch die erstelle Flask app werden dann die routen freigegeben, und ein Objekt der Klasse Controller() erstellt, und eine jeweilige Funktion zum Path aufgerufen.
> <br> Anschließend werden die daten zurück an den client gesendet.

> ###Beschreibung controller.py
> <br> Im Konstruktor der Funktion (__init__) wird versucht sich mit der datenbank erneut zu verbinden, sollte die Verbindung sich zuvor geschlossen haben.
> <br> In der Klasse Controller() gibt es 2 Funktionen für die jeweiligen URL-Pfade.
> <br> Die erste schreibt die vom Sensor gegebenen Daten in die Datenbank und gibt den status 200 zurück.
> <br> Die zweite Frägt die Daten mit dem zugehörigen Key vom Akteur ab, und ruft daraufhin eine dritte Funktion auf.
> <br> Diese überprüft die Bedingungen, unter denen der Akteur ausführen darf. Dazu wird durch das JSON-Array welches die Bedingungen für den jeweiligen Wert repräsentiert, durchgelaufen. Dann wird der Wert des angegebenen Sensors aus der Datenbank ausgelesen und auf min/max überprüft.
> <br> Sollten beide min/max Bedingungen übereinstimmen, werden die Daten an die übergeordnete Funktion gegeben und anschließend werden die Daten zurück an den Akteur gesendet.
> <br> Der Akteur führt dann die Aktionen aus.

> ### Beschreibung database.py
> <br> Diese Datei wird in jeder anderen importiert.
> <br> Sie stellt eine Verbindung zur Datenbank her und speichert den Cursor in einer Variable, die dann überall genutzt werden kann.
---

### Chen notation
![Image](http://school.cv3.xyz/GFS/12.1-IT/data/Chen%20notation/image.png)

---

### UML
![Image](http://school.cv3.xyz/GFS/12.1-IT/data/UML/image.png)

---

### Sequencediagram
![Image](http://school.cv3.xyz/GFS/12.1-IT/data/Sequenzdiagramm/Untitled.svg)

---

### Demo
In diesem Beispiel wurde programmiert, dass die Rote und die Blaue LED an gehen, wenn es dunkel ist.
Wenn ein Licht angeht, scheint nur die Blaue, und wenn das Licht sehr hell ist, gehen beide LEDs aus.

[<img alt="Video" height="200" src="http://school.cv3.xyz/GFS/12.1-IT/data/IMG_6712.png"/>](http://school.cv3.xyz/GFS/12.1-IT/data/IMG_6712.mov)

