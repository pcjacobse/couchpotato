This is a Dockerfile setup for couchpotato - https://couchpota.to/

To run:

```
docker run -d --name="couchpotato" -v /path/to/couchpotato/conf:/config -v /path/to/downloads:/downloads -v /path/to/movies:/movies -v /etc/localtime:/etc/localtime:ro -p 5050:5050 pcjacobse/couchpotato
```
