%dw 2.0
output application/csv
fun formatBooleanToNumber(value: String): Number =
    value match {
        case true -> 1
        case false -> 0
        else -> 0
    }
fun formatDataTime(value: String): String = 
    value as LocalDateTime{format: "yyyy-MM-dd'T'HH:mm:ss'Z'"} as String{format: "dd.MM.yyyy HH:mm:ss"}

 fun formatDateOnly(value: String): String =
    value as Date{format: "yyyy-MM-dd"} as String{format: "dd.MM.yyyy"}   
---
{
  "Name": payload.Name,
  "Anrede": payload.Anrede,
  "AngelegtAm": formatDataTime(payload.AngelegtAm),
  "GeaendertAm": formatDataTime(payload.GeaendertAm),
  "Straße": payload["Straße"],
  "Postleitzahl": payload.Postleitzahl,
  "Ort": payload.Ort,
  "Land": payload.Land,
  "GeborenAm": formatDateOnly(payload.GeborenAm),
  "Zuzahlungsbefreiung": formatBooleanToNumber(payload.Zuzahlungsbefreiung),
  "Patientenerklaerung": formatBooleanToNumber(payload.Patientenerklaerung)
}