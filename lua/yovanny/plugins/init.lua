return{
	"nvim-lua/plenary.nvim",
	"nvim-telescope/telescope.nvim",
	"folke/neodev.nvim",
	{ "nvim-tree/nvim-web-devicons", lazy = true },
	{ 
		"folke/neoconf.nvim", 
		cmd = "Neoconf" 
	},
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
	}
}

