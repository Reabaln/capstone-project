# Sockshop: Microservices Application
## Capstone Project - DevOps Bootcamp 
This project uses the sockshop microservices web app developed by [Weaveworks](https://www.weave.works/) to domenstrate several Cloud-Native technolgies. 



### Services Architecture 
The Sockshop Microservices applications is a web-based e-commerce app where users can browse items, add them to the cart, and purchase them. All services communicate using REST over HTTP. 

![Services Architectire](https://github.com/microservices-demo/microservices-demo.github.io/blob/HEAD/assets/Architecture.png?raw=true  "Weaveworks Sockshop Architecture")

### Depolyment Platform 
This application is deployed on Kubernetes cluster (k3s)  with 4 nodes having NGINX as an Ingress Controller, Tekton as an automation controller, Prometheous/Grafana for monitoring, and ELF for logging (Fluent Bit, Elasticsearch and Kibana)


#### Tools used
To Build and deploy Sockshop app, several Cloud-Native technologies and tools have been used as shown in the graph. It is built using Spring Boot, Go kit and Node.js and is packaged in Docker containers. 

![tools used](https://user-images.githubusercontent.com/63632708/97748824-22565d00-1aff-11eb-9bfb-42f94151fc8c.png)



**Prometheus/Grafana**
![proograaf-dashboard](https://user-images.githubusercontent.com/63632708/97748916-474ad000-1aff-11eb-9317-a954534927d5.png)



**ELF** 
![Kibana Dashboard](https://user-images.githubusercontent.com/63632708/97749584-5b430180-1b00-11eb-9093-1c224fd45f0d.png)



**Tekton**
![Tekton PR list](https://user-images.githubusercontent.com/63632708/97749802-bbd23e80-1b00-11eb-92b5-fb66db3e0a15.png)


![Tekton Cart Pipeline](https://user-images.githubusercontent.com/63632708/97749814-c096f280-1b00-11eb-9b8d-ee0fd0d2bc2a.png)

![tekton running in parallel](https://user-images.githubusercontent.com/63632708/97755365-1623cd00-1b0a-11eb-992b-ae54c3b0ea44.png)




### Installation
Clone this project to your machine. Then add Github/Docker Hub secrets to tun Tekton pipelines. 

**Prepare the platform by running the following command:**

	Make up 

**Build and deploy the project (CI/CD)**

	Make Build 


	

