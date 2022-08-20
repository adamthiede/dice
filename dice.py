#!/usr/bin/env python3
"""
Rolls dice in a loop based on user input
"""
import random
import sys

def roll(sides, amount=1, mod=0):
    """
    Roll 'amount' of dice with 'sides' sides and add 'mod'
    """
    if mod>0:
        print(f"Rolling {amount} D{sides} +{mod}...")
    else:
        print(f"Rolling {amount} D{sides}...")

    rolls=[]
    for _ in range(0,amount):
        result=random.randint(1,sides)
        rolls.append(result)
    if amount>1:
        total=sum(rolls)+mod
        if mod>0:
            print(f"Total: {total}, Rolls: {rolls}, Mod: {mod}")
        else:
            print(f"Total: {total}, Rolls: {rolls}")
    else:
        print(rolls)
print("Type numbers only. Type Q to quit.")
print("Type # of dice, sides, and modifier, followed by Enter.")
print("Amount and modifier are optional.")
while True:
    print("Roll:")
    choice=input().strip()
    if choice in {"q", "Q"}:
        print("Game Over")
        sys.exit()
    if choice=="":
        roll(sides=20)
        continue

    val=choice.split(" ")
    if len(val)==1:
        roll(sides=int(val[0]))
    elif len(val)==2:
        roll(sides=int(val[1]), amount=int(val[0]))
    elif len(val)==3:
        roll(sides=int(val[1]), amount=int(val[0]), mod=int(val[2]))
    else:
        print("input some correct values.")
