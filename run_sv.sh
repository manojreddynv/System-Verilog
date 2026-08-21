#!/bin/bash

PROJECT="$1"

if [ -z "$PROJECT" ]; then
    echo "Usage: ./run_sv.sh <project-folder>"
    exit 1
fi

if [ ! -d "$PROJECT" ]; then
    echo "❌ Project folder not found: $PROJECT"
    exit 1
fi

echo "================================"
echo " SystemVerilog: $PROJECT"
echo "================================"

echo ""
echo "Compiling..."

iverilog -g2012 -o "$PROJECT/sim.out" "$PROJECT"/*.sv

if [ $? -ne 0 ]; then
    echo ""
    echo "❌ Compilation FAILED"
    echo "Code will NOT be pushed."
    exit 1
fi

echo "✅ Compilation successful"

echo ""
echo "Running simulation..."
echo "--------------------------------"

vvp "$PROJECT/sim.out"

if [ $? -ne 0 ]; then
    echo "❌ Simulation FAILED"
    echo "Code will NOT be pushed."
    exit 1
fi

echo "--------------------------------"
echo "✅ Simulation successful!"

rm -f "$PROJECT/sim.out"

echo ""
read -r -p "Push $PROJECT to GitHub? [y/N]: " answer

if [[ "$answer" =~ ^[Yy]$ ]]; then

    git add -A

    git commit -m "Added $PROJECT SystemVerilog code and simulation"

    if [ $? -ne 0 ]; then
        echo "❌ Commit failed."
        exit 1
    fi

    git push

    if [ $? -eq 0 ]; then
        echo ""
        echo "🚀 Successfully pushed to GitHub!"
    else
        echo ""
        echo "❌ GitHub push failed."
        exit 1
    fi

else

    echo ""
    echo "⏸️ Push cancelled. Nothing was pushed."

fi
