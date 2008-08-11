Received: from az33egw02.freescale.net ([192.88.158.103])
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1KSTNt-00020k-Pp
	for linux-mtd@lists.infradead.org; Mon, 11 Aug 2008 09:08:14 +0000
Received: from az33smr01.freescale.net (az33smr01.freescale.net [10.64.34.199])
	by az33egw02.freescale.net (8.12.11/az33egw02) with ESMTP id
	m7B98AEe011021 for <linux-mtd@lists.infradead.org>;
	Mon, 11 Aug 2008 02:08:11 -0700 (MST)
Received: from zch01exm21.fsl.freescale.net (zch01exm21.ap.freescale.net
	[10.192.129.205])
	by az33smr01.freescale.net (8.13.1/8.13.0) with ESMTP id m7B985aD007178
	for <linux-mtd@lists.infradead.org>;
	Mon, 11 Aug 2008 04:08:09 -0500 (CDT)
From: Chen Gong <g.chen@freescale.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 3/3] [MTD] m25p80.c extended jedec support
Date: Mon, 11 Aug 2008 16:59:15 +0800
Message-Id: <1218445155-6238-4-git-send-email-g.chen@freescale.com>
In-Reply-To: <1218445155-6238-3-git-send-email-g.chen@freescale.com>
References: <1218445155-6238-1-git-send-email-g.chen@freescale.com>
	<1218445155-6238-2-git-send-email-g.chen@freescale.com>
	<1218445155-6238-3-git-send-email-g.chen@freescale.com>
Cc: Chen Gong <g.chen@freescale.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

- add extended device information support
- add s25sl128 device support

Signed-off-by: Chen Gong <g.chen@freescale.com>
---
 drivers/mtd/devices/m25p80.c |   86 +++++++++++++++++++++++-------------------
 1 files changed, 47 insertions(+), 39 deletions(-)

diff --git a/drivers/mtd/devices/m25p80.c b/drivers/mtd/devices/m25p80.c
index b2b58c1..4d3ae08 100644
--- a/drivers/mtd/devices/m25p80.c
+++ b/drivers/mtd/devices/m25p80.c
@@ -469,6 +469,7 @@ struct flash_info {
 	 * then a two byte device id.
 	 */
 	u32		jedec_id;
+	u16             ext_id;
 
 	/* The size listed here is what works with OPCODE_SE, which isn't
 	 * necessarily called a "sector" by the vendor.
@@ -488,57 +489,59 @@ struct flash_info {
 static struct flash_info __devinitdata m25p_data [] = {
 
 	/* Atmel -- some are (confusingly) marketed as "DataFlash" */
-	{ "at25fs010",  0x1f6601, 32 * 1024, 4, SECT_4K, },
-	{ "at25fs040",  0x1f6604, 64 * 1024, 8, SECT_4K, },
+	{ "at25fs010",  0x1f6601, 0, 32 * 1024, 4, SECT_4K, },
+	{ "at25fs040",  0x1f6604, 0, 64 * 1024, 8, SECT_4K, },
 
-	{ "at25df041a", 0x1f4401, 64 * 1024, 8, SECT_4K, },
-	{ "at25df641",  0x1f4800, 64 * 1024, 128, SECT_4K, },
+	{ "at25df041a", 0x1f4401, 0, 64 * 1024, 8, SECT_4K, },
+	{ "at25df641",  0x1f4800, 0, 64 * 1024, 128, SECT_4K, },
 
-	{ "at26f004",   0x1f0400, 64 * 1024, 8, SECT_4K, },
-	{ "at26df081a", 0x1f4501, 64 * 1024, 16, SECT_4K, },
-	{ "at26df161a", 0x1f4601, 64 * 1024, 32, SECT_4K, },
-	{ "at26df321",  0x1f4701, 64 * 1024, 64, SECT_4K, },
+	{ "at26f004",   0x1f0400, 0, 64 * 1024, 8, SECT_4K, },
+	{ "at26df081a", 0x1f4501, 0, 64 * 1024, 16, SECT_4K, },
+	{ "at26df161a", 0x1f4601, 0, 64 * 1024, 32, SECT_4K, },
+	{ "at26df321",  0x1f4701, 0, 64 * 1024, 64, SECT_4K, },
 
 	/* Spansion -- single (large) sector size only, at least
 	 * for the chips listed here (without boot sectors).
 	 */
-	{ "s25sl004a", 0x010212, 64 * 1024, 8, },
-	{ "s25sl008a", 0x010213, 64 * 1024, 16, },
-	{ "s25sl016a", 0x010214, 64 * 1024, 32, },
-	{ "s25sl032a", 0x010215, 64 * 1024, 64, },
-	{ "s25sl064a", 0x010216, 64 * 1024, 128, },
+	{ "s25sl004a", 0x010212, 0, 64 * 1024, 8, },
+	{ "s25sl008a", 0x010213, 0, 64 * 1024, 16, },
+	{ "s25sl016a", 0x010214, 0, 64 * 1024, 32, },
+	{ "s25sl032a", 0x010215, 0, 64 * 1024, 64, },
+	{ "s25sl064a", 0x010216, 0, 64 * 1024, 128, },
+        { "s25sl12800", 0x012018, 0x0300, 256 * 1024, 64, },
+	{ "s25sl12801", 0x012018, 0x0301, 64 * 1024, 256, },
 
 	/* SST -- large erase sizes are "overlays", "sectors" are 4K */
-	{ "sst25vf040b", 0xbf258d, 64 * 1024, 8, SECT_4K, },
-	{ "sst25vf080b", 0xbf258e, 64 * 1024, 16, SECT_4K, },
-	{ "sst25vf016b", 0xbf2541, 64 * 1024, 32, SECT_4K, },
-	{ "sst25vf032b", 0xbf254a, 64 * 1024, 64, SECT_4K, },
+	{ "sst25vf040b", 0xbf258d, 0, 64 * 1024, 8, SECT_4K, },
+	{ "sst25vf080b", 0xbf258e, 0, 64 * 1024, 16, SECT_4K, },
+	{ "sst25vf016b", 0xbf2541, 0, 64 * 1024, 32, SECT_4K, },
+	{ "sst25vf032b", 0xbf254a, 0, 64 * 1024, 64, SECT_4K, },
 
 	/* ST Microelectronics -- newer production may have feature updates */
-	{ "m25p05",  0x202010,  32 * 1024, 2, },
-	{ "m25p10",  0x202011,  32 * 1024, 4, },
-	{ "m25p20",  0x202012,  64 * 1024, 4, },
-	{ "m25p40",  0x202013,  64 * 1024, 8, },
-	{ "m25p80",         0,  64 * 1024, 16, },
-	{ "m25p16",  0x202015,  64 * 1024, 32, },
-	{ "m25p32",  0x202016,  64 * 1024, 64, },
-	{ "m25p64",  0x202017,  64 * 1024, 128, },
-	{ "m25p128", 0x202018, 256 * 1024, 64, },
-
-	{ "m45pe80", 0x204014,  64 * 1024, 16, },
-	{ "m45pe16", 0x204015,  64 * 1024, 32, },
-
-	{ "m25pe80", 0x208014,  64 * 1024, 16, },
-	{ "m25pe16", 0x208015,  64 * 1024, 32, SECT_4K, },
+	{ "m25p05",  0x202010,  0, 32 * 1024, 2, },
+	{ "m25p10",  0x202011,  0, 32 * 1024, 4, },
+	{ "m25p20",  0x202012,  0, 64 * 1024, 4, },
+	{ "m25p40",  0x202013,  0, 64 * 1024, 8, },
+	{ "m25p80",         0,  0, 64 * 1024, 16, },
+	{ "m25p16",  0x202015,  0, 64 * 1024, 32, },
+	{ "m25p32",  0x202016,  0, 64 * 1024, 64, },
+	{ "m25p64",  0x202017,  0, 64 * 1024, 128, },
+	{ "m25p128", 0x202018, 0, 256 * 1024, 64, },
+
+	{ "m45pe80", 0x204014,  0, 64 * 1024, 16, },
+	{ "m45pe16", 0x204015,  0, 64 * 1024, 32, },
+
+	{ "m25pe80", 0x208014,  0, 64 * 1024, 16, },
+	{ "m25pe16", 0x208015,  0, 64 * 1024, 32, SECT_4K, },
 
 	/* Winbond -- w25x "blocks" are 64K, "sectors" are 4KiB */
-	{ "w25x10", 0xef3011, 64 * 1024, 2, SECT_4K, },
-	{ "w25x20", 0xef3012, 64 * 1024, 4, SECT_4K, },
-	{ "w25x40", 0xef3013, 64 * 1024, 8, SECT_4K, },
-	{ "w25x80", 0xef3014, 64 * 1024, 16, SECT_4K, },
-	{ "w25x16", 0xef3015, 64 * 1024, 32, SECT_4K, },
-	{ "w25x32", 0xef3016, 64 * 1024, 64, SECT_4K, },
-	{ "w25x64", 0xef3017, 64 * 1024, 128, SECT_4K, },
+	{ "w25x10", 0xef3011, 0, 64 * 1024, 2, SECT_4K, },
+	{ "w25x20", 0xef3012, 0, 64 * 1024, 4, SECT_4K, },
+	{ "w25x40", 0xef3013, 0, 64 * 1024, 8, SECT_4K, },
+	{ "w25x80", 0xef3014, 0, 64 * 1024, 16, SECT_4K, },
+	{ "w25x16", 0xef3015, 0, 64 * 1024, 32, SECT_4K, },
+	{ "w25x32", 0xef3016, 0, 64 * 1024, 64, SECT_4K, },
+	{ "w25x64", 0xef3017, 0, 64 * 1024, 128, SECT_4K, },
 };
 
 static struct flash_info *__devinit jedec_probe(struct spi_device *spi)
@@ -547,6 +550,7 @@ static struct flash_info *__devinit jedec_probe(struct spi_device *spi)
 	u8			code = OPCODE_RDID;
 	u8			id[3];
 	u32			jedec;
+	u16                     ext_jedec;
 	struct flash_info	*info;
 
 	/* JEDEC also defines an optional "extended device information"
@@ -565,10 +569,14 @@ static struct flash_info *__devinit jedec_probe(struct spi_device *spi)
 	jedec = jedec << 8;
 	jedec |= id[2];
 
+	ext_jedec = id[3] << 8 | id[4];
+
 	for (tmp = 0, info = m25p_data;
 			tmp < ARRAY_SIZE(m25p_data);
 			tmp++, info++) {
 		if (info->jedec_id == jedec)
+			if (ext_jedec != 0 && info->ext_id != ext_jedec)
+				continue;
 			return info;
 	}
 	dev_err(&spi->dev, "unrecognized JEDEC id %06x\n", jedec);
-- 
1.5.4
