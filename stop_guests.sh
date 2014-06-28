#!/bin/sh

ps aux | grep qemu-system-arm | awk '{print $2}' | xargs kill
