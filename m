Subject: [PATCH] MTD: fix m25p80 64-bit divisions
From: Artem Bityutskiy <dedekind@infradead.org>
To: David Woodhouse <dwmw2@infradead.org>
Content-Type: text/plain; charset=UTF-8
Date: Wed, 17 Dec 2008 18:51:47 +0200
Message-Id: <1229532707.17960.40.camel@sauron>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Cc: linux-mtd <linux-mtd@lists.infradead.org>
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
Date: Wed, 17 Dec 2008 20:06:00 +0200
Subject: [PATCH] MTD: fix m25p80 64-bit divisions

MTD has recently been upgraded for 64-bit support, see commit
number 69423d99fc182a81f3c5db3eb5c140acc6fc64be in the
mtd-2.6.git tree (git://git.infradead.org/mtd-2.6.git)
or see this URL:
http://git.infradead.org/mtd-2.6.git?a=3Dcommit;h=3D69423d99fc182a81f3c5db3=
eb5c140acc6fc64be

Some variables in MTD data structures which were 32-bit
became 64-bit. Namely, the 'size' field in 'struct mtd_info'
and the 'addr'/'len' fields in 'struct erase_info'. This
means we have to use 'do_div' to divide them.

This patch fixes the following linking error:
ERROR: "__umoddi3" [drivers/mtd/devices/m25p80.ko] undefined!

This patch changes divisions of 64-bit variable so that they use
'do_div'. This patch also change some print placeholders to
get rid of gcc warnings.

Signed-off-by: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
Cc: David Woodhouse <dwmw2@infradead.org>
---
 drivers/mtd/devices/m25p80.c |   31 ++++++++++++++++---------------
 1 files changed, 16 insertions(+), 15 deletions(-)

diff --git a/drivers/mtd/devices/m25p80.c b/drivers/mtd/devices/m25p80.c
index 6659b22..84a9254 100644
--- a/drivers/mtd/devices/m25p80.c
+++ b/drivers/mtd/devices/m25p80.c
@@ -20,6 +20,7 @@
 #include <linux/device.h>
 #include <linux/interrupt.h>
 #include <linux/mutex.h>
+#include <asm/div64.h>
=20
 #include <linux/mtd/mtd.h>
 #include <linux/mtd/partitions.h>
@@ -169,9 +170,9 @@ static int wait_till_ready(struct m25p *flash)
  */
 static int erase_chip(struct m25p *flash)
 {
-	DEBUG(MTD_DEBUG_LEVEL3, "%s: %s %dKiB\n",
+	DEBUG(MTD_DEBUG_LEVEL3, "%s: %s %lluKiB\n",
 			flash->spi->dev.bus_id, __func__,
-			flash->mtd.size / 1024);
+			flash->mtd.size >> 10);
=20
 	/* Wait until finished previous write command. */
 	if (wait_till_ready(flash))
@@ -232,18 +233,18 @@ static int m25p80_erase(struct mtd_info *mtd, struct =
erase_info *instr)
 {
 	struct m25p *flash =3D mtd_to_m25p(mtd);
 	u32 addr,len;
+	uint64_t tmp;
=20
-	DEBUG(MTD_DEBUG_LEVEL2, "%s: %s %s 0x%08x, len %d\n",
+	DEBUG(MTD_DEBUG_LEVEL2, "%s: %s %s 0x%llx, len %llu\n",
 			flash->spi->dev.bus_id, __func__, "at",
-			(u32)instr->addr, instr->len);
+			instr->addr, instr->len);
=20
 	/* sanity checks */
 	if (instr->addr + instr->len > flash->mtd.size)
 		return -EINVAL;
-	if ((instr->addr % mtd->erasesize) !=3D 0
-			|| (instr->len % mtd->erasesize) !=3D 0) {
+	tmp =3D instr->len;
+	if (do_div(tmp, mtd->erasesize))
 		return -EINVAL;
-	}
=20
 	addr =3D instr->addr;
 	len =3D instr->len;
@@ -677,21 +678,21 @@ static int __devinit m25p_probe(struct spi_device *sp=
i)
 		flash->mtd.erasesize =3D info->sector_size;
 	}
=20
-	dev_info(&spi->dev, "%s (%d Kbytes)\n", info->name,
-			flash->mtd.size / 1024);
+	dev_info(&spi->dev, "%s (%llu Kbytes)\n", info->name,
+			flash->mtd.size >> 10);
=20
 	DEBUG(MTD_DEBUG_LEVEL2,
-		"mtd .name =3D %s, .size =3D 0x%.8x (%uMiB) "
+		"mtd .name =3D %s, .size =3D 0x%llx (%lluMiB) "
 			".erasesize =3D 0x%.8x (%uKiB) .numeraseregions =3D %d\n",
 		flash->mtd.name,
-		flash->mtd.size, flash->mtd.size / (1024*1024),
+		flash->mtd.size, flash->mtd.size >> 20,
 		flash->mtd.erasesize, flash->mtd.erasesize / 1024,
 		flash->mtd.numeraseregions);
=20
 	if (flash->mtd.numeraseregions)
 		for (i =3D 0; i < flash->mtd.numeraseregions; i++)
 			DEBUG(MTD_DEBUG_LEVEL2,
-				"mtd.eraseregions[%d] =3D { .offset =3D 0x%.8x, "
+				"mtd.eraseregions[%d] =3D { .offset =3D 0x%llx, "
 				".erasesize =3D 0x%.8x (%uKiB), "
 				".numblocks =3D %d }\n",
 				i, flash->mtd.eraseregions[i].offset,
@@ -722,12 +723,12 @@ static int __devinit m25p_probe(struct spi_device *sp=
i)
 		if (nr_parts > 0) {
 			for (i =3D 0; i < nr_parts; i++) {
 				DEBUG(MTD_DEBUG_LEVEL2, "partitions[%d] =3D "
-					"{.name =3D %s, .offset =3D 0x%.8x, "
-						".size =3D 0x%.8x (%uKiB) }\n",
+					"{.name =3D %s, .offset =3D 0x%llx, "
+						".size =3D 0x%llx (%lluKiB) }\n",
 					i, parts[i].name,
 					parts[i].offset,
 					parts[i].size,
-					parts[i].size / 1024);
+					parts[i].size >> 10);
 			}
 			flash->partitioned =3D 1;
 			return add_mtd_partitions(&flash->mtd, parts, nr_parts);
--=20
1.5.4.3


--=20
Best regards,
Artem Bityutskiy (=D0=91=D0=B8=D1=82=D1=8E=D1=86=D0=BA=D0=B8=D0=B9 =D0=90=
=D1=80=D1=82=D1=91=D0=BC)
