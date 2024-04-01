param (
    [ValidateNotNullOrEmpty()]
    [DateTime] $Date = (Get-Date),

    [ValidateNotNullOrEmpty()]
    [Boolean] $Silent = $False
)

function Get-RosaryMystery {
    param (
        [Parameter(Mandatory=$True)]
        [DateTime] $Date
    )
    $numSeconds = [Int64](Get-Date -Date $Date -UFormat "%s")
    $numWeeks = [Int32][Math]::Floor($numSeconds / 604800)
    $mysteryNo = $numWeeks % 5 + 1
    $dayOfWeek = Get-Date -Date $Date -UFormat "%A"
    $series = Import-Csv ./week.csv | Where-Object {
        $_.day_of_week -eq $dayOfWeek
    }
    $series = $series.series
    return New-Object -TypeName psobject -Property @{
        series = $series
        mysteryNo = $mysteryNo
    }
}

function Initialize-Directory {
    param (
        [Parameter(Mandatory=$True)]
        [String] $Path
    )
    if (!(Test-Path $Path)) {
        New-Item -ItemType Directory $Path | Out-Null
    }
}

function Start-Main {
    param (
        [Parameter(Mandatory=$True)]
        [DateTime] $Date,

        [Parameter(Mandatory=$True)]
        [Boolean] $Silent
    )

    $outPath = "out"
    Initialize-Directory -Path $outPath

    $value = Get-RosaryMystery -Date $Date
    $series = $value.series
    $mysteryNo = $value.mysteryNo
    $dateString = $Date.ToString("yyyy-MM-dd")
    $result = Import-Csv .\mysteries.csv | Where-Object {
        ($_.series_en -eq $series) -and ($_.mystery_no -eq $mysteryNo)
    }
    $result | Add-Member -NotePropertyName "date" -NotePropertyValue $dateString

    $jsonOutFile = Join-Path $outPath "$dateString.json"
    $result | ConvertTo-Json -Depth 100 | Set-Content $jsonOutFile
    if ($Silent -eq $False) {
        $result | Format-List
    }
}

Start-Main $Date $Silent
