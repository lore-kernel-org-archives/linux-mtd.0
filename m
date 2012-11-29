Received: from mail-we0-f177.google.com ([74.125.82.177])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1Te9ln-0001j7-SE
 for linux-mtd@lists.infradead.org; Thu, 29 Nov 2012 19:27:36 +0000
Received: by mail-we0-f177.google.com with SMTP id x48so5432574wey.36
 for <linux-mtd@lists.infradead.org>; Thu, 29 Nov 2012 11:27:30 -0800 (PST)
From: =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: [WIP][PATCH][DON'T APPLY] bcm47xxnflash: writing support
Date: Thu, 29 Nov 2012 20:27:22 +0100
Message-Id: <1354217242-19808-1-git-send-email-zajec5@gmail.com>
Cc: =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

---
Just to show my work in case someone is interested in it. I still have
to check it with aiaiai & friends :)
---
 drivers/mtd/nand/bcm47xxnflash/ops_bcm4706.c |   76 ++++++++++++++++++++++++++
 1 files changed, 76 insertions(+), 0 deletions(-)

diff --git a/drivers/mtd/nand/bcm47xxnflash/ops_bcm4706.c b/drivers/mtd/nand/bcm47xxnflash/ops_bcm4706.c
index e776a4b..20a406f 100644
--- a/drivers/mtd/nand/bcm47xxnflash/ops_bcm4706.c
+++ b/drivers/mtd/nand/bcm47xxnflash/ops_bcm4706.c
@@ -30,6 +30,7 @@
 #define NCTL_CMD0			0x00010000
 #define NCTL_CMD1W			0x00080000
 #define NCTL_READ			0x00100000
+#define NCTL_WRITE			0x00200000
 #define NCTL_SPECADDR			0x01000000
 #define NCTL_READY			0x04000000
 #define NCTL_ERR			0x08000000
@@ -139,6 +140,36 @@ static void bcm47xxnflash_ops_bcm4706_read(struct mtd_info *mtd, uint8_t *buf,
 	}
 }
 
+static void bcm47xxnflash_ops_bcm4706_write(struct mtd_info *mtd,
+					    const uint8_t *buf, int len)
+{
+	struct nand_chip *nand_chip = (struct nand_chip *)mtd->priv;
+	struct bcm47xxnflash *b47n = (struct bcm47xxnflash *)nand_chip->priv;
+	struct bcma_drv_cc *cc = b47n->cc;
+
+	u32 ctlcode;
+	const u32 *data = (u32 *)buf;
+	int i;
+
+	BUG_ON(b47n->curr_page_addr & ~nand_chip->pagemask);
+	/* Don't validate column using nand_chip->page_shift, it may be bigger
+	 * when accessing OOB */
+
+	for (i = 0; i < len; i += 4, data++) {
+		bcma_cc_write32(cc, BCMA_CC_NFLASH_DATA, *data);
+
+		ctlcode = NCTL_CSA | 0x30000000 | NCTL_WRITE;
+		if (i == len - 4) /* Last read goes without that */
+			ctlcode &= ~NCTL_CSA;
+		if (bcm47xxnflash_ops_bcm4706_ctl_cmd(cc, ctlcode)) {
+			pr_err("%s ctl_cmd didn't work!\n", __func__);
+			return;
+		}
+	}
+
+	b47n->curr_column += len;
+}
+
 /**************************************************
  * NAND chip ops
  **************************************************/
@@ -215,6 +246,35 @@ static void bcm47xxnflash_ops_bcm4706_cmdfunc(struct mtd_info *mtd,
 		if (page_addr != -1)
 			b47n->curr_column += mtd->writesize;
 		break;
+	case NAND_CMD_ERASE1:
+		bcma_cc_write32(cc, BCMA_CC_NFLASH_ROW_ADDR,
+				b47n->curr_page_addr);
+		ctlcode = 0x00040000 | NCTL_CMD1W | NCTL_CMD0 | NAND_CMD_ERASE1 | (NAND_CMD_ERASE2 << 8);
+		if (bcm47xxnflash_ops_bcm4706_ctl_cmd(cc, ctlcode))
+			pr_err("ERASE1 failed\n");;
+		break;
+	case NAND_CMD_ERASE2:
+		break;
+	case NAND_CMD_SEQIN:
+		/* Set page and column */
+		bcma_cc_write32(cc, BCMA_CC_NFLASH_COL_ADDR,
+				b47n->curr_column);
+		bcma_cc_write32(cc, BCMA_CC_NFLASH_ROW_ADDR,
+				b47n->curr_page_addr);
+
+		/* Prepare to write */
+		ctlcode = 0x40000000 | 0x00040000 | 0x00020000 | 0x00010000;
+		ctlcode |= NAND_CMD_SEQIN;
+		if (bcm47xxnflash_ops_bcm4706_ctl_cmd(cc, ctlcode))
+			pr_err("SEQIN failed\n");;
+		break;
+	case NAND_CMD_PAGEPROG:
+		if (bcm47xxnflash_ops_bcm4706_ctl_cmd(cc, 0x00010000 |
+							  NAND_CMD_PAGEPROG))
+			pr_err("PAGEPROG failed\n");
+		if (bcm47xxnflash_ops_bcm4706_poll(cc))
+			pr_err("PAGEPROG not ready\n");
+		break;
 	default:
 		pr_err("Command 0x%X unsupported\n", command);
 		break;
@@ -266,6 +326,21 @@ static void bcm47xxnflash_ops_bcm4706_read_buf(struct mtd_info *mtd,
 	pr_err("Invalid command for buf read: 0x%X\n", b47n->curr_command);
 }
 
+static void bcm47xxnflash_ops_bcm4706_write_buf(struct mtd_info *mtd,
+						const uint8_t *buf, int len)
+{
+	struct nand_chip *nand_chip = (struct nand_chip *)mtd->priv;
+	struct bcm47xxnflash *b47n = (struct bcm47xxnflash *)nand_chip->priv;
+
+	switch (b47n->curr_command) {
+	case NAND_CMD_SEQIN:
+		bcm47xxnflash_ops_bcm4706_write(mtd, buf, len);
+		return;
+	}
+
+	pr_err("Invalid command for buf write: 0x%X\n", b47n->curr_command);
+}
+
 /**************************************************
  * Init
  **************************************************/
@@ -285,6 +360,7 @@ int bcm47xxnflash_ops_bcm4706_init(struct bcm47xxnflash *b47n)
 	b47n->nand_chip.cmdfunc = bcm47xxnflash_ops_bcm4706_cmdfunc;
 	b47n->nand_chip.read_byte = bcm47xxnflash_ops_bcm4706_read_byte;
 	b47n->nand_chip.read_buf = bcm47xxnflash_ops_bcm4706_read_buf;
+	b47n->nand_chip.write_buf = bcm47xxnflash_ops_bcm4706_write_buf;
 	b47n->nand_chip.bbt_options = NAND_BBT_USE_FLASH;
 	b47n->nand_chip.ecc.mode = NAND_ECC_NONE; /* TODO: implement ECC */
 
-- 
1.7.7
