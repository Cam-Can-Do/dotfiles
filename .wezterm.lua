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
-- config.front_end = "Software" -- Necessary in virtualized environments like VMs without a GPU

config.hide_tab_bar_if_only_one_tab = true

config.audible_bell = 'Disabled'

config.font_size = 14

-- Default theme
config.color_scheme = "Catppuccin Mocha"

wezterm.on("toggle-colors", function(window, pane)
  local overrides = window:get_config_overrides() or {}

  if overrides.color_scheme == "Builtin Light" then
    overrides.color_scheme = "Catppuccin Mocha"
  else
    overrides.color_scheme = "Builtin Light"
  end

  window:set_config_overrides(overrides)
end)

-- Add keybindings

config.pane_focus_follows_mouse = true


config.keys = {
  {
    key = "i",
    mods = "ALT|SHIFT|CTRL",
    action = wezterm.action.EmitEvent("toggle-colors"),
  },

  -- Tabs
  {
    key = 't',
    mods = 'ALT|SHIFT|CTRL',
    action = act.SpawnTab 'CurrentPaneDomain',
  },
  {
    key = 'w',
    mods = 'ALT|SHIFT|CTRL',
    action = act.CloseCurrentTab { confirm = true },
  },
  {
    key = '1',
    mods = 'ALT|SHIFT|CTRL',
    action = wezterm.action.ActivateTab(0),
  },
  {
    key = '2',
    mods = 'ALT|SHIFT|CTRL',
    action = wezterm.action.ActivateTab(1),
  },
  {
    key = '3',
    mods = 'ALT|SHIFT|CTRL',
    action = wezterm.action.ActivateTab(2),
  },
  {
    key = '4',
    mods = 'ALT|SHIFT|CTRL',
    action = wezterm.action.ActivateTab(3),
  },
  {
    key = '5',
    mods = 'ALT|SHIFT|CTRL',
    action = wezterm.action.ActivateTab(4),
  },
  {
    key = '6',
    mods = 'ALT|SHIFT|CTRL',
    action = wezterm.action.ActivateTab(5),
  },
  {
    key = '7',
    mods = 'ALT|SHIFT|CTRL',
    action = wezterm.action.ActivateTab(6),
  },
  {
    key = '8',
    mods = 'ALT|SHIFT|CTRL',
    action = wezterm.action.ActivateTab(7),
  },
  {
    key = '9',
    mods = 'ALT|SHIFT|CTRL',
    action = wezterm.action.ActivateTab(8),
  },
  {
    key = '0',
    mods = 'ALT|SHIFT|CTRL',
    action = wezterm.action.ActivateTab(9),
  },




  -- Panes
  {
    key = 'h',
    mods = 'ALT|SHIFT|CTRL',
    action = wezterm.action.SplitPane { direction = 'Left', size = { Percent = 50 } },
  },
  {
    key = 'v',
    mods = 'ALT|SHIFT|CTRL',
    action = wezterm.action.SplitPane { direction = 'Down', size = { Percent = 50 } },
  },
  {
    key = 'x',
    mods = 'ALT|SHIFT|CTRL',
    action = wezterm.action.CloseCurrentPane { confirm = true },
  },
  {
    key = 'f',
    mods = 'ALT|SHIFT|CTRL',
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

  -- Pane resizing
  {
    key = 'LeftArrow',
    mods = 'ALT|SHIFT|CTRL',
    action = wezterm.action.AdjustPaneSize { 'Left', 5 },
  },
  {
    key = 'RightArrow',
    mods = 'ALT|SHIFT|CTRL',
    action = wezterm.action.AdjustPaneSize { 'Right', 5 },
  },
  {
    key = 'UpArrow',
    mods = 'ALT|SHIFT|CTRL',
    action = wezterm.action.AdjustPaneSize { 'Up', 5 },
  },
  {
    key = 'DownArrow',
    mods = 'ALT|SHIFT|CTRL',
    action = wezterm.action.AdjustPaneSize { 'Down', 5 },
  },

}



return config