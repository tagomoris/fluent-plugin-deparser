# fluent-plugin-deparser

## Component

### DeparserOutput

Generate string log value from log message, with specified format and fields, and re-emit.

## Configuration

### DeparserOutput

To build CSV from field 'store','item','num', as field 'csv', without raw data:

    <match in.marketlog.**>
      type deparser
      remove_prefix in
      format %s,%s,%s
      format_key_names store,item,num
      key_name csv
    </match>

To build same CSV, as additional field 'csv', with reserved raw fields:

    <match in.marketlog>
      type deparser
      tag marketlog
      format %s,%s,%s
      format_key_names store,item,num
      key_name csv
      reserve_data yes
    </match>

## TODO

* consider what to do next
* patches welcome!

## Copyright

Copyright:: Copyright (c) 2012- TAGOMORI Satoshi (tagomoris)
License::   Apache License, Version 2.0
