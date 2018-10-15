Received: from mail-lj1-x244.google.com ([2a00:1450:4864:20::244])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gC8iw-0004Hm-GT
 for linux-mtd@lists.infradead.org; Mon, 15 Oct 2018 19:40:20 +0000
Received: by mail-lj1-x244.google.com with SMTP id 63-v6so18621736ljs.4
 for <linux-mtd@lists.infradead.org>; Mon, 15 Oct 2018 12:40:08 -0700 (PDT)
From: Janusz Krzysztofik <jmkrzyszt@gmail.com>
To: Boris Brezillon <boris.brezillon@bootlin.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Marek Vasut <marek.vasut@gmail.com>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, Janusz Krzysztofik <jmkrzyszt@gmail.com>
Subject: [PATCH v3 3/3] mtd: rawnand: ams-delta: Convert the driver to
 ->exec_op()
Date: Mon, 15 Oct 2018 21:41:30 +0200
Message-Id: <20181015194130.21764-3-jmkrzyszt@gmail.com>
In-Reply-To: <20181015194130.21764-1-jmkrzyszt@gmail.com>
References: <20181012204101.26274-1-jmkrzyszt@gmail.com>
 <20181015194130.21764-1-jmkrzyszt@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Replace legacy callbacks with ->select_chip() and ->exec_op().

Suggested-by: Boris Brezillon <boris.brezillon@bootlin.com>
Signed-off-by: Janusz Krzysztofik <jmkrzyszt@gmail.com>
Reviewed-by: Boris Brezillon <boris.brezillon@bootlin.com>
---
Changelog:
v3:
- former PATCH 2/2 from which PATCH v3 2/3 has been split out,
- added missing return on check_only - requested by Boris Brezillon,
  thanks
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

 drivers/mtd/nand/raw/ams-delta.c | 100 ++++++++++++++++++++++-----------------
 1 file changed, 56 insertions(+), 44 deletions(-)

diff --git a/drivers/mtd/nand/raw/ams-delta.c b/drivers/mtd/nand/raw/ams-delta.c
index 46193db6d368..9ca70aab199d 100644
--- a/drivers/mtd/nand/raw/ams-delta.c
+++ b/drivers/mtd/nand/raw/ams-delta.c
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
@@ -124,46 +123,66 @@ static void ams_delta_read_buf(struct nand_chip *this, u_char *buf, int len)
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
+	if (check_only)
+		return 0;
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
 
 
@@ -211,10 +230,8 @@ static int ams_delta_init(struct platform_device *pdev)
 	nand_set_controller_data(this, priv);
 
 	/* Set address of NAND IO lines */
-	this->legacy.read_byte = ams_delta_read_byte;
-	this->legacy.write_buf = ams_delta_write_buf;
-	this->legacy.read_buf = ams_delta_read_buf;
-	this->legacy.cmd_ctrl = ams_delta_hwcontrol;
+	this->select_chip = ams_delta_select_chip;
+	this->exec_op = ams_delta_exec_op;
 
 	priv->gpiod_rdy = devm_gpiod_get_optional(&pdev->dev, "rdy", GPIOD_IN);
 	if (IS_ERR(priv->gpiod_rdy)) {
@@ -223,11 +240,6 @@ static int ams_delta_init(struct platform_device *pdev)
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
