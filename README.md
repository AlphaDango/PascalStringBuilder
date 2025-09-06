# uDangoStringBuilder

Ein leichter, eigenständiger **StringBuilder** für Delphi/Object Pascal.  
Entwickelt primär für **ältere Delphi-Versionen**, die keine  `TStringBuilder` Klasse haben.  

---

## ✨ Features

- Effizientes String-Aufbauen ohne ständiges Kopieren
- Dynamisches Wachstum des Buffers
- Methoden:
  - `Append(const S: string)` → Strings anhängen
  - `AppendChar(C: Char)` → einzelnes Zeichen anhängen
  - `ToString: string` → fertigen String zurückgeben
- Unterstützung für **Method Chaining**
- Robust gegen leere Strings
- Kompatibel mit Delphi 7+ bis Unicode Delphi Versionen (Delphi 2009)

---

## 📖 Klassenübersicht

### 🔹 TStringBuilder

**Eigenschaften**
- `FLength: Integer` → Anzahl der aktuell im Buffer gespeicherten Zeichen (intern)

**Methoden**
- `constructor Create(InitialCapacity: Integer = 16)`  
  Erstellt den StringBuilder.  
  - Wirft eine Exception, wenn `InitialCapacity < 1`.  

- `function Append(const S: string): TStringBuilder`  
  Hängt den angegebenen String an. Leere Strings werden ignoriert.  
  - Gibt für Method Chaining `Self` zurück.

- `function AppendChar(C: Char): TStringBuilder`  
  Hängt ein einzelnes Zeichen an.  
  - Gibt für Method Chaining `Self` zurück.

- `function ToString: string`  
  Gibt den gesamten Inhalt als String zurück.  
  - Bei leerem Buffer wird `''` zurückgegeben.

---

## 👨‍💻 Anwendung

### Strings anhängen (Method Chaining)

```pascal
var
  SB: TStringBuilder;
begin
  SB := TStringBuilder.Create;
  try
    SB.Append('Hallo')
      .AppendChar(' ')
      .Append('Welt')
      .AppendChar('!');
    ShowMessage(SB.ToString);  // "Hallo Welt!"
  finally
    SB.Free;
  end;
end;
```

### Einzelne Zeichen anhängen

```pascal
var
  SB: TStringBuilder;
begin
  SB := TStringBuilder.Create;
  try
    SB.AppendChar('A')
      .AppendChar('B')
      .AppendChar('C');
    ShowMessage(SB.ToString);  // "ABC"
  finally
    SB.Free;
  end;
end;
```

### Kombination aus Strings und Zeichen

```pascal
var
  SB: TStringBuilder;
begin
  SB := TStringBuilder.Create;
  try
    SB.Append('Zeichen: ')
      .AppendChar('X');
    ShowMessage(SB.ToString);  // "Zeichen: X"
  finally
    SB.Free;
  end;
end;
```

---

## 🛠️ Geplante Features

- **Clear-Methode**  
  Buffer komplett leeren, ohne ein neues Objekt erstellen zu müssen.

- **Properties**  
  - `Length`: aktuelle Länge des Inhalts  
  - `Capacity`: aktuelle Größe des internen Buffers

- **Method Chaining erweitern**  
  Rückgabe von `Self` für alle Append-Methoden, um Verkettungen zu vereinfachen.

- **Unicode-Unterstützung**  
  Kompatibilität für Delphi-Versionen ab 2009 (`string = UnicodeString`).

- **Performance-Optimierungen**  
  - Effizientere Verdopplung des Buffers bei sehr großen Strings  

- **Weitere Utility-Methoden**  
  - `Insert` → Zeichen oder Strings an einer beliebigen Position einfügen  
  - `Remove` → bestimmte Teilstrings entfernen

--- 

## ⚠️ Lizenz 

Dieses Projekt hat keine offene Lizenz.
Für jede Verwendung oder Weitergabe bitte vorher anfragen.
