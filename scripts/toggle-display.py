#!/usr/bin/python
import i3
import subprocess
# from Xlib import X, display, Xutil
# from Xlib.ext import randr

# xrandr --output DP2 --primary
xrandr = subprocess.Popen(
    ['xrandr', '--output', 'DP2', '--primary'],
    stdout=subprocess.PIPE
)
output = xrandr.communicate()[0]
primary_output = filter(
    lambda output: output['active'] and output['primary'],
    i3.get_outputs()
)[0]
secondary_output = filter(
    lambda output: output['active'] and not output['primary'],
    i3.get_outputs()
)[0]

primary_workspaces = range(6)
for workspace in i3.get_workspaces():
    output = primary_output if workspace['num'] in primary_workspaces else secondary_output

    # set as current workspace.
    i3.workspace('%s' % workspace['name'])

    # and move it to the primary output if in
    # primary_workspaces else secondary_output
    i3.command(
        'move',
        'workspace to output %s' % output['name']
    )

#
i3.workspace('1')
