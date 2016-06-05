# Opdracht Ansible

How to use:

 - Vagrant up
 - go to localhost:8079

 if you want to see the stats:
 localhost:8079/haproxy?stats

 To do the zero downtime update:
  - change the template `index.html.j2` in the templates folder
  - login to the mgr server `vagrant ssh mgr`
  - run following command `ansible-playbook rolling-deployment.yml`


  Sidenotes:
  - Running perfectly on Laptop but when tried to run on Computer it doesn't work as it should do.
  - port is NOT default 8080 but 8079
