Received: from mail1.bemta12.messagelabs.com ([216.82.251.14])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fG6K2-0004gT-RZ
 for linux-mtd@lists.infradead.org; Tue, 08 May 2018 17:22:44 +0000
From: IKEGAMI Tokunori <ikegami@allied-telesis.co.jp>
To: Boris Brezillon <boris.brezillon@bootlin.com>
CC: Brian Norris <computersforpeace@gmail.com>, Boris Brezillon
 <boris.brezillon@free-electrons.com>, Richard Weinberger <richard@nod.at>,
 Marek Vasut <marek.vasut@gmail.com>, PACKHAM Chris
 <chris.packham@alliedtelesis.co.nz>, "linux-mtd@lists.infradead.org"
 <linux-mtd@lists.infradead.org>, Cyrille Pitchen
 <cyrille.pitchen@wedev4u.fr>, David Woodhouse <dwmw2@infradead.org>
Subject: [PATCH] mtd: cfi_cmdset_0002: Fix coding style issues
Date: Tue, 8 May 2018 17:22:28 +0000
Message-ID: <TY1PR01MB09542FD6BF741E2365C898BEDC9A0@TY1PR01MB0954.jpnprd01.prod.outlook.com>
References: <TY1PR01MB09543004A0EDF2E03783E6D9DC9A0@TY1PR01MB0954.jpnprd01.prod.outlook.com>
 <20180508190902.32c344b7@bbrezillon>
In-Reply-To: <20180508190902.32c344b7@bbrezillon>
Content-Language: ja-JP
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Tokunori Ikegami <ikegami@allied-telesis.co.jp>

This patch fixes mainly to remove unneeded spaces after '(' and before ')'.
Also some indentation errors are fixed.

Signed-off-by: Tokunori Ikegami <ikegami@allied-telesis.co.jp>
Cc: Chris Packham <chris.packham@alliedtelesis.co.nz>
Cc: Brian Norris <computersforpeace@gmail.com>
Cc: David Woodhouse <dwmw2@infradead.org>
Cc: Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: Marek Vasut <marek.vasut@gmail.com>
Cc: Richard Weinberger <richard@nod.at>
Cc: Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>
Cc: linux-mtd@lists.infradead.org
---
 drivers/mtd/chips/cfi_cmdset_0002.c | 26 +++++++++++++-------------
 1 file changed, 13 insertions(+), 13 deletions(-)

diff --git a/drivers/mtd/chips/cfi_cmdset_0002.c b/drivers/mtd/chips/cfi_cm=
dset_0002.c
index 56aa6b75213d..e397b80e40cc 100644
--- a/drivers/mtd/chips/cfi_cmdset_0002.c
+++ b/drivers/mtd/chips/cfi_cmdset_0002.c
@@ -44,8 +44,8 @@
=20
 #define MAX_WORD_RETRIES 3
=20
-#define SST49LF004B	        0x0060
-#define SST49LF040B	        0x0050
+#define SST49LF004B		0x0060
+#define SST49LF040B		0x0050
 #define SST49LF008A		0x005a
 #define AT49BV6416		0x00d6
=20
@@ -207,7 +207,7 @@ static void fixup_use_write_buffers(struct mtd_info *mt=
d)
 	struct map_info *map =3D mtd->priv;
 	struct cfi_private *cfi =3D map->fldrv_priv;
 	if (cfi->cfiq->BufWriteTimeoutTyp) {
-		pr_debug("Using buffer write method\n" );
+		pr_debug("Using buffer write method\n");
 		mtd->_write =3D cfi_amdstd_write_buffers;
 	}
 }
@@ -1562,7 +1562,7 @@ static int __xipram do_write_oneword(struct map_info =
*map, struct flchip *chip,
 	 * depending of the conditions.	 The ' + 1' is to avoid having a
 	 * timeout of 0 jiffies if HZ is smaller than 1000.
 	 */
-	unsigned long uWriteTimeout =3D ( HZ / 1000 ) + 1;
+	unsigned long uWriteTimeout =3D (HZ / 1000) + 1;
 	int ret =3D 0;
 	map_word oldd;
 	int retry_cnt =3D 0;
@@ -1577,7 +1577,7 @@ static int __xipram do_write_oneword(struct map_info =
*map, struct flchip *chip,
 	}
=20
 	pr_debug("MTD %s(): WRITE 0x%.8lx(0x%.8lx)\n",
-	       __func__, adr, datum.x[0] );
+		 __func__, adr, datum.x[0]);
=20
 	if (mode =3D=3D FL_OTP_WRITE)
 		otp_enter(map, chip, adr, map_bankwidth(map));
@@ -1643,7 +1643,7 @@ static int __xipram do_write_oneword(struct map_info =
*map, struct flchip *chip,
 	/* Did we succeed? */
 	if (!chip_good(map, adr, datum)) {
 		/* reset on all failures. */
-		map_write( map, CMD(0xF0), chip->start );
+		map_write(map, CMD(0xF0), chip->start);
 		/* FIXME - should have reset delay before continuing */
=20
 		if (++retry_cnt <=3D MAX_WORD_RETRIES)
@@ -1821,7 +1821,7 @@ static int __xipram do_write_buffer(struct map_info *=
map, struct flchip *chip,
 	datum =3D map_word_load(map, buf);
=20
 	pr_debug("MTD %s(): WRITE 0x%.8lx(0x%.8lx)\n",
-	       __func__, adr, datum.x[0] );
+		 __func__, adr, datum.x[0]);
=20
 	XIP_INVAL_CACHED_RANGE(map, adr, len);
 	ENABLE_VPP(map);
@@ -2251,7 +2251,7 @@ static int __xipram do_erase_chip(struct map_info *ma=
p, struct flchip *chip)
 	}
=20
 	pr_debug("MTD %s(): ERASE 0x%.8lx\n",
-	       __func__, chip->start );
+	       __func__, chip->start);
=20
 	XIP_INVAL_CACHED_RANGE(map, adr, map->size);
 	ENABLE_VPP(map);
@@ -2297,7 +2297,7 @@ static int __xipram do_erase_chip(struct map_info *ma=
p, struct flchip *chip)
=20
 		if (time_after(jiffies, timeo)) {
 			printk(KERN_WARNING "MTD %s(): software timeout\n",
-				__func__ );
+			       __func__);
 			break;
 		}
=20
@@ -2307,7 +2307,7 @@ static int __xipram do_erase_chip(struct map_info *ma=
p, struct flchip *chip)
 	/* Did we succeed? */
 	if (!chip_good(map, adr, map_word_ff(map))) {
 		/* reset on all failures. */
-		map_write( map, CMD(0xF0), chip->start );
+		map_write(map, CMD(0xF0), chip->start);
 		/* FIXME - should have reset delay before continuing */
=20
 		ret =3D -EIO;
@@ -2340,7 +2340,7 @@ static int __xipram do_erase_oneblock(struct map_info=
 *map, struct flchip *chip,
 	}
=20
 	pr_debug("MTD %s(): ERASE 0x%.8lx\n",
-	       __func__, adr );
+		 __func__, adr);
=20
 	XIP_INVAL_CACHED_RANGE(map, adr, len);
 	ENABLE_VPP(map);
@@ -2389,7 +2389,7 @@ static int __xipram do_erase_oneblock(struct map_info=
 *map, struct flchip *chip,
 		if (time_after(jiffies, timeo)) {
 			xip_enable(map, chip, adr);
 			printk(KERN_WARNING "MTD %s(): software timeout\n",
-				__func__ );
+			       __func__);
 			break;
 		}
=20
@@ -2399,7 +2399,7 @@ static int __xipram do_erase_oneblock(struct map_info=
 *map, struct flchip *chip,
 	/* Did we succeed? */
 	if (!chip_good(map, adr, map_word_ff(map))) {
 		/* reset on all failures. */
-		map_write( map, CMD(0xF0), chip->start );
+		map_write(map, CMD(0xF0), chip->start);
 		/* FIXME - should have reset delay before continuing */
=20
 		ret =3D -EIO;
--=20
2.16.1
