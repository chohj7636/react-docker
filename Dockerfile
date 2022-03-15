# base image
FROM node:16.13.1
# FROM node:alpine as build

# 빌드된 산출물을 실행시키기 위해 필요한 serve 모듈 
RUN npm install -g serve

# 작업 공간 
RUN mkdir /app 
WORKDIR /app 
COPY . /app

# 의존성 설치 및 빌드
RUN yarn \
    && yarn build

# open port
EXPOSE 3000

# 실행 명령어 
ENTRYPOINT ["serve", "-s", "build"]

