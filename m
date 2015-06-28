Received: from mail-la0-x22f.google.com ([2a00:1450:4010:c03::22f])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Z98JE-0006o4-Sx
 for linux-mtd@lists.infradead.org; Sun, 28 Jun 2015 08:51:29 +0000
Received: by lagh6 with SMTP id h6so23733305lag.2
 for <linux-mtd@lists.infradead.org>; Sun, 28 Jun 2015 01:51:03 -0700 (PDT)
From: =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>
To: Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org
Subject: [PATCH] mtd: bcm47xxpart: store MAGICs in little-endian order
Date: Sun, 28 Jun 2015 10:50:51 +0200
Message-Id: <1435481451-12223-1-git-send-email-zajec5@gmail.com>
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

This is more natural for programming and used by various filesystems /
containers in the kernel.
Data on flash is store in big-endian, so simply use be32_to_cpu.

Signed-off-by: Rafał Miłecki <zajec5@gmail.com>
---
 drivers/mtd/bcm47xxpart.c | 49 ++++++++++++++++++++++++-----------------------
 1 file changed, 25 insertions(+), 24 deletions(-)

diff --git a/drivers/mtd/bcm47xxpart.c b/drivers/mtd/bcm47xxpart.c
index c0720c1..6a1d978 100644
--- a/drivers/mtd/bcm47xxpart.c
+++ b/drivers/mtd/bcm47xxpart.c
@@ -31,18 +31,18 @@
 #define BCM47XXPART_BYTES_TO_READ	0x4e8
 
 /* Magics */
-#define BOARD_DATA_MAGIC		0x5246504D	/* MPFR */
-#define BOARD_DATA_MAGIC2		0xBD0D0BBD
-#define CFE_MAGIC			0x43464531	/* 1EFC */
-#define FACTORY_MAGIC			0x59544346	/* FCTY */
-#define NVRAM_HEADER			0x48534C46	/* FLSH */
-#define POT_MAGIC1			0x54544f50	/* POTT */
-#define POT_MAGIC2			0x504f		/* OP */
-#define ML_MAGIC1			0x39685a42
-#define ML_MAGIC2			0x26594131
-#define TRX_MAGIC			0x30524448
+#define BOARD_DATA_MAGIC		0x4D504652	/* MPFR */
+#define BOARD_DATA_MAGIC2		0xBD0B0DBD
+#define CFE_MAGIC			0x31454643	/* 1EFC */
+#define FACTORY_MAGIC			0x46435459	/* FCTY */
+#define NVRAM_HEADER			0x464C5348	/* FLSH */
+#define POT_MAGIC1			0x504f5454	/* POTT */
+#define POT_MAGIC2			0x4f500000	/* OP */
+#define ML_MAGIC1			0x425a6839
+#define ML_MAGIC2			0x31415926
+#define TRX_MAGIC			0x48445230	/* HDR0 */
 #define SHSQ_MAGIC			0x71736873	/* shsq (weird ZTE H218N endianness) */
-#define UBI_EC_MAGIC			0x23494255	/* UBI# */
+#define UBI_EC_MAGIC			0x55424923	/* UBI# */
 
 struct trx_header {
 	uint32_t magic;
@@ -74,7 +74,7 @@ static const char *bcm47xxpart_trx_data_part_name(struct mtd_info *master,
 		goto out_default;
 	}
 
-	if (buf == UBI_EC_MAGIC)
+	if (be32_to_cpu(buf) == UBI_EC_MAGIC)
 		return "ubi";
 
 out_default:
@@ -136,8 +136,9 @@ static int bcm47xxpart_parse(struct mtd_info *master,
 		}
 
 		/* Magic or small NVRAM at 0x400 */
-		if ((buf[0x4e0 / 4] == CFE_MAGIC && buf[0x4e4 / 4] == CFE_MAGIC) ||
-		    (buf[0x400 / 4] == NVRAM_HEADER)) {
+		if ((be32_to_cpu(buf[0x4e0 / 4]) == CFE_MAGIC &&
+		     be32_to_cpu(buf[0x4e4 / 4]) == CFE_MAGIC) ||
+		    (be32_to_cpu(buf[0x400 / 4]) == NVRAM_HEADER)) {
 			bcm47xxpart_add_part(&parts[curr_part++], "boot",
 					     offset, MTD_WRITEABLE);
 			continue;
@@ -147,37 +148,37 @@ static int bcm47xxpart_parse(struct mtd_info *master,
 		 * board_data starts with board_id which differs across boards,
 		 * but we can use 'MPFR' (hopefully) magic at 0x100
 		 */
-		if (buf[0x100 / 4] == BOARD_DATA_MAGIC) {
+		if (be32_to_cpu(buf[0x100 / 4]) == BOARD_DATA_MAGIC) {
 			bcm47xxpart_add_part(&parts[curr_part++], "board_data",
 					     offset, MTD_WRITEABLE);
 			continue;
 		}
 
 		/* Found on Huawei E970 */
-		if (buf[0x000 / 4] == FACTORY_MAGIC) {
+		if (be32_to_cpu(buf[0x000 / 4]) == FACTORY_MAGIC) {
 			bcm47xxpart_add_part(&parts[curr_part++], "factory",
 					     offset, MTD_WRITEABLE);
 			continue;
 		}
 
 		/* POT(TOP) */
-		if (buf[0x000 / 4] == POT_MAGIC1 &&
-		    (buf[0x004 / 4] & 0xFFFF) == POT_MAGIC2) {
+		if (be32_to_cpu(buf[0x000 / 4]) == POT_MAGIC1 &&
+		    (be32_to_cpu(buf[0x004 / 4]) & 0xFFFF0000) == POT_MAGIC2) {
 			bcm47xxpart_add_part(&parts[curr_part++], "POT", offset,
 					     MTD_WRITEABLE);
 			continue;
 		}
 
 		/* ML */
-		if (buf[0x010 / 4] == ML_MAGIC1 &&
-		    buf[0x014 / 4] == ML_MAGIC2) {
+		if (be32_to_cpu(buf[0x010 / 4]) == ML_MAGIC1 &&
+		    be32_to_cpu(buf[0x014 / 4]) == ML_MAGIC2) {
 			bcm47xxpart_add_part(&parts[curr_part++], "ML", offset,
 					     MTD_WRITEABLE);
 			continue;
 		}
 
 		/* TRX */
-		if (buf[0x000 / 4] == TRX_MAGIC) {
+		if (be32_to_cpu(buf[0x000 / 4]) == TRX_MAGIC) {
 			if (BCM47XXPART_MAX_PARTS - curr_part < 4) {
 				pr_warn("Not enough partitions left to register trx, scanning stopped!\n");
 				break;
@@ -247,7 +248,7 @@ static int bcm47xxpart_parse(struct mtd_info *master,
 		 * block will be checked later, so skip it.
 		 */
 		if (offset != master->size - blocksize &&
-		    buf[0x000 / 4] == NVRAM_HEADER) {
+		    be32_to_cpu(buf[0x000 / 4]) == NVRAM_HEADER) {
 			bcm47xxpart_add_part(&parts[curr_part++], "nvram",
 					     offset, 0);
 			continue;
@@ -262,7 +263,7 @@ static int bcm47xxpart_parse(struct mtd_info *master,
 		}
 
 		/* Some devices (ex. WNDR3700v3) don't have a standard 'MPFR' */
-		if (buf[0x000 / 4] == BOARD_DATA_MAGIC2) {
+		if (be32_to_cpu(buf[0x000 / 4]) == BOARD_DATA_MAGIC2) {
 			bcm47xxpart_add_part(&parts[curr_part++], "board_data",
 					     offset, MTD_WRITEABLE);
 			continue;
@@ -285,7 +286,7 @@ static int bcm47xxpart_parse(struct mtd_info *master,
 		}
 
 		/* Standard NVRAM */
-		if (buf[0] == NVRAM_HEADER) {
+		if (be32_to_cpu(buf[0]) == NVRAM_HEADER) {
 			bcm47xxpart_add_part(&parts[curr_part++], "nvram",
 					     master->size - blocksize, 0);
 			break;
-- 
1.8.4.5
