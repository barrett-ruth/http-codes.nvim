local M = {}

local open_url = require('http-codes.os').get_open_url()

M.config = {
    use = nil,
    open_url = open_url,
}

M.http_codes = function()
    if M.config.use == 'telescope' then
        require('telescope').extensions.http.list(M.config.open_url)
    elseif M.config.use == 'fzf' then
        require('http-codes.fzf').pick(M.config.open_url)
    end
end

M.setup = function(user_config)
    if
        user_config.use == nil
        or not vim.tbl_contains({ 'fzf', 'telescope' }, user_config.use)
    then
        vim.notify_once(
            'http-codes.nvim: must specify `use = {fzf,telescope}` in setup.',
            vim.log.levels.ERROR
        )
        return
    end

    M.config = vim.tbl_deep_extend('force', M.config, user_config)

    if M.config.use == 'telescope' then
        require('http-codes.telescope').setup()
    end

    vim.api.nvim_create_user_command('HTTPCodes', M.http_codes, {})
end

return M
