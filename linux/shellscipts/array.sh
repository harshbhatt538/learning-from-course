SERVICES=("nginx" "mysql" "redis")
for svc in "${SERVICES[@]}"; do
  echo "$svc"
done

