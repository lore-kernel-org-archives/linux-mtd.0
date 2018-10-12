Received: from mail-lf1-x141.google.com ([2a00:1450:4864:20::141])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gB4Dv-0001y5-KE
 for linux-mtd@lists.infradead.org; Fri, 12 Oct 2018 20:40:07 +0000
Received: by mail-lf1-x141.google.com with SMTP id m18-v6so10216720lfl.11
 for <linux-mtd@lists.infradead.org>; Fri, 12 Oct 2018 13:39:41 -0700 (PDT)
From: Janusz Krzysztofik <jmkrzyszt@gmail.com>
To: Boris Brezillon <boris.brezillon@bootlin.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Marek Vasut <marek.vasut@gmail.com>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, Janusz Krzysztofik <jmkrzyszt@gmail.com>
Subject: [PATCH v2 2/2] mtd: rawnand: ams-delta: Use ->exec_op()
Date: Fri, 12 Oct 2018 22:41:01 +0200
Message-Id: <20181012204101.26274-2-jmkrzyszt@gmail.com>
In-Reply-To: <20181012204101.26274-1-jmkrzyszt@gmail.com>
References: <20181003120028.9257-1-jmkrzyszt@gmail.com>
 <20181012204101.26274-1-jmkrzyszt@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Replace legacy callbacks with ->select_chip() and ->exec_op().

In order to remove any references to legacy structure members, use of 
.IO_ADDR_R/W has been replaced wit runtime calculations based on 
priv->io_base.

Suggested-by: Boris Brezillon <boris.brezillon@bootlin.com>
Signed-off-by: Janusz Krzysztofik <jmkrzyszt@gmail.com>
---
Changelog:
v2:
- replace references to legacy structure .IO_ADDR_R/W members with 
  runtime calculated values - requested by Boris Brezillon, thanks!
- modify ams_delta_read/write_buf() functions, no longer exposed as 
  callbacks, to accept driver private structure instead of struct 
  nand_chip,
- use newly introduced nand_gpio_waitrdy() helper instead of legacy 
  nand_wait_ready() - suggested by Boris Brezillon, thanks!
- remove no longer needed ams_delta_dev_ready() legacy callback and
  legacy structure member .chip_delay.

 drivers/mtd/nand/raw/ams-delta.c | 103 +++++++++++++++++++++------------------
 1 file changed, 55 insertions(+), 48 deletions(-)

diff --git a/drivers/mtd/nand/raw/ams-delta.c b/drivers/mtd/nand/raw/ams-delta.c
index 5ba180a291eb..f0745aeecb1c 100644
--- a/drivers/mtd/nand/raw/ams-delta.c
+++ b/drivers/mtd/nand/raw/ams-delta.c
@@ -75,7 +75,7 @@ static const struct mtd_partition partition_info[] = {
 
 static void ams_delta_io_write(struct ams_delta_nand *priv, u_char byte)
 {
-	writew(byte, priv->nand_chip.legacy.IO_ADDR_W);
+	writew(byte, priv->io_base + OMAP_MPUIO_OUTPUT);
 	gpiod_set_value(priv->gpiod_nwe, 0);
 	ndelay(40);
 	gpiod_set_value(priv->gpiod_nwe, 1);
@@ -87,7 +87,7 @@ static u_char ams_delta_io_read(struct ams_delta_nand *priv)
 
 	gpiod_set_value(priv->gpiod_nre, 0);
 	ndelay(40);
-	res = readw(priv->nand_chip.legacy.IO_ADDR_R);
+	res = readw(priv->io_base + OMAP_MPUIO_INPUT_LATCH);
 	gpiod_set_value(priv->gpiod_nre, 1);
 
 	return res;
@@ -99,10 +99,9 @@ static void ams_delta_dir_input(struct ams_delta_nand *priv, bool in)
 	priv->data_in = in;
 }
 
-static void ams_delta_write_buf(struct nand_chip *this, const u_char *buf,
+static void ams_delta_write_buf(struct ams_delta_nand *priv, const u_char *buf,
 				int len)
 {
-	struct ams_delta_nand *priv = nand_get_controller_data(this);
 	int i;
 
 	if (priv->data_in)
@@ -112,9 +111,9 @@ static void ams_delta_write_buf(struct nand_chip *this, const u_char *buf,
 		ams_delta_io_write(priv, buf[i]);
 }
 
-static void ams_delta_read_buf(struct nand_chip *this, u_char *buf, int len)
+static void ams_delta_read_buf(struct ams_delta_nand *priv, u_char *buf,
+			       int len)
 {
-	struct ams_delta_nand *priv = nand_get_controller_data(this);
 	int i;
 
 	if (!priv->data_in)
@@ -124,46 +123,63 @@ static void ams_delta_read_buf(struct nand_chip *this, u_char *buf, int len)
 		buf[i] = ams_delta_io_read(priv);
 }
 
-static u_char ams_delta_read_byte(struct nand_chip *this)
-{
-	u_char res;
-
-	ams_delta_read_buf(this, &res, 1);
-
-	return res;
-}
-
-/*
- * Command control function
- *
- * ctrl:
- * NAND_NCE: bit 0 -> bit 2
- * NAND_CLE: bit 1 -> bit 7
- * NAND_ALE: bit 2 -> bit 6
- */
-static void ams_delta_hwcontrol(struct nand_chip *this, int cmd,
-				unsigned int ctrl)
+static void ams_delta_select_chip(struct nand_chip *this, int n)
 {
 	struct ams_delta_nand *priv = nand_get_controller_data(this);
 
-	if (ctrl & NAND_CTRL_CHANGE) {
-		gpiod_set_value(priv->gpiod_nce, !(ctrl & NAND_NCE));
-		gpiod_set_value(priv->gpiod_cle, !!(ctrl & NAND_CLE));
-		gpiod_set_value(priv->gpiod_ale, !!(ctrl & NAND_ALE));
-	}
-
-	if (cmd != NAND_CMD_NONE) {
-		u_char byte = cmd;
+	if (n > 0)
+		return;
 
-		ams_delta_write_buf(this, &byte, 1);
-	}
+	gpiod_set_value(priv->gpiod_nce, n < 0);
 }
 
-static int ams_delta_nand_ready(struct nand_chip *this)
+static int ams_delta_exec_op(struct nand_chip *this,
+			     const struct nand_operation *op, bool check_only)
 {
 	struct ams_delta_nand *priv = nand_get_controller_data(this);
+	const struct nand_op_instr *instr;
+	int ret = 0;
+
+	for (instr = op->instrs; instr < op->instrs + op->ninstrs; instr++) {
+
+		switch (instr->type) {
+		case NAND_OP_CMD_INSTR:
+			gpiod_set_value(priv->gpiod_cle, 1);
+			ams_delta_write_buf(priv, &instr->ctx.cmd.opcode, 1);
+			gpiod_set_value(priv->gpiod_cle, 0);
+			break;
+
+		case NAND_OP_ADDR_INSTR:
+			gpiod_set_value(priv->gpiod_ale, 1);
+			ams_delta_write_buf(priv, instr->ctx.addr.addrs,
+					    instr->ctx.addr.naddrs);
+			gpiod_set_value(priv->gpiod_ale, 0);
+			break;
+
+		case NAND_OP_DATA_IN_INSTR:
+			ams_delta_read_buf(priv, instr->ctx.data.buf.in,
+					   instr->ctx.data.len);
+			break;
+
+		case NAND_OP_DATA_OUT_INSTR:
+			ams_delta_write_buf(priv, instr->ctx.data.buf.out,
+					    instr->ctx.data.len);
+			break;
+
+		case NAND_OP_WAITRDY_INSTR:
+			ret = priv->gpiod_rdy ?
+			      nand_gpio_waitrdy(this, priv->gpiod_rdy,
+						instr->ctx.waitrdy.timeout_ms) :
+			      nand_soft_waitrdy(this,
+						instr->ctx.waitrdy.timeout_ms);
+			break;
+		}
+
+		if (ret)
+			break;
+	}
 
-	return gpiod_get_value(priv->gpiod_rdy);
+	return ret;
 }
 
 
@@ -211,12 +227,8 @@ static int ams_delta_init(struct platform_device *pdev)
 	nand_set_controller_data(this, priv);
 
 	/* Set address of NAND IO lines */
-	this->legacy.IO_ADDR_R = io_base + OMAP_MPUIO_INPUT_LATCH;
-	this->legacy.IO_ADDR_W = io_base + OMAP_MPUIO_OUTPUT;
-	this->legacy.read_byte = ams_delta_read_byte;
-	this->legacy.write_buf = ams_delta_write_buf;
-	this->legacy.read_buf = ams_delta_read_buf;
-	this->legacy.cmd_ctrl = ams_delta_hwcontrol;
+	this->select_chip = ams_delta_select_chip;
+	this->exec_op = ams_delta_exec_op;
 
 	priv->gpiod_rdy = devm_gpiod_get_optional(&pdev->dev, "rdy", GPIOD_IN);
 	if (IS_ERR(priv->gpiod_rdy)) {
@@ -225,11 +237,6 @@ static int ams_delta_init(struct platform_device *pdev)
 		goto out_mtd;
 	}
 
-	if (priv->gpiod_rdy)
-		this->legacy.dev_ready = ams_delta_nand_ready;
-
-	/* 25 us command delay time */
-	this->legacy.chip_delay = 30;
 	this->ecc.mode = NAND_ECC_SOFT;
 	this->ecc.algo = NAND_ECC_HAMMING;
 
-- 
2.16.4
