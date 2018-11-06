Received: from mail.bootlin.com ([62.4.15.54])
 by merlin.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gK37F-0007wt-86
 for linux-mtd@lists.infradead.org; Tue, 06 Nov 2018 15:18:06 +0000
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
Subject: [PATCH v2 08/22] mtd: rawnand: ams-delta: Fix various coding style
 issues
Date: Tue,  6 Nov 2018 16:07:56 +0100
Message-Id: <20181106150810.9569-9-boris.brezillon@bootlin.com>
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

Most of them were reported by checkpatch:

* s/u_char/u8/
* remove unneeded blank lines
* don't print warning messages when devm_kzalloc() fails
* Use ! instead of == NULL
* Remove invalid comment

Signed-off-by: Boris Brezillon <boris.brezillon@bootlin.com>
---
Changes in v2
- New patch
---
 drivers/mtd/nand/raw/ams-delta.c | 23 ++++++++---------------
 1 file changed, 8 insertions(+), 15 deletions(-)

diff --git a/drivers/mtd/nand/raw/ams-delta.c b/drivers/mtd/nand/raw/ams-delta.c
index a00f9e549cb1..8b90132aea43 100644
--- a/drivers/mtd/nand/raw/ams-delta.c
+++ b/drivers/mtd/nand/raw/ams-delta.c
@@ -26,7 +26,6 @@
 /*
  * MTD structure for E3 (Delta)
  */
-
 struct ams_delta_nand {
 	struct nand_chip	nand_chip;
 	struct gpio_desc	*gpiod_rdy;
@@ -65,7 +64,7 @@ static const struct mtd_partition partition_info[] = {
 	  .size		=  3 * SZ_256K },
 };
 
-static void ams_delta_io_write(struct ams_delta_nand *priv, u_char byte)
+static void ams_delta_io_write(struct ams_delta_nand *priv, u8 byte)
 {
 	writew(byte, priv->io_base + OMAP_MPUIO_OUTPUT);
 	gpiod_set_value(priv->gpiod_nwe, 0);
@@ -73,9 +72,9 @@ static void ams_delta_io_write(struct ams_delta_nand *priv, u_char byte)
 	gpiod_set_value(priv->gpiod_nwe, 1);
 }
 
-static u_char ams_delta_io_read(struct ams_delta_nand *priv)
+static u8 ams_delta_io_read(struct ams_delta_nand *priv)
 {
-	u_char res;
+	u8 res;
 
 	gpiod_set_value(priv->gpiod_nre, 0);
 	ndelay(40);
@@ -91,7 +90,7 @@ static void ams_delta_dir_input(struct ams_delta_nand *priv, bool in)
 	priv->data_in = in;
 }
 
-static void ams_delta_write_buf(struct ams_delta_nand *priv, const u_char *buf,
+static void ams_delta_write_buf(struct ams_delta_nand *priv, const u8 *buf,
 				int len)
 {
 	int i;
@@ -103,8 +102,7 @@ static void ams_delta_write_buf(struct ams_delta_nand *priv, const u_char *buf,
 		ams_delta_io_write(priv, buf[i]);
 }
 
-static void ams_delta_read_buf(struct ams_delta_nand *priv, u_char *buf,
-			       int len)
+static void ams_delta_read_buf(struct ams_delta_nand *priv, u8 *buf, int len)
 {
 	int i;
 
@@ -136,7 +134,6 @@ static int ams_delta_exec_op(struct nand_chip *this,
 		return 0;
 
 	for (instr = op->instrs; instr < op->instrs + op->ninstrs; instr++) {
-
 		switch (instr->type) {
 		case NAND_OP_CMD_INSTR:
 			gpiod_set_value(priv->gpiod_cle, 1);
@@ -177,7 +174,6 @@ static int ams_delta_exec_op(struct nand_chip *this,
 	return ret;
 }
 
-
 /*
  * Main initialization routine
  */
@@ -196,10 +192,9 @@ static int ams_delta_init(struct platform_device *pdev)
 	/* Allocate memory for MTD device structure and private data */
 	priv = devm_kzalloc(&pdev->dev, sizeof(struct ams_delta_nand),
 			    GFP_KERNEL);
-	if (!priv) {
-		pr_warn("Unable to allocate E3 NAND MTD device structure.\n");
+	if (!priv)
 		return -ENOMEM;
-	}
+
 	this = &priv->nand_chip;
 
 	mtd = nand_to_mtd(this);
@@ -210,9 +205,8 @@ static int ams_delta_init(struct platform_device *pdev)
 	 * it should have been already requested from the
 	 * gpio-omap driver and requesting it again would fail.
 	 */
-
 	io_base = ioremap(res->start, resource_size(res));
-	if (io_base == NULL) {
+	if (!io_base) {
 		dev_err(&pdev->dev, "ioremap failed\n");
 		err = -EIO;
 		goto out_free;
@@ -221,7 +215,6 @@ static int ams_delta_init(struct platform_device *pdev)
 	priv->io_base = io_base;
 	nand_set_controller_data(this, priv);
 
-	/* Set address of NAND IO lines */
 	this->select_chip = ams_delta_select_chip;
 	this->exec_op = ams_delta_exec_op;
 
-- 
2.17.1
