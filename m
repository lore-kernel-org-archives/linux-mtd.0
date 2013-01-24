Received: from hauke-2-pt.tunnel.tserv6.fra1.ipv6.he.net
 ([2001:470:1f0a:465::2] helo=hauke-m.de)
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1TyR9V-0006E0-41
 for linux-mtd@lists.infradead.org; Thu, 24 Jan 2013 18:03:54 +0000
From: Hauke Mehrtens <hauke@hauke-m.de>
To: dwmw2@infradead.org
Subject: [PATCH v2 6/6] mtd: bcm47xxpart: improve probing of nvram partition
Date: Thu, 24 Jan 2013 19:03:37 +0100
Message-Id: <1359050617-23974-1-git-send-email-hauke@hauke-m.de>
In-Reply-To: <1359045599-1305-7-git-send-email-hauke@hauke-m.de>
References: <1359045599-1305-7-git-send-email-hauke@hauke-m.de>
Cc: Hauke Mehrtens <hauke@hauke-m.de>, zajec5@gmail.com,
 linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The nvram in the nvram partition does not start at the beginning of the
partition on every device. Sometimes they are stating in the middle of
a partition or the first 0x1000 bytes are free.

Signed-off-by: Hauke Mehrtens <hauke@hauke-m.de>
---

v2:
 * 0x8004 assigned to max_bytes_to_read should be a hex value.

 drivers/mtd/bcm47xxpart.c |   22 +++++++++++++---------
 1 file changed, 13 insertions(+), 9 deletions(-)

diff --git a/drivers/mtd/bcm47xxpart.c b/drivers/mtd/bcm47xxpart.c
index 986ab6e..9bcec8f 100644
--- a/drivers/mtd/bcm47xxpart.c
+++ b/drivers/mtd/bcm47xxpart.c
@@ -19,12 +19,6 @@
 /* 10 parts were found on sflash on Netgear WNDR4500 */
 #define BCM47XXPART_MAX_PARTS		12
 
-/*
- * Amount of bytes we read when analyzing each block of flash memory.
- * Set it big enough to allow detecting partition and reading important data.
- */
-#define BCM47XXPART_BYTES_TO_READ	0x404
-
 /* Magics */
 #define BOARD_DATA_MAGIC		0x5246504D	/* MPFR */
 #define POT_MAGIC1			0x54544f50	/* POTT */
@@ -63,14 +57,17 @@ static int bcm47xxpart_parse(struct mtd_info *master,
 	struct trx_header *trx;
 	int trx_part = -1;
 	int last_trx_part = -1;
+	int max_bytes_to_read = 0x8004;
 
 	if (blocksize <= 0x10000)
 		blocksize = 0x10000;
+	if (blocksize == 0x20000)
+		max_bytes_to_read = 0x18004;
 
 	/* Alloc */
 	parts = kzalloc(sizeof(struct mtd_partition) * BCM47XXPART_MAX_PARTS,
 			GFP_KERNEL);
-	buf = kzalloc(BCM47XXPART_BYTES_TO_READ, GFP_KERNEL);
+	buf = kzalloc(max_bytes_to_read, GFP_KERNEL);
 
 	/* Parse block by block looking for magics */
 	for (offset = 0; offset <= master->size - blocksize;
@@ -85,7 +82,7 @@ static int bcm47xxpart_parse(struct mtd_info *master,
 		}
 
 		/* Read beginning of the block */
-		if (mtd_read(master, offset, BCM47XXPART_BYTES_TO_READ,
+		if (mtd_read(master, offset, max_bytes_to_read,
 			     &bytes_read, (uint8_t *)buf) < 0) {
 			pr_err("mtd_read error while parsing (offset: 0x%X)!\n",
 			       offset);
@@ -100,9 +97,16 @@ static int bcm47xxpart_parse(struct mtd_info *master,
 		}
 
 		/* Standard NVRAM */
-		if (buf[0x000 / 4] == NVRAM_HEADER) {
+		if (buf[0x000 / 4] == NVRAM_HEADER ||
+		    buf[0x1000 / 4] == NVRAM_HEADER ||
+		    buf[0x8000 / 4] == NVRAM_HEADER ||
+		    (blocksize == 0x20000 && (
+		      buf[0x10000 / 4] == NVRAM_HEADER ||
+		      buf[0x11000 / 4] == NVRAM_HEADER ||
+		      buf[0x18000 / 4] == NVRAM_HEADER))) {
 			bcm47xxpart_add_part(&parts[curr_part++], "nvram",
 					     offset, 0);
+			offset = rounddown(offset, blocksize);
 			continue;
 		}
 
-- 
1.7.10.4
