vim.opt.encoding = 'utf-8'       --Кодировка
 
vim.opt.keymap="russian-jcukenwin"
--ввода при старте Вима - Английский
vim.opt.iminsert=0
--Аналогично настраивается режим поиска
vim.opt.imsearch=0

--должен подкрашивать цвета при изменении раскладки но не работает
vim.api.nvim_set_hl(0, 'lCursor', { bg='#FFEB95'})

