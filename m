Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.16 #2)
	id 13ZWzF-0000z3-00
	for mtd-list@infradead.org; Thu, 14 Sep 2000 12:15:25 +0100
Received: from tele2-gw.tao-group.com ([212.19.67.123] helo=gate.tao-group.com)
	by infradead.org with esmtp (Exim 3.16 #2)
	id 13ZWzC-0000yu-00
	for mtd@infradead.org; Thu, 14 Sep 2000 12:15:23 +0100
Received: from pearl.tao.co.uk (pearl.tao.co.uk [172.16.100.66])
	by gate.tao-group.com (8.9.3/8.9.3) with ESMTP id MAA02679
	for <mtd@infradead.org>; Thu, 14 Sep 2000 12:15:09 +0100
To: mtd@infradead.org
Subject: Re: sbc-mediagx 
In-reply-to: Your message of "Thu, 14 Sep 2000 11:03:26 BST."
             <E13ZVrg-0003TD-00@pearl.tao.co.uk>
Mime-Version: 1.0
Content-Type: multipart/mixed ;
	boundary="==_Exmh_13141000350"
Date: Thu, 14 Sep 2000 12:15:03 +0100
From: David Given <dg@tao-group.com>
Message-Id: <E13ZWyt-0003aY-00@pearl.tao.co.uk>
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

This is a multipart MIME message.

--==_Exmh_13141000350
Content-Type: text/plain; charset=us-ascii

[...]
>Done. (I've also integrated the devfs changes.) I'm not sure that this is the 
>right way to test to see if a device exists, though.

It's not. Don't touch that patch with a barge-pole, I forgot to 
put_mtd_device() after probing for each device.

The new patch fixes that and also fixes the device numbering; you now get 
/dev/mtd/{0,0ro,1,1ro,...} for the read-only devices. Suggestions on naming, 
please.

David Given
dg@tao-group.com

--==_Exmh_13141000350
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
LDM5Mwo8IAkKPCAJaWYgKHJlZ2lzdGVyX2NocmRldihNVERfQ0hBUl9NQUpPUiwibXRkIiwm
bXRkX2ZvcHMpKSB7Ci0tLQo+ICNpZmRlZiBDT05GSUdfREVWRlNfRlMKPiAJaW50IGk7Cj4g
CWNoYXIgbmFtZVs4XTsKPiAJc3RydWN0IG10ZF9pbmZvKiBtdGQ7Cj4gCj4gCWlmIChkZXZm
c19yZWdpc3Rlcl9jaHJkZXYoTVREX0NIQVJfTUFKT1IsICJtdGQiLCAmbXRkX2ZvcHMpKQo+
IAl7CjM5MGEzOTksNDI4Cj4gCWRldmZzX2hhbmRsZSA9IGRldmZzX21rX2RpcihOVUxMLCAi
bXRkIiwgTlVMTCk7Cj4gCj4gCWZvciAoaT0wOyBpPE1BWF9NVERfREVWSUNFUzsgaSsrKQo+
IAl7Cj4gCQltdGQgPSBnZXRfbXRkX2RldmljZShOVUxMLCBpKTsKPiAJCWlmIChtdGQpCj4g
CQl7Cj4gCQkJc3ByaW50ZihuYW1lLCAiJWQiLCBpKTsKPiAJCQlkZXZmc19yZWdpc3Rlcihk
ZXZmc19oYW5kbGUsIG5hbWUsCj4gCQkJCQlERVZGU19GTF9ERUZBVUxULCBNVERfQ0hBUl9N
QUpPUiwgaSoyLAo+IAkJCQkJU19JRkNIUiB8IFNfSVJVR08gfCBTX0lXVUdPLAo+IAkJCQkJ
Jm10ZF9mb3BzLCBOVUxMKTsKPiAJCQlzcHJpbnRmKG5hbWUsICIlZHJvIiwgaSk7Cj4gCj4g
CQkJZGV2ZnNfcmVnaXN0ZXIoZGV2ZnNfaGFuZGxlLCBuYW1lLAo+IAkJCQkJREVWRlNfRkxf
REVGQVVMVCwgTVREX0NIQVJfTUFKT1IsIGkqMisxLAo+IAkJCQkJU19JRkNIUiB8IFNfSVJV
R08gfCBTX0lXVUdPLAo+IAkJCQkJJm10ZF9mb3BzLCBOVUxMKTsKPiAJCQlwdXRfbXRkX2Rl
dmljZShtdGQpOwo+IAkJfQo+IAl9Cj4gI2Vsc2UKPiAJaWYgKHJlZ2lzdGVyX2NocmRldihN
VERfQ0hBUl9NQUpPUiwgIm10ZCIsICZtdGRfZm9wcykpCj4gCXsKPiAJCXByaW50ayhLRVJO
X05PVElDRSAiQ2FuJ3QgYWxsb2NhdGUgbWFqb3IgbnVtYmVyICVkIGZvciBNZW1vcnkgVGVj
aG5vbG9neSBEZXZpY2VzLlxuIiwKPiAJCSAgICAgICBNVERfQ0hBUl9NQUpPUik7Cj4gCQly
ZXR1cm4gLUVBR0FJTjsKPiAJfQo+ICNlbmRpZgo+IAozOTZjNDM0LDQzOQo8IAl1bnJlZ2lz
dGVyX2NocmRldihNVERfQ0hBUl9NQUpPUiwibXRkIik7Ci0tLQo+ICNpZmRlZiBDT05GSUdf
REVWRlNfRlMKPiAJZGV2ZnNfdW5yZWdpc3RlcihkZXZmc19oYW5kbGUpOwo+IAlkZXZmc191
bnJlZ2lzdGVyX2NocmRldihNVERfQ0hBUl9NQUpPUiwgIm10ZCIpOwo+ICNlbHNlCj4gCXVu
cmVnaXN0ZXJfY2hyZGV2KE1URF9DSEFSX01BSk9SLCAibXRkIik7Cj4gI2VuZGlmCg==

--==_Exmh_13141000350--






To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
