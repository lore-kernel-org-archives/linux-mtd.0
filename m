Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.20 #2)
	id 14Y2pm-0007OH-00
	for mtd-list@infradead.org; Wed, 28 Feb 2001 09:23:46 +0000
Received: from maggiore.dsnet.it ([195.250.233.15])
	by infradead.org with smtp (Exim 3.20 #2)
	id 14Y2pl-0007OB-00
	for mtd@infradead.org; Wed, 28 Feb 2001 09:23:45 +0000
Received: from sat2520cdt.distelco.it (host70.distelco.it [192.168.1.70])
	by deunan.distelco.it (8.9.3/8.8.7) with ESMTP id KAA03963
	for <mtd@infradead.org>; Wed, 28 Feb 2001 10:18:10 +0100
Message-Id: <4.3.1.0.20010228102717.00b74a50@mbox.distelco.it>
Date: Wed, 28 Feb 2001 10:29:10 +0100
To: mtd@infradead.org
From: Matteo Costa <matteoc@distelco.it>
Subject: Re: lilo kernel params failure
In-Reply-To: <3A9B09BD.C3D3CB68@tg-embedded.com>
Mime-Version: 1.0
Content-Type: multipart/mixed;
	boundary="=====================_1155581==_"
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

--=====================_1155581==_
Content-Type: text/plain; charset="us-ascii"; format=flowed

At 20.58 26/02/01 -0500, dant@tg-embedded.com wrote:
>I have been strugling with this for some time now.
>
>It looks like a failure of lilo to pass kernel params ( append="...." )
>But we have been through the code and fail to find a reason.
>this happens with the lilo-mtd in the cvs /patches area and we have
>patched 21 with the same results.
>We are using DoC  2000 with kernel 2.4.2 though this has been happening
>for months really.
>Anyone have any ideas?
>

I have a patch for LILO 21.6.1. It works well for me with kernel 2.4.0.

Bye.

--=====================_1155581==_
Content-Type: application/octet-stream; name="lilo-21.6.1-mtd.patch"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="lilo-21.6.1-mtd.patch"

ZGlmZiAtciAtdSBsaWxvLTIxLjYuMS9NYWtlZmlsZSBsaWxvLTIxLjYuMS1tdGQvTWFrZWZpbGUK
LS0tIGxpbG8tMjEuNi4xL01ha2VmaWxlCVNhdCBEZWMgMTYgMjM6NDE6MzUgMjAwMAorKysgbGls
by0yMS42LjEtbXRkL01ha2VmaWxlCU1vbiBGZWIgMTkgMTE6NDg6NTIgMjAwMQpAQCAtNTAsNiAr
NTAsMTAgQEAKICAgc2VkICdzLy1ELy1ETENGXy9nJ2AgYFsgLXIgL3Vzci9pbmNsdWRlL2FzbS9i
b290LmggXSAmJiBlY2hvIC1ESEFTX0JPT1RfSGAKIEdPPS1ER089MHhgc2VkICcvZ28vcy9eLipn
byAqMCBcKC4uLi5cKSBBLiokJC9cMS9wO2QnIGZpcnN0Lmxpc2AKIAorI3BhdGNoZWQgbGlsbyBO
TyBuZWVkIGZvciB0aGlzIHdpdGggbmV3IExJTE8KKyNDT05GSUcrPSAtRExDRl9MQVJHRV9FQkRB
CisjUENPTkZJRys9IC1ETENGX0xBUkdFX0VCREEKKwogU0hFTEw9L2Jpbi9zaAogQ0M9Y2MKIENQ
UD0kKENDKSAtRQpkaWZmIC1yIC11IGxpbG8tMjEuNi4xL2dlb21ldHJ5LmMgbGlsby0yMS42LjEt
bXRkL2dlb21ldHJ5LmMKLS0tIGxpbG8tMjEuNi4xL2dlb21ldHJ5LmMJU2F0IERlYyAxNiAyMzow
OToyMSAyMDAwCisrKyBsaWxvLTIxLjYuMS1tdGQvZ2VvbWV0cnkuYwlUaHUgRmViIDE1IDE4OjMw
OjUzIDIwMDEKQEAgLTEyNSw3ICsxMjUsOCBAQAogICAgICAgTUFKT1IoZGV2KSA9PSBNQUpPUl9J
REUzIHx8IE1BSk9SKGRldikgPT0gTUFKT1JfSURFNCB8fAogICAgICAgTUFKT1IoZGV2KSA9PSBN
QUpPUl9JREU1IHx8IE1BSk9SKGRldikgPT0gTUFKT1JfSURFNiB8fAogICAgICAgTUFKT1IoZGV2
KSA9PSBNQUpPUl9YVCB8fCBNQUpPUihkZXYpID09IE1BSk9SX1NEIHx8Ci0gICAgICBNQUpPUihk
ZXYpID09IE1BSk9SX0VTREkgfHwgTUFKT1IoZGV2KSA9PSBNQUpPUl9EQUM5NjA7CisgICAgICBN
QUpPUihkZXYpID09IE1BSk9SX0VTREkgfHwgTUFKT1IoZGV2KSA9PSBNQUpPUl9EQUM5NjAgfHwg
CisgICAgICBNQUpPUihkZXYpID09IE1BSk9SX0ZMIHx8IE1BSk9SKGRldikgPT0gTUFKT1JfTkZU
TDsKIH0KIAogCkBAIC0zMTAsOCArMzExLDE0IEBACiAJICAgIC8qIGZhbGwgdGhyb3VnaCAqLwog
CWNhc2UgTUFKT1JfRVNESToKIAkgICAgLyogZmFsbCB0aHJvdWdoICovCisJY2FzZSBNQUpPUl9G
TDoKKyAgICAgICAgY2FzZSBNQUpPUl9ORlRMOgorCSAgICAvKiBmYWxsIHRocm91Z2ggKi8KIAlj
YXNlIE1BSk9SX1hUOgotCSAgICBnZW8tPmRldmljZSA9IDB4ODArKE1JTk9SKGRldmljZSkgPj4g
NikrKE1BSk9SKGRldmljZSkgPT0gTUFKT1JfSEQgPworCSAgICBnZW8tPmRldmljZSA9IDB4ODAr
KE1JTk9SKGRldmljZSkgPj4gNikrKAorCSAgICAgIChNQUpPUihkZXZpY2UpID09IE1BSk9SX0hE
IHx8IAorCSAgICAgICBNQUpPUihkZXZpY2UpID09IE1BSk9SX0ZMIHx8CisJICAgICAgIE1BSk9S
KGRldmljZSkgPT0gTUFKT1JfTkZUTCkgPwogCSAgICAgIDAgOiBsYXN0X2RldihNQUpPUl9IRCw2
NCkpOwogCSAgICBpZiAoaW9jdGwoZmQsSERJT19HRVRHRU8sJmhkcHJtKSA8IDApCiAJCWRpZSgi
Z2VvX3F1ZXJ5X2RldiBIRElPX0dFVEdFTyAoZGV2IDB4JTA0eCk6ICVzIixkZXZpY2UsCkBAIC00
MDMsNiArNDEwLDkgQEAKIAljYXNlIE1BSk9SX0lERTY6CiAJICAgIC8qIGZhbGwgdGhyb3VnaCAq
LwogCWNhc2UgTUFKT1JfRVNESToKKwkgICAgLyogZmFsbCB0aHJvdWdoICovCisJY2FzZSBNQUpP
Ul9GTDoKKyAgICAgICAgY2FzZSBNQUpPUl9ORlRMOgogCSAgICAvKiBmYWxsIHRocm91Z2ggKi8K
IAljYXNlIE1BSk9SX1hUOgogCSAgICByZXR1cm4gTUlOT1IoZGV2aWNlKSA+PiA2ID8gMCA6ICFs
YXN0X2RldihNQUpPUl9IRCw2NCk7CmRpZmYgLXIgLXUgbGlsby0yMS42LjEvbGlsby5oIGxpbG8t
MjEuNi4xLW10ZC9saWxvLmgKLS0tIGxpbG8tMjEuNi4xL2xpbG8uaAlGcmkgU2VwIDIyIDAxOjE4
OjUwIDIwMDAKKysrIGxpbG8tMjEuNi4xLW10ZC9saWxvLmgJTW9uIEZlYiAxOSAxMTo0MjozNCAy
MDAxCkBAIC00Miw2ICs0Miw4IEBACiAjZGVmaW5lIE1BSk9SX0lERTUJNTUgLyogSURFIG9uIGZp
ZnRoIGludGVyZmFjZSAqLwogI2RlZmluZSBNQUpPUl9JREU2CTU3IC8qIElERSBvbiBzaXh0aCBp
bnRlcmZhY2UgKi8KICNkZWZpbmUgQ09NUEFRX1NNQVJUMl9NQUpPUgk3MiAvKiBGaXJzdCBTbWFy
dC8yIE1ham9yICovCisjZGVmaW5lIE1BSk9SX0ZMICAgICAgICA2MiAvKiBNLVN5c3RlbXMgRGlz
ayBPbiBDaGlwIDIwMDAgKi8KKyNkZWZpbmUgTUFKT1JfTkZUTCAgICAgIDkzIC8qIE0tU3lzdGVt
cyBET0MyMDAwIE5GVEwgZHJpdmVyICovCiAKICNkZWZpbmUgTUFYX0lNQUdFUyAgICAgICgoU0VD
VE9SX1NJWkUqMi0yKS9zaXplb2YoSU1BR0VfREVTQ1IpKQogCQkJICAvKiBtYXhpbXVtIG51bWJl
ciBvZiBpbWFnZXMgKi8K
--=====================_1155581==_--



To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
