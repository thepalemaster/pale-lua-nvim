--убрать свопы
vim.opt.swapfile = false

 --[[ Настройка панелей ]]--
-- Вертикальные сплиты становятся справа
-- По умолчанию панели в Neovim ставятся в зависимости от расположения текущей панели. Данная настройка поможет нам держать панели в порядке
vim.opt.splitright = true

-- Горизонтальные сплиты становятся снизу
vim.opt.splitbelow = true
 
 --[[ Дополнительные настройки ]]--
-- Используем системный буфер обмена
-- On Mac OS X and Windows, the * and + registers both point to the system clipboard so unnamed and unnamedplus have the same effect: the unnamed register is synchronized with the system clipboard.
-- 
-- On Linux, you have essentially two clipboards: one is pretty much the same as in the other OSes (CtrlC and CtrlV in other programs, mapped to register + in Vim), the other is the "selection" clipboard (mapped to register * in Vim).
-- 
-- Using only unnamedplus on Linux, Windows and Mac OS X allows you to:
-- 
-- CtrlC in other programs and put in Vim with p on all three platforms,
-- yank in Vim with y and CtrlV in other programs on all three platforms.
-- If you also want to use Linux's "selection" clipboard, you will also need unnamed.
vim.opt.clipboard = 'unnamedplus'

-- Отключаем дополнение файлов в конце
--что бы он автоматом не дописывал еоф 
vim.opt.fixeol = false

-- Автодополнение (встроенное в Neovim)
--Set completeopt to have a better completion experience
-- :help completeopt
-- menuone: popup even when there's only one match
-- noinsert: Do not insert text until a selection is made
-- noselect: Do not select, force to select one from the menu
-- shortness: avoid showing extra messages when using completion
-- updatetime: set updatetime for CursorHold
vim.opt.completeopt  = {'menuone', 'noselect', 'noinsert'}
vim.opt.shortmess = vim.opt.shortmess + { c = true} -- Avoid showing extra messages when using completion

-- Не автокомментировать новые линии при переходе на новую строку
vim.cmd("autocmd BufEnter * set fo-=c fo-=r fo-=o")

vim.opt.foldcolumn = '2'         --Ширина колонки для фолдов

vim.opt.colorcolumn =  '119' -- полоска для длинны строки

vim.opt.cursorline = true        -- Подсветка строки с курсором
vim.opt.termguicolors = true   -- set term gui colors (most terminals support this)

vim.opt.cmdheight = 2 -- more space in the neovim command line for displaying messages

vim.opt.relativenumber = true -- set relative numbered lines

-- have a fixed column for the diagnostics to appear in
-- this removes the jitter when warnings/errors flow in
vim.wo.signcolumn = "yes"
