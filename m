Received: from mail.bootlin.com ([62.4.15.54])
 by casper.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gLkbB-0000Uk-Rm
 for linux-mtd@lists.infradead.org; Sun, 11 Nov 2018 07:56:03 +0000
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: Boris Brezillon <boris.brezillon@bootlin.com>,
 Richard Weinberger <richard@nod.at>,
 Miquel Raynal <miquel.raynal@bootlin.com>, linux-mtd@lists.infradead.org
Cc: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Marek Vasut <marek.vasut@gmail.com>, Han Xu <han.xu@nxp.com>,
 Masahiro Yamada <yamada.masahiro@socionext.com>,
 Tudor Ambarus <tudor.ambarus@microchip.com>,
 Harvey Hunt <harveyhuntnexus@gmail.com>,
 Xiaolei Li <xiaolei.li@mediatek.com>,
 Maxim Levitsky <maximlevitsky@gmail.com>,
 Marc Gonzalez <marc.w.gonzalez@free.fr>, Stefan Agner <stefan@agner.ch>,
 Janusz Krzysztofik <jmkrzyszt@gmail.com>
Subject: [PATCH v3 19/22] mtd: rawnand: ams-delta: Stop implementing
 ->select_chip()
Date: Sun, 11 Nov 2018 08:55:21 +0100
Message-Id: <20181111075524.13123-20-boris.brezillon@bootlin.com>
In-Reply-To: <20181111075524.13123-1-boris.brezillon@bootlin.com>
References: <20181111075524.13123-1-boris.brezillon@bootlin.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Now that the CS to be selected is passed in nand_operation->cs, we can
get rid of the ->select_chip() implementation and replace it by an
internal function which is called from the chip->exec_op() hook.

Signed-off-by: Boris Brezillon <boris.brezillon@bootlin.com>
Tested-by: Janusz Krzysztofik <jmkrzyszt@gmail.com>
---
Changes in v3:
- Add Janusz T-b

Changes in v2:
- New patch
---
 drivers/mtd/nand/raw/ams-delta.c | 14 ++++++--------
 1 file changed, 6 insertions(+), 8 deletions(-)

diff --git a/drivers/mtd/nand/raw/ams-delta.c b/drivers/mtd/nand/raw/ams-delta.c
index 34b83edb965c..611c822e967f 100644
--- a/drivers/mtd/nand/raw/ams-delta.c
+++ b/drivers/mtd/nand/raw/ams-delta.c
@@ -116,14 +116,9 @@ static void ams_delta_read_buf(struct ams_delta_nand *priv, u8 *buf, int len)
 		buf[i] = ams_delta_io_read(priv);
 }
 
-static void ams_delta_select_chip(struct nand_chip *this, int n)
+static void ams_delta_ctrl_cs(struct ams_delta_nand *priv, bool assert)
 {
-	struct ams_delta_nand *priv = nand_get_controller_data(this);
-
-	if (n > 0)
-		return;
-
-	gpiod_set_value(priv->gpiod_nce, n < 0);
+	gpiod_set_value(priv->gpiod_nce, assert ? 0 : 1);
 }
 
 static int ams_delta_exec_op(struct nand_chip *this,
@@ -136,6 +131,8 @@ static int ams_delta_exec_op(struct nand_chip *this,
 	if (check_only)
 		return 0;
 
+	ams_delta_ctrl_cs(priv, 1);
+
 	for (instr = op->instrs; instr < op->instrs + op->ninstrs; instr++) {
 		switch (instr->type) {
 		case NAND_OP_CMD_INSTR:
@@ -174,6 +171,8 @@ static int ams_delta_exec_op(struct nand_chip *this,
 			break;
 	}
 
+	ams_delta_ctrl_cs(priv, 0);
+
 	return ret;
 }
 
@@ -217,7 +216,6 @@ static int ams_delta_init(struct platform_device *pdev)
 	priv->io_base = io_base;
 	nand_set_controller_data(this, priv);
 
-	this->select_chip = ams_delta_select_chip;
 	this->exec_op = ams_delta_exec_op;
 
 	priv->gpiod_rdy = devm_gpiod_get_optional(&pdev->dev, "rdy", GPIOD_IN);
-- 
2.17.1
