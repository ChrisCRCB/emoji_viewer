@echo off
rm -rf docs & flutter build web --release & move build\web docs & git add docs & git commit -am "Built for the web."