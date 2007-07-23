Received: from smtp.nokia.com ([131.228.20.172] helo=mgw-ext13.nokia.com)
	by canuck.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1ICvvN-0005xX-R7
	for linux-mtd@lists.infradead.org; Mon, 23 Jul 2007 07:18:03 -0400
Received: from esebh106.NOE.Nokia.com (esebh106.ntc.nokia.com [172.21.138.213])
	by mgw-ext13.nokia.com (Switch-3.2.5/Switch-3.2.5) with ESMTP id
	l6NBHSOU009478
	for <linux-mtd@lists.infradead.org>; Mon, 23 Jul 2007 14:17:57 +0300
Subject: [PATCH] [MTD] NAND: fix race in nand_base
From: Artem Bityutskiy <dedekind@infradead.org>
To: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset=UTF-8
Date: Mon, 23 Jul 2007 14:17:26 +0300
Message-Id: <1185189446.25822.5.camel@sauron>
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

From: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
Date: Mon, 23 Jul 2007 16:06:50 +0300
Subject: [PATCH] [MTD] NAND: fix race in nand_base

When we mark block bad we have to get chip because this involves
writing to the page's OOB. We hit this bug in UBI - we observed
random obscure crashes when it marks block bad from the background
thread and there is some parallel task which utilizes flash.

Signed-off-by: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
---
 drivers/mtd/nand/nand_base.c |    4 ++++
 1 files changed, 4 insertions(+), 0 deletions(-)

diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
index 7e68203..3391b05 100644
--- a/drivers/mtd/nand/nand_base.c
+++ b/drivers/mtd/nand/nand_base.c
@@ -348,6 +348,8 @@ static int nand_default_block_markbad(struct mtd_info *=
mtd, loff_t ofs)
 	uint8_t buf[2] =3D { 0, 0 };
 	int block, ret;
=20
+	nand_get_device(chip, mtd, FL_READING);
+
 	/* Get block number */
 	block =3D (int)(ofs >> chip->bbt_erase_shift);
 	if (chip->bbt)
@@ -370,6 +372,8 @@ static int nand_default_block_markbad(struct mtd_info *=
mtd, loff_t ofs)
 	}
 	if (!ret)
 		mtd->ecc_stats.badblocks++;
+
+	nand_release_device(mtd);
 	return ret;
 }
=20
--=20
1.5.0.6


--=20
Best regards,
Artem Bityutskiy (=D0=91=D0=B8=D1=82=D1=8E=D1=86=D0=BA=D0=B8=D0=B9 =D0=90=
=D1=80=D1=82=D1=91=D0=BC)
