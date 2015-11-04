# centos-base
构建centos6基础镜像
包含zsh jdk7 maven nginx等组件

#1. 构建centos基础镜像, 仅支持centos6

```bash
./centos.sh
```
此命令将新建一个名为 centos-6.6 的基础镜像,也可以不执行此步骤，Dockerfile中的FROM我已经指定了共有仓库的地址，
或者你可以自行修改FROM为自己本地构建的centos基础镜像以加快构建速度


#2. 构建base-image镜像

```bash
./build.sh
```
此命令将新建一个的名为 base-image 的镜像

*注: 依赖包较多, 可能会很慢, 稍安勿躁*

#3. 启动容器

host方式启动(共享宿主网络, 推荐, 但是只能启动一个实例)

```bash
./run-host.sh images-name [containerName]
```

bridge方式启动(docker私有网络, 默认)

```bash
./run.sh images-name [containerName]
```

#组件列表:
| 组件         |  开放端口  | 说明                                   |
| ----         | -----      | ----                                   |
| ssh          | 2222       | ssh服务                                |
| supervisor   | 9001       | 服务管理                               |
| samba        | 139,445    | 文件共享                               |
| scm          |            | git                                    |
| zsh          |            | 好用的shell                            |
| jdk7         |            |                                        |
| maven        |            | java构建工具                           |
| nginx        | 80         | web服务器                              |
| zookeeper    | 2181       | 集群工具                               |
| jboss        | 8081       | jboss                                  |
| ofbiz        | 8080       | ofbiz首页                              |
| ofbiz        | 8443       | ofbiz管理                              |


#如何管理
1. 直接ssh登录2222端口
2. 通过samba文件共享访问 \\hostip\root, (mac是: smb://hostip/root)
3. 通过supervisor http管理服务: http://hostip:9001/

*注1:所有密码都是root 123456*
*注2:如果是nat方式启动,请先用docker ps查看对应映射端口*

#服务管理
- 通过supervisor http管理服务: http://hostip:9001/
- supervisorctl help 查看帮助
- supervisorctl status 查看服务状态
- supervisorctl start samba 启动服务
- supervisorctl stop samba 停止服务
- supervisorctl restart samba 重启服务
