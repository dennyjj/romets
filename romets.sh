npm init --y
npm install --save-dev typescript ts-node @types/node
./node_modules/.bin/tsc --init
mkdir src
cd src
touch index.ts
echo "console.log('TypeScript App is Created✅');" >> index.ts
cd ..
./node_modules/.bin/ts-node src/index.ts
