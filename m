Received: from mail-ee0-f50.google.com ([74.125.83.50])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UDVmu-0003X1-6W
 for linux-mtd@lists.infradead.org; Thu, 07 Mar 2013 08:02:55 +0000
Received: by mail-ee0-f50.google.com with SMTP id e51so97475eek.9
 for <linux-mtd@lists.infradead.org>; Thu, 07 Mar 2013 00:02:50 -0800 (PST)
From: =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>
To: linux-mtd@lists.infradead.org, Artem Bityutskiy <dedekind1@gmail.com>,
 David Woodhouse <David.Woodhouse@intel.com>
Subject: [FIX 3.9][PATCH 1/2] Revert "mtd: bcm47xxpart: improve probing of
 nvram partition"
Date: Thu,  7 Mar 2013 09:02:38 +0100
Message-Id: <1362643359-27955-1-git-send-email-zajec5@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: Hauke Mehrtens <hauke@hauke-m.de>,
 =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This reverts commit be3781b71ac03723b552dc156931620634ef1b22.

Some CFE bootloaders have NVRAM at offset 0x1000. With that patch we
were detecting such a bootloaders as a standard NVRAM partition.
Changing anything in this pseudo-NVRAM resulted in corrupted bootloader
and bricked device!

Signed-off-by: Rafał Miłecki <zajec5@gmail.com>
---
 drivers/mtd/bcm47xxpart.c |   22 +++++++++-------------
 1 file changed, 9 insertions(+), 13 deletions(-)

diff --git a/drivers/mtd/bcm47xxpart.c b/drivers/mtd/bcm47xxpart.c
index 63feb75..4552afb 100644
--- a/drivers/mtd/bcm47xxpart.c
+++ b/drivers/mtd/bcm47xxpart.c
@@ -19,6 +19,12 @@
 /* 10 parts were found on sflash on Netgear WNDR4500 */
 #define BCM47XXPART_MAX_PARTS		12
 
+/*
+ * Amount of bytes we read when analyzing each block of flash memory.
+ * Set it big enough to allow detecting partition and reading important data.
+ */
+#define BCM47XXPART_BYTES_TO_READ	0x404
+
 /* Magics */
 #define BOARD_DATA_MAGIC		0x5246504D	/* MPFR */
 #define POT_MAGIC1			0x54544f50	/* POTT */
@@ -57,17 +63,14 @@ static int bcm47xxpart_parse(struct mtd_info *master,
 	struct trx_header *trx;
 	int trx_part = -1;
 	int last_trx_part = -1;
-	int max_bytes_to_read = 0x8004;
 
 	if (blocksize <= 0x10000)
 		blocksize = 0x10000;
-	if (blocksize == 0x20000)
-		max_bytes_to_read = 0x18004;
 
 	/* Alloc */
 	parts = kzalloc(sizeof(struct mtd_partition) * BCM47XXPART_MAX_PARTS,
 			GFP_KERNEL);
-	buf = kzalloc(max_bytes_to_read, GFP_KERNEL);
+	buf = kzalloc(BCM47XXPART_BYTES_TO_READ, GFP_KERNEL);
 
 	/* Parse block by block looking for magics */
 	for (offset = 0; offset <= master->size - blocksize;
@@ -82,7 +85,7 @@ static int bcm47xxpart_parse(struct mtd_info *master,
 		}
 
 		/* Read beginning of the block */
-		if (mtd_read(master, offset, max_bytes_to_read,
+		if (mtd_read(master, offset, BCM47XXPART_BYTES_TO_READ,
 			     &bytes_read, (uint8_t *)buf) < 0) {
 			pr_err("mtd_read error while parsing (offset: 0x%X)!\n",
 			       offset);
@@ -97,16 +100,9 @@ static int bcm47xxpart_parse(struct mtd_info *master,
 		}
 
 		/* Standard NVRAM */
-		if (buf[0x000 / 4] == NVRAM_HEADER ||
-		    buf[0x1000 / 4] == NVRAM_HEADER ||
-		    buf[0x8000 / 4] == NVRAM_HEADER ||
-		    (blocksize == 0x20000 && (
-		      buf[0x10000 / 4] == NVRAM_HEADER ||
-		      buf[0x11000 / 4] == NVRAM_HEADER ||
-		      buf[0x18000 / 4] == NVRAM_HEADER))) {
+		if (buf[0x000 / 4] == NVRAM_HEADER) {
 			bcm47xxpart_add_part(&parts[curr_part++], "nvram",
 					     offset, 0);
-			offset = rounddown(offset, blocksize);
 			continue;
 		}
 
-- 
1.7.10.4
