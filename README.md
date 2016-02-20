# kube-chaosmonkey

This  kills pods to help check your environment can withstand failures by using [fabric8 chaos monkey](http://fabric8.io/guide/chaosMonkey.html) without fabric8 dependency


#### Run as a shell
   - You  need to specify a couple of environment variables for the container.
   
|Environment Variable|Description|example|
|:---------|:-------------|:-----------:|
|KUBERNETES_MASTER| 	The URL to kubermaster|http://127.0.0.1:8080|
|KUBERNETES_NAMESPACE| 	The name space of the pod to delete randomly|default|
|CHAOS_MONKEY_INCLUDES|regular expressions which can be splited by , |zk*,kafka*|
|CHAOS_MONKEY_EXCLUDES|regular expressions which can be splited by , |zk*,kafka*|
|CHAOS_MONKEY_KILL_FREQUENCY_SECONDS| The frequency to call the chaos monkey(seconds)| 30|
   - Start chaos monkey docker container 
    ```txt
    docker run -d \
    -name chaosmonkey
 	-e KUBERNETES_MASTER=http://127.0.0.1:8080 \
 	-e KUBERNETES_NAMESPACE=default \
	-e CHAOS_MONKEY_INCLUDES=zookeeper*,kafka* \
 	-e CHAOS_MONKEY_EXCLUDES=zk2* \
 	-e CHAOS_MONKEY_KILL_FREQUENCY_SECONDS=30 \
 	fabric8/chaos-monkey:2.2.110
    ```
  - Checking the logs of chaos monkey docker container 
  
    ```txt
    docker logs chaosmonkey
    ```


#### Run inside the kubernetes
  - Update env part of [chaos-monkey-rc.yaml](kubernetes/chaos-monkey-rc.yaml), it's the same as the shell

   ```
   $ kubectl create -f kubernetes/chaos-monkey-rc.yaml
   ```
   
  - Check the log of the container
   
   
  





