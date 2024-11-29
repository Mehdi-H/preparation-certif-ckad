# Préparation certif' CKAD

- [Préparation certif' CKAD](#préparation-certif-ckad)
  - [Quelques commandes](#quelques-commandes)
    - [Pré-requis](#pré-requis)
  - [Define and build image](#define-and-build-image)
  - [Jobs \& CronJobs](#jobs--cronjobs)
    - [Pour s'exercer](#pour-sexercer)
    - [Pointeurs de docs utiles et autorisés le jour J](#pointeurs-de-docs-utiles-et-autorisés-le-jour-j)

## Quelques commandes

![Availble commands](docs/available-commands.png)

### Pré-requis

- 🥏 [Kubectl](https://kubernetes.io/fr/docs/tasks/tools/install-kubectl/)
- 🚐 [Minikube](https://kubernetes.io/fr/docs/tasks/tools/install-minikube/)
- 🐳 Docker ou [Colima](https://github.com/abiosoft/colima)
- ⚙️ make (>v4)
- 🧊 [charmbracelet/freeze](https://github.com/charmbracelet/freeze)

## Define and build image

- Pour save une image : `$> docker save ckad:docker --output ckad.tar`
- Pour save & compresser une image : `$> docker save ckad:docker | gzip > image .tar.gz`
- Créer une image à partir d'une image trifouillée : `$> docker commit <container> <new_image>`
- Renommer une image : `$> docker image tag ckad:docker mho/ckad:docker`
- Détruire une image s'il n'y a pas de container associé qui tourne : `$> docker image rm <image>`

> [!TIP]
> Pour aller + loin : <https://github.com/nigelpoulton/ckad>

## Jobs & CronJobs

>[!Warning]
> Il peut arriver qu'on nous demande de se positionner dans un namespace précis pour faire des actions, mais sans nous dire comment faire :
>
> `$> kubectl config set-context --curent --namespace=<ns>;`

| Kind    | Spec                    | ?                                                  |
| ------- | ----------------------- | -------------------------------------------------- |
| CronJob | concurrencyPolicy       | Allow x Forbid x Replace                           |
| CronJob | startingDeadlineSeconds | Deadline avant laquelle lancer le job              |
| Job     | activeDeadlineSeconds   | Terminate job if it still runnning after N seconds |
| Job     | backoffLimit            | Combien de retry (exponentiel) max                 |
| Job     | backoffLimit            | Stop attempting retries after N tries              |
| Job     | completions             | Combien de pods on veut lancer                     |
| Job     | parallelism             | Combien de pods peuvent être lancés en //          |

> [!Warning]
> Si startingDeadlineSeconds est inférieur à 10, le Cronjob risque de ne jamais démarrer, car le CronJobController vérifie toutes les 10 secondes si un nouveau job a été déclaré

### Pour s'exercer

> [!Tip]
> Des exercices/Q&A dispo sur ce topic ici :
> 🔗 <https://github.com/nigelpoulton/ckad/blob/main/1%20Application%20Design%20and%20Build/3%20Understand%20Jobs%20and%20CronJobs/answers.md>

### Pointeurs de docs utiles et autorisés le jour J

- <https://kubernetes.io/docs/concepts/workloads/controllers/job/>
- <https://kubernetes.io/docs/reference/kubernetes-api/workload-resources/job-v1/>
- <https://kubernetes.io/docs/concepts/workloads/controllers/cron-jobs/>
- <https://kubernetes.io/docs/reference/kubernetes-api/workload-resources/cron-job-v1/>
