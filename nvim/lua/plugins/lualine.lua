local status, lualine = pcall(require, 'lualine')
if not status then
    return
end

local themee = require('lualine.themes.nightfly')

themee.insert.a.bg = '#2ce65d'

lualine.setup({
    options = {
        theme = themee
    }
})

