time=$(date "+%Y%m%d%H%M%S")
TAG=jeecg-system-start-$time
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
mvn clean package -f ../pom.xml  -Dmaven.test.skip=true -s $MAVEN_SETTING
echo "=====================================docker login..."
docker login -u ch25ch@163.com -p RTnJFN3Hdi8gTa ${REGISTRY_URL}
echo "=====================================docker build ${FULL_IMAGE_URL}:${TAG}..."
docker buildx build -t ${FULL_IMAGE_URL}:${TAG} -f ../Dockerfile ../.. --platform linux/amd64
echo "=====================================docker push..."
docker push ${FULL_IMAGE_URL}:${TAG}
echo "=====================================Competed!"
