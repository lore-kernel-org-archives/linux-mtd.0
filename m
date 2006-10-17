Received: from miranda.se.axis.com ([193.13.178.8])
	by canuck.infradead.org with esmtps (Exim 4.62 #1 (Red Hat Linux))
	id 1GZqpR-0001JO-Hj
	for linux-mtd@lists.infradead.org; Tue, 17 Oct 2006 11:26:16 -0400
Received: from lnxricardw.se.axis.com (lnxricardw.se.axis.com [10.13.11.219])
	by miranda.se.axis.com (8.12.9/8.12.9/Debian-5local0.1) with ESMTP
	id k9HFPvP1031115
	for <linux-mtd@lists.infradead.org>; Tue, 17 Oct 2006 17:25:57 +0200
Date: Tue, 17 Oct 2006 17:27:11 +0200 (CEST)
From: Ricard Wanderlof <ricard.wanderlof@axis.com>
To: Linux mtd <linux-mtd@lists.infradead.org>
Subject: [PATCH] [MTD] [CORE]: Fix MEMGETOOBSEL and ECCGETLAYOUT ioctls
Message-ID: <Pine.LNX.4.64.0610171720200.25906@lnxricardw.se.axis.com>
MIME-Version: 1.0
Content-Type: MULTIPART/MIXED; BOUNDARY="218815243-287909873-1161098831=:25906"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--218815243-287909873-1161098831=:25906
Content-Type: TEXT/PLAIN; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE


Hi,

This is my first patch submission, so please correct me if I've done=20
anything stupid or just plain wrong. :-)


1. The ECCGETLAYOUT ioctl copy_to_user() call has a superfluous '&'=20
causing the resulting information to be garbage rather than the intended=20
mtd->ecclayout.

2. The MEMGETOOBSEL misses copying mtd->ecclayout->eccbytes so the
resulting field of the returned structure contains garbage.


From: Ricard Wanderlof <ricardw at axis.com>
Signed-off-by: Ricard Wanderlof <ricardw at axis.com>


--- a/drivers/mtd/mtdchar.c=092006-10-17 17:10:45.929965640 +0200
+++ b/drivers/mtd/mtdchar.c=092006-10-17 17:12:10.000000000 +0200
@@ -616,6 +616,7 @@
  =09=09memcpy(&oi.eccpos, mtd->ecclayout->eccpos, sizeof(oi.eccpos));
  =09=09memcpy(&oi.oobfree, mtd->ecclayout->oobfree,
  =09=09       sizeof(oi.oobfree));
+=09=09oi.eccbytes =3D mtd->ecclayout->eccbytes;

  =09=09if (copy_to_user(argp, &oi, sizeof(struct nand_oobinfo)))
  =09=09=09return -EFAULT;
@@ -715,7 +716,7 @@
  =09=09if (!mtd->ecclayout)
  =09=09=09return -EOPNOTSUPP;

-=09=09if (copy_to_user(argp, &mtd->ecclayout,
+=09=09if (copy_to_user(argp, mtd->ecclayout,
  =09=09=09=09 sizeof(struct nand_ecclayout)))
  =09=09=09return -EFAULT;
  =09=09break;

--
Ricard Wolf Wanderl=F6f                           ricardw(at)axis.com
Axis Communications AB, Lund, Sweden            www.axis.com
Phone +46 46 272 2016                           Fax +46 46 13 61 30
--218815243-287909873-1161098831=:25906
Content-Type: TEXT/PLAIN; charset=US-ASCII; name=mtdchar.c.patch
Content-Transfer-Encoding: BASE64
Content-ID: <Pine.LNX.4.64.0610171727110.25906@lnxricardw.se.axis.com>
Content-Description: patch file
Content-Disposition: attachment; filename=mtdchar.c.patch

LS0tIGEvZHJpdmVycy9tdGQvbXRkY2hhci5jCTIwMDYtMTAtMTcgMTc6MTA6
NDUuOTI5OTY1NjQwICswMjAwDQorKysgYi9kcml2ZXJzL210ZC9tdGRjaGFy
LmMJMjAwNi0xMC0xNyAxNzoxMjoxMC4wMDAwMDAwMDAgKzAyMDANCkBAIC02
MTYsNiArNjE2LDcgQEANCiAJCW1lbWNweSgmb2kuZWNjcG9zLCBtdGQtPmVj
Y2xheW91dC0+ZWNjcG9zLCBzaXplb2Yob2kuZWNjcG9zKSk7DQogCQltZW1j
cHkoJm9pLm9vYmZyZWUsIG10ZC0+ZWNjbGF5b3V0LT5vb2JmcmVlLA0KIAkJ
ICAgICAgIHNpemVvZihvaS5vb2JmcmVlKSk7DQorCQlvaS5lY2NieXRlcyA9
IG10ZC0+ZWNjbGF5b3V0LT5lY2NieXRlczsNCiANCiAJCWlmIChjb3B5X3Rv
X3VzZXIoYXJncCwgJm9pLCBzaXplb2Yoc3RydWN0IG5hbmRfb29iaW5mbykp
KQ0KIAkJCXJldHVybiAtRUZBVUxUOw0KQEAgLTcxNSw3ICs3MTYsNyBAQA0K
IAkJaWYgKCFtdGQtPmVjY2xheW91dCkNCiAJCQlyZXR1cm4gLUVPUE5PVFNV
UFA7DQogDQotCQlpZiAoY29weV90b191c2VyKGFyZ3AsICZtdGQtPmVjY2xh
eW91dCwNCisJCWlmIChjb3B5X3RvX3VzZXIoYXJncCwgbXRkLT5lY2NsYXlv
dXQsDQogCQkJCSBzaXplb2Yoc3RydWN0IG5hbmRfZWNjbGF5b3V0KSkpDQog
CQkJcmV0dXJuIC1FRkFVTFQ7DQogCQlicmVhazsNCg==

--218815243-287909873-1161098831=:25906--
