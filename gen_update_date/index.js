 const axios = require('axios');

const id = process.argv.slice(2);
const prefix = process.argv.slice(3);
main();

async function main() {
  await updateDate();
  setInterval(updateDate, 60 * 1000);
}

async function updateDate() {
  try {

    const port = (prefix == "chj") ? 9872 : 9873
    const response = await axios.get(`http://121.41.118.162:${port}/gen/updateDate/42c25d0c9c18/${id}`);
    console.log(`${getTime()}, 响应数据: ${response.data}`);
  } catch (e) {
    console.error(`${getTime()}, 请求失败:', ${e.message}`);
  }
}

function getTime() {
  const now = new Date();
  
  const year = now.getFullYear();
  const month = String(now.getMonth() + 1).padStart(2, '0'); // 月份从0开始
  const day = String(now.getDate()).padStart(2, '0');
  const hours = String(now.getHours()).padStart(2, '0');
  const minutes = String(now.getMinutes()).padStart(2, '0');
  const seconds = String(now.getSeconds()).padStart(2, '0');

  return `${year}-${month}-${day} ${hours}:${minutes}:${seconds}`;
}

