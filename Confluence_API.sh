#!/usr/bin/env bash
shopt -s nocasematch

echo "Enter Number of the Operation: 1-Create New Page; 2-Read; 3-Create a new page as a child of another page  4-Update; 5-Delete"
read number
case $number in
1)
curl -u 'username':'password' -X POST -H  'Content-Type: application/json' -d '{"type":"page","title":"new page",
"space":{"key":"SpaceKey"},"body":{"storage":{"value":"<p>This is <br/> a new page</p>","representation":
"storage"}}}' 'Hostname/rest/api/content/' | python -mjson.tool
;;
2)
curl -u 'username':'password' -X GET "Hostname/rest/api/content/PageID?expand=body.storage" | python -mjson.tool > output.txt ;;
3)
curl -u 'Username':'Password' -X POST -H 'Content-Type: application/json' -d '{"type":"page","title":"Child Page",
"ancestors":[{"id":Oberseite_ID}], "space":{"key":"SpaceKey"},"body":{"storage":{"value":
"<p>This is a new page</p>","representation":"storage"}}}' 'Hostname/rest/api/content/' | python -mjson.tool;;
4)
curl -u 'username':'Password' -X PUT -H 'Content-Type: application/json' -d '{"id":"Page_ID","type":"page",
"title":"New Page","space":{"key":"SpaceKey"},"body":{"storage":{"value":
"<p>Update </p>","representation":"storage"}}, "version":{"number":2}}' 'Hostname/rest/api/content/Page_ID' | python -mjson.tool;;
5)
curl -v -S -u 'Username':'Password' -X DELETE 'Hostname/rest/api/content/Page_ID' | python -mjson.tool
;;
esac
