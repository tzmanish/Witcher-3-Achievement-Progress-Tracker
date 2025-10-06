# Localization

1. Rename the included `en` file to your language code. Supported languages:
```
ar  br  cn  cz  de  en  es  esmx  fr  hu  it  jp  kr  pl  ru  tr  zh
```

2. Edit the `text` column, then encode it using the W3 strings encoder. The mod's id-space is `5912`. Example:
```bash
w3strings.exe --encode en --id-space 5912
```

3. Place the encoded `[languagecode].w3strings` file in the mod's `content` directory, replacing the existing file.

4. (Optional) Publish the localization on Nexus and link it to the mod using Nexus options.
