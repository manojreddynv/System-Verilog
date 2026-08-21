#!/bin/bash

echo "================================"
echo "   SystemVerilog Simulation"
echo "================================"

echo ""
echo "Compiling..."

iverilog -g2012 -o sim.out adder.sv tb_adder.sv

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

vvp sim.out

if [ $? -ne 0 ]; then
    echo ""
    echo "❌ Simulation FAILED"
    echo "Code will NOT be pushed."
    exit 1
fi

echo "--------------------------------"
echo "✅ Simulation completed successfully"

echo ""
read -p "Push this code to GitHub? [y/N]: " answer

if [[ "$answer" =~ ^[Yy]$ ]]; then

    echo ""
    echo "Adding changes..."
    git add .

    echo ""
    read -p "Enter commit message: " message

    if [ -z "$message" ]; then
        message="Update SystemVerilog code"
    fi

    git commit -m "$message"

    echo ""
    echo "Pushing to GitHub..."
    git push

    echo ""
    echo "🚀 Successfully pushed to GitHub!"

else

    echo ""
    echo "⏸️ Push cancelled."
    echo "Your code was NOT pushed to GitHub."
fi
