Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.16 #2)
	id 13ZVrt-0000lA-00
	for mtd-list@infradead.org; Thu, 14 Sep 2000 11:03:45 +0100
Received: from tele2-gw.tao-group.com ([212.19.67.123] helo=gate.tao-group.com)
	by infradead.org with esmtp (Exim 3.16 #2)
	id 13ZVrp-0000l4-00
	for mtd@infradead.org; Thu, 14 Sep 2000 11:03:41 +0100
Received: from pearl.tao.co.uk (pearl.tao.co.uk [172.16.100.66])
	by gate.tao-group.com (8.9.3/8.9.3) with ESMTP id LAA32395
	for <mtd@infradead.org>; Thu, 14 Sep 2000 11:03:35 +0100
To: mtd@infradead.org
From: "David Given" <dg@tao-group.com>
Subject: Re: sbc-mediagx 
In-reply-to: Your message of "Thu, 14 Sep 2000 10:04:51 BST."
             <25904.968922291@passion.cygnus.co.uk>
Mime-Version: 1.0
Content-Type: multipart/mixed ;
	boundary="==_Exmh_12061193900"
Date: Thu, 14 Sep 2000 11:03:26 +0100
Message-Id: <E13ZVrg-0003TD-00@pearl.tao.co.uk>
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

This is a multipart MIME message.

--==_Exmh_12061193900
Content-Type: text/plain; charset=us-ascii

>Doesn't look like it'll work on 2.2 without devfs. I've littered it with 
>appropriate (but ugly) ifdefs. We should probably put the devfs stuff into 
>compatmac.h

Not sure this is a good idea; the actual logic is different, it's not just a 
matter of changing some of the function names.

>I'd go for /dev/mtdblock/%d

Is it wise to use different top-level directory names?

>It'd be nice if we could get it to create the device nodes only when 
>devices are present.

Done. (I've also integrated the devfs changes.) I'm not sure that this is the 
right way to test to see if a device exists, though.

David Given
dg@tao-group.com


--==_Exmh_12061193900
Content-Type: application/octet-stream ; name="patch"
Content-Description: patch
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="patch"

SW5kZXg6IGtlcm5lbC9tdGRjaGFyLmMKPT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PQpSQ1MgZmlsZTogL2hvbWUv
Y3ZzL210ZC9rZXJuZWwvbXRkY2hhci5jLHYKcmV0cmlldmluZyByZXZpc2lvbiAxLjkKZGlm
ZiAtcjEuOSBtdGRjaGFyLmMKMTRhMTUsMTcKPiAjaW5jbHVkZSA8bGludXgvZGV2ZnNfZnNf
a2VybmVsLmg+Cj4gCj4gc3RhdGljIGRldmZzX2hhbmRsZV90IGRldmZzX2hhbmRsZSA9IE5V
TEw7CjM2NWMzNjgKPCAKLS0tCj4gCW93bmVyOgkJVEhJU19NT0RVTEUsCjM4NCwzODVjMzg3
LDM5Mgo8IAkKPCAJaWYgKHJlZ2lzdGVyX2NocmRldihNVERfQ0hBUl9NQUpPUiwibXRkIiwm
bXRkX2ZvcHMpKSB7Ci0tLQo+ICNpZmRlZiBDT05GSUdfREVWRlNfRlMKPiAJaW50IGk7Cj4g
CWNoYXIgbmFtZVs4XTsKPiAKPiAJaWYgKGRldmZzX3JlZ2lzdGVyX2NocmRldihNVERfQ0hB
Ul9NQUpPUiwgIm10ZCIsICZtdGRfZm9wcykpCj4gCXsKMzkwYTM5OCw0MTkKPiAJZGV2ZnNf
aGFuZGxlID0gZGV2ZnNfbWtfZGlyKE5VTEwsICJtdGQiLCBOVUxMKTsKPiAKPiAJZm9yIChp
PTA7IGk8TUFYX01URF9ERVZJQ0VTOyBpKyspCj4gCXsKPiAJCWlmIChnZXRfbXRkX2Rldmlj
ZShOVUxMLCBpKSkKPiAJCXsKPiAJCQlzcHJpbnRmKG5hbWUsICIlZCIsIGkpOwo+IAkJCWRl
dmZzX3JlZ2lzdGVyKGRldmZzX2hhbmRsZSwgbmFtZSwKPiAJCQkJCURFVkZTX0ZMX0RFRkFV
TFQsIE1URF9DSEFSX01BSk9SLCBpLAo+IAkJCQkJU19JRkNIUiB8IFNfSVJVR08gfCBTX0lX
VUdPLAo+IAkJCQkJJm10ZF9mb3BzLCBOVUxMKTsKPiAJCX0KPiAJfQo+ICNlbHNlCj4gCWlm
IChyZWdpc3Rlcl9jaHJkZXYoTVREX0NIQVJfTUFKT1IsICJtdGQiLCAmbXRkX2ZvcHMpKQo+
IAl7Cj4gCQlwcmludGsoS0VSTl9OT1RJQ0UgIkNhbid0IGFsbG9jYXRlIG1ham9yIG51bWJl
ciAlZCBmb3IgTWVtb3J5IFRlY2hub2xvZ3kgRGV2aWNlcy5cbiIsCj4gCQkgICAgICAgTVRE
X0NIQVJfTUFKT1IpOwo+IAkJcmV0dXJuIC1FQUdBSU47Cj4gCX0KPiAjZW5kaWYKPiAKMzk2
YzQyNSw0MzAKPCAJdW5yZWdpc3Rlcl9jaHJkZXYoTVREX0NIQVJfTUFKT1IsIm10ZCIpOwot
LS0KPiAjaWZkZWYgQ09ORklHX0RFVkZTX0ZTCj4gCWRldmZzX3VucmVnaXN0ZXIoZGV2ZnNf
aGFuZGxlKTsKPiAJZGV2ZnNfdW5yZWdpc3Rlcl9jaHJkZXYoTVREX0NIQVJfTUFKT1IsICJt
dGQiKTsKPiAjZWxzZQo+IAl1bnJlZ2lzdGVyX2NocmRldihNVERfQ0hBUl9NQUpPUiwgIm10
ZCIpOwo+ICNlbmRpZgo=

--==_Exmh_12061193900--




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
