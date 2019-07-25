# installing Requests:
# open directory you wish and run git clone git://github.com/requests/requests.git
# cd %the folder you created%
# sudo pip3 install --upgrade pip
# sudo -H pip3 install .
# the folder may be deleted after all done successfully

import requests

link = input(str("Link to the website: "))          # user input
if "http://" in link or "https://" in link:     # error-evasion: Requests does not work without a protocol
    newlink = link
    print(newlink)
else:
    newlink = "https://"+link               # error-evasion

try:
    r = requests.get(newlink)                   # making a request and evading SSLError
except:                         # occurs if site's certificate is self-signed (even with LetsEncrypt)
    r = requests.get(newlink, verify=False)
print("Your target responds with", str(r.status_code)+".")                        # receiving an HTML status code
goog = requests.get("https://google.com").status_code       # accessing Google since it is always up
print("Google shows", str(goog)+".")        # if it responds with anything except for 200, there is a problem
