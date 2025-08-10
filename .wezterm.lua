-- Pull in the wezterm API
local wezterm = require 'wezterm'

-- Import the action module
local act = wezterm.action

-- This will hold the configuration.
local config = wezterm.config_builder()

-- This is where you actually apply your config choices.

-- For example, changing the initial geometry for new windows:
config.initial_cols = 120
config.initial_rows = 28

config.max_fps = 144

config.hide_tab_bar_if_only_one_tab = true

config.audible_bell = 'Disabled'

config.font_size = 14
config.color_scheme = 'Catppuccin Mocha'

-- Add keybindings

config.pane_focus_follows_mouse = true

config.leader = { key = 'a', mods = 'CTRL' } 

config.keys = {
  -- Tabs
  {
    key = 't',
    mods = 'CTRL',
    action = act.SpawnTab 'CurrentPaneDomain',
  },
  {
    key = 'w',
    mods = 'CTRL',
    action = act.CloseCurrentTab { confirm = true },
  },
  {
    key = '1',
    mods = 'CTRL',
    action = wezterm.action.ActivateTab(0),
  },
  {
    key = '2',
    mods = 'CTRL',
    action = wezterm.action.ActivateTab(1),
  },
  {
    key = '3',
    mods = 'CTRL',
    action = wezterm.action.ActivateTab(2),
  },
  {
    key = '4',
    mods = 'CTRL',
    action = wezterm.action.ActivateTab(3),
  },
  {
    key = '5',
    mods = 'CTRL',
    action = wezterm.action.ActivateTab(4),
  },
  {
    key = '6',
    mods = 'CTRL',
    action = wezterm.action.ActivateTab(5),
  },
  {
    key = '7',
    mods = 'CTRL',
    action = wezterm.action.ActivateTab(6),
  },
  {
    key = '8',
    mods = 'CTRL',
    action = wezterm.action.ActivateTab(7),
  },
  {
    key = '9',
    mods = 'CTRL',
    action = wezterm.action.ActivateTab(8),
  },
  {
    key = '0',
    mods = 'CTRL',
    action = wezterm.action.ActivateTab(9),
  },




  -- Panes
  {
    key = 'h',
    mods = 'CTRL',
    action = wezterm.action.SplitPane { direction = 'Left', size = { Percent = 50 } },
  },
  {
    key = 'v',
    mods = 'CTRL',
    action = wezterm.action.SplitPane { direction = 'Down', size = { Percent = 50 } },
  },
  {
    key = 'x',
    mods = 'CTRL',
    action = wezterm.action.CloseCurrentPane { confirm = true },
  },
  {
    key = 'z',
    mods = 'CTRL',
    action = wezterm.action.TogglePaneZoomState,
  },

  --- Navigation
  {
    key = 'h',
    mods = 'ALT',
    action = wezterm.action.ActivatePaneDirection 'Left',
  },
  {
    key = 'l',
    mods = 'ALT',
    action = wezterm.action.ActivatePaneDirection 'Right',
  },
  {
    key = 'k',
    mods = 'ALT',
    action = wezterm.action.ActivatePaneDirection 'Up',
  },
  {
    key = 'j',
    mods = 'ALT',
    action = wezterm.action.ActivatePaneDirection 'Down',
  },

  -- Copy Mode
  {
    key = 'c',
    mods = 'LEADER',
    action = wezterm.action.CopyTo 'ClipboardAndPrimarySelection',
  },
  {
    key = 'y',
    mods = 'LEADER',
    action = wezterm.action.QuickSelect,
  },
  {
    key = '[',
    mods = 'LEADER',
    action = wezterm.action.ActivateCopyMode,
  },
  {
    key = 'f',
    mods = 'ALT',
    action = wezterm.action.TogglePaneZoomState,
  },
}

return config