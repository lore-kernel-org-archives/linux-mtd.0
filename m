Received: from tesla.selinc.com ([12.110.71.2])
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1KEGql-0005WG-Lw
	for linux-mtd@lists.infradead.org; Thu, 03 Jul 2008 04:55:19 +0000
Received: from edison2.selinc.com (edison2.selinc.com [12.110.71.8])
	by tesla.selinc.com (8.12.11.20060308/8.12.11) with ESMTP id
	m634tIqJ007446
	for <linux-mtd@lists.infradead.org>; Wed, 2 Jul 2008 21:55:18 -0700
To: linux-mtd@lists.infradead.org
Subject: [PATCH] UBI: Fix 64-bit calculations
MIME-Version: 1.0
Message-ID: <OF36E1E7E8.CDE063B0-ON8825747B.001AF00D-8825747B.001AFBD6@selinc.com>
From: Bruce_Leonard@selinc.com
Date: Wed, 2 Jul 2008 21:55:17 -0700
Content-Type: multipart/mixed; boundary="=_mixed 001AFBD38825747B_="
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

--=_mixed 001AFBD38825747B_=
Content-Type: text/plain; charset="US-ASCII"

Artem,

I found another place where promotion was clobbering the 64-bit result. 
I'm attaching it rather than sending it inline because my mailer evidently 

has a problem with line wraps that I haven't figured out how to fix. 
Hopefully it comes through okay.  My apologies to the list.

Bruce


--=_mixed 001AFBD38825747B_=
Content-Type: application/octet-stream; name="cdev.c patch"
Content-Disposition: attachment; filename="cdev.c patch"
Content-Transfer-Encoding: base64

U2lnbmVkLW9mZi1ieTogQnJ1Y2UgTGVvbmFyZCA8YnJ1Y2xlQHNlbGluYy5jb20+DQoNCmRpZmYg
LS1naXQgYS9kcml2ZXJzL210ZC91YmkvY2Rldi5jIGIvZHJpdmVycy9tdGQvdWJpL2NkZXYuYw0K
aW5kZXggMzQxNzVlYy4uODhmMWI2ZiAxMDA2NDQNCi0tLSBhL2RyaXZlcnMvbXRkL3ViaS9jZGV2
LmMNCisrKyBiL2RyaXZlcnMvbXRkL3ViaS9jZGV2LmMNCkBAIC00MzIsNyArNDMyLDcgQEAgc3Rh
dGljIGludCB2b2xfY2Rldl9pb2N0bChzdHJ1Y3QgaW5vZGUgKmlub2RlLCBzdHJ1Y3QgZmlsZSAq
ZmlsZSwNCiAgICAgICAgICAgICAgICAgICAgICAgIGJyZWFrOw0KICAgICAgICAgICAgICAgIH0N
CiANCi0gICAgICAgICAgICAgICByc3ZkX2J5dGVzID0gdm9sLT5yZXNlcnZlZF9wZWJzICogKHVi
aS0+bGViX3NpemUtdm9sLT5kYXRhX3BhZCk7DQorICAgICAgICAgICAgICAgcnN2ZF9ieXRlcyA9
IChsb25nIGxvbmcpdm9sLT5yZXNlcnZlZF9wZWJzICogKHViaS0+bGViX3NpemUtdm9sLT5kYXRh
X3BhZCk7DQogICAgICAgICAgICAgICAgaWYgKGJ5dGVzIDwgMCB8fCBieXRlcyA+IHJzdmRfYnl0
ZXMpIHsNCiAgICAgICAgICAgICAgICAgICAgICAgIGVyciA9IC1FSU5WQUw7DQogICAgICAgICAg
ICAgICAgICAgICAgICBicmVhazsNCg==

--=_mixed 001AFBD38825747B_=--
