Received: from mail-ea0-f177.google.com ([209.85.215.177])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1Tbp5R-0003xK-MY
 for linux-mtd@lists.infradead.org; Fri, 23 Nov 2012 08:58:14 +0000
Received: by mail-ea0-f177.google.com with SMTP id c10so1683973eaa.36
 for <linux-mtd@lists.infradead.org>; Fri, 23 Nov 2012 00:58:12 -0800 (PST)
From: =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>
To: linux-mtd@lists.infradead.org,
	Artem Bityutskiy <dedekind1@gmail.com>
Subject: [PATCH][SEE DEPENDENCY] bcm47xxnflash: support NAND_CMD_STATUS
Date: Fri, 23 Nov 2012 09:58:11 +0100
Message-Id: <1353661091-6426-1-git-send-email-zajec5@gmail.com>
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
Please note this patch depends on:
[PATCH] bcm47xxnflash: define some magic numbers
---
 drivers/mtd/nand/bcm47xxnflash/ops_bcm4706.c |   11 +++++++++++
 1 files changed, 11 insertions(+), 0 deletions(-)

diff --git a/drivers/mtd/nand/bcm47xxnflash/ops_bcm4706.c b/drivers/mtd/nand/bcm47xxnflash/ops_bcm4706.c
index 672dc90..ece343c 100644
--- a/drivers/mtd/nand/bcm47xxnflash/ops_bcm4706.c
+++ b/drivers/mtd/nand/bcm47xxnflash/ops_bcm4706.c
@@ -156,6 +156,7 @@ static void bcm47xxnflash_ops_bcm4706_cmdfunc(struct mtd_info *mtd,
 {
 	struct nand_chip *nand_chip = (struct nand_chip *)mtd->priv;
 	struct bcm47xxnflash *b47n = (struct bcm47xxnflash *)nand_chip->priv;
+	struct bcma_drv_cc *cc = b47n->cc;
 	u32 ctlcode;
 	int i;
 
@@ -196,6 +197,11 @@ static void bcm47xxnflash_ops_bcm4706_cmdfunc(struct mtd_info *mtd,
 		}
 
 		break;
+	case NAND_CMD_STATUS:
+		ctlcode = NCTL_CSA | NCTL_CMD0 | NAND_CMD_STATUS;
+		if (bcm47xxnflash_ops_bcm4706_ctl_cmd(cc, ctlcode))
+			pr_err("STATUS command error\n");
+		break;
 	case NAND_CMD_READ0:
 		break;
 	case NAND_CMD_READOOB:
@@ -213,6 +219,7 @@ static u8 bcm47xxnflash_ops_bcm4706_read_byte(struct mtd_info *mtd)
 {
 	struct nand_chip *nand_chip = (struct nand_chip *)mtd->priv;
 	struct bcm47xxnflash *b47n = (struct bcm47xxnflash *)nand_chip->priv;
+	struct bcma_drv_cc *cc = b47n->cc;
 	u32 tmp = 0;
 
 	switch (b47n->curr_command) {
@@ -223,6 +230,10 @@ static u8 bcm47xxnflash_ops_bcm4706_read_byte(struct mtd_info *mtd)
 			return 0;
 		}
 		return b47n->id_data[b47n->curr_column++];
+	case NAND_CMD_STATUS:
+		if (bcm47xxnflash_ops_bcm4706_ctl_cmd(cc, NCTL_READ))
+			return 0;
+		return bcma_cc_read32(cc, BCMA_CC_NFLASH_DATA) & 0xff;
 	case NAND_CMD_READOOB:
 		bcm47xxnflash_ops_bcm4706_read(mtd, (u8 *)&tmp, 4);
 		return tmp & 0xFF;
-- 
1.7.7
