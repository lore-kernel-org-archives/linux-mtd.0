Received: from mail-we0-f177.google.com ([74.125.82.177])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1TBtRC-0003vf-2b
 for linux-mtd@lists.infradead.org; Wed, 12 Sep 2012 20:21:32 +0000
Received: by weyr3 with SMTP id r3so1281117wey.36
 for <linux-mtd@lists.infradead.org>; Wed, 12 Sep 2012 13:21:29 -0700 (PDT)
From: =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>
To: linux-mtd@lists.infradead.org,
	Artem Bityutskiy <dedekind1@gmail.com>
Subject: [PATCH 3/4] mtd: bcm47xxnflash: support for NAND_CMD_READID command
Date: Wed, 12 Sep 2012 22:21:14 +0200
Message-Id: <1347481275-995-3-git-send-email-zajec5@gmail.com>
In-Reply-To: <1347481275-995-1-git-send-email-zajec5@gmail.com>
References: <1347481275-995-1-git-send-email-zajec5@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


Signed-off-by: Rafał Miłecki <zajec5@gmail.com>
---
 drivers/mtd/nand/bcm47xxnflash/bcm47xxnflash.h |    5 ++
 drivers/mtd/nand/bcm47xxnflash/ops_bcm4706.c   |   90 ++++++++++++++++++++++++
 2 files changed, 95 insertions(+), 0 deletions(-)

diff --git a/drivers/mtd/nand/bcm47xxnflash/bcm47xxnflash.h b/drivers/mtd/nand/bcm47xxnflash/bcm47xxnflash.h
index 149b74f..53fb2ea 100644
--- a/drivers/mtd/nand/bcm47xxnflash/bcm47xxnflash.h
+++ b/drivers/mtd/nand/bcm47xxnflash/bcm47xxnflash.h
@@ -9,6 +9,11 @@ struct bcm47xxnflash {
 
 	struct nand_chip nand_chip;
 	struct mtd_info mtd;
+
+	unsigned curr_command;
+	int curr_column;
+
+	u8 id_data[8];
 };
 
 int bcm47xxnflash_ops_bcm4706_init(struct bcm47xxnflash *bcm47xxnflash);
diff --git a/drivers/mtd/nand/bcm47xxnflash/ops_bcm4706.c b/drivers/mtd/nand/bcm47xxnflash/ops_bcm4706.c
index 38e3da6..e86670b 100644
--- a/drivers/mtd/nand/bcm47xxnflash/ops_bcm4706.c
+++ b/drivers/mtd/nand/bcm47xxnflash/ops_bcm4706.c
@@ -16,6 +16,10 @@
 
 #include "bcm47xxnflash.h"
 
+/* Broadcom uses 1'000'000 but it seems to be too many. Tests on WNDR4500 has
+ * shown 164 retries as maxiumum. */
+#define NFLASH_READY_RETRIES		1000
+
 /**************************************************
  * Various helpers
  **************************************************/
@@ -25,6 +29,24 @@ static inline u8 bcm47xxnflash_ops_bcm4706_ns_to_cycle(u16 ns, u16 clock)
 	return ((ns * 1000 * clock) / 1000000) + 1;
 }
 
+static int bcm47xxnflash_ops_bcm4706_ctl_cmd(struct bcma_drv_cc *cc, u32 code)
+{
+	int i = 0;
+
+	bcma_cc_write32(cc, BCMA_CC_NFLASH_CTL, 0x80000000 | code);
+	for (i = 0; i < NFLASH_READY_RETRIES; i++) {
+		if (!(bcma_cc_read32(cc, BCMA_CC_NFLASH_CTL) & 0x80000000)) {
+			i = 0;
+			break;
+		}
+	}
+	if (i) {
+		pr_err("NFLASH control command not ready!\n");
+		return -EBUSY;
+	}
+	return 0;
+}
+
 /**************************************************
  * NAND chip ops
  **************************************************/
@@ -35,6 +57,72 @@ static void bcm47xxnflash_ops_bcm4706_select_chip(struct mtd_info *mtd,
 	return;
 }
 
+static void bcm47xxnflash_ops_bcm4706_cmdfunc(struct mtd_info *mtd,
+					      unsigned command, int column,
+					      int page_addr)
+{
+	struct nand_chip *nand_chip = (struct nand_chip *)mtd->priv;
+	struct bcm47xxnflash *b47n = (struct bcm47xxnflash *)nand_chip->priv;
+	u32 ctlcode;
+	int i;
+
+	switch (command) {
+	case NAND_CMD_RESET:
+		pr_warn("Chip reset not implemented yet\n");
+		break;
+	case NAND_CMD_READID:
+		ctlcode = 0x40000000 | 0x01000000 | 0x00080000 | 0x00010000;
+		ctlcode |= NAND_CMD_READID;
+		if (bcm47xxnflash_ops_bcm4706_ctl_cmd(b47n->cc, ctlcode)) {
+			pr_err("READID error\n");
+			break;
+		}
+
+		/*
+		 * Reading is specific, last one has to go without 0x40000000
+		 * bit. We don't know how many reads NAND subsystem is going
+		 * to perform, so cache everything.
+		 */
+		for (i = 0; i < ARRAY_SIZE(b47n->id_data); i++) {
+			ctlcode = 0x40000000 | 0x00100000;
+			if (i == ARRAY_SIZE(b47n->id_data) - 1)
+				ctlcode &= ~0x40000000;
+			if (bcm47xxnflash_ops_bcm4706_ctl_cmd(b47n->cc,
+							      ctlcode)) {
+				pr_err("READID error\n");
+				break;
+			}
+			b47n->id_data[i] = bcma_cc_read32(b47n->cc, BCMA_CC_NFLASH_DATA) & 0xFF;
+		}
+
+		b47n->curr_column = 0;
+		break;
+	default:
+		pr_err("Command 0x%X unsupported\n", command);
+		break;
+	}
+	b47n->curr_command = command;
+}
+
+static u8 bcm47xxnflash_ops_bcm4706_read_byte(struct mtd_info *mtd)
+{
+	struct nand_chip *nand_chip = (struct nand_chip *)mtd->priv;
+	struct bcm47xxnflash *b47n = (struct bcm47xxnflash *)nand_chip->priv;
+
+	switch (b47n->curr_command) {
+	case NAND_CMD_READID:
+		if (b47n->curr_column >= ARRAY_SIZE(b47n->id_data)) {
+			pr_err("Requested invalid id_data: %d\n",
+			       b47n->curr_column);
+			return 0;
+		}
+		return b47n->id_data[b47n->curr_column++];
+	}
+
+	pr_err("Invalid command for byte read: 0x%X\n", b47n->curr_command);
+	return 0;
+}
+
 /**************************************************
  * Init
  **************************************************/
@@ -52,6 +140,8 @@ int bcm47xxnflash_ops_bcm4706_init(struct bcm47xxnflash *b47n)
 	u32 val;
 
 	b47n->nand_chip.select_chip = bcm47xxnflash_ops_bcm4706_select_chip;
+	b47n->nand_chip.cmdfunc = bcm47xxnflash_ops_bcm4706_cmdfunc;
+	b47n->nand_chip.read_byte = bcm47xxnflash_ops_bcm4706_read_byte;
 	b47n->nand_chip.ecc.mode = NAND_ECC_SOFT; /* TODO: implement ECC */
 
 	/* Enable NAND flash access */
-- 
1.7.7
