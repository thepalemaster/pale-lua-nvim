--он не то чтобы сильно нужен но чисто для удобства
-- nm - создает горячую клавишу в нормальном режиме
-- im - создает горячую клавишу в режиме ввода
-- vm - создает горячую клавишу в визуальном режиме
-- tm - создает горячую клавишу в терминальном режиме
-- Алиас для быстрого доступа к методу установки горячих клавиш
local map = vim.api.nvim_set_keymap 

--[[
Метод для установки горячих клавиш (normal)
key - {string} Строка с горячей клавишей
command - {string} Команда
]]--
function nm(key, command) 
	map('n', key, command, {noremap = true})
end

--[[
Метод для установки горячих клавиш (input)
key - {string} Строка с горячей клавишей
command - {string} Команда
]]--
function im(key, command)
	map('i', key, command, {noremap = true})
end

--[[
Метод для установки горячих клавиш (visual)
key - {string} Строка с горячей клавишей
command - {string} Команда
]]--
function vm(key, command)
	map('v', key, command, {noremap = true})
end

--[[
Метод для установки горячих клавиш (terminal)
key - {string} Строка с горячей клавишей
command - {string} Команда
]]--
function tm(key, command)
	map('t', key, command, {noremap = true})
end 
