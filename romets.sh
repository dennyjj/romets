PROJECT_NAME=""
if [ -n "$1" ]; then
    PROJECT_NAME=$1
else
    PROJECT_NAME="romets-app"
fi
mkdir $PROJECT_NAME
cd $PROJECT_NAME
npm init --y
npm install --save-dev typescript ts-node @types/node
./node_modules/.bin/tsc --init
mkdir src
cd src
touch index.ts
echo "console.log('TypeScript App is Created✅');" >>index.ts
cd ..
./node_modules/.bin/ts-node src/index.ts
