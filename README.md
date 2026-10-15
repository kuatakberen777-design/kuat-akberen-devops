# kuat-akberen-devops

Personal DevOps laboratory project: **Linux → Git → GitHub → Docker → Jenkins**.

| Field      | Value        |
|------------|--------------|
| Name       | Akberen      |
| Surname    | Kuat         |
| Group      | IT2-2313     |
| Student ID | IT2-2313       |
| Course     | DevOps       |

## Structure

```
kuat_akberen/
├── app/                      # Python application shown in Docker
├── scripts/                  # Bash scripts (Kuat_Akberen_system.sh)
├── config/                   # Application configuration
├── logs/                     # Logs (ignored by Git)
├── backup/                   # Backups (ignored by Git)
├── Kuat_Akberen_info.txt     # Student information
├── Dockerfile
├── docker-compose.yml
└── Jenkinsfile
```

## Run

```bash
./scripts/Kuat_Akberen_system.sh            # Linux script
docker build -t kuat-akberen-devops .        # build image
docker run --name kuat-akberen-container kuat-akberen-devops
docker compose up                            # or via Compose
```

## Jenkins (local)

```bash
cd jenkins && docker compose up -d --build   # Jenkins at http://localhost:8081
docker exec jenkins cat /var/jenkins_home/secrets/initialAdminPassword
```
Create a Pipeline job `Kuat_Akberen_DevOps` → *Pipeline script from SCM* → Git →
`https://github.com/kuatakberen777-design/kuat-akberen-devops.git`, branch `*/main`, script path `Jenkinsfile`.
