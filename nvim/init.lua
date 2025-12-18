if vim.fn.has("mouse") == 1 then
    vim.opt.mouse = "a"
end

vim.cmd("language en_US")

-- This need to be clean up, 'cause some things works by default in neovim.
vim.opt.backup = false		    -- do not keep a backup file
vim.opt.writebackup = false
vim.opt.autoindent = true		-- always set autoindenting on
vim.opt.smartindent = true    
vim.opt.autoread = true		    -- Load changed files without alerting us all the time
vim.opt.hlsearch = true
vim.opt.incsearch = true
vim.opt.swapfile = false
vim.opt.ruler = true

-- I don't remember what it doing.
vim.opt.switchbuf:append("uselast")

vim.opt.expandtab = true
vim.opt.smarttab = false
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.wrap = false
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.scrolloff = 5 	          -- Scroll vertially before hitting the edges of the window
vim.opt.sidescrolloff = 10        -- Scroll horizontally before hitting the edges of the window
vim.opt.ignorecase = true		  -- Make search case-insensitive by default

vim.opt.wildmenu = true
vim.opt.wildmode = {"longest", "list:full"}
vim.opt.wildignorecase = true

-- Also work under ru
vim.opt.langmap = 'ФИСВУАПРШОЛДЬТЩЗЙКЫЕГМЦЧНЯ;ABCDEFGHIJKLMNOPQRSTUVWXYZ,фисвуапршолдьтщзйкыегмцчня;abcdefghijklmnopqrstuvwxyz'

-- Work by default.
vim.opt.backspace={"indent", "eol", "start"}

-- Should word by default.
vim.opt.hidden = true

-- Theme
vim.opt.background = "dark"
vim.opt.termguicolors = true
vim.cmd("colorscheme ep4")

-- Status hiden, when 1 window open.
vim.opt.laststatus = 1

-- Disable leader timeout.
vim.opt.timeout = false
vim.opt.ttimeout = true

-- Disable autocomments.
vim.cmd('autocmd BufEnter * setlocal formatoptions-=ro')

-- File searche like in emacs
-- NOTE: disabled foreawhile.
-- vim.opt.autochdir = true

-- Open netrw.
--vim.keymap.set("n", "t", ":Oil<CR>", {noremap = true, silent = true})

-- Quit from terminal mode
vim.keymap.set("t", "<Esc>", [[<C-\><C-n>]], {silent = true})

-- Page up, page down.
vim.keymap.set("n", "f", "<C-f>")
vim.keymap.set("n", "m", "<C-b>")
vim.keymap.set("v", "f", "<C-f>")
vim.keymap.set("v", "m", "<C-b>")

-- Visual block mode.
vim.keymap.set("n", ",", "<C-v>")
vim.keymap.set("v", ",", "<C-v>")

-- Window's stuff.
vim.keymap.set("n", "q", "<C-w>w")
vim.keymap.set("v", "q", "<C-w>w")
vim.keymap.set("n", "<M-2>", ":vsplit<CR>")
vim.keymap.set("n", "<M-1>", "<C-w>o")

-- Next tab
vim.keymap.set("n", "<M-e>", "gt")   

-- I don't use it, but let it be.
vim.keymap.set("n", "<M-s>", ":w<CR>")      
vim.keymap.set("i", "<M-s>", "<C-o>:w<CR>")

-- Buffers.
vim.keymap.set("n", "<M-k>", ":bp<bar>sp<bar>bn<bar>bd<CR>") -- Kill and switch to next
vim.keymap.set("n", "<M-q>", ":b#<CR>")                      -- Switch to last.

-- Autoread file with external changes.
vim.api.nvim_create_autocmd("FocusGained", {
    pattern = "*",
    command = "silent! checktime"
})

-- Some insert mode helpers.
vim.keymap.set("i", "<M-d>", "<Del>")
vim.keymap.set("i", "<M-/>", "<C-n>")
vim.keymap.set("i", "<C-z>", "<C-o>zz")

-- Best keymap in vim ever.
vim.keymap.set("n", "<M-/>", ":noh<CR>", { silent = true })

-- Fix stupid clipboard.
vim.opt.clipboard = "unnamedplus"

-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

-- Install plugins using lazy
require('lazy').setup({
    { 
        'nvim-telescope/telescope-fzf-native.nvim',
        build = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build'
    },
    {
        'nvim-telescope/telescope.nvim', tag = 'v0.2.0',
        dependencies = { 'nvim-lua/plenary.nvim' },
        config = function()
            local telescope = require('telescope')

            telescope.setup{
                -- defaults = {
                    -- }
                    defaults = {
                        file_ignore_patterns = { "%.exe", "%.o", "%.obj", "%.dll" },
                    },
                    extensions = {
                        fzf = {
                            fuzzy = true,                    -- false will only do exact matching
                            override_generic_sorter = true,  -- override the generic sorter
                            override_file_sorter = true,     -- override the file sorter
                            case_mode = "smart_case",        -- or "ignore_case" or "respect_case"
                            -- the default case_mode is "smart_case"
                        }
                    }
                }

                --telescope.load_extension('fzy_native')
                telescope.load_extension('fzf')

                local builtin = require('telescope.builtin')

                vim.keymap.set('n', '<M-f>', builtin.find_files, { noremap = true, silent = true })
                vim.keymap.set('n', '<M-c>', builtin.buffers, { noremap = true, silent = true })
                vim.keymap.set('n', '<F2>', builtin.live_grep, { noremap = true, silent = true })
            end
        },
        {
            'stevearc/oil.nvim',
            ---@module 'oil'
            ---@type oil.SetupOpts
            opts = {},
            -- Optional dependencies
            dependencies = { { "nvim-mini/mini.icons", opts = {} } },
            -- dependencies = { "nvim-tree/nvim-web-devicons" }, -- use if you prefer nvim-web-devicons
            -- Lazy loading is not recommended because it is very tricky to make it work correctly in all situations.
            lazy = false,

            config = function()
                local oil = require('oil')

                oil.setup{
                    default_file_explorer = true,
                    delete_to_trash = false,
                }

                vim.keymap.set("n", "t", ":Oil<CR>", {noremap = true, silent = true})
            end
        },
    })
