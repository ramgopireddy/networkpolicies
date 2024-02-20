oc new-project cardservices
oc label ns cardservices app=cardservices

oc new-project paymentservices
oc label ns paymentservices app=paymentservices

oc new-project devstudio
oc label ns devstudio app=devstudio

oc new-app quay.io/bkozdemb/hello --name="hello"

oc get pods

oc run client --image=fedora --command -- tail -f /dev/null

oc rsh client

curl -v hello.devstudio:8080

oc get pods --show-labels

oc apply -f deny-by-default.yaml

oc rsh client

curl -v hello.devstudio:8080

oc apply -f allow-from-same-namespace.yaml

oc rsh client

curl -v hello.devstudio:8080

oc expose svc/hello

curl -v http://hello-devstudio.apps.cluster-vzbgg.dynamic.redhatworkshops.io

oc apply -f allow-from-openshift-ingress.yaml

curl -v http://hello-devstudio.apps.cluster-vzbgg.dynamic.redhatworkshops.io


oc project cardservices

oc run client --image=fedora --command -- tail -f /dev/null

oc rsh client

curl -v hello.devstudio:8080

---after failure, apply the network policy to allow

oc apply -f allow-from-cardservices.yaml -n devstudio

oc project paymentservices

oc run client --image=fedora --command -- tail -f /dev/null

oc rsh client

curl -v hello.devstudio:8080


