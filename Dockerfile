# ใช้ Node.js base image
FROM node:20-alpine

# ตั้ง working directory
WORKDIR /usr/src/app

# คัดลอกไฟล์ package.json และ package-lock.json
COPY app/package*.json ./

# ติดตั้ง dependencies
RUN npm cache clean --force \
  && npm cache verify \
  && rm -rf node_modules package-lock.json \
  && npm install --prefer-online --no-cache

# คัดลอก source code ที่เหลือ
COPY app/ .

# เปิด port 80
EXPOSE 80

# รันแอป
CMD [ "npm", "start" ]