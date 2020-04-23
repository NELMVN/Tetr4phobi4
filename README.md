<p align="Center"><a href="https://vuejs.org" target="_blank" rel="noopener noreferrer">
    <img width="100" src="http://www.mediafire.com/convkey/d9ed/edp1u5u2pqv6sv2zg.jpg" alt="Tetr4phobi4 logo">
</a></p>

<h2 align="Center">Tetr4phobi4</h2>
An esoteric language that makes you fear in number 4.

---

<h2 align="Center">How to use</h2>

Run **Tetr4phobi4.vbs** by using CMD (Command Prompt).
```batch
cscript Tetr4phobi4.vbs test\Hello World.444
```

---

<h2 align="Center">Syntaxes</h2>

| Commands | Definitions |
| :---: | --- |
| `4444` | It will convert the current value of a current cell into an ASCII Character. If a current value is greater than 127, it will set a current value into 52. |
| `44UR` | Move a pointer to the left. |
| `FO44` | Move a pointer to the right. |
| `4OUR` | Add 4 to a current cell. |
| `FOU4` | Reduce 4 to a current cell. |
| `four` | Divide a current cell by 4. |
| `fuor` | Multiply a current cell by 4. |
| `ffff` | Set current cell into 0. |
| `{44}` | Comment |
| `$$$$` | Delimiter |

### Delimiter
* You must add `$$$$` to seperate between the 2 commands.
```tetr4phobi4
4OUR$$$$4444$$$$ffff$$$$4444
```

* Also you are allowed to use **Line Feed** as delimiter.
```tetr4phobi4
4OUR
4444
ffff
4444
```

or

```tetr4phobi4
4OUR
4444$$$$ffff
4444
```

### Comment
```tetr4phobi4
4OUR$$$$4444$$$$ffff$$$$4444 {44} This is a comment
```

---

<h2 align="Center">Limitations</h2>

* You only have **4 cells**.
* The maximum value of each cell is **4,444**.
