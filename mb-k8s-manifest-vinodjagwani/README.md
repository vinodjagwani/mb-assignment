# Kubernetes Manifests assignment by Vinod Jagwani for MB

## Following manifest files are available deploying the applicaion.
1. ConfigMap - (Contains configuration data that can be injected into pods)
2. Deployment - (Defines a deployment for the application pods)
3. HPA - (Automatically scales the number of pods based on CPU usage)
4. Ingress - (Provides external access to the service via an ingress controller)
5. Namespace - (Defines a namespace for the application resources)
6. PV - Persistent Volume - (Defines a persistent volume backed by Amazon EFS)
7. PVC - Persistent Volume Claim - (Defines a persistent volume claim to use the persistent volume)
8. Secret - (Contains secrets used by the application)
9. Service - (Exposes the application pods internally within the cluster)
10. Storage Class - (Defines a storage class for dynamic provisioning of EFS volumes)

## Prerequisites

- Kubernetes cluster
- 'kubectl' command-line tool configured to interact with your cluster
- Amazon EFS setup

## Applying the Manifests - Run following command from console

1. kubectl apply -f namespace.yaml
2. kubectl apply -f secret.yaml
3. kubectl apply -f configmap.yaml
4. kubectl apply -f pv.yaml
5. kubectl apply -f pvc.yaml
6. kubectl apply -f storageclass.yaml
7. kubectl apply -f deployment.yaml
8. kubectl apply -f service.yaml
9. kubectl apply -f ingress.yaml
10. kubectl apply -f hpa.yaml
