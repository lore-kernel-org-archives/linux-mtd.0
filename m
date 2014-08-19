Received: from mail-wg0-x229.google.com ([2a00:1450:400c:c00::229])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XJfin-0007NC-Eu
 for linux-mtd@lists.infradead.org; Tue, 19 Aug 2014 09:28:54 +0000
Received: by mail-wg0-f41.google.com with SMTP id z12so6045988wgg.0
 for <linux-mtd@lists.infradead.org>; Tue, 19 Aug 2014 02:28:31 -0700 (PDT)
From: =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>
To: linux-mtd@lists.infradead.org, David Woodhouse <David.Woodhouse@intel.com>,
 Artem Bityutskiy <dedekind1@gmail.com>,
 Brian Norris <computersforpeace@gmail.com>
Subject: [PATCH] mtd: bcm47xxnflash: replace some magic numbers
Date: Tue, 19 Aug 2014 11:28:24 +0200
Message-Id: <1408440504-6802-1-git-send-email-zajec5@gmail.com>
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

Signed-off-by: Rafał Miłecki <zajec5@gmail.com>
---
 drivers/mtd/nand/bcm47xxnflash/ops_bcm4706.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/nand/bcm47xxnflash/ops_bcm4706.c b/drivers/mtd/nand/bcm47xxnflash/ops_bcm4706.c
index 82844ef..592befc 100644
--- a/drivers/mtd/nand/bcm47xxnflash/ops_bcm4706.c
+++ b/drivers/mtd/nand/bcm47xxnflash/ops_bcm4706.c
@@ -24,6 +24,8 @@
 #define NFLASH_SECTOR_SIZE		512
 
 #define NCTL_CMD0			0x00010000
+#define NCTL_COL			0x00020000	/* Update column with value from BCMA_CC_NFLASH_COL_ADDR */
+#define NCTL_ROW			0x00040000	/* Update row (page) with value from BCMA_CC_NFLASH_ROW_ADDR */
 #define NCTL_CMD1W			0x00080000
 #define NCTL_READ			0x00100000
 #define NCTL_WRITE			0x00200000
@@ -110,7 +112,7 @@ static void bcm47xxnflash_ops_bcm4706_read(struct mtd_info *mtd, uint8_t *buf,
 				b47n->curr_page_addr);
 
 		/* Prepare to read */
-		ctlcode = NCTL_CSA | NCTL_CMD1W | 0x00040000 | 0x00020000 |
+		ctlcode = NCTL_CSA | NCTL_CMD1W | NCTL_ROW | NCTL_COL |
 			  NCTL_CMD0;
 		ctlcode |= NAND_CMD_READSTART << 8;
 		if (bcm47xxnflash_ops_bcm4706_ctl_cmd(b47n->cc, ctlcode))
@@ -274,7 +276,7 @@ static void bcm47xxnflash_ops_bcm4706_cmdfunc(struct mtd_info *mtd,
 	case NAND_CMD_ERASE1:
 		bcma_cc_write32(cc, BCMA_CC_NFLASH_ROW_ADDR,
 				b47n->curr_page_addr);
-		ctlcode = 0x00040000 | NCTL_CMD1W | NCTL_CMD0 |
+		ctlcode = NCTL_ROW | NCTL_CMD1W | NCTL_CMD0 |
 			  NAND_CMD_ERASE1 | (NAND_CMD_ERASE2 << 8);
 		if (bcm47xxnflash_ops_bcm4706_ctl_cmd(cc, ctlcode))
 			pr_err("ERASE1 failed\n");
@@ -289,13 +291,13 @@ static void bcm47xxnflash_ops_bcm4706_cmdfunc(struct mtd_info *mtd,
 				b47n->curr_page_addr);
 
 		/* Prepare to write */
-		ctlcode = 0x40000000 | 0x00040000 | 0x00020000 | 0x00010000;
+		ctlcode = 0x40000000 | NCTL_ROW | NCTL_COL | NCTL_CMD0;
 		ctlcode |= NAND_CMD_SEQIN;
 		if (bcm47xxnflash_ops_bcm4706_ctl_cmd(cc, ctlcode))
 			pr_err("SEQIN failed\n");
 		break;
 	case NAND_CMD_PAGEPROG:
-		if (bcm47xxnflash_ops_bcm4706_ctl_cmd(cc, 0x00010000 |
+		if (bcm47xxnflash_ops_bcm4706_ctl_cmd(cc, NCTL_CMD0 |
 							  NAND_CMD_PAGEPROG))
 			pr_err("PAGEPROG failed\n");
 		if (bcm47xxnflash_ops_bcm4706_poll(cc))
-- 
1.8.4.5
