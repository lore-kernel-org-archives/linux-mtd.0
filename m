Received: from [2002:5db3:e134::1] (helo=shrek.podlesie.net)
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1U8tz7-0005sb-9m
 for linux-mtd@lists.infradead.org; Fri, 22 Feb 2013 14:52:26 +0000
From: Krzysztof Mazur <krzysiek@podlesie.net>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 1/2] mtd: m25p80: introduce SST_WRITE flag for SST byte
 programming
Date: Fri, 22 Feb 2013 15:51:05 +0100
Message-Id: <1361544666-7148-1-git-send-email-krzysiek@podlesie.net>
Cc: artem.bityutskiy@linux.intel.com, Krzysztof Mazur <krzysiek@podlesie.net>,
 dwmw2@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Not all SST devices implement the SST byte programming command.
Some devices (like SST25VF064C) implement only standard m25p80 page
write command.

Now SPI flash devices that need sst_write() are explicitly marked
with new SST_WRITE flag and the decision to use sst_write() is based
on this flag instead of manufacturer id.

Signed-off-by: Krzysztof Mazur <krzysiek@podlesie.net>
---
 drivers/mtd/devices/m25p80.c | 19 ++++++++++---------
 1 file changed, 10 insertions(+), 9 deletions(-)

diff --git a/drivers/mtd/devices/m25p80.c b/drivers/mtd/devices/m25p80.c
index 4eeeb2d..e533bf1 100644
--- a/drivers/mtd/devices/m25p80.c
+++ b/drivers/mtd/devices/m25p80.c
@@ -591,6 +591,7 @@ struct flash_info {
 	u16		flags;
 #define	SECT_4K		0x01		/* OPCODE_BE_4K works uniformly */
 #define	M25P_NO_ERASE	0x02		/* No erase command needed */
+#define	SST_WRITE	0x04		/* use SST byte programming */
 };
 
 #define INFO(_jedec_id, _ext_id, _sector_size, _n_sectors, _flags)	\
@@ -687,14 +688,14 @@ static const struct spi_device_id m25p_ids[] = {
 	{ "s25fl064k",  INFO(0xef4017,      0,  64 * 1024, 128, SECT_4K) },
 
 	/* SST -- large erase sizes are "overlays", "sectors" are 4K */
-	{ "sst25vf040b", INFO(0xbf258d, 0, 64 * 1024,  8, SECT_4K) },
-	{ "sst25vf080b", INFO(0xbf258e, 0, 64 * 1024, 16, SECT_4K) },
-	{ "sst25vf016b", INFO(0xbf2541, 0, 64 * 1024, 32, SECT_4K) },
-	{ "sst25vf032b", INFO(0xbf254a, 0, 64 * 1024, 64, SECT_4K) },
-	{ "sst25wf512",  INFO(0xbf2501, 0, 64 * 1024,  1, SECT_4K) },
-	{ "sst25wf010",  INFO(0xbf2502, 0, 64 * 1024,  2, SECT_4K) },
-	{ "sst25wf020",  INFO(0xbf2503, 0, 64 * 1024,  4, SECT_4K) },
-	{ "sst25wf040",  INFO(0xbf2504, 0, 64 * 1024,  8, SECT_4K) },
+	{ "sst25vf040b", INFO(0xbf258d, 0, 64 * 1024,  8, SECT_4K | SST_WRITE) },
+	{ "sst25vf080b", INFO(0xbf258e, 0, 64 * 1024, 16, SECT_4K | SST_WRITE) },
+	{ "sst25vf016b", INFO(0xbf2541, 0, 64 * 1024, 32, SECT_4K | SST_WRITE) },
+	{ "sst25vf032b", INFO(0xbf254a, 0, 64 * 1024, 64, SECT_4K | SST_WRITE) },
+	{ "sst25wf512",  INFO(0xbf2501, 0, 64 * 1024,  1, SECT_4K | SST_WRITE) },
+	{ "sst25wf010",  INFO(0xbf2502, 0, 64 * 1024,  2, SECT_4K | SST_WRITE) },
+	{ "sst25wf020",  INFO(0xbf2503, 0, 64 * 1024,  4, SECT_4K | SST_WRITE) },
+	{ "sst25wf040",  INFO(0xbf2504, 0, 64 * 1024,  8, SECT_4K | SST_WRITE) },
 
 	/* ST Microelectronics -- newer production may have feature updates */
 	{ "m25p05",  INFO(0x202010,  0,  32 * 1024,   2, 0) },
@@ -900,7 +901,7 @@ static int m25p_probe(struct spi_device *spi)
 	flash->mtd._read = m25p80_read;
 
 	/* sst flash chips use AAI word program */
-	if (JEDEC_MFR(info->jedec_id) == CFI_MFR_SST)
+	if (info->flags & SST_WRITE)
 		flash->mtd._write = sst_write;
 	else
 		flash->mtd._write = m25p80_write;
-- 
1.8.2.rc0.238.g01e6e4a
