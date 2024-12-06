# 🎆 Divers

## Ressources pour se former

- Cours Pluralsight [Certified Kubernetes Application Developer: Application Design and Build](https://app.pluralsight.com/library/courses/ckad-services-networking-cert/table-of-contents) 
  - de [Nigel Poulton](https://www.nigelpoulton.com/)
  - et [Dan Wahlin](https://www.linkedin.com/in/danwahlin/)
- Cours Udemy [Kubernetes Certified Application Developer (CKAD) with Tests](https://www.udemy.com/course/certified-kubernetes-application-developer/)
  - de [Mumshad Mannambeth](https://www.linkedin.com/in/mmumshad/)
  - cours recommandé par le CNCF
  - vient avec un accès à des labs interactif en ligne sur la plateforme [KodeKloud](https://kodekloud.com/)
- Pages officielles du CNCF sur le contenu de l'examen :
  - ℹ️ A propos : <https://www.cncf.io/training/certification/ckad/>
  - 📖 Certificate handbook : <https://docs.linuxfoundation.org/tc-docs/certification/lf-handbook2>
  - 💡 Exam tips : <https://docs.linuxfoundation.org/tc-docs/certification/tips-cka-and-ckad>
  - ❓ FAQ : <https://docs.linuxfoundation.org/tc-docs/certification/faq-cka-ckad-cks>
  - 🎲 Cheatsheet : <https://kubernetes.io/docs/reference/kubectl/quick-reference/>

## Des commandes utiles en vrac ❗️

| Use case                                       | Commandes                                                                           |
| ---------------------------------------------- | ----------------------------------------------------------------------------------- |
| Pour se connecter à un namespace               | `$> kubectl config set-context --current --namespace=<insert-namespace-name-here>;` |
| Pour voir les logs d'un pod                    | `$> kubectl logs <pod-id>;`                                                         |
| Si pas ou pas assez de logs                    | `$> kubectl describe pod <pod-id>`                                                  |
| Editer un pod pour lequel on n'a pas de config | `$> kubectl get pod <pod-name> -o yaml > pod-definition.yaml`                       |
| Editer un pod                                  | `$> kubectl edit pod <pod-name>`                                                    |

### Pointeurs de doc autorisés pendant la certif'

- <https://kubernetes.io/docs/concepts/workloads/controllers/job/>
- <https://kubernetes.io/docs/reference/kubernetes-api/workload-resources/job-v1/>
- <https://kubernetes.io/docs/concepts/workloads/controllers/cron-jobs/>
- <https://kubernetes.io/docs/reference/kubernetes-api/workload-resources/cron-job-v1/>