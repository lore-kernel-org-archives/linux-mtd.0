Received: from miranda.se.axis.com ([193.13.178.8])
	by canuck.infradead.org with esmtps (Exim 4.62 #1 (Red Hat Linux))
	id 1GawP1-0006bH-Rz
	for linux-mtd@lists.infradead.org; Fri, 20 Oct 2006 11:35:26 -0400
Received: from lnxricardw.se.axis.com (lnxricardw.se.axis.com [10.13.11.219])
	by miranda.se.axis.com (8.12.9/8.12.9/Debian-5local0.1) with ESMTP
	id k9KFZFP1013387
	for <linux-mtd@lists.infradead.org>; Fri, 20 Oct 2006 17:35:15 +0200
Date: Fri, 20 Oct 2006 17:36:35 +0200 (CEST)
From: Ricard Wanderlof <ricard.wanderlof@axis.com>
To: Linux mtd <linux-mtd@lists.infradead.org>
Subject: [PATCH] [MTD] [NAND]: nand_default_mark_blockbad() doesn't work when
	flash-based bbt not enabled
Message-ID: <Pine.LNX.4.64.0610201728220.25906@lnxricardw.se.axis.com>
MIME-Version: 1.0
Content-Type: MULTIPART/MIXED; BOUNDARY="218815243-287909873-1161098831=:25906"
Content-ID: <Pine.LNX.4.64.0610201728221.25906@lnxricardw.se.axis.com>
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
Content-Type: TEXT/PLAIN; FORMAT=flowed; CHARSET=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Content-ID: <Pine.LNX.4.64.0610201728222.25906@lnxricardw.se.axis.com>


Hi,

When a flash-based BBT is not used, nand_default_mark_blockbad() is=20
supposed to mark the block bad in the oob. However, it sets the wrong=20
length variable so that no bad block marker is in fact written. This patch=
=20
attempts to rectify that.

From: Ricard Wanderlof <ricardw at axis.com>
Signed-off-by: Ricard Wanderlof <ricardw at axis.com>

diff -ur git/drivers/mtd/nand/nand_base.c rw/drivers/mtd/nand/nand_base.c
--- git/drivers/mtd/nand/nand_base.c=092006-10-20 17:23:37.000000000 +0200
+++ rw/drivers/mtd/nand/nand_base.c=092006-10-20 17:23:56.000000000 +0200
@@ -362,7 +362,7 @@
  =09=09 * access
  =09=09 */
  =09=09ofs +=3D mtd->oobsize;
-=09=09chip->ops.len =3D 2;
+=09=09chip->ops.ooblen =3D 2;
  =09=09chip->ops.datbuf =3D NULL;
  =09=09chip->ops.oobbuf =3D buf;
  =09=09chip->ops.ooboffs =3D chip->badblockpos & ~0x01;

--
Ricard Wolf Wanderl=F6f                           ricardw(at)axis.com
Axis Communications AB, Lund, Sweden            www.axis.com
Phone +46 46 272 2016                           Fax +46 46 13 61 30
--218815243-287909873-1161098831=:25906
Content-Type: TEXT/PLAIN; CHARSET=US-ASCII; NAME=patch
Content-Transfer-Encoding: BASE64
Content-ID: <Pine.LNX.4.64.0610201733040.25906@lnxricardw.se.axis.com>
Content-Description: patch file
Content-Disposition: ATTACHMENT; FILENAME=patch

ZGlmZiAtdXIgZ2l0L2RyaXZlcnMvbXRkL25hbmQvbmFuZF9iYXNlLmMgcncv
ZHJpdmVycy9tdGQvbmFuZC9uYW5kX2Jhc2UuYw0KLS0tIGdpdC9kcml2ZXJz
L210ZC9uYW5kL25hbmRfYmFzZS5jCTIwMDYtMTAtMjAgMTc6MjM6MzcuMDAw
MDAwMDAwICswMjAwDQorKysgcncvZHJpdmVycy9tdGQvbmFuZC9uYW5kX2Jh
c2UuYwkyMDA2LTEwLTIwIDE3OjIzOjU2LjAwMDAwMDAwMCArMDIwMA0KQEAg
LTM2Miw3ICszNjIsNyBAQA0KIAkJICogYWNjZXNzDQogCQkgKi8NCiAJCW9m
cyArPSBtdGQtPm9vYnNpemU7DQotCQljaGlwLT5vcHMubGVuID0gMjsNCisJ
CWNoaXAtPm9wcy5vb2JsZW4gPSAyOw0KIAkJY2hpcC0+b3BzLmRhdGJ1ZiA9
IE5VTEw7DQogCQljaGlwLT5vcHMub29iYnVmID0gYnVmOw0KIAkJY2hpcC0+
b3BzLm9vYm9mZnMgPSBjaGlwLT5iYWRibG9ja3BvcyAmIH4weDAxOw0K

--218815243-287909873-1161098831=:25906--
