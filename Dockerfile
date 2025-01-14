FROM node:20-alpine

# 작업 디렉토리 설정
WORKDIR /app

# package.json 복사 후 의존성 설치
COPY package.json ./
RUN yarn install --pure-lockfile

# 애플리케이션 파일 복사
COPY . .

# Next.js 빌드
RUN yarn build

# 3000번 포트 개방
EXPOSE 3000

# Next.js 서버 시작
CMD ["yarn", "start"]