Received: from hauke-m.de ([5.39.93.123])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bF6oC-0000S2-AZ
 for linux-mtd@lists.infradead.org; Mon, 20 Jun 2016 21:32:41 +0000
From: Hauke Mehrtens <hauke@hauke-m.de>
To: boris.brezillon@free-electrons.com,
	richard@nod.at
Cc: dwmw2@infradead.org, computersforpeace@gmail.com,
 linux-mtd@lists.infradead.org, john@phrozen.org,
 Hauke Mehrtens <hauke@hauke-m.de>
Subject: [PATCH v5 1/8] mtd: nand: xway: add some more documentation
Date: Mon, 20 Jun 2016 23:32:07 +0200
Message-Id: <1466458334-10830-2-git-send-email-hauke@hauke-m.de>
In-Reply-To: <1466458334-10830-1-git-send-email-hauke@hauke-m.de>
References: <1466458334-10830-1-git-send-email-hauke@hauke-m.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This adds some register documentation which should make it easier to
understand how this controller works. In addition it makes now use of
BIT() macro and adds some more defines.

Signed-off-by: Hauke Mehrtens <hauke@hauke-m.de>
---
 drivers/mtd/nand/xway_nand.c | 21 +++++++++++++++------
 1 file changed, 15 insertions(+), 6 deletions(-)

diff --git a/drivers/mtd/nand/xway_nand.c b/drivers/mtd/nand/xway_nand.c
index 0cf0ac0..2d74637 100644
--- a/drivers/mtd/nand/xway_nand.c
+++ b/drivers/mtd/nand/xway_nand.c
@@ -16,20 +16,29 @@
 #define EBU_ADDSEL1		0x24
 #define EBU_NAND_CON		0xB0
 #define EBU_NAND_WAIT		0xB4
+#define  NAND_WAIT_RD		BIT(0) /* NAND flash status output */
+#define  NAND_WAIT_WR_C		BIT(3) /* NAND Write/Read complete */
 #define EBU_NAND_ECC0		0xB8
 #define EBU_NAND_ECC_AC		0xBC
 
-/* nand commands */
-#define NAND_CMD_ALE		(1 << 2)
-#define NAND_CMD_CLE		(1 << 3)
-#define NAND_CMD_CS		(1 << 4)
+/*
+ * nand commands
+ * The pins of the NAND chip are selected based on the address bits of the
+ * "register" read and write. There are no special registers, but an
+ * address range and the lower address bits are used to activate the
+ * correct line. For example when the bit (1 << 2) is set in the address
+ * the ALE pin will be activated.
+ */
+#define NAND_CMD_ALE		BIT(2) /* address latch enable */
+#define NAND_CMD_CLE		BIT(3) /* command latch enable */
+#define NAND_CMD_CS		BIT(4) /* chip select */
+#define NAND_CMD_SE		BIT(5) /* spare area access latch */
+#define NAND_CMD_WP		BIT(6) /* write protect */
 #define NAND_WRITE_CMD_RESET	0xff
 #define NAND_WRITE_CMD		(NAND_CMD_CS | NAND_CMD_CLE)
 #define NAND_WRITE_ADDR		(NAND_CMD_CS | NAND_CMD_ALE)
 #define NAND_WRITE_DATA		(NAND_CMD_CS)
 #define NAND_READ_DATA		(NAND_CMD_CS)
-#define NAND_WAIT_WR_C		(1 << 3)
-#define NAND_WAIT_RD		(0x1)
 
 /* we need to tel the ebu which addr we mapped the nand to */
 #define ADDSEL1_MASK(x)		(x << 4)
-- 
2.8.1
