# Test fixtures

One behaviour each, kept minimal. `30-documentation.test.js` holds this table
and this directory to each other in both directions.

| Fixture | Tests |
|---|---|
| `generic-note.xml` | Basic rendering, XML declaration as PI, no ONIX false positive |
| `with-comments.xml` | Comments render in `.px-comment` styling |
| `with-cdata.xml` | CDATA wrapped in `.px-cdata-marker` spans |
| `malformed.xml` | Parse error UI shown instead of crash |
| `rss.xml` | Non-ONIX XML doesn't get misidentified as ONIX |
| `onix-3.0-reference.xml` | Reference dialect: codelists, tag classes, summaries |
| `onix-3.0-short.xml` | Short-tag dialect: detection, styling, `SHORT_TO_REFERENCE` map |
| `onix-short-no-namespace.xml` | `<ONIXmessage>` root with no namespace: dialect from the root spelling, version from `release` |
| `onix-3.0-short-codelists.xml` | Short-tag code lists and the `<price>` chip in short dialect |
| `onix-3.1-standalone-product.xml` | `<Product>` root without an envelope; clean bar its deprecated `<TitleText>` |
| `onix-3.0-multi-title.xml` | Multiple `<TitleDetail>` blocks → summary picks `<TitleType>01</TitleType>` |
| `onix-3.0-gtin-only.xml` | Identifier preference order: GTIN-13 wins when ISBN-13 absent |
| `onix-3.0-isbn10-only.xml` | ISBN-10 labelled as "ISBN" in the summary |
| `onix-3.0-proprietary-only.xml` | Summary omits the identifier segment when no ISBN/GTIN present |
| `onix-3.0-acknowledgement.xml` | Acknowledgement: detection, "records" label, ack code lists |
| `onix-3.0-acknowledgement-short.xml` | Short-tag acknowledgement: `m489`/`a498` resolve via the registered ack short→reference bindings |
| `onix-standalone-product-no-namespace.xml` | Bare `<Product>` root, no namespace: detection via corroborating child, version-less label |
| `non-onix-product.xml` | A non-ONIX `<Product>` root (sku/price/…) is **not** misdetected as ONIX — guards the corroboration heuristic |
| `onix-3.0-title-without-prefix.xml` | Summary reads split-form titles: `<NoPrefix/>` + `<TitleWithoutPrefix>`, and `<TitlePrefix>` joined to the remainder |
| `onix-3.0-title-without-prefix-short.xml` | Same in short dialect (`b030` + `b031`) |
| `onix-3.0-single-product-blocks.xml` | `Block N` badges and the `Blocks: 1, 4, 6` pill; `RecordSourceIdentifier` and `Price` chips |
| `onix-3.1-valid.xml` | Schema-valid 3.1, zero findings: the validator's clean baseline |
| `onix-3.1-invalid.xml` | One instance of each finding kind (the defect catalogue; keeps its bad ISBN-10 on purpose) |
| `onix-3.0-text-attributes.xml` | `textformat` attribute chips on leaf and open rows |
| `onix-2.1-doctype.xml` | An ONIX 2.1 message with the standard `<!DOCTYPE … SYSTEM "…dtd">`: the DOCTYPE row keeps its `SYSTEM` keyword |
| `onix-3.1-dependent-codelists.xml` | Second-order code lists, one value element per selector, plus a free-text type 07; schema-valid |
