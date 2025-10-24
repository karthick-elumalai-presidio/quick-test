#!/bin/bash

echo "=== Debug Gemfile Location ==="
echo "Current directory: $(pwd)"
echo "Directory contents:"
ls -la
echo ""
echo "Gemfile exists: $(test -f Gemfile && echo 'YES' || echo 'NO')"
echo "Gemfile contents:"
cat Gemfile
echo ""
echo "Bundle check:"
bundle check
