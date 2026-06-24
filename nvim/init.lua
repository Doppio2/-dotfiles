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

-- Special chars --
vim.opt.list = true
vim.opt.listchars = {leadmultispace = '·', tab = '¬ '}

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
vim.keymap.set("n", "<M-h>", ":bp<bar>sp<bar>bn<bar>bd<CR>") -- Kill and switch to next
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

-- Default build command --
if vim.fn.has("win32") == 1 then 
    vim.opt.makeprg = "cmd /c chcp 65001 >nul && build.bat"
else
    vim.opt.makeprg = "./build.sh"
end

vim.api.nvim_create_user_command("MakeQuickFix", function(opts)
  vim.cmd("silent! make " .. opts.args)
  vim.cmd("botright copen")
end, { nargs = "*" })

vim.api.nvim_create_user_command("MakeQuickFixStay", function()
    local win = vim.fn.win_getid()
    local pos = vim.fn.getpos(".")

    vim.cmd("MakeQuickFix")

    vim.fn.win_gotoid(win)
    vim.fn.setpos(".", pos)
end, {})
vim.keymap.set("n", "<M-v>", ":MakeQuickFixStay<CR>")

-- Quickfix --
-- Open quickfix and return to cursor pos.
vim.keymap.set("n", "<A-x>", function()
    local current_win = vim.fn.win_getid()
    local current_pos = vim.fn.getpos(".")

    for _, win in ipairs(vim.fn.getwininfo()) do
        if win.quickfix == 1 then
            vim.cmd("cclose")

            if vim.fn.win_gotoid(current_win) == 1 then
                vim.fn.setpos(".", current_pos)
            end

            return
        end
    end

    vim.cmd("botright copen")

    if vim.fn.win_gotoid(current_win) == 1 then
        vim.fn.setpos(".", current_pos)
    end
end, {
    noremap = true,
    silent = true,
    desc = "Toggle quickfix without focus",
})

-- Switch to quickfix if opened.
vim.keymap.set("n", "<A-n>", function()
    for _, win in ipairs(vim.fn.getwininfo()) do
        if win.quickfix == 1 then
            vim.fn.win_gotoid(win.winid)
            return
        end
    end
end, {
    noremap = true,
    silent = true,
    desc = "Focus quickfix if open",
})

vim.keymap.set("n", "<A-j>", ":cnext<CR>", {
    noremap = true,
    silent = true,
    desc = "Next quickfix item",
})

vim.keymap.set("n", "<A-k>", ":cprev<CR>", {
    noremap = true,
    silent = true,
    desc = "Previous quickfix item",
})

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

if vim.g.neovide then
    vim.o.guifont = "Liberation Mono:h16" -- text below applies for VimScript
end

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
                    view_options = {
                        show_hidden = true,
                    },
                }

                vim.keymap.set("n", "t", ":Oil<CR>", {noremap = true, silent = true})
            end
        },
        {
<<<<<<< HEAD
            "neovim/nvim-lspconfig",

            dependencies = {
                "hrsh7th/nvim-cmp",
                "hrsh7th/cmp-nvim-lsp",
            },

            config = function()
                -- CMP capabilities
                local capabilities = require("cmp_nvim_lsp").default_capabilities()

                -- PYRIGHT
                vim.lsp.config("pyright", {
                    capabilities = capabilities,
                })

                vim.lsp.enable("pyright")

                -- AUTOCOMPLETE
                local cmp = require("cmp")

                cmp.setup({
                    completion = {
                        autocomplete = false,
                    },

                    mapping = cmp.mapping.preset.insert({
                        ["<CR>"] = cmp.mapping.confirm({ select = true }),
                        ["<C-Space>"] = cmp.mapping.complete(),
                    }),

                    sources = {
                        { name = "nvim_lsp" },
                    },
                })

                -- LSP KEYMAPS
                vim.keymap.set("n", "gd", vim.lsp.buf.definition)
                vim.keymap.set("n", "gr", vim.lsp.buf.references)
                vim.keymap.set("n", "K", vim.lsp.buf.hover)

                -- DIAGNOSTICS
                vim.diagnostic.config({
                    virtual_text = true,
                    signs = true,
                })

                -- TOGGLE DIAGNOSTICS
                local diagnostics_enabled = true

                vim.keymap.set("n", "<F8>", function()
                    diagnostics_enabled = not diagnostics_enabled

                    vim.diagnostic.config({
                        virtual_text = diagnostics_enabled,
                        underline = diagnostics_enabled,
                        signs = diagnostics_enabled,
                    })
                end)
            end
        },
        {
            'ludovicchabant/vim-gutentags',
            init = function()
                vim.g.gutentags_ctags_tagfile = 'tags'
                vim.g.gutentags_cache_dir = vim.fn.expand('~/.cache/nvim/tags/')
            end,
        },
    })
