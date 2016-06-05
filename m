Received: from hauke-m.de ([5.39.93.123])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1b9fTQ-00016C-2g
 for linux-mtd@lists.infradead.org; Sun, 05 Jun 2016 21:20:45 +0000
From: Hauke Mehrtens <hauke@hauke-m.de>
To: computersforpeace@gmail.com
Cc: linux-mtd@lists.infradead.org, David.Woodhouse@intel.com, john@phrozen.org,
 Hauke Mehrtens <hauke@hauke-m.de>
Subject: [PATCH 1/6] MTD: xway: add some more documentation
Date: Sun,  5 Jun 2016 23:20:04 +0200
Message-Id: <1465161609-19303-2-git-send-email-hauke@hauke-m.de>
In-Reply-To: <1465161609-19303-1-git-send-email-hauke@hauke-m.de>
References: <1465161609-19303-1-git-send-email-hauke@hauke-m.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This adds some register documentation which should make it easier to
understand how this controller works.

Signed-off-by: Hauke Mehrtens <hauke@hauke-m.de>
---
 drivers/mtd/nand/xway_nand.c | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/xway_nand.c b/drivers/mtd/nand/xway_nand.c
index 0cf0ac0..ccac19c 100644
--- a/drivers/mtd/nand/xway_nand.c
+++ b/drivers/mtd/nand/xway_nand.c
@@ -19,10 +19,20 @@
 #define EBU_NAND_ECC0		0xB8
 #define EBU_NAND_ECC_AC		0xBC
 
-/* nand commands */
+/*
+ * nand commands
+ * The pins of the NAND chip are selected based on the address bits of the
+ * "register" read and write. There are no special registers, but an
+ * address range and the lower address bits are used to activate the
+ * correct line. For example when the bit (1 << 2) is set in the address
+ * the ALE pin will be activated.
+ */
 #define NAND_CMD_ALE		(1 << 2)
 #define NAND_CMD_CLE		(1 << 3)
 #define NAND_CMD_CS		(1 << 4)
+#define NAND_CMD_SE		(1 << 5)
+#define NAND_CMD_WP		(1 << 6)
+#define NAND_CMD_PRE		(1 << 7)
 #define NAND_WRITE_CMD_RESET	0xff
 #define NAND_WRITE_CMD		(NAND_CMD_CS | NAND_CMD_CLE)
 #define NAND_WRITE_ADDR		(NAND_CMD_CS | NAND_CMD_ALE)
-- 
2.8.1
