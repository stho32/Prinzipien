# Prinzipien bei der Entwicklung von Software

Neben den üblichen Kandidaten hier meine Gedanken zu einigen Dingen, 
die mir in meiner jahrelangen Praxis begegnet sind. 

Während das die Antworten sind, auf die ich gekommen bin, kann und möchte
ich nicht ausschließen, dass man bei anderer Historie vielleicht anders denkt.
Wer weiß, die Welt ist groß.

## Mehr Quelltext ist eigentlich immer eine schlechte Idee. Strebe nach wenig Source.

Dabei ist es nicht wichtig, ob man selbst den Code geschrieben hat oder nicht. 
Bei PHP z.B. ist es inzwischen üblicher, sich ein ganzes Framework herunterzuladen
und dieses zu verwenden um Anwendungen zu schreiben. 
Das hat Vorteile - aber machen wir uns nichts vor: Wenn man 1000 Dateien fremden 
Quelltextes in eine Anwendung lädt, dann sind das auch verflucht viele Quelltextzeilen, die man nicht ausreichend kennt und die verflucht viele Variablen beinhalten und Gedanken und Abhängigkeiten. 

Im Endeffekt sind Bibliotheken toll, aber wann immer man kann, nutze man lieber weniger als mehr.

Der negative Effekt wird einem noch klarer, wenn man das gleiche Projekt in 5 Jahren anfassen muss. Und feststellt, wie viele genutzte Bibliotheken inzwischen nicht mehr existieren, breaking changes hatten, ...

## Lesbarkeit und Verständlichkeit sind weitaus wichtiger als Performance.

## Strebe danach, alles sehr gut zu machen, aber vergebe dir auch.

Es gibt aus irgendeinem Grund keine Möglichkeit in einer Gruppe keine Kritik zu ernten. Egal was man wie gut macht, man wird immer ständig Leute finden, die etwas zu nörgeln finden. Vielleicht ist man selbst auch nicht zufrieden. 

Der Zustand, dass alle zufrieden sind, ist aber nicht zu erreichen. Manchmal reicht es schon, einfach so gut zu arbeiten, dass der "Schmerz" woanders hin wandert.

## Schreibe die Anwendungen in einer angemessenen Sprache.

Wenn du international angewandte Software schreibst, dann schreib sie in (gutem) Englisch. Nicht so einem google-Translator gestottere.

Wenn du Software schreibst, die nur innerhalb einer lokal arbeitenden Firma verwendet wird, dann benenne die Klassen und Variablen in der lokalen Sprache. Das schaltet eine Menge Abstraktionen aus.

## Dokumentiere Anforderungen, keine Aufgaben! Und dokumentiere sie sofort.

## Es geht um verantwortliche Entscheidungen, nicht Urlaub, Freizeit, dein Wochenende oder Schuld.

Ich möchte, dass die Dinge, die ich schreibe _laufen_. Das ist mir wichtig. 
Dennoch hab ich mich oft erwischt, wie ich Mantras unserer Gesellschaft nachplappere:
  - "Man muss doch mal abschalten können."
  - "Im Urlaub müsste ich eigentlich auch mal 2 Wochen nicht erreichbar sein..."

Aus meiner Sicht hat alles miteinander zu tun, aber es beginnt mit meinen eigenen Entscheidungen. 
  - Wenn ich nicht alle Register ziehe, wenn es um Sorgfalt in meiner Software geht, dann muss ich mich nicht wundern, dass ich am Wochenende oder im Urlaub angerufen werde. Die Firma muss mit der Software arbeiten können, sonst erschafft sie keinen Mehrwert...
  - Selbst wenn ich das tue, dann kann es immer noch zu unvorhergesehenen Dingen kommen. Und dann ist es mein Wunsch, erreichbar zu sein. Was ich tue, wenn ich professionell entwickle, ist, eine Leistung für andere bereit zu stellen. Das ist ein hohes Gut, das ich entwickeln und stützen möchte. Für die Welt da draußen. Also finde ich es schön, wenn ich so gut bin, dass mich im Urlaub niemand anrufen muss. Aber wenn ein Problem besteht, dann möchte ich liebend gern ansprechbar sein.
  - Es geht nicht um Schuld. Oft kann man in der Entwicklung Entscheidungen treffen und alle Wege haben Nachteile die irgendwann mal einem auf das Bein fallen. Wirklich alle. Manchmal habe ich viel Mühe in einen Bereich investiert um dann nie wieder dort dran zu arbeiten und das Projekt ist obsolet geworden. Manchmal habe ich schnell etwas zusammengebastelt und bin es jahrelang nicht mehr los geworden.
  Eigentlich zählt immer nur eins: die nächste verantwortliche Entscheidung im Hinblick auf die Leistung für die anderen. Dann baut man etwas auf. 

## Du entscheidest.

  - Ob du dich fortbildest oder nicht entscheidest DU SELBST. Niemand kann dir Fortbildung verbieten. Man kann es nicht fördern, aber verbieten kann es dir niemand.
  - Die Entscheidung, ob du dich in deiner Freizeit fortbildest oder nicht, triffst DU.
  - Wenn du nach 5 Jahren die Firma wechselst und feststellst, dass du nur Technologien kennst, die vor 10 Jahren aktuell waren und die sonst niemand mehr braucht, ist nicht dein ehemaliger Arbeitgeber schuld!
  - Ob du so sorgfältig arbeitest, dass dich niemand im Urlaub anrufen muss oder nicht, entscheidest DU.
  - Ob du eine Anweisung deines Arbeitgebers befolgst oder nicht, entscheidest DU. Beides kann gut sein, beides kann schlecht sein. Aber letztlich schreibst du den Quelltext, also liegt die Entscheidung bei dir.
