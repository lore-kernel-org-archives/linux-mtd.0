Received: from mail-wi0-x232.google.com ([2a00:1450:400c:c05::232])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XJdd7-0004k5-B9
 for linux-mtd@lists.infradead.org; Tue, 19 Aug 2014 07:14:53 +0000
Received: by mail-wi0-f178.google.com with SMTP id hi2so4779854wib.17
 for <linux-mtd@lists.infradead.org>; Tue, 19 Aug 2014 00:14:29 -0700 (PDT)
From: =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>
To: linux-mtd@lists.infradead.org, David Woodhouse <David.Woodhouse@intel.com>,
 Artem Bityutskiy <dedekind1@gmail.com>,
 Brian Norris <computersforpeace@gmail.com>
Subject: [PATCH 3/4] mtd: bcm47xxnflash: add cmd_ctrl handler
Date: Tue, 19 Aug 2014 09:14:15 +0200
Message-Id: <1408432456-27280-3-git-send-email-zajec5@gmail.com>
In-Reply-To: <1408432456-27280-1-git-send-email-zajec5@gmail.com>
References: <1408432456-27280-1-git-send-email-zajec5@gmail.com>
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

This won't be used by NAND subsystem as we implement cmdfunc on our
own, but will allow us to write a bit cleaner code.

Signed-off-by: Rafał Miłecki <zajec5@gmail.com>
---
 drivers/mtd/nand/bcm47xxnflash/ops_bcm4706.c | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/drivers/mtd/nand/bcm47xxnflash/ops_bcm4706.c b/drivers/mtd/nand/bcm47xxnflash/ops_bcm4706.c
index 1ea5e77..30df67a 100644
--- a/drivers/mtd/nand/bcm47xxnflash/ops_bcm4706.c
+++ b/drivers/mtd/nand/bcm47xxnflash/ops_bcm4706.c
@@ -167,6 +167,26 @@ static void bcm47xxnflash_ops_bcm4706_write(struct mtd_info *mtd,
  * NAND chip ops
  **************************************************/
 
+static void bcm47xxnflash_ops_bcm4706_cmd_ctrl(struct mtd_info *mtd, int cmd,
+					       unsigned int ctrl)
+{
+	struct nand_chip *nand_chip = (struct nand_chip *)mtd->priv;
+	struct bcm47xxnflash *b47n = (struct bcm47xxnflash *)nand_chip->priv;
+	u32 code = 0;
+
+	if (cmd == NAND_CMD_NONE)
+		return;
+
+	if (cmd & NAND_CTRL_CLE)
+		code = cmd | NCTL_CMD0;
+
+	/* nCS is not needed for reset command */
+	if (cmd != NAND_CMD_RESET)
+		code |= NCTL_CSA;
+
+	bcm47xxnflash_ops_bcm4706_ctl_cmd(b47n->cc, code);
+}
+
 /* Default nand_select_chip calls cmd_ctrl, which is not used in BCM4706 */
 static void bcm47xxnflash_ops_bcm4706_select_chip(struct mtd_info *mtd,
 						  int chip)
@@ -360,6 +380,7 @@ int bcm47xxnflash_ops_bcm4706_init(struct bcm47xxnflash *b47n)
 	u32 val;
 
 	b47n->nand_chip.select_chip = bcm47xxnflash_ops_bcm4706_select_chip;
+	nand_chip->cmd_ctrl = bcm47xxnflash_ops_bcm4706_cmd_ctrl;
 	nand_chip->dev_ready = bcm47xxnflash_ops_bcm4706_dev_ready;
 	b47n->nand_chip.cmdfunc = bcm47xxnflash_ops_bcm4706_cmdfunc;
 	b47n->nand_chip.read_byte = bcm47xxnflash_ops_bcm4706_read_byte;
-- 
1.8.4.5
