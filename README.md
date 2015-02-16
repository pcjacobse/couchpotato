This is a Dockerfile setup for couchpotato - https://couchpota.to/

To run:

```
docker run -d --name="couchpotato" -v /path/to/couchpotato/conf:/config -v /path/to/downloads:/downloads -v /path/to/movies:/movies -v /etc/localtime:/etc/localtime:ro -p 8080:8080 pcjacobse/couchpotato
```
