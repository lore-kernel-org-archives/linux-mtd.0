Received: from smtp2-g21.free.fr ([212.27.42.2])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1O5hof-0006BI-3X
	for linux-mtd@lists.infradead.org; Sat, 24 Apr 2010 16:02:50 +0000
Subject: [PATCH v5 1/9] mtd: cfi_probe: enter Auto Select Mode after filling
	cfi->cfiq members
To: linux-mtd <linux-mtd@lists.infradead.org>
From: Guillaume LECERF <glecerf@gmail.com>
Date: Sat, 24 Apr 2010 17:57:52 +0200
Message-ID: <20100424155751.14723.46761.stgit@shiryu.yomgui.biz>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Cc: Wolfram Sang <w.sang@pengutronix.de>, David Woodhouse <dwmw2@infradead.org>,
	Chris Moore <moore@free.fr>, Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Move the code to enter Auto Select Mode down to be able to use cfi->cfiq
members to add support for chips using alternative sequence / unlock
addresses.

Signed-off-by: Guillaume LECERF <glecerf@gmail.com>
Reviewed-by: Wolfram Sang <w.sang@pengutronix.de>
---
 drivers/mtd/chips/cfi_probe.c |   47 +++++++++++++++++++++--------------------
 1 files changed, 24 insertions(+), 23 deletions(-)

diff --git a/drivers/mtd/chips/cfi_probe.c b/drivers/mtd/chips/cfi_probe.c
index e63e674..f657d16 100644
--- a/drivers/mtd/chips/cfi_probe.c
+++ b/drivers/mtd/chips/cfi_probe.c
@@ -181,29 +181,6 @@ static int __xipram cfi_chip_setup(struct map_info *map,
 	for (i=0; i<(sizeof(struct cfi_ident) + num_erase_regions * 4); i++)
 		((unsigned char *)cfi->cfiq)[i] = cfi_read_query(map,base + (0x10 + i)*ofs_factor);
 
-	/* Note we put the device back into Read Mode BEFORE going into Auto
-	 * Select Mode, as some devices support nesting of modes, others
-	 * don't. This way should always work.
-	 * On cmdset 0001 the writes of 0xaa and 0x55 are not needed, and
-	 * so should be treated as nops or illegal (and so put the device
-	 * back into Read Mode, which is a nop in this case).
-	 */
-	cfi_send_gen_cmd(0xf0,     0, base, map, cfi, cfi->device_type, NULL);
-	cfi_send_gen_cmd(0xaa, 0x555, base, map, cfi, cfi->device_type, NULL);
-	cfi_send_gen_cmd(0x55, 0x2aa, base, map, cfi, cfi->device_type, NULL);
-	cfi_send_gen_cmd(0x90, 0x555, base, map, cfi, cfi->device_type, NULL);
-	cfi->mfr = cfi_read_query16(map, base);
-	cfi->id = cfi_read_query16(map, base + ofs_factor);
-
-	/* Get AMD/Spansion extended JEDEC ID */
-	if (cfi->mfr == CFI_MFR_AMD && (cfi->id & 0xff) == 0x7e)
-		cfi->id = cfi_read_query(map, base + 0xe * ofs_factor) << 8 |
-			  cfi_read_query(map, base + 0xf * ofs_factor);
-
-	/* Put it back into Read Mode */
-	cfi_qry_mode_off(base, map, cfi);
-	xip_allowed(base, map);
-
 	/* Do any necessary byteswapping */
 	cfi->cfiq->P_ID = le16_to_cpu(cfi->cfiq->P_ID);
 
@@ -228,6 +205,30 @@ static int __xipram cfi_chip_setup(struct map_info *map,
 #endif
 	}
 
+	/*
+	 * Note we put the device back into Read Mode BEFORE going into Auto
+	 * Select Mode, as some devices support nesting of modes, others
+	 * don't. This way should always work.
+	 * On cmdset 0001 the writes of 0xaa and 0x55 are not needed, and
+	 * so should be treated as nops or illegal (and so put the device
+	 * back into Read Mode, which is a nop in this case).
+	 */
+	cfi_send_gen_cmd(0xf0,     0, base, map, cfi, cfi->device_type, NULL);
+	cfi_send_gen_cmd(0xaa, 0x555, base, map, cfi, cfi->device_type, NULL);
+	cfi_send_gen_cmd(0x55, 0x2aa, base, map, cfi, cfi->device_type, NULL);
+	cfi_send_gen_cmd(0x90, 0x555, base, map, cfi, cfi->device_type, NULL);
+	cfi->mfr = cfi_read_query16(map, base);
+	cfi->id = cfi_read_query16(map, base + ofs_factor);
+
+	/* Get AMD/Spansion extended JEDEC ID */
+	if (cfi->mfr == CFI_MFR_AMD && (cfi->id & 0xff) == 0x7e)
+		cfi->id = cfi_read_query(map, base + 0xe * ofs_factor) << 8 |
+			  cfi_read_query(map, base + 0xf * ofs_factor);
+
+	/* Put it back into Read Mode */
+	cfi_qry_mode_off(base, map, cfi);
+	xip_allowed(base, map);
+
 	printk(KERN_INFO "%s: Found %d x%d devices at 0x%x in %d-bit bank\n",
 	       map->name, cfi->interleave, cfi->device_type*8, base,
 	       map->bankwidth*8);
