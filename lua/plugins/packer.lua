 -- команда лоя учтановки пакера
-- git clone --depth 1 https://github.com/wbthomason/packer.nvim\
--  ~/.local/share/nvim/site/pack/packer/start/packer.nvim
-- если уже установлен можно закоментировать
local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
    vim.cmd([[packadd packer.nvim]])
    return true
  end
  return false
end
local packer_bootstrap = ensure_packer()
-- the first run will install packer and our plugins
if packer_bootstrap then
  require("packer").sync()
  return
end
 
 
-- Добавляем Packer как пакет в Neovim
vim.cmd ([[packadd packer.nvim]])

-- Используем данный коллбэк как список для плагинов
return require('packer').startup(function()

	-- Добавляем Packer в список, чтобы он обновлял сам себя
	use 'wbthomason/packer.nvim'

	-- LSP сервер
	use 'neovim/nvim-lspconfig'
	
	-- Иконки для автодополнения
	use {
		'onsails/lspkind-nvim',
		config = function()
			require('plugins/lspkind')
		end
	}

	--Инсталлер для серверов LSP
	use {
		'williamboman/nvim-lsp-installer',
		config = function()
			require('plugins/lsp-installer')
		end
	}

	-- Удобное меню для обозрения проблем LSP
	use {
		"folke/trouble.nvim",
		requires = "kyazdani42/nvim-web-devicons",
		config = function()
			require("trouble").setup {}
		end,
	}
	
	-- автоматические закрывающиеся скобки
	use { 'windwp/nvim-autopairs',
		config = function()
			require("nvim-autopairs").setup()
		end
	}
	
	-- строка статуса
	use {
		'nvim-lualine/lualine.nvim',
		requires = { 'kyazdani42/nvim-web-devicons', opt = true },
		config = function()
			require('plugins/lualine')
		end
	}
	
	-- use 'mfussenegger/nvim-dap' --debug
	use({ "rcarriga/nvim-dap-ui", 
		requires = { "mfussenegger/nvim-dap" },
		config = function()
			require("dapui").setup()
		end
	})
	use "nvim-lua/plenary.nvim" --зависимость к дебагу
-- для улучшения дебага 
-- https://github.com/simrat39/rust-tools.nvim/wiki/Debugging

	-- Плагин для того чтобы показывать процесс загрузки LSP
	  use({
		"j-hui/fidget.nvim",
		config = function()
			require("fidget").setup() --лень было писать отдельный файл
		end
	})
	
	--Подсветка синтаксиса в Neovim
	use {
		'nvim-treesitter/nvim-treesitter',
		config = function()
			require('plugins/nvim-treesitter')
		end
	}
		
	--для раста
    use {
		'simrat39/rust-tools.nvim',
		config = function()
			require('plugins/rust-tools')
		end
	}
		
	 -- Даже если включена русская раскладка, то nvim-команды будут работать
	--use 'powerman/vim-plugin-ruscmd'
	
	--всевозможные автозаполнялки
	use {
		'hrsh7th/nvim-cmp' ,
		config = function()
			require('plugins/cmp')
		end
	}
    -- LSP completion source:
    use 'hrsh7th/cmp-nvim-lsp'
    -- Useful completion sources:
    use 'hrsh7th/cmp-nvim-lua'
    use 'hrsh7th/cmp-nvim-lsp-signature-help'
    use 'hrsh7th/cmp-vsnip'                             
    use 'hrsh7th/cmp-path'                              
    use 'hrsh7th/cmp-buffer'                            
    use 'hrsh7th/vim-vsnip'   
    
    --файловая система вызвать :Neotree
	use {
		"nvim-neo-tree/neo-tree.nvim",
		branch = "v2.x",
		requires = { 
			"nvim-lua/plenary.nvim",
			"nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
			"MunifTanjim/nui.nvim",
		}
	}
	
end)
