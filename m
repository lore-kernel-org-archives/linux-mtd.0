Received: from mail-lf0-x242.google.com ([2a00:1450:4010:c07::242])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cR4iV-0001nE-7y
 for linux-mtd@lists.infradead.org; Tue, 10 Jan 2017 22:16:34 +0000
Received: by mail-lf0-x242.google.com with SMTP id v186so9783471lfa.2
 for <linux-mtd@lists.infradead.org>; Tue, 10 Jan 2017 14:16:12 -0800 (PST)
From: =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>
To: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>
Cc: linux-mtd@lists.infradead.org, Hauke Mehrtens <hauke@hauke-m.de>,
 =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>
Subject: [PATCH V2 2/2] mtd: bcm47xxpart: support layouts with multiple TRX
 partitions
Date: Tue, 10 Jan 2017 23:15:25 +0100
Message-Id: <20170110221525.9216-2-zajec5@gmail.com>
In-Reply-To: <20170110221525.9216-1-zajec5@gmail.com>
References: <20170110115045.9134-1-zajec5@gmail.com>
 <20170110221525.9216-1-zajec5@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Rafał Miłecki <rafal@milecki.pl>

Some devices may have an extra TRX partition used as failsafe one. If
we detect such partition we should set a proper name for it and don't
parse it.

Signed-off-by: Rafał Miłecki <rafal@milecki.pl>
---
 drivers/mtd/bcm47xxpart.c | 56 ++++++++++++++++++++++++++++++++++++++---------
 1 file changed, 46 insertions(+), 10 deletions(-)

diff --git a/drivers/mtd/bcm47xxpart.c b/drivers/mtd/bcm47xxpart.c
index 1093025..d10fa6c 100644
--- a/drivers/mtd/bcm47xxpart.c
+++ b/drivers/mtd/bcm47xxpart.c
@@ -9,6 +9,7 @@
  *
  */
 
+#include <linux/bcm47xx_nvram.h>
 #include <linux/module.h>
 #include <linux/kernel.h>
 #include <linux/slab.h>
@@ -144,6 +145,30 @@ static int bcm47xxpart_parse_trx(struct mtd_info *master,
 	return curr_part;
 }
 
+/**
+ * bcm47xxpart_bootpartition - gets index of TRX partition used by bootloader
+ *
+ * Some devices may have more than one TRX partition. In such case one of them
+ * is the main one and another a failsafe one. Bootloader may fallback to the
+ * failsafe firmware if it detects corruption of the main image.
+ *
+ * This function provides info about currently used TRX partition. It's the one
+ * containing kernel started by the bootloader.
+ */
+static int bcm47xxpart_bootpartition(void)
+{
+	char buf[4];
+	int bootpartition;
+
+	/* Check CFE environment variable */
+	if (bcm47xx_nvram_getenv("bootpartition", buf, sizeof(buf)) > 0) {
+		if (!kstrtoint(buf, 0, &bootpartition))
+			return bootpartition;
+	}
+
+	return 0;
+}
+
 static int bcm47xxpart_parse(struct mtd_info *master,
 			     const struct mtd_partition **pparts,
 			     struct mtd_part_parser_data *data)
@@ -154,7 +179,8 @@ static int bcm47xxpart_parse(struct mtd_info *master,
 	size_t bytes_read;
 	uint32_t offset;
 	uint32_t blocksize = master->erasesize;
-	int trx_part = -1;
+	int trx_parts[2]; /* Array with indexes of TRX partitions */
+	int trx_num = 0; /* Number of found TRX partitions */
 	int possible_nvram_sizes[] = { 0x8000, 0xF000, 0x10000, };
 	int err;
 
@@ -243,7 +269,11 @@ static int bcm47xxpart_parse(struct mtd_info *master,
 		if (buf[0x000 / 4] == TRX_MAGIC) {
 			struct trx_header *trx;
 
-			trx_part = curr_part;
+			if (trx_num >= ARRAY_SIZE(trx_parts))
+				pr_warn("No enough space to store another TRX found at 0x%X\n",
+					offset);
+			else
+				trx_parts[trx_num++] = curr_part;
 			bcm47xxpart_add_part(&parts[curr_part++], "firmware",
 					     offset, 0);
 
@@ -329,14 +359,20 @@ static int bcm47xxpart_parse(struct mtd_info *master,
 	}
 
 	/* If there was TRX parse it now */
-	if (trx_part >= 0) {
-		int num_parts;
-
-		num_parts = bcm47xxpart_parse_trx(master, &parts[trx_part],
-						  parts + curr_part,
-						  BCM47XXPART_MAX_PARTS - curr_part);
-		if (num_parts > 0)
-			curr_part += num_parts;
+	for (i = 0; i < trx_num; i++) {
+		struct mtd_partition *trx = &parts[trx_parts[i]];
+
+		if (i == bcm47xxpart_bootpartition()) {
+			int num_parts;
+
+			num_parts = bcm47xxpart_parse_trx(master, trx,
+							  parts + curr_part,
+							  BCM47XXPART_MAX_PARTS - curr_part);
+			if (num_parts > 0)
+				curr_part += num_parts;
+		} else {
+			trx->name = "failsafe";
+		}
 	}
 
 	*pparts = parts;
-- 
2.10.1
