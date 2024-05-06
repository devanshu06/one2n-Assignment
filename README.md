
# One2n-Assignment

### Problem Statement:

Create a Kubernetes cron job that pulls node metrics like (CPU, Memory, Disk usage) and stores them in a file.

* Every time the cron runs, it should create a new file. The filename should have the current timestamp.
* By default, cron should be minute, but it should be configurable with the slightest changes to code.
* Choose a tool of your choice to collect and expose metrics. Preferable is node exporter.
* The instances involved here are Kubernetes nodes themselves.

### Expected Output:

* The actual program code pulls the metrics and writes them to a file.
* The Dockerfile to containerize the code.
* Kubernetes YAML or HELM Chart.
* A README file explaining the design, deployment and other details.
* If possible, record a short video to demo the output with the code files.

# Solution:
## Files Overview:
This repository Contains 4 files let me explain Each file:
* node-exporter.yml
* cronjob.yml
* Dockerfile
* metrics.sh

#### 1. node-exporter.yml
This Kubernetes manifest file deploys the node-exporter as a DaemonSet on each worker node in the Kubernetes cluster. Additionally, it defines a Service to expose the node-exporter metrics, enabling access for other components such as the cron job.

#### 2. metrics.sh
This bash script is responsible for fetching node metrics from the node-exporter service and storing them in a file. The script utilizes tools like curl to retrieve metrics endpoints exposed by node-exporter and date to generate timestamps for filenames.

#### 3. Dockerfile
This file contains instructions to build a Docker image encapsulating the metrics.sh script. The Docker image provides a portable environment for executing the script within Kubernetes.

#### 4. cronjob.yml
This Kubernetes manifest file defines a CronJob resource, specifying the schedule for running the metrics.sh script. It configures the cron job to execute every minute by default. Additionally, it attaches a local volume to the cron job to ensure data persistence across executions.


## Deployment Steps:
#### Deploy node-exporter: 
Apply the node-exporter.yml manifest to the Kubernetes cluster using `kubectl apply -f node-exporter.yml`. 
#### Build Docker Image: 
Execute `docker build -t dev06/one2n:Assignment .` within the directory containing the Dockerfile to build the Docker image.
#### Deploy Cron Job:
Apply the cronjob.yml manifest to the Kubernetes cluster using `kubectl apply -f cronjob.yml`. This will create a CronJob resource configured to execute the metrics.sh script every minute by default.

# Demo:
You can watch a demonstration of the solution in action in the provided video.

