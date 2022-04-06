## Automated ELK Stack Deployment

The files in this repository were used to configure the network depicted below.

"Diagrams\Cloud Security Network Diagram + Elk.png"

These files have been tested and used to generate a live ELK deployment on Azure. They can be used to either recreate the entire deployment pictured above. Alternatively, select portions of the filebeat-playbook file may be used to install only certain pieces of it, such as Filebeat.

  - _TODO: Enter the playbook file._

This document contains the following details:
- Description of the Topologu
- Access Policies
- ELK Configuration
  - Beats in Use
  - Machines Being Monitored
- How to Use the Ansible Build


### Description of the Topology

The main purpose of this network is to expose a load-balanced and monitored instance of DVWA, the D*mn Vulnerable Web Application.

Load balancing ensures that the application will be highly reliable, in addition to restricting traffic to the network.

- Load balancers can defend against denial-of-service (DDos) attacks. Having a jumpbox that has hardened security allows you to manage other systems within your security or network.

Integrating an ELK server allows users to easily monitor the vulnerable VMs for changes to the file logs and system metrics.
- Filebeat monitors specified log files or locations, collects log events.
- It records machine metrics and stats, such as uptime.

The configuration details of each machine may be found below.

| Name        | Function      | IP Address              | Operating System  |
|-------------|---------------|-------------------------|-------------------|
| Workstation | Access Control| My IP Address           | Windows           |
| JumpBox     | Gateway       | 10.0.0.4/20.58.190.73   | Linux             |
| Web 1       | Webserver     | 10.0.0.9/20.213.164.101 | Linux             |
| Web 2       | Webserver     | 10.0.0.8/20.213.164.101 | Linux             |
| Web 3       | Webserver     | 10.0.0.10/20.213.164.101| Linux             |
| Elk         | Monitoring    | 10.1.0.4/20.213.241.110 | Linux             |

### Access Policies

The machines on the internal network are not exposed to the public Internet. 

Only the Elk machine can accept connections from the Internet. Access to this machine is only allowed from the following IP addresses:
- 20.58.190.73 (?is it supposed to be my IP?) via TCP port 5601 ???

Machines within the network can only be accessed by Workstation via the JumpBoxProvisioner.
- The JumpBoxProvisioner has access to the ELK VM and its IP address is 20.58.190.73

A summary of the access policies in place can be found in the table below. ???

| Name     | Publicly Accessible | Allowed IP Addresses    |
|----------|---------------------|-------------------------|
| JumpBox  | No (yes? for my IP?)| My IP ?                 | 
| Web 1    | No                  |                         | 
| Web 2    | No                  |                         | 
| Web 3    | No                  |                         | 
| Elk      | Yes                 | 20.58.190.73            | 

### Elk Configuration

Ansible was used to automate configuration of the ELK machine. No configuration was performed manually, which is advantageous because...
- It allows you to easily configure new machines, update programs on multiple machines/servers at once.

The playbook implements the following tasks:
- Install Docker
- Install python3-pip
- Install Docker python module
- Set the vm.max_map_count to 262144
- Download and launch a docker elk container

The following screenshot displays the result of running `docker ps` after successfully configuring the ELK instance.

TO DO "Images/docker_ps_output.png" TO DO

### Target Machines & Beats
This ELK server is configured to monitor the following machines:
- Web 1 10.0.0.9 
- Web 2 10.0.0.8
- Web 3 10.0.0.10

We have installed the following Beats on these machines:
- Filebeat 
- Metricbeat

These Beats allow us to collect the following information from each machine:
- Filebeat -monitors specified log files or locations, collects log events- e.g., tracking the cahnges made to system logs using event.dataset : "system.syslog" ?
- Metricbeat -collect metrics from systems and service- e.g., memory usage of a hosting server. ?


### Using the Playbook
In order to use the playbook, you will need to have an Ansible control node already configured. Assuming you have such a control node provisioned: 

SSH into the control node and follow the steps below: ??
- Copy the playbook (.yml) file to the Ansible directory. 
- Update the host file to include webserver and ELK.
- Run the playbook, and navigate to Kibana to check that the installation worked as expected.

_TODO: Answer the following questions to fill in the blanks:_
- _Which file is the playbook? Where do you copy it?_
- _Which file do you update to make Ansible run the playbook on a specific machine? How do I specify which machine to install the ELK server on versus which to install Filebeat on?_
- http://20.213.241.110:5601/app/kibana#/home

_As a **Bonus**, provide the specific commands the user will need to run to download the playbook, update the files, etc._ ???

Update the filebeat-config and metricbeat-config files each to point towards the ELK server IP address, username and password. (10.1.0.4, elastic & changeme, respectively, for both config files)

Update the /etc/ansible/hosts file with two separate sections for the private server IP addresses of the ELK server and the webservers on the internal network. (see above for IP addresses) configure two sections: [webservers] [elk]

# /etc/ansible/hosts
 [webservers]
 10.0.0.9 ansible_python_interpreter=/usr/bin/python3
 10.0.0.8 ansible_python_interpreter=/usr/bin/python3
 10.0.0.10 ansible_python_interpreter=/usr/bin/python3

 [elk]
 10.1.0.4 ansible_python_interpreter=/usr/bin/python3

Run the filebeat and metricbeat playbooks, and ssh into each webserver (10.0.0.9, 10.0.0.8, and 10.0.0.10)
enter: ssh sysadmin@server-ip-address (replace "server-ip-address" with above IP addresses).

Run the install-ELK playbook and navigate to the ELK server's Kibana webpage using the ELK server's public IP address at the following URL (http://20.213.241.110:5601/app/kibana#/home) to check that the installation worked as expected. You should see the Kibana homepage.