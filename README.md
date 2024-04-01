# Daily Mystery of the Holy Rosary

## How to Pray the Rosary

*See more: [The Mysteries of the Rosary (vatican.va)](https://www.vatican.va/special/rosary/documents/misteri_en.html)*

## Usage

PowerShell:
```{PowerShell}
# Get today's mystery
./main.ps1

# Get today's mystery in silent mode
./main.ps1 -Silent $True

# Get the mystery of December 31, 2000
./main.ps1 -Date "2000-12-31"

# Get the mystery of December 31, 2000 in silent mode
./main.ps1 -Date "2000-12-31" -Silent $True
```

If success, the mystery of the day will be saved as a JSON file in the `out` folder of this directory. The JSON file's fields are:

| Field | Notes | Example |
| --- | --- | --- |
| series_en | Name of the series in English | Glorious Mysteries |
| series_vi | Name of the series in Vietnamese | Năm sự Mừng |
| mystery_no | The ordinal number of the mystery | 3 |
| bible_verses | Corresponding Bible verse(s) for the mystery | Acts 2:1-4 |
| name_en | Mystery's name in English | The descent of the Holy Spirit |
| name_vi | Mystery's name in Vietnamese | Đức Chúa Thánh Thần hiện xuống |
| prayer_vi | Additional prayer in Vietnamese | Ta hãy xin cho được lòng đầy rẫy mọi ơn Đức Chúa Thánh Thần |
| date | Date in `yyyy-MM-dd` format | 2000-12-31 |

## Sources

| Language | URL |
| --- | --- |
| English | https://www.vatican.va/special/rosary/documents/misteri_en.html |
| Vietnamese | https://www.tonggiaophanhanoi.org/phan-thu-ba-ngam-cac-phep-lan-hat/ |

## License

The prayers and their translations are in public domain.

Those PowerShell scripts of mine are licensed under [CC0 1.0 Deed](https://creativecommons.org/publicdomain/zero/1.0/) by me, the author.
