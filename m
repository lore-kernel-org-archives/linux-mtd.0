Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.03 #1)
	id 139thI-0003FY-00
	for mtd-list@infradead.org; Wed, 05 Jul 2000 19:14:56 +0100
Received: from mail.transzap.net ([207.239.241.226] helo=tzi.transzap.com)
	by infradead.org with smtp (Exim 3.03 #1)
	id 139thG-0003FS-00
	for mtd@infradead.org; Wed, 05 Jul 2000 19:14:55 +0100
From: Patrick Higgins <phiggins@transzap.com>
To: Rodrigo Moya <rmoya@tsai.es>
Cc: mtd@infradead.org
Date: Wed, 5 Jul 2000 12:18:27 -0600 (MDT)
Subject: Re: firmware problem
In-Reply-To: <E139Q9r-000718-00@infradead.org>
Message-ID: <Pine.LNX.4.21.0007051210530.9964-200000@phiggins.transzap.com>
MIME-Version: 1.0
Content-Type: MULTIPART/MIXED; BOUNDARY="-1463810046-1940656945-962821107=:9964"
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.
  Send mail to mime@docserver.cac.washington.edu for more info.

---1463810046-1940656945-962821107=:9964
Content-Type: TEXT/PLAIN; charset=US-ASCII


This is pretty much a big pain in the neck that I also ran into a while
ago (can't remember the cause, though).  Anyway, the only way I found to
recover the flash was to erase the entire thing.  The bad block table
(made when the flash is manufactured) could probably be saved somewhere,
but I never coded it up because I don't know the location or format.  
Anyway, you can use the attached utility (a modified version of
util/erase.c which erases all the flash, not just a single block).  We
should definitely look into adding support for saving the bad block table,
though.

-Patrick


On Tue, 4 Jul 2000, Rodrigo Moya wrote:

> 
> Hi all!
> 
> I am trying to put the firmware in the DOC, using the following command:
> 
> dformat /win:d000 /s:doc123.exb
> 
> and I get the following error message:
> 
> Format failed, Medium not large enough
> 
> Any idea on what's happening?
> 
> Thanks
> 
> 
> 
> To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
> 


---1463810046-1940656945-962821107=:9964
Content-Type: TEXT/PLAIN; charset=US-ASCII; name="eraseall.c"
Content-Transfer-Encoding: BASE64
Content-ID: <Pine.LNX.4.21.0007051218270.9964@phiggins.transzap.com>
Content-Description: 
Content-Disposition: attachment; filename="eraseall.c"

I2luY2x1ZGUgPHVuaXN0ZC5oPg0KI2luY2x1ZGUgPHN0ZGxpYi5oPg0KI2luY2x1ZGUgPHN0ZGlv
Lmg+DQojaW5jbHVkZSA8ZmNudGwuaD4NCiNpbmNsdWRlIDx0aW1lLmg+DQojaW5jbHVkZSA8c3lz
L2lvY3RsLmg+DQojaW5jbHVkZSA8c3lzL21vdW50Lmg+DQoNCiNpbmNsdWRlIDxsaW51eC9tdGQv
bXRkLmg+DQoNCmludCBtYWluKGludCBhcmdjLGNoYXIgKmFyZ3ZbXSkNCnsNCiAgbXRkX2luZm9f
dCBtZW1pbmZvOw0KICBpbnQgRmQ7DQogIHVuc2lnbmVkIGxvbmcgTGVuZ3RoOw0KICANCiAgaWYg
KDEgPj0gYXJnYykNCiAgICB7DQogICAgICBmcHJpbnRmKHN0ZGVyciwiWW91IG11c3Qgc3BlY2lm
eSBhIGRldmljZVxuIik7DQogICAgICByZXR1cm4gMTY7DQogICAgfQ0KICANCiAgLy8gT3BlbiBh
bmQgc2l6ZSB0aGUgZGV2aWNlDQogIGlmICgoRmQgPSBvcGVuKGFyZ3ZbMV0sT19SRFdSKSkgPCAw
KQ0KICAgIHsNCiAgICAgIGZwcmludGYoc3RkZXJyLCJGaWxlIG9wZW4gZXJyb3JcbiIpOw0KICAg
ICAgcmV0dXJuIDg7DQogICAgfQ0KICANCiAgDQogICBpZiAoaW9jdGwoRmQsTUVNR0VUSU5GTywm
bWVtaW5mbykgPT0gMCkNCiAgICAgew0KICAgICAgIGVyYXNlX2luZm9fdCBlcmFzZTsNCiAgICAg
ICANCiAgICAgICBwcmludGYoIkRldmljZSBpbmZvcm1hdGlvbjpcbiIpOw0KICAgICAgIHByaW50
ZigiTmFtZTogJXNcbiIsIG1lbWluZm8ubmFtZSk7DQogICAgICAgcHJpbnRmKCJUeXBlOiAlZFxu
IiwgbWVtaW5mby50eXBlKTsNCiAgICAgICBwcmludGYoIkZsYWdzOiAlZFxuIiwgbWVtaW5mby5m
bGFncyk7DQogICAgICAgcHJpbnRmKCJTaXplOiAlZFxuIiwgbWVtaW5mby5zaXplKTsNCiAgICAg
ICBwcmludGYoIkVyYXNlIHNpemU6ICVkXG4iLCBtZW1pbmZvLmVyYXNlc2l6ZSk7DQogICAgICAg
cHJpbnRmKCJPT0IgYmxvY2s6ICVkXG4iLCBtZW1pbmZvLm9vYmJsb2NrKTsNCiAgICAgICBwcmlu
dGYoIk9PQiBzaXplOiAlZFxuIiwgbWVtaW5mby5vb2JzaXplKTsNCiAgICAgICBwcmludGYoIkVD
QyB0eXBlOiAlZFxuIiwgbWVtaW5mby5lY2N0eXBlKTsNCiAgICAgICBwcmludGYoIkVDQyBzaXpl
OiAlZFxuIiwgbWVtaW5mby5lY2NzaXplKTsNCiAgICAgICANCiAgICAgICBlcmFzZS5sZW5ndGgg
PSBtZW1pbmZvLmVyYXNlc2l6ZTsNCiAgICAgICBlcmFzZS5zdGFydCA9IDA7DQogICAgICAgDQog
ICAgICAgcHJpbnRmKCJFcmFzaW5nLi4uIiwgZXJhc2Uuc3RhcnQpOw0KICAgICAgIHdoaWxlIChl
cmFzZS5zdGFydCA8IG1lbWluZm8uc2l6ZSkNCgkgew0KCSAgIGZmbHVzaChzdGRvdXQpOw0KCSAg
IA0KCSAgIGlmIChpb2N0bChGZCxNRU1FUkFTRSwmZXJhc2UpICE9IDApDQoJICAgICB7DQoJICAg
ICAgIHBlcnJvcigiXG5NVEQgRXJhc2UgZmFpbHVyZSIpOw0KCSAgICAgICBjbG9zZShGZCk7DQoJ
ICAgICAgIHJldHVybiA4Ow0KCSAgICAgfQ0KCSAgIGVyYXNlLnN0YXJ0ICs9IGVyYXNlLmxlbmd0
aDsNCgkgfQ0KICAgICAgIHByaW50ZigiZG9uZVxuIik7DQogICAgIH0NCiAgIHJldHVybiAwOw0K
fQ0K

---1463810046-1940656945-962821107=:9964--


To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
