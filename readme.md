# http-codes.nvim

Quickly investigate HTTP status codes with the help of [mozilla](https://developer.mozilla.org/en-US/docs/Web/HTTP), including [telescope](https://github.com/barrett-ruth/telescope-http.nvim/) and [fzf-lua](https://github.com/ibhagwan/fzf-lua) integrations.

## Installation

Install via your favorite package manager, like [lazy](https://github.com/folke/lazy.nvim):

```lua
require('lazy').setup({
    {
        'barrett-ruth/http-codes.nvim'
        opts = {
            -- *REQUIRED*: 'fzf' or 'telescope'
            use = 'fzf',
            -- How the mozilla url is opened.
            -- Configured by default based on OS:
            open_url = 'xdg-open %s' -- UNIX
                  -- = 'open %s'     -- OSX
                  -- = 'start %s'    -- Windows
        },
        dependencies = {
            -- choose your picker:
            'ibhagwan/fzf-lua'
         -- 'nvim-telescope/telescope.nvim',
        },
    }
})
```

## [Configuration](./doc/http-codes.txt)

## Usage

Use the exposed command in vimscript:

```lua
:HTTPCodes
```

or in lua:

```lua
require('http-codes').http_codes()
```

## Migration

If migrating from [telescope-http.nvim](https://github.com/barrett-ruth/telescope-http.nvim), follow the above instructions&mdash;no telescope-specific config is necessary.
