Received: from zeus.vortex.is ([193.4.145.1])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 154hDw-0006Wi-00
	for <linux-mtd@lists.infradead.org>; Tue, 29 May 2001 11:59:40 +0100
Received: from froskur.flaga.is (mail.flaga.is [193.4.144.1])
          by zeus.vortex.is (Post.Office MTA v3.5.3 release 223
          ID# 0-71211U5000L1850S0V35) with ESMTP id is
          for <linux-mtd@lists.infradead.org>;
          Tue, 29 May 2001 11:03:53 +0000
Received: from kolkrabbi.flaga.is ([192.168.145.6]) by froskur.flaga.is
          (Post.Office MTA v3.5.3 release 223 ID# 0-0U10L2S100V35)
          with ESMTP id is for <linux-mtd@lists.infradead.org>;
          Tue, 29 May 2001 11:03:53 +0000
content-class: urn:content-classes:message
MIME-Version: 1.0
Content-Type: multipart/mixed;
	boundary="----_=_NextPart_001_01C0E82F.0BBA96B8"
Subject: Virtual regions
Date: Tue, 29 May 2001 11:03:52 -0000
Message-ID: <EADB10BAC266A14A85ECBF8686A73E310A9183@kolkrabbi.flaga.is>
From: =?iso-8859-1?B?S+FyaSBEYXbt8HNzb24=?= <kd@flaga.is>
To: <linux-mtd@lists.infradead.org>
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

This is a multi-part message in MIME format.

------_=_NextPart_001_01C0E82F.0BBA96B8
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi,

This patch removes the now optional Virtual regions option, i.e. virtual
regions will always be made for all partitions.

You can make partitions on any boundary you want,
if a partition does not start nor end on sector boundary the partition
is non-writable. Otherwise it is writable.

Comments?

K.D.

------_=_NextPart_001_01C0E82F.0BBA96B8
Content-Type: application/octet-stream;
	name="virt_regions.diff"
Content-Transfer-Encoding: base64
Content-Description: virt_regions.diff
Content-Disposition: attachment;
	filename="virt_regions.diff"

SW5kZXg6IGRyaXZlcnMvbXRkL210ZHBhcnQuYwo9PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09ClJDUyBmaWxlOiAvaG9tZS9j
dnMvbXRkL2RyaXZlcnMvbXRkL210ZHBhcnQuYyx2CnJldHJpZXZpbmcgcmV2aXNpb24gMS4xOApk
aWZmIC11IC1yMS4xOCBtdGRwYXJ0LmMKLS0tIGRyaXZlcnMvbXRkL210ZHBhcnQuYwkyMDAxLzAz
LzMxIDEyOjM0OjE0CTEuMTgKKysrIGRyaXZlcnMvbXRkL210ZHBhcnQuYwkyMDAxLzA1LzI5IDEw
OjU2OjA5CkBAIC0yNDQsMjcgKzI0NCw2IEBACiAJCQlwcmludGsgKCJtdGQ6IHBhcnRpdGlvbiBc
IiVzXCIgZXh0ZW5kcyBiZXlvbmQgdGhlIGVuZCBvZiBkZXZpY2UgXCIlc1wiIC0tIHNpemUgdHJ1
bmNhdGVkIHRvICUjeFxuIiwKIAkJCQlwYXJ0c1tpXS5uYW1lLCBtYXN0ZXItPm5hbWUsIHNsYXZl
LT5tdGQuc2l6ZSk7CiAJCX0KLSNpZm5kZWYgQ09ORklHX01URF9DRklfVklSVFVBTF9FUgotCQlp
ZiAobWFzdGVyLT5udW1lcmFzZXJlZ2lvbnM+MSkgewotCQkJLyogRGVhbCB3aXRoIHZhcmlhYmxl
IGVyYXNlIHNpemUgc3R1ZmYgKi8KLQkJCWludCBpOwotCQkJc3RydWN0IG10ZF9lcmFzZV9yZWdp
b25faW5mbyAqcmVnaW9ucyA9IG1hc3Rlci0+ZXJhc2VyZWdpb25zOwotCQkJCi0JCQkvKiBGaW5k
IHRoZSBmaXJzdCBlcmFzZSByZWdpb25zIHdoaWNoIGlzIHBhcnQgb2YgdGhpcyBwYXJ0aXRpb24u
ICovCi0JCQlmb3IgKGk9MDsgaSA8IG1hc3Rlci0+bnVtZXJhc2VyZWdpb25zICYmIHNsYXZlLT5v
ZmZzZXQgPj0gcmVnaW9uc1tpXS5vZmZzZXQ7IGkrKykKLQkJCQk7Ci0KLQkJCWZvciAoaS0tOyBp
IDwgbWFzdGVyLT5udW1lcmFzZXJlZ2lvbnMgJiYgc2xhdmUtPm9mZnNldCArIHNsYXZlLT5tdGQu
c2l6ZSA+IHJlZ2lvbnNbaV0ub2Zmc2V0OyBpKyspIHsKLQkJCQlpZiAoc2xhdmUtPm10ZC5lcmFz
ZXNpemUgPCByZWdpb25zW2ldLmVyYXNlc2l6ZSkgewotCQkJCQlzbGF2ZS0+bXRkLmVyYXNlc2l6
ZSA9IHJlZ2lvbnNbaV0uZXJhc2VzaXplOwotCQkJCX0KLQkJCX0KLQkJfSBlbHNlIHsKLQkJCS8q
IFNpbmdsZSBlcmFzZSBzaXplICovCi0JCQlzbGF2ZS0+bXRkLmVyYXNlc2l6ZSA9IG1hc3Rlci0+
ZXJhc2VzaXplOwotCQl9Ci0KLSNlbHNlIC8vISBDT05GSUdfTVREX0NGSV9WSVJUVUFMX0VSCiAJ
CXsgLy9DcmVhdGUgYSBzbWFsbCBsb2NhbCBjb250ZXh0CiAJCQlpbnQgaiA9IDA7CiAJCQlpbnQg
ayA9IDA7CkBAIC0zMzcsNyArMzE2LDYgQEAKIAkJCQl9CiAJCQl9CiAJCX0gLy9Mb2NhbCBjb250
ZXh0IG92ZXIKLSNlbmRpZiAvLyBDT05GSUdfTVREX0NGSV9WSVJUVUFMX0VSCiAKIAkJaWYgKChz
bGF2ZS0+bXRkLmZsYWdzICYgTVREX1dSSVRFQUJMRSkgJiYgCiAJCSAgICAoc2xhdmUtPm9mZnNl
dCAlIHNsYXZlLT5tdGQuZXJhc2VzaXplKSkgewo=

------_=_NextPart_001_01C0E82F.0BBA96B8--
