Received: from mail-lf1-x144.google.com ([2a00:1450:4864:20::144])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1g7foH-0000c3-9M
 for linux-mtd@lists.infradead.org; Wed, 03 Oct 2018 11:59:22 +0000
Received: by mail-lf1-x144.google.com with SMTP id t22-v6so3914032lfb.7
 for <linux-mtd@lists.infradead.org>; Wed, 03 Oct 2018 04:59:08 -0700 (PDT)
From: Janusz Krzysztofik <jmkrzyszt@gmail.com>
To: Boris Brezillon <boris.brezillon@bootlin.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Marek Vasut <marek.vasut@gmail.com>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, Janusz Krzysztofik <jmkrzyszt@gmail.com>
Subject: [RFC PATCH] mtd: rawnand: ams-delta: use ->exec_op()
Date: Wed,  3 Oct 2018 14:00:28 +0200
Message-Id: <20181003120028.9257-1-jmkrzyszt@gmail.com>
In-Reply-To: <20180719081508.5dafebde@bbrezillon>
References: <20180719081508.5dafebde@bbrezillon>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Replace legacy callbacks with ->select_chip() and ->exec_op().

Implementation of NAND_OP_WAITRDY_INSTR has been based on legacy
nand_wait_ready(), otherwise that function would probabaly have to be
reimplemented inside the driver.  Hence, legacy callback ->dev_ready()
is still used.

Use of IO_ADDR_R and IO_ADDR_W legacy structure members will be dropped
later, as soon as the driver is converted to use GPIO API for data I/O.

Suggested-by: Boris Brezillon <boris.brezillon@bootlin.com>
Signed-off-by: Janusz Krzysztofik <jmkrzyszt@gmail.com>
---
Hi,

I've not tested the change on hardware yet as I'm not sure if:
- handling of NCE limited to that inside ->select_chip() is
  sufficient,
- releasing ALE / CLE immediately after ams_delta_write_buf() is
  correct.
Please advise before I break my test hardware :-).

Thanks,
Janusz

 drivers/mtd/nand/raw/ams-delta.c | 83 +++++++++++++++++++++++++---------------
 1 file changed, 52 insertions(+), 31 deletions(-)

diff --git a/drivers/mtd/nand/raw/ams-delta.c b/drivers/mtd/nand/raw/ams-delta.c
index 5ba180a291eb..90c283a2c1b7 100644
--- a/drivers/mtd/nand/raw/ams-delta.c
+++ b/drivers/mtd/nand/raw/ams-delta.c
@@ -124,46 +124,69 @@ static void ams_delta_read_buf(struct nand_chip *this, u_char *buf, int len)
 		buf[i] = ams_delta_io_read(priv);
 }
 
-static u_char ams_delta_read_byte(struct nand_chip *this)
+static int ams_delta_nand_ready(struct nand_chip *this)
 {
-	u_char res;
-
-	ams_delta_read_buf(this, &res, 1);
+	struct ams_delta_nand *priv = nand_get_controller_data(this);
 
-	return res;
+	return gpiod_get_value(priv->gpiod_rdy);
 }
 
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
+	int i;
 
-	return gpiod_get_value(priv->gpiod_rdy);
+	for (i = 0; i < op->ninstrs; i++) {
+		instr = &op->instrs[i];
+
+		switch (instr->type) {
+		case NAND_OP_CMD_INSTR:
+			gpiod_set_value(priv->gpiod_cle, 1);
+			ams_delta_write_buf(this, &instr->ctx.cmd.opcode, 1);
+			gpiod_set_value(priv->gpiod_cle, 0);
+			break;
+
+		case NAND_OP_ADDR_INSTR:
+			gpiod_set_value(priv->gpiod_ale, 1);
+			ams_delta_write_buf(this, instr->ctx.addr.addrs,
+					    instr->ctx.addr.naddrs);
+			gpiod_set_value(priv->gpiod_ale, 0);
+			break;
+
+		case NAND_OP_DATA_IN_INSTR:
+			ams_delta_read_buf(this, instr->ctx.data.buf.in,
+					   instr->ctx.data.len);
+			break;
+
+		case NAND_OP_DATA_OUT_INSTR:
+			ams_delta_write_buf(this, instr->ctx.data.buf.out,
+					    instr->ctx.data.len);
+			break;
+
+		case NAND_OP_WAITRDY_INSTR:
+			if (this->legacy.dev_ready) {
+				nand_wait_ready(this);
+				break;
+			}
+
+			return nand_soft_waitrdy(this,
+						 instr->ctx.waitrdy.timeout_ms);
+		}
+	}
+
+	return 0;
 }
 
 
@@ -213,10 +236,8 @@ static int ams_delta_init(struct platform_device *pdev)
 	/* Set address of NAND IO lines */
 	this->legacy.IO_ADDR_R = io_base + OMAP_MPUIO_INPUT_LATCH;
 	this->legacy.IO_ADDR_W = io_base + OMAP_MPUIO_OUTPUT;
-	this->legacy.read_byte = ams_delta_read_byte;
-	this->legacy.write_buf = ams_delta_write_buf;
-	this->legacy.read_buf = ams_delta_read_buf;
-	this->legacy.cmd_ctrl = ams_delta_hwcontrol;
+	this->select_chip = ams_delta_select_chip;
+	this->exec_op = ams_delta_exec_op;
 
 	priv->gpiod_rdy = devm_gpiod_get_optional(&pdev->dev, "rdy", GPIOD_IN);
 	if (IS_ERR(priv->gpiod_rdy)) {
-- 
2.16.4
