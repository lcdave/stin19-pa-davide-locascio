# Praktikum: Datenbank-Migration 👨‍💻

Analyse der Fahrzeiten 2020 der VBZ im SOLL-IST-Vergleich.
In diesem Praktikum soll eine Datenbank der VBZ Zürich importiert und verfügbar gemacht werden.

Meine Aufgabe war es, die Abfragen für die Linie 5 zu erstellen.

## 📝 Aufgabe 1: Aufgabenstellung verstehen

Bei dieser Aufgabe gibt es nichts zu lösen, es geht lediglich um das Verständnis.

## 📝 Aufgabe 2: Datenquellen einrichten

### Aufgabenbeschreibung

Um die Datenquellen einzurichten werden im Aufgaben Dokument alle notwendigen Schritte erläutert.

### Lösung

Um die Aufgaben lösen zu können, muss jedoch eine Datenbank erstellt werden. Dafür wird das folgende Script benötigt: [SQL Script](Scripts/a2.sql)

## 📝 Aufgabe 3: Migration Haltepunkt

In dieser Aufgabe werden die Haltepunkte migriert. Die notwendigen Schritte werden im Aufgaben Dokument erklärt.

## 📝 Aufgabe 4: Migration Haltestelle

In dieser Aufgabe werden die Haltestellen migriert. Die notwendigen Schritte werden im Aufgaben Dokument erklärt.

## 📝 Aufgabe 5: Migration Fahrzeiten Soll Ist

In dieser Aufgabe werden die Fahrzeiten Soll Ist migriert. Die notwendigen Schritte werden im Aufgaben Dokument erklärt.

## 📝 Aufgabe 6: Bereinigung der Tabellen und Constraints

### Aufgabenbeschreibung

Bei der Bereinigung der Tabellen geht es um das Hinzufügen von Primärschlüsseln und die Verwendung der korrekten Datentypen (zum Beispiel für Date).

### Lösung

Das Script zur Lösung: [SQL Script](Scripts/a6.sql)

Beim Schritt 3 wird ein ERD verlangt. Das wurde erstellt und sieht wie folgt aus:

![ERD](img/a6_erd.jpg "ERD")

## 📝 Aufgabe 7: Erstellen Sie eine Abfrage über Zeitdifferenzen

### Aufgabenbeschreibung

Erstellen Sie eine Abfrage, welche die Zeitdifferenzen anzeigt. Für die Zeitdifferenzen sollen nur die von-Zeiten betrachtet werden.

### Lösung

Das Script für die Abfrage finden Sie hier: [SQL Script](Scripts/a7.sql)

Im Script wurde eine Generelle Abfrage für alle und eine spezifische Abfrage erstellt. Die spezifische Abfrage gilt für die Fahrt mit der ID 720 vom 27.12.20.

## 📝 Aufgabe 8: Linien Tabelle

### Aufgabenbeschreibung

Die Abfrage soll die Linie, die Richtung, die Fahrwegnummer und die Fahrwegbezeichnung enthalten.

### Lösung

Die folgenden Aufgaben wurden alle in diesem Script gelöst: [SQL Script](Scripts/a8.sql)

#### Aufgabe a

Das Ergebnis zeigt, dass pro Linie (in diesem Fall 5) insgesamt 5 Varianten pro Richtung existieren. Der Grund ist, dass die Trams in ein Depo ein- und ausfahren sowie eine Linie je nach Tageszeit verkürzt geführt wird.

![SELECT](img/a8_a.jpg "Select")

#### Aufgabe b

Erstellen Sie aus der Abfrage eine View query_line.

![View](img/a8_b.jpg "View")

#### Aufgabe c

Erstellen Sie ein Skript mit einer Tabellenerstellungsabfrage create_line_table.
Die Tabelle soll linie heissen. Der Primärschlüssel kann mit Hilfe von fahrweg_id gebildet werden.

![Linie](img/a8_c.jpg "Linie")

## 📝 Aufgabe 9: Ankunftszeiten Tabelle

### Aufgabenbeschreibung

Es soll aus der fahrzeiten_soll_ist Tabelle eine vereinfachte Tabelle Ankunftszeiten erstellt werden.

Als Lösung wurde die direkte Variante mit einer Tabellenerstellungsabfrage gewählt.

### Lösung

Ein Ausschnitt der Tabelle:

![Ankunftszeiten](img/a9.jpg "Ankunftszeiten")

Das resultierende ERD:

![ERD](img/a9_erd.jpg "ERD")

Das Script zur Lösung: [SQL Script](Scripts/a9.sql)

## 📝 Aufgabe 10: Verspätungsliste pro Linie

### Aufgabenbeschreibung

Ermitteln Sie für eine Line (zum Beispiel Linie 9) eine Liste mit den 20 grössten Verspätungen. Visualisieren Sie die Daten mit Hilfe der Anwendung https://maps.co/gis/

### Lösung

Im unten verlinkten SQL Script befindet sich die Abfrage, sowie auch eine "temporäre" Tabelle um die Daten in das von maps.co/gis/ vordefinierte Format zu bringen. Diese Daten müssen dann als CSV exportiert und wieder in maps.co/gis/ importiert werden.

#### Ausgabe der Verspätungen (Select)

![Ausgabe Select](img/a10_select.jpg "Ausgabe Select")

#### Ausgabe der Tabelle für den Export

![Ausgabe Export](img/a10_export_table.jpg "Ausgabe Export")

#### Lösungs-Dateien

Das Script: [SQL Script](Scripts/a10.sql)

Das exportierte CSV: [SQL Script](csv/a10_verspaetungen.csv)

So sehen die importierten Daten aus:

#### Map Ausgabe

Nachdem das CSV in maps.co importiert wurde, erscheint folgende Ausgabe:

![Map](img/a10_delay.jpg "Map")

Ein Beispiel mit einem Pin:

![Map](img/a10_delay_pin.jpg "Map")

## 📝 Aufgabe 11: Graphische Visualisierung einer Linie

### Aufgabenbeschreibung

Ermitteln Sie über die Geokoordinaten eine graphische Visualisierung einer Linie. Sie können dazu die Anwendung unter https://maps.co/gis/ verwenden.

### Lösung

#### Die Tabelle für den CSV Export

![Ausgabe Export](img/a11_table.jpg "Ausgabe Export")

#### Lösungs-Dateien

Das Script: [SQL Script](Scripts/a11.sql)

Das exportierte CSV: [SQL Script](csv/a11_713.csv)

#### Map Ausgabe

Ausgabe der Linie 713, am 01.01.2021:

![Map](img/a11_linie_713.jpg "Map")

## 📝 Aufgabe 12: Fahrplan einer Linie

### Aufgabenbeschreibung

Extrahieren Sie aus der Tabelle Ankunftszeiten die Soll-Abfahrtszeiten für eine Linie für einen bestimmten Tag. Die notwendigen Angaben sind in fahrt_id, datum und linie.

Die Abfrage soll die Haltestellen und die Uhrzeit pro Linie sortiert nach fahrt_id und Uhrzeit (ohne Datum) anzeigen.

### Lösung

Ein Ausschnitt des Ergebnisses für die Fahrt mit der ID 713:

![Fahrplan](img/a12.jpg "Fahrplan")

Das Script dazu finden: [SQL Script](Scripts/a12.sql)

## 📝 Aufgabe 13: Nächste Station zu meinem Standort

### Aufgabenbeschreibung

Wählen Sie eine GEO-Koordinate in Zürich. Ermitteln Sie eine Liste mit den 4 nächsten Stationen zu Ihrer Geokoordinate.

Visualisieren Sie Ihren Standort und die 4 nächsten Stationen mit Hilfe von https://maps.co/gis/.

Erstellen Sie eine Abfrage. Sie können die gewählte Geokoordinate direkt als Wert in der Abfrage verwenden.

### Lösung

Lösung ausstehend

## 📝 Aufgabe 14: Distanz zwischen zwei Haltestellen

### Aufgabenbeschreibung

Berechnen Sie für eine Linie die Distanz zwischen 2 Haltestellen. Sortieren Sie die Abfrage aufsteigend nach Distanz.

### Lösung

Ich habe für die Lösung die Fahrt mit der ID 713 am 01.01.2021 genommen:

![Distanzen](img/a14.jpg "Distanzen")

Das Script dazu: [SQL Script](Scripts/a14.sql)
