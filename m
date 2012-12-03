Received: from mail-ee0-f49.google.com ([74.125.83.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1TfSEc-0000Nm-5Z
 for linux-mtd@lists.infradead.org; Mon, 03 Dec 2012 09:22:42 +0000
Received: by mail-ee0-f49.google.com with SMTP id c4so1456976eek.36
 for <linux-mtd@lists.infradead.org>; Mon, 03 Dec 2012 01:22:39 -0800 (PST)
From: =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>
To: linux-mtd@lists.infradead.org,
	Artem Bityutskiy <dedekind1@gmail.com>
Subject: [PATCH] bcm47xxnflash: writing support
Date: Mon,  3 Dec 2012 10:22:35 +0100
Message-Id: <1354526555-27143-1-git-send-email-zajec5@gmail.com>
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
 drivers/mtd/nand/Kconfig                     |    5 +-
 drivers/mtd/nand/bcm47xxnflash/ops_bcm4706.c |   77 ++++++++++++++++++++++++++
 2 files changed, 79 insertions(+), 3 deletions(-)

diff --git a/drivers/mtd/nand/Kconfig b/drivers/mtd/nand/Kconfig
index 3314e92..37ffe56 100644
--- a/drivers/mtd/nand/Kconfig
+++ b/drivers/mtd/nand/Kconfig
@@ -461,13 +461,12 @@ config MTD_NAND_GPMI_NAND
 	 the GPMI.
 
 config MTD_NAND_BCM47XXNFLASH
-	tristate "R/O support for NAND flash on BCMA bus"
+	tristate "Support for NAND flash on BCM4706 BCMA bus"
 	depends on BCMA_NFLASH
 	help
 	  BCMA bus can have various flash memories attached, they are
 	  registered by bcma as platform devices. This enables driver for
-	  NAND flash memories. For now only read mode for BCM4706 is
-	  implemented.
+	  NAND flash memories. For now only BCM4706 is supported.
 
 config MTD_NAND_PLATFORM
 	tristate "Support for generic platform NAND driver"
diff --git a/drivers/mtd/nand/bcm47xxnflash/ops_bcm4706.c b/drivers/mtd/nand/bcm47xxnflash/ops_bcm4706.c
index ece343c..86c9a79 100644
--- a/drivers/mtd/nand/bcm47xxnflash/ops_bcm4706.c
+++ b/drivers/mtd/nand/bcm47xxnflash/ops_bcm4706.c
@@ -25,6 +25,7 @@
 #define NCTL_CMD0			0x00010000
 #define NCTL_CMD1W			0x00080000
 #define NCTL_READ			0x00100000
+#define NCTL_WRITE			0x00200000
 #define NCTL_SPECADDR			0x01000000
 #define NCTL_READY			0x04000000
 #define NCTL_ERR			0x08000000
@@ -132,6 +133,36 @@ static void bcm47xxnflash_ops_bcm4706_read(struct mtd_info *mtd, uint8_t *buf,
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
@@ -208,6 +239,36 @@ static void bcm47xxnflash_ops_bcm4706_cmdfunc(struct mtd_info *mtd,
 		if (page_addr != -1)
 			b47n->curr_column += mtd->writesize;
 		break;
+	case NAND_CMD_ERASE1:
+		bcma_cc_write32(cc, BCMA_CC_NFLASH_ROW_ADDR,
+				b47n->curr_page_addr);
+		ctlcode = 0x00040000 | NCTL_CMD1W | NCTL_CMD0 |
+			  NAND_CMD_ERASE1 | (NAND_CMD_ERASE2 << 8);
+		if (bcm47xxnflash_ops_bcm4706_ctl_cmd(cc, ctlcode))
+			pr_err("ERASE1 failed\n");
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
+			pr_err("SEQIN failed\n");
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
@@ -259,6 +320,21 @@ static void bcm47xxnflash_ops_bcm4706_read_buf(struct mtd_info *mtd,
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
@@ -278,6 +354,7 @@ int bcm47xxnflash_ops_bcm4706_init(struct bcm47xxnflash *b47n)
 	b47n->nand_chip.cmdfunc = bcm47xxnflash_ops_bcm4706_cmdfunc;
 	b47n->nand_chip.read_byte = bcm47xxnflash_ops_bcm4706_read_byte;
 	b47n->nand_chip.read_buf = bcm47xxnflash_ops_bcm4706_read_buf;
+	b47n->nand_chip.write_buf = bcm47xxnflash_ops_bcm4706_write_buf;
 	b47n->nand_chip.bbt_options = NAND_BBT_USE_FLASH;
 	b47n->nand_chip.ecc.mode = NAND_ECC_NONE; /* TODO: implement ECC */
 
-- 
1.7.7
