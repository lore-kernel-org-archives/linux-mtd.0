Received: from relay04.roc.ny.frontiernet.net ([66.133.182.167])
	by canuck.infradead.org with esmtp (Exim 4.54 #1 (Red Hat Linux))
	id 1EblnK-0006Bp-JE
	for linux-mtd@lists.infradead.org; Mon, 14 Nov 2005 16:23:23 -0500
From: John Bowler <jbowler@acm.org>
To: <linux-mtd@lists.infradead.org>
Date: Mon, 14 Nov 2005 13:20:07 -0800
Message-ID: <007301c5e961$3083a300$1001a8c0@kalmiopsis>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <4378CE1D.4030605@arcom.com>
Cc: 'Alessandro Zummo' <azummo-lists@towertech.it>
Subject: [PATCH] [MTD] MAPS/ixp4xx.c: fix BE system break in 2.6.15-rc1,
	enable LE operation in 2.6.15
Reply-To: jbowler@acm.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

[MTD] MAPS/ixp4xx.c: fix BE system break in 2.6.15-rc1, enable LE =
operation in 2.6.15

Linux 2.6.14.2 with NSLU2 patches excluding patches to ixp4xx.c
correctly boots on a BE (default) NSLU2 system from a JFFS2 rootfs
in the on-board flash.

Linux 2.6.15-rc1 with NSLU2 patches (excluding ixp4xx.c) and with
or without the additional patches from DVrabel:

mtd-unaligned-read-fix1.txt
mtd-little-endian-support.txt

fails during boot on NSLU2 BE because the probe of the on board flash
fails.

This patch applies to 2.6.15-rc1 (without any additional patches) and
fixes the problems so that 2.6.15-rc1+NSLU2 patches(excluding ixp4xx.c)+
this patch works in all cases where 2.6.14.2+NSLU2 patches (including,
in this case, the NSLU2 submitted ixp4xx.c patch).  That is to say,
the patched system will function correctly in both BE and LE modes using
(reading *and* writing) a JFFS2 from the on-board flash.

The comments in the patch explain the problems being fixed and how the
fix is achieved.  The fix is equivalent to the previously submitted
NSLU2 patch.

The full problem set is as follows, where '2.6.14' means 2.6.14 without
the NSLU2 patches, '2.6.15' means 2.6.15-rc1 without NSLU2 patches
and 'Vrabel' means 2.6.15-rc1 with the two patches mentioned above.

[2.6.14 BE]: boots, writeable JFFS2 but alignment problems for some =
reads
[2.6.14 LE]: does not work, flash probe fails, flash not accessible
[2.6.15, Vrabel BE]: does not work, flash probe fails, flash not =
accessible
[Vrabel LE]: boots, flash readable, flash fails on write (because the =
write
  byte swaps the bytes written, whereas the copy-from API used for the =
read
  does not).

[From: John Bowler <jbowler@acm.org>]
Signed-off-by: John Bowler <jbowler@acm.org>
Signed-off-by: Alessandro Zummo <a.zummo@towertech.it>

--- linux-2.6.15/drivers/mtd/maps/ixp4xx.c	1970-01-01 00:00:00.000000000 =
+0000
+++ linux-2.6.15/drivers/mtd/maps/ixp4xx.c	1970-01-01 00:00:00.000000000 =
+0000
@@ -28,24 +28,45 @@
 #include <linux/mtd/mtd.h>
 #include <linux/mtd/map.h>
 #include <linux/mtd/partitions.h>
+#include <linux/mtd/cfi_endian.h>
=20
 #include <asm/io.h>
 #include <asm/mach/flash.h>
=20
 #include <linux/reboot.h>
=20
-#ifndef __ARMEB__
-#define	BYTE0(h)	((h) & 0xFF)
-#define	BYTE1(h)	(((h) >> 8) & 0xFF)
+/*
+ * Read a 16 bit word from flash address 'addr'.
+ * This code ensures that the ixp4xx flash behaves as a consistent byte
+ * stream (same bytes in same order) regardless of whether the CPU is
+ * running in BE or LE mode, and regardless of whether the read16 or
+ * copyfrom method is used to read the flash data.
+ *
+ * When the cpu is in little-endian mode the hardware inverts the low
+ * address lines between the MMU (including the cache) and the flash =
chip
+ * ('address coherency') so we need to undo the swizzling to ensure =
commands
+ * and the like end up on the correct flash address.  This requirement
+ * only applies to command operations, however this code cannot =
distinguish
+ * a command read from a data read, therefore the fix applies to the =
data
+ * as well as the command and must be implemented consistently =
throughout
+ * the map driver (here).
+ */
+static inline u16 flash_read16(const void __iomem *virt, unsigned long =
offset)
+{
+#ifdef __ARMEB__
+	return *(const volatile u16 __iomem *)(virt + offset);
 #else
-#define	BYTE0(h)	(((h) >> 8) & 0xFF)
-#define	BYTE1(h)	((h) & 0xFF)
+	/* Cancel the address coherency invert of address line 1 in the
+	 * hardware on LE systems.
+	 */
+	return *(const volatile u16 __iomem *)(virt + (offset ^ 2));
 #endif
+}
=20
 static map_word ixp4xx_read16(struct map_info *map, unsigned long ofs)
 {
 	map_word val;
-	val.x[0] =3D le16_to_cpu(readw(map->virt + ofs));
+	val.x[0] =3D cfi16_to_cpu(flash_read16(map->virt, ofs));
 	return val;
 }
=20
@@ -53,41 +74,70 @@ static map_word ixp4xx_read16(struct map
  * The IXP4xx expansion bus only allows 16-bit wide acceses
  * when attached to a 16-bit wide device (such as the 28F128J3A),
  * so we can't just memcpy_fromio().
+ *
+ * This code must obtain the correct bytes in the correct order
+ * according to the configuration of the CFI subsystem.
  */
+#if (defined CFI_BIG_ENDIAN) || ((defined CFI_HOST_ENDIAN) && (defined =
__ARMEB__))
+	/* BE flash */
+#define	BYTE0(h)	(((h) >> 8) & 0xFF)
+#define	BYTE1(h)	((h) & 0xFF)
+#else
+	/* LE flash */
+#define	BYTE0(h)	((h) & 0xFF)
+#define	BYTE1(h)	(((h) >> 8) & 0xFF)
+#endif
+
 static void ixp4xx_copy_from(struct map_info *map, void *to,
 			     unsigned long from, ssize_t len)
 {
-	int i;
-	u8 *dest =3D (u8 *) to;
-	void __iomem *src =3D map->virt + from;
-	u16 data;
-
-	for (i =3D 0; i < (len / 2); i++) {
-		data =3D le16_to_cpu(readw(src + 2*i));
-		dest[i * 2] =3D BYTE0(data);
-		dest[i * 2 + 1] =3D BYTE1(data);
+	u8 *dest =3D to;
+	const void __iomem * const virt =3D map->virt;
+
+	if (len <=3D 0)
+		return;
+
+	if (from & 1) {
+		*dest++ =3D BYTE1(flash_read16(virt, from-1));
+                ++from;
+		--len;
+	}
+
+	while (len >=3D 2) {
+		u16 data =3D flash_read16(virt, from);
+		*dest++ =3D BYTE0(data);
+		*dest++ =3D BYTE1(data);
+		from +=3D 2;
+		len -=3D 2;
 	}
=20
-	if (len & 1)
-		dest[len - 1] =3D BYTE0(le16_to_cpu(readw(src + 2*i)));
+	if (len > 0)
+		*dest++ =3D BYTE0(flash_read16(virt, from));
 }
=20
 /*
- * Unaligned writes are ignored, causing the 8-bit
- * probe to fail and proceed to the 16-bit probe (which succeeds).
+ * Fast write16 function without the probing check below.
  */
-static void ixp4xx_probe_write16(struct map_info *map, map_word d, =
unsigned long adr)
+static void ixp4xx_write16(struct map_info *map, map_word d, unsigned =
long adr)
 {
-	if (!(adr & 1))
-		writew(cpu_to_le16(d.x[0]), map->virt + adr);
+#ifdef __ARMEB__
+	*(volatile u16 __iomem*)(map->virt + adr) =3D cpu_to_cfi16(d.x[0]);
+#else
+	/* Cancel the address coherency invert of address line 1 in the
+	 * hardware on LE systems.
+	 */
+	*(volatile u16 __iomem*)(map->virt + (adr ^ 2)) =3D =
cpu_to_cfi16(d.x[0]);
+#endif
 }
=20
 /*
- * Fast write16 function without the probing check above
+ * Unaligned writes are ignored, causing the 8-bit
+ * probe to fail and proceed to the 16-bit probe (which succeeds).
  */
-static void ixp4xx_write16(struct map_info *map, map_word d, unsigned =
long adr)
+static void ixp4xx_probe_write16(struct map_info *map, map_word d, =
unsigned long adr)
 {
-	writew(cpu_to_le16(d.x[0]), map->virt + adr);
+	if (!(adr & 1))
+		ixp4xx_write16(map, d, adr);
 }
=20
 struct ixp4xx_flash_info {
