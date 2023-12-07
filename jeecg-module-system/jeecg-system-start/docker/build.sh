TAG=jeecg-system-start-$(date "+%Y%m%d%H%M%S")
# 阿里云服务器内部网络：registry-vpc.cn-hangzhou.aliyuncs.com
#公网：registry.cn-hangzhou.aliyuncs.com
REGISTRY_URL=registry.cn-hangzhou.aliyuncs.com
REGISTRY_SPACE=biz_prj/biz-prj-test
#项目空间
FULL_IMAGE_URL=${REGISTRY_URL}/${REGISTRY_SPACE}

echo "===================================Start to package"
echo "===================================git pull..."
git pull
echo "=====================================mvn clean package..."
mvn clean package -f ../pom.xml  -Dmaven.test.skip=true

echo "=====================================docker login..."
docker login -u ch25ch@163.com -p RTnJFN3Hdi8gTa ${REGISTRY_URL}
echo "=====================================docker build..."
echo "docker build param: -t ${FULL_IMAGE_URL}:${TAG} -f ./Dockerfile ../.."
docker buildx build -t ${FULL_IMAGE_URL}:${TAG} -f ../Dockerfile ../.. --platform linux/amd64
echo "=====================================docker push ${FULL_IMAGE_URL}:${TAG}..."
docker push ${FULL_IMAGE_URL}:${TAG}
echo "=====================================Competed!"
