Received: from mail1.bemta8.messagelabs.com ([216.82.243.200])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fFzjm-00037I-LB
 for linux-mtd@lists.infradead.org; Tue, 08 May 2018 10:20:52 +0000
From: IKEGAMI Tokunori <ikegami@allied-telesis.co.jp>
To: Brian Norris <computersforpeace@gmail.com>
CC: IKEGAMI Tokunori <ikegami@allied-telesis.co.jp>, PACKHAM Chris
 <chris.packham@alliedtelesis.co.nz>, David Woodhouse <dwmw2@infradead.org>,
 Boris Brezillon <boris.brezillon@free-electrons.com>, Marek Vasut
 <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>, Cyrille Pitchen
 <cyrille.pitchen@wedev4u.fr>, "linux-mtd@lists.infradead.org"
 <linux-mtd@lists.infradead.org>
Subject: [PATCH] mtd: cfi_cmdset_0002: Change erase functions to retry for
 error
Date: Tue, 8 May 2018 10:20:29 +0000
Message-ID: <TY1PR01MB0954474CBDBF98D0E3D3E648DC9A0@TY1PR01MB0954.jpnprd01.prod.outlook.com>
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

For the word write functions it is retried for error.
But it is not implemented to retry for the erase functions.
To make sure for the erase functions change to retry as same.

Signed-off-by: Tokunori Ikegami <ikegami@allied-telesis.co.jp>
Cc: Chris Packham <chris.packham@alliedtelesis.co.nz>
Cc: David Woodhouse <dwmw2@infradead.org>
Cc: Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: Marek Vasut <marek.vasut@gmail.com>
Cc: Richard Weinberger <richard@nod.at>
Cc: Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>
Cc: linux-mtd@lists.infradead.org
---
 drivers/mtd/chips/cfi_cmdset_0002.c | 36 +++++++++++++++++++++++----------=
---
 1 file changed, 23 insertions(+), 13 deletions(-)

diff --git a/drivers/mtd/chips/cfi_cmdset_0002.c b/drivers/mtd/chips/cfi_cm=
dset_0002.c
index 56aa6b75213d..e2dc020cd102 100644
--- a/drivers/mtd/chips/cfi_cmdset_0002.c
+++ b/drivers/mtd/chips/cfi_cmdset_0002.c
@@ -42,7 +42,7 @@
 #define AMD_BOOTLOC_BUG
 #define FORCE_WORD_WRITE 0
=20
-#define MAX_WORD_RETRIES 3
+#define MAX_WRITE_RETRIES 3
=20
 #define SST49LF004B	        0x0060
 #define SST49LF040B	        0x0050
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
@@ -1577,7 +1577,7 @@ static int __xipram do_write_oneword(struct map_info =
*map, struct flchip *chip,
 	}
=20
 	pr_debug("MTD %s(): WRITE 0x%.8lx(0x%.8lx)\n",
-	       __func__, adr, datum.x[0] );
+	       __func__, adr, datum.x[0]);
=20
 	if (mode =3D=3D FL_OTP_WRITE)
 		otp_enter(map, chip, adr, map_bankwidth(map));
@@ -1643,10 +1643,10 @@ static int __xipram do_write_oneword(struct map_inf=
o *map, struct flchip *chip,
 	/* Did we succeed? */
 	if (!chip_good(map, adr, datum)) {
 		/* reset on all failures. */
-		map_write( map, CMD(0xF0), chip->start );
+		map_write(map, CMD(0xF0), chip->start);
 		/* FIXME - should have reset delay before continuing */
=20
-		if (++retry_cnt <=3D MAX_WORD_RETRIES)
+		if (++retry_cnt <=3D MAX_WRITE_RETRIES)
 			goto retry;
=20
 		ret =3D -EIO;
@@ -1821,7 +1821,7 @@ static int __xipram do_write_buffer(struct map_info *=
map, struct flchip *chip,
 	datum =3D map_word_load(map, buf);
=20
 	pr_debug("MTD %s(): WRITE 0x%.8lx(0x%.8lx)\n",
-	       __func__, adr, datum.x[0] );
+	       __func__, adr, datum.x[0]);
=20
 	XIP_INVAL_CACHED_RANGE(map, adr, len);
 	ENABLE_VPP(map);
@@ -2105,7 +2105,7 @@ static int do_panic_write_oneword(struct map_info *ma=
p, struct flchip *chip,
 		map_write(map, CMD(0xF0), chip->start);
 		/* FIXME - should have reset delay before continuing */
=20
-		if (++retry_cnt <=3D MAX_WORD_RETRIES)
+		if (++retry_cnt <=3D MAX_WRITE_RETRIES)
 			goto retry;
=20
 		ret =3D -EIO;
@@ -2240,6 +2240,7 @@ static int __xipram do_erase_chip(struct map_info *ma=
p, struct flchip *chip)
 	unsigned long int adr;
 	DECLARE_WAITQUEUE(wait, current);
 	int ret =3D 0;
+	int retry_cnt =3D 0;
=20
 	adr =3D cfi->addr_unlock1;
=20
@@ -2251,12 +2252,13 @@ static int __xipram do_erase_chip(struct map_info *=
map, struct flchip *chip)
 	}
=20
 	pr_debug("MTD %s(): ERASE 0x%.8lx\n",
-	       __func__, chip->start );
+	       __func__, chip->start);
=20
 	XIP_INVAL_CACHED_RANGE(map, adr, map->size);
 	ENABLE_VPP(map);
 	xip_disable(map, chip, adr);
=20
+ retry:
 	cfi_send_gen_cmd(0xAA, cfi->addr_unlock1, chip->start, map, cfi, cfi->dev=
ice_type, NULL);
 	cfi_send_gen_cmd(0x55, cfi->addr_unlock2, chip->start, map, cfi, cfi->dev=
ice_type, NULL);
 	cfi_send_gen_cmd(0x80, cfi->addr_unlock1, chip->start, map, cfi, cfi->dev=
ice_type, NULL);
@@ -2297,7 +2299,7 @@ static int __xipram do_erase_chip(struct map_info *ma=
p, struct flchip *chip)
=20
 		if (time_after(jiffies, timeo)) {
 			printk(KERN_WARNING "MTD %s(): software timeout\n",
-				__func__ );
+				__func__);
 			break;
 		}
=20
@@ -2307,9 +2309,12 @@ static int __xipram do_erase_chip(struct map_info *m=
ap, struct flchip *chip)
 	/* Did we succeed? */
 	if (!chip_good(map, adr, map_word_ff(map))) {
 		/* reset on all failures. */
-		map_write( map, CMD(0xF0), chip->start );
+		map_write(map, CMD(0xF0), chip->start);
 		/* FIXME - should have reset delay before continuing */
=20
+		if (++retry_cnt <=3D MAX_WRITE_RETRIES)
+			goto retry;
+
 		ret =3D -EIO;
 	}
=20
@@ -2329,6 +2334,7 @@ static int __xipram do_erase_oneblock(struct map_info=
 *map, struct flchip *chip,
 	unsigned long timeo =3D jiffies + HZ;
 	DECLARE_WAITQUEUE(wait, current);
 	int ret =3D 0;
+	int retry_cnt =3D 0;
=20
 	adr +=3D chip->start;
=20
@@ -2340,12 +2346,13 @@ static int __xipram do_erase_oneblock(struct map_in=
fo *map, struct flchip *chip,
 	}
=20
 	pr_debug("MTD %s(): ERASE 0x%.8lx\n",
-	       __func__, adr );
+	       __func__, adr);
=20
 	XIP_INVAL_CACHED_RANGE(map, adr, len);
 	ENABLE_VPP(map);
 	xip_disable(map, chip, adr);
=20
+ retry:
 	cfi_send_gen_cmd(0xAA, cfi->addr_unlock1, chip->start, map, cfi, cfi->dev=
ice_type, NULL);
 	cfi_send_gen_cmd(0x55, cfi->addr_unlock2, chip->start, map, cfi, cfi->dev=
ice_type, NULL);
 	cfi_send_gen_cmd(0x80, cfi->addr_unlock1, chip->start, map, cfi, cfi->dev=
ice_type, NULL);
@@ -2389,7 +2396,7 @@ static int __xipram do_erase_oneblock(struct map_info=
 *map, struct flchip *chip,
 		if (time_after(jiffies, timeo)) {
 			xip_enable(map, chip, adr);
 			printk(KERN_WARNING "MTD %s(): software timeout\n",
-				__func__ );
+				__func__);
 			break;
 		}
=20
@@ -2399,9 +2406,12 @@ static int __xipram do_erase_oneblock(struct map_inf=
o *map, struct flchip *chip,
 	/* Did we succeed? */
 	if (!chip_good(map, adr, map_word_ff(map))) {
 		/* reset on all failures. */
-		map_write( map, CMD(0xF0), chip->start );
+		map_write(map, CMD(0xF0), chip->start);
 		/* FIXME - should have reset delay before continuing */
=20
+		if (++retry_cnt <=3D MAX_WRITE_RETRIES)
+			goto retry;
+
 		ret =3D -EIO;
 	}
=20
--=20
2.16.1
