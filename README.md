# SwiftString-VersionNumberComparison

## Standard Way

```"10.8".compare("10.9", options: .numeric) //.orderedAscending```

```"10.9".compare("10.12", options: .numeric) //.orderedAscending```

```"10.0".compare("10.0.0", options: .numeric) //.orderedAscending``` :worried:!?

## With Extension

```"10.8".compareVersion(with: "10.9") //.orderedAscending```

```"10.9".compareVersion(with: "10.12") //.orderedAscending```

```"10.0".compareVersion(with: "10.0.0") //.orderedSame``` :satisfied:
