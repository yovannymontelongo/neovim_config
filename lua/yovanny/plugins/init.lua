return{
    "sindrets/diffview.nvim",
    "f-person/git-blame.nvim",
	"nvim-lua/plenary.nvim",
	"nvim-telescope/telescope.nvim",
	"folke/neodev.nvim",
	{ "nvim-tree/nvim-web-devicons", lazy = false },
	{ 
		"folke/neoconf.nvim", 
		cmd = "Neoconf" 
	},
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
	}
}

