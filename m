Received: from mail-we0-f177.google.com ([74.125.82.177])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1TBtRE-0003wO-7L
 for linux-mtd@lists.infradead.org; Wed, 12 Sep 2012 20:21:35 +0000
Received: by weyr3 with SMTP id r3so1281143wey.36
 for <linux-mtd@lists.infradead.org>; Wed, 12 Sep 2012 13:21:31 -0700 (PDT)
From: =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>
To: linux-mtd@lists.infradead.org,
	Artem Bityutskiy <dedekind1@gmail.com>
Subject: [PATCH 4/4] mtd: bcm47xxnflash: implement reading
Date: Wed, 12 Sep 2012 22:21:15 +0200
Message-Id: <1347481275-995-4-git-send-email-zajec5@gmail.com>
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
 drivers/mtd/nand/bcm47xxnflash/bcm47xxnflash.h |    1 +
 drivers/mtd/nand/bcm47xxnflash/ops_bcm4706.c   |  106 ++++++++++++++++++++++++
 2 files changed, 107 insertions(+), 0 deletions(-)

diff --git a/drivers/mtd/nand/bcm47xxnflash/bcm47xxnflash.h b/drivers/mtd/nand/bcm47xxnflash/bcm47xxnflash.h
index 53fb2ea..e1cfdc5 100644
--- a/drivers/mtd/nand/bcm47xxnflash/bcm47xxnflash.h
+++ b/drivers/mtd/nand/bcm47xxnflash/bcm47xxnflash.h
@@ -11,6 +11,7 @@ struct bcm47xxnflash {
 	struct mtd_info mtd;
 
 	unsigned curr_command;
+	int curr_page_addr;
 	int curr_column;
 
 	u8 id_data[8];
diff --git a/drivers/mtd/nand/bcm47xxnflash/ops_bcm4706.c b/drivers/mtd/nand/bcm47xxnflash/ops_bcm4706.c
index e86670b..ca3eaf0 100644
--- a/drivers/mtd/nand/bcm47xxnflash/ops_bcm4706.c
+++ b/drivers/mtd/nand/bcm47xxnflash/ops_bcm4706.c
@@ -20,6 +20,8 @@
  * shown 164 retries as maxiumum. */
 #define NFLASH_READY_RETRIES		1000
 
+#define NFLASH_SECTOR_SIZE		512
+
 /**************************************************
  * Various helpers
  **************************************************/
@@ -47,6 +49,80 @@ static int bcm47xxnflash_ops_bcm4706_ctl_cmd(struct bcma_drv_cc *cc, u32 code)
 	return 0;
 }
 
+static int bcm47xxnflash_ops_bcm4706_poll(struct bcma_drv_cc *cc)
+{
+	int i;
+
+	for (i = 0; i < NFLASH_READY_RETRIES; i++) {
+		if (bcma_cc_read32(cc, BCMA_CC_NFLASH_CTL) & 0x04000000) {
+			if (bcma_cc_read32(cc, BCMA_CC_NFLASH_CTL) &
+			    BCMA_CC_NFLASH_CTL_ERR) {
+				pr_err("Error on polling\n");
+				return -EBUSY;
+			} else {
+				return 0;
+			}
+		}
+	}
+
+	pr_err("Polling timeout!\n");
+	return -EBUSY;
+}
+
+/**************************************************
+ * R/W
+ **************************************************/
+
+static void bcm47xxnflash_ops_bcm4706_read(struct mtd_info *mtd, uint8_t *buf,
+					   int len)
+{
+	struct nand_chip *nand_chip = (struct nand_chip *)mtd->priv;
+	struct bcm47xxnflash *b47n = (struct bcm47xxnflash *)nand_chip->priv;
+
+	u32 ctlcode;
+	u32 *dest = (u32 *)buf;
+	int i;
+	int toread;
+
+	BUG_ON(b47n->curr_page_addr & ~nand_chip->pagemask);
+	/* Don't validate column using nand_chip->page_shift, it may be bigger
+	 * when accessing OOB */
+
+	while (len) {
+		/* We can read maximum of 0x200 bytes at once */
+		toread = min(len, 0x200);
+
+		/* Set page and column */
+		bcma_cc_write32(b47n->cc, BCMA_CC_NFLASH_COL_ADDR,
+				b47n->curr_column);
+		bcma_cc_write32(b47n->cc, BCMA_CC_NFLASH_ROW_ADDR,
+				b47n->curr_page_addr);
+
+		/* Prepare to read */
+		ctlcode = 0x40000000 | 0x00080000 | 0x00040000 | 0x00020000 |
+			  0x00010000;
+		ctlcode |= NAND_CMD_READSTART << 8;
+		if (bcm47xxnflash_ops_bcm4706_ctl_cmd(b47n->cc, ctlcode))
+			return;
+		if (bcm47xxnflash_ops_bcm4706_poll(b47n->cc))
+			return;
+
+		/* Eventually read some data :) */
+		for (i = 0; i < toread; i += 4, dest++) {
+			ctlcode = 0x40000000 | 0x30000000 | 0x00100000;
+			if (i == toread - 4) /* Last read goes without that */
+				ctlcode &= ~0x40000000;
+			if (bcm47xxnflash_ops_bcm4706_ctl_cmd(b47n->cc,
+							      ctlcode))
+				return;
+			*dest = bcma_cc_read32(b47n->cc, BCMA_CC_NFLASH_DATA);
+		}
+
+		b47n->curr_column += toread;
+		len -= toread;
+	}
+}
+
 /**************************************************
  * NAND chip ops
  **************************************************/
@@ -97,6 +173,14 @@ static void bcm47xxnflash_ops_bcm4706_cmdfunc(struct mtd_info *mtd,
 
 		b47n->curr_column = 0;
 		break;
+	case NAND_CMD_READ0:
+		b47n->curr_page_addr = page_addr;
+		b47n->curr_column = column;
+		break;
+	case NAND_CMD_READOOB:
+		b47n->curr_page_addr = page_addr;
+		b47n->curr_column = mtd->writesize + column;
+		break;
 	default:
 		pr_err("Command 0x%X unsupported\n", command);
 		break;
@@ -108,6 +192,7 @@ static u8 bcm47xxnflash_ops_bcm4706_read_byte(struct mtd_info *mtd)
 {
 	struct nand_chip *nand_chip = (struct nand_chip *)mtd->priv;
 	struct bcm47xxnflash *b47n = (struct bcm47xxnflash *)nand_chip->priv;
+	u32 tmp = 0;
 
 	switch (b47n->curr_command) {
 	case NAND_CMD_READID:
@@ -117,12 +202,31 @@ static u8 bcm47xxnflash_ops_bcm4706_read_byte(struct mtd_info *mtd)
 			return 0;
 		}
 		return b47n->id_data[b47n->curr_column++];
+	case NAND_CMD_READOOB:
+		bcm47xxnflash_ops_bcm4706_read(mtd, (u8 *)&tmp, 4);
+		return tmp & 0xFF;
 	}
 
 	pr_err("Invalid command for byte read: 0x%X\n", b47n->curr_command);
 	return 0;
 }
 
+static void bcm47xxnflash_ops_bcm4706_read_buf(struct mtd_info *mtd,
+					       uint8_t *buf, int len)
+{
+	struct nand_chip *nand_chip = (struct nand_chip *)mtd->priv;
+	struct bcm47xxnflash *b47n = (struct bcm47xxnflash *)nand_chip->priv;
+
+	switch (b47n->curr_command) {
+	case NAND_CMD_READ0:
+	case NAND_CMD_READOOB:
+		bcm47xxnflash_ops_bcm4706_read(mtd, buf, len);
+		return;
+	}
+
+	pr_err("Invalid command for buf read: 0x%X\n", b47n->curr_command);
+}
+
 /**************************************************
  * Init
  **************************************************/
@@ -142,6 +246,8 @@ int bcm47xxnflash_ops_bcm4706_init(struct bcm47xxnflash *b47n)
 	b47n->nand_chip.select_chip = bcm47xxnflash_ops_bcm4706_select_chip;
 	b47n->nand_chip.cmdfunc = bcm47xxnflash_ops_bcm4706_cmdfunc;
 	b47n->nand_chip.read_byte = bcm47xxnflash_ops_bcm4706_read_byte;
+	b47n->nand_chip.read_buf = bcm47xxnflash_ops_bcm4706_read_buf;
+	b47n->nand_chip.bbt_options = NAND_BBT_USE_FLASH;
 	b47n->nand_chip.ecc.mode = NAND_ECC_SOFT; /* TODO: implement ECC */
 
 	/* Enable NAND flash access */
-- 
1.7.7
