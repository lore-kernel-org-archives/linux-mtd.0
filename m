Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.16 #2)
	id 13ZGzv-0001Pq-00
	for mtd-list@infradead.org; Wed, 13 Sep 2000 19:11:03 +0100
Received: from tele2-gw.tao-group.com ([212.19.67.123] helo=gate.tao-group.com)
	by infradead.org with esmtp (Exim 3.16 #2)
	id 13ZGzu-0001Pk-00
	for mtd@infradead.org; Wed, 13 Sep 2000 19:11:02 +0100
Received: from pearl.tao.co.uk (pearl.tao.co.uk [172.16.100.66])
	by gate.tao-group.com (8.9.3/8.9.3) with ESMTP id TAA17785
	for <mtd@infradead.org>; Wed, 13 Sep 2000 19:11:01 +0100
To: mtd@infradead.org
Subject: Re: sbc-mediagx 
In-reply-to: Your message of "Wed, 13 Sep 2000 18:08:14 BST."
             <E13ZG18-00027x-00@pearl.tao.co.uk>
Mime-Version: 1.0
Content-Type: multipart/mixed ;
	boundary="==_Exmh_-19760470040"
Date: Wed, 13 Sep 2000 19:10:58 +0100
From: David Given <dg@tao-group.com>
Message-Id: <E13ZGzr-0002Zs-00@pearl.tao.co.uk>
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

This is a multipart MIME message.

--==_Exmh_-19760470040
Content-Type: text/plain; charset=us-ascii

[...]
>Sure --- I just don't know how. Ditto with the devfs stuff. I'll have a look 
>at the rest of the kernel and see how easy/difficult it is. Getting this 
>working would be a great bonus for us.

...and here is a patch to devfsify mtdchar. I even got a chance to test it, 
and the previous patch, and it all seems to work.

This is terribly terribly basic, as three-quarters of an hour ago I knew 
nothing about devfs. It creates entries for all fifteen possible devices, 
regardless of whether they exist or not. Interestingly, on my system, 0-5 
work, despite the fact that /proc/mtd claims that only 0-2 exist. Accessing 
the others returns a normal and harmless "No such device" error.

Block devices appear to be just as easy, but as it's 19:10 here in the UK and 
I'm still at work I'll do it tomorrow. What should I call it? /dev/mtd/b%d? 
/dev/mtd/block/%d? /dev/mtdblock/%d? /dev/mtd/fnord/%d?

David Given
dg@tao-group.com

--==_Exmh_-19760470040
Content-Type: application/octet-stream ; name="patch"
Content-Description: patch
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="patch"

SW5kZXg6IG10ZGNoYXIuYwo9PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09ClJDUyBmaWxlOiAvaG9tZS9jdnMvbXRk
L2tlcm5lbC9tdGRjaGFyLmMsdgpyZXRyaWV2aW5nIHJldmlzaW9uIDEuOQpkaWZmIC1yMS45
IG10ZGNoYXIuYwoxNGExNSwxNwo+ICNpbmNsdWRlIDxsaW51eC9kZXZmc19mc19rZXJuZWwu
aD4KPiAKPiBzdGF0aWMgZGV2ZnNfaGFuZGxlX3QgZGV2ZnNfaGFuZGxlID0gTlVMTDsKMzY1
YzM2OAo8IAotLS0KPiAJb3duZXI6CQlUSElTX01PRFVMRSwKMzg0LDM4NWMzODcsMzkwCjwg
CQo8IAlpZiAocmVnaXN0ZXJfY2hyZGV2KE1URF9DSEFSX01BSk9SLCJtdGQiLCZtdGRfZm9w
cykpIHsKLS0tCj4gCWludCBpOwo+IAljaGFyIG5hbWVbOF07Cj4gCj4gCWlmIChkZXZmc19y
ZWdpc3Rlcl9jaHJkZXYoTVREX0NIQVJfTUFKT1IsICJtdGQiLCAmbXRkX2ZvcHMpKSB7CjM5
MGEzOTYsNDA2Cj4gCWRldmZzX2hhbmRsZSA9IGRldmZzX21rX2RpcihOVUxMLCAibXRkIiwg
TlVMTCk7Cj4gCj4gCWZvciAoaT0wOyBpPE1BWF9NVERfREVWSUNFUzsgaSsrKQo+IAl7Cj4g
CQlzcHJpbnRmKG5hbWUsICIlZCIsIGkpOwo+IAkJZGV2ZnNfcmVnaXN0ZXIoZGV2ZnNfaGFu
ZGxlLCBuYW1lLAo+IAkJCQlERVZGU19GTF9ERUZBVUxULCBNVERfQ0hBUl9NQUpPUiwgaSwK
PiAJCQkJU19JRkNIUiB8IFNfSVJVR08gfCBTX0lXVUdPLAo+IAkJCQkmbXRkX2ZvcHMsIE5V
TEwpOwo+IAl9Cj4gCjM5NmM0MTIsNDEzCjwgCXVucmVnaXN0ZXJfY2hyZGV2KE1URF9DSEFS
X01BSk9SLCJtdGQiKTsKLS0tCj4gCWRldmZzX3VucmVnaXN0ZXIoZGV2ZnNfaGFuZGxlKTsK
PiAJZGV2ZnNfdW5yZWdpc3Rlcl9jaHJkZXYoTVREX0NIQVJfTUFKT1IsICJtdGQiKTsK

--==_Exmh_-19760470040--






To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
