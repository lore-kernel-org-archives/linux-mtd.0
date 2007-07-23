Received: from smtp.nokia.com ([131.228.20.173] helo=mgw-ext14.nokia.com)
	by canuck.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1ICwEF-0006Si-UJ
	for linux-mtd@lists.infradead.org; Mon, 23 Jul 2007 07:37:35 -0400
Received: from esebh108.NOE.Nokia.com (esebh108.ntc.nokia.com [172.21.143.145])
	by mgw-ext14.nokia.com (Switch-3.2.5/Switch-3.2.5) with ESMTP id
	l6NBb4t2015755
	for <linux-mtd@lists.infradead.org>; Mon, 23 Jul 2007 14:37:28 +0300
Subject: [PATCH take2] [MTD] NAND: fix race in nand_base.c
From: Artem Bityutskiy <dedekind@infradead.org>
To: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset=UTF-8
Date: Mon, 23 Jul 2007 14:37:10 +0300
Message-Id: <1185190630.25822.11.camel@sauron>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

>From b9098e6f16a69cb48f85080a39a37e1c587da0f4 Mon Sep 17 00:00:00 2001
From: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
Date: Mon, 23 Jul 2007 16:06:50 +0300
Subject: [PATCH take2] [MTD] NAND: fix race in nand_base.c

When we mark block bad we have to get chip because this involves
writing to the page's OOB. We hit this bug in UBI - we observed
random obscure crashes when it marks block bad from the background
thread and there is some parallel task which utilizes flash.

This patch also adds a TODO note about BBT table protection which
it seems does not exist.

Signed-off-by: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
---
 drivers/mtd/nand/nand_base.c |    4 ++++
 1 files changed, 4 insertions(+), 0 deletions(-)

diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
index 7e68203..4b019c6 100644
--- a/drivers/mtd/nand/nand_base.c
+++ b/drivers/mtd/nand/nand_base.c
@@ -24,6 +24,7 @@
  *	if we have HW ecc support.
  *	The AG-AND chips have nice features for speed improvement,
  *	which are not supported yet. Read / program 4 pages in one go.
+ *	BBT table is not serialized, has to be fixed
  *
  * This program is free software; you can redistribute it and/or modify
  * it under the terms of the GNU General Public License version 2 as
@@ -360,6 +361,7 @@ static int nand_default_block_markbad(struct mtd_info *=
mtd, loff_t ofs)
 		/* We write two bytes, so we dont have to mess with 16 bit
 		 * access
 		 */
+		nand_get_device(chip, mtd, FL_WRITING);
 		ofs +=3D mtd->oobsize;
 		chip->ops.len =3D chip->ops.ooblen =3D 2;
 		chip->ops.datbuf =3D NULL;
@@ -367,9 +369,11 @@ static int nand_default_block_markbad(struct mtd_info =
*mtd, loff_t ofs)
 		chip->ops.ooboffs =3D chip->badblockpos & ~0x01;
=20
 		ret =3D nand_do_write_oob(mtd, ofs, &chip->ops);
+		nand_release_device(mtd);
 	}
 	if (!ret)
 		mtd->ecc_stats.badblocks++;
+
 	return ret;
 }
=20
--=20
1.5.0.6


--=20
Best regards,
Artem Bityutskiy (=D0=91=D0=B8=D1=82=D1=8E=D1=86=D0=BA=D0=B8=D0=B9 =D0=90=
=D1=80=D1=82=D1=91=D0=BC)
