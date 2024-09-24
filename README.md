

# Kubernetes Hello World
A Kubernetes Hello World Project for Python Flask.  This project uses [a simple Flask app that returns correct change](https://github.com/bertrand12345/flask-change-microservice) as the base project and converts it to Kubernetes.




## Get Started

* Create Python virtual environment `python3 -m venv ~/.kube-hello && source ~/.kube-hello/bin/activate`
* Run `make all` to install python libraries, lint project, including `Dockerfile` and run tests

## Build and Run Docker Container

* Install [Docker Desktop](https://www.docker.com/products/docker-desktop)

* To build the image locally do the following.

`docker build -t flask-change:latest .` or run `make build` which has the same command.

* To verify container run `docker image ls`

* To run do the following:  `docker run -p 8080:8080 flask-change` or run `make run` which has the same command

* In a separate terminal invoke the web service via curl, or run `make invoke` 


```bash
[
  {
    "5": "quarters"
  }, 
  {
    "1": "nickels"
  }, 
  {
    "4": "pennies"
  }
]
```

* Stop the running docker container by using `control-c` command

## Running Kubernetes Locally

* Verify Kubernetes is working via docker-desktop context

```bash
(.kube-hello) ➜  kubernetes-hello-world-python-flask git:(main) kubectl get nodes
NAME             STATUS   ROLES    AGE   VERSION
docker-desktop   Ready    master   30d   v1.19.3
```

* Run the application in Kubernetes using the following command which tells Kubernetes to setup the load balanced service and run it:  

`kubectl apply -f kube-hello-change.yaml` or run `make run-kube` which has the same command



* Verify the container is running

`kubectl get pods`

Here is the output:



* Describe the load balanced service:

`kubectl describe services hello-python-service`


Invoke the endpoint to curl it:  

`make invoke`


To cleanup the deployment do the following: `kubectl delete deployment hello-python`

## References

* Azure [Kubernetes deployment strategy](https://azure.microsoft.com/en-us/overview/kubernetes-deployment-strategy/)
* Service [Cluster Config](https://kubernetes.io/docs/tasks/access-application-cluster/service-access-application-cluster/) YAML file
* [Kubernetes.io Hello World](https://kubernetes.io/blog/2019/07/23/get-started-with-kubernetes-using-python/)