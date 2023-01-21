#!/usr/bin/env python3
import subprocess
import json
import sys

def get_focused():
    i3msgret = json.loads(subprocess.check_output(['i3-msg', '-t', 'get_workspaces']).decode())
    focused = None
    for worksp in i3msgret:
        print(worksp["num"], worksp["focused"])
        if worksp["focused"]:
            focused = worksp["num"]
    return focused


def get_workspaces():
    i3msgret = json.loads(subprocess.check_output(['i3-msg', '-t', 'get_workspaces']).decode())
    workspaces = [None]*11    
    for worksp in i3msgret:
        workspaces[worksp["num"]] = worksp
    return workspaces


def get_next():
    focused = get_focused()
    workspaces = get_workspaces()
    output = workspaces[focused]["output"]
    for i in range(focused+1, 10):
        if workspaces[i] is None or workspaces[i]["output"] == output:
            return i
    return focused+1


def get_prev():
    focused = get_focused()
    workspaces = get_workspaces()
    output = workspaces[focused]["output"]
    for i in range(focused-1, -1, -1):
        if workspaces[i] is None or workspaces[i]["output"] == output:
            return i
    return focused-1

if sys.argv[1] == "num":
    print(get_focused)
    
if sys.argv[1] == "next":
    subprocess.check_output(['i3', 'workspace', str(get_next())])
if sys.argv[1] == "prev":
    subprocess.check_output(['i3', 'workspace', str(get_prev())])
