Received: from mail.bootlin.com ([62.4.15.54])
 by casper.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gK2yJ-00075c-PS
 for linux-mtd@lists.infradead.org; Tue, 06 Nov 2018 15:08:56 +0000
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
Subject: [PATCH v2 17/22] mtd: rawnand: tegra: Stop implementing
 ->select_chip()
Date: Tue,  6 Nov 2018 16:08:05 +0100
Message-Id: <20181106150810.9569-18-boris.brezillon@bootlin.com>
In-Reply-To: <20181106150810.9569-1-boris.brezillon@bootlin.com>
References: <20181106150810.9569-1-boris.brezillon@bootlin.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Now that the CS to be selected is kept in chip->cur_cs and passed
in nand_operation->cs, we can get rid of the ->select_chip()
implementation and replace it by an internal function which is called
from the chip->exec_op() and chip->ecc.read/write_xxx() hooks.

Signed-off-by: Boris Brezillon <boris.brezillon@bootlin.com>
---
Changes in v2:
- None
---
 drivers/mtd/nand/raw/tegra_nand.c | 28 ++++++++++++----------------
 1 file changed, 12 insertions(+), 16 deletions(-)

diff --git a/drivers/mtd/nand/raw/tegra_nand.c b/drivers/mtd/nand/raw/tegra_nand.c
index 9767e29d74e2..590393d93ffc 100644
--- a/drivers/mtd/nand/raw/tegra_nand.c
+++ b/drivers/mtd/nand/raw/tegra_nand.c
@@ -454,29 +454,24 @@ static const struct nand_op_parser tegra_nand_op_parser = NAND_OP_PARSER(
 		NAND_OP_PARSER_PAT_DATA_IN_ELEM(true, 4)),
 	);
 
+static void tegra_nand_select_target(struct nand_chip *chip,
+				     unsigned int die_nr)
+{
+	struct tegra_nand_chip *nand = to_tegra_chip(chip);
+	struct tegra_nand_controller *ctrl = to_tegra_ctrl(chip->controller);
+
+	ctrl->cur_cs = nand->cs[die_nr];
+}
+
 static int tegra_nand_exec_op(struct nand_chip *chip,
 			      const struct nand_operation *op,
 			      bool check_only)
 {
+	tegra_nand_select_target(chip, op->cs);
 	return nand_op_parser_exec_op(chip, &tegra_nand_op_parser, op,
 				      check_only);
 }
 
-static void tegra_nand_select_chip(struct nand_chip *chip, int die_nr)
-{
-	struct tegra_nand_chip *nand = to_tegra_chip(chip);
-	struct tegra_nand_controller *ctrl = to_tegra_ctrl(chip->controller);
-
-	WARN_ON(die_nr >= (int)ARRAY_SIZE(nand->cs));
-
-	if (die_nr < 0 || die_nr > 0) {
-		ctrl->cur_cs = -1;
-		return;
-	}
-
-	ctrl->cur_cs = nand->cs[die_nr];
-}
-
 static void tegra_nand_hw_ecc(struct tegra_nand_controller *ctrl,
 			      struct nand_chip *chip, bool enable)
 {
@@ -503,6 +498,8 @@ static int tegra_nand_page_xfer(struct mtd_info *mtd, struct nand_chip *chip,
 	u32 addr1, cmd, dma_ctrl;
 	int ret;
 
+	tegra_nand_select_target(chip, chip->cur_cs);
+
 	if (read) {
 		writel_relaxed(NAND_CMD_READ0, ctrl->regs + CMD_REG1);
 		writel_relaxed(NAND_CMD_READSTART, ctrl->regs + CMD_REG2);
@@ -1116,7 +1113,6 @@ static int tegra_nand_chips_init(struct device *dev,
 
 	chip->options = NAND_NO_SUBPAGE_WRITE | NAND_USE_BOUNCE_BUFFER;
 	chip->exec_op = tegra_nand_exec_op;
-	chip->select_chip = tegra_nand_select_chip;
 	chip->setup_data_interface = tegra_nand_setup_data_interface;
 
 	ret = nand_scan(chip, 1);
-- 
2.17.1
