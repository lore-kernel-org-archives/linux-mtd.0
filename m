Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97ECAD26D6F
	for <linux-mtd@archiver.kernel.org>; Fri,  9 Jan 2026 17:18:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tYa3W9McXuWoGHvQ84GNhIVTkgLopka0OuKIDkeS9JY=; b=tksJGpZDSLPwCn
	4XH6pTTUD4VCIc9wbUoy8x74Ze2+Qck6YKWXjt7FZvLR3aZJ0O04bH9/piSaZ5M5So3mbiykz4dyv
	m38LibbtvWrbPS4yJeNG6ULlr7j7ut8oFHmFChW5aEooWz1wvyVxpcv+9wlGsRhxEgN7fsz6J4fzd
	oee8lgPL7HAniIZ0t8MKXV3iYnzKmVGaEns6w2oGWIZWjRY2cHaY5z4M51rBGnML/JOEqFQlouy+q
	VWVmG9VdQobR4XOh8nfz1IXfUnMgqk4YXqjBIzcrF0wEc9DrAN37uy8u9btM/6slPN7hnAYRPrkFL
	T0y+FnTln4TeqWRI+SbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1veG8B-00000002lyT-1a2w;
	Fri, 09 Jan 2026 17:18:35 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1veG88-00000002lt3-3VMd
	for linux-mtd@lists.infradead.org;
	Fri, 09 Jan 2026 17:18:34 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 6CD6B1A2753;
	Fri,  9 Jan 2026 17:18:31 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 3FBF5606C6;
	Fri,  9 Jan 2026 17:18:31 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 990CB103C89B2;
	Fri,  9 Jan 2026 18:18:29 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1767979110; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=47BFkvp1DEd5/5BI/hfjcGhX9bpoRnXfqFY5VY7IdiU=;
	b=vUVL8aAC94fy4qJjrT/nxxn5sEgLApkL10IK2BfakUtcEHgPZGwrMYKs9KjyZG4exKeX9n
	vANJyIrcpl+5TXKiGI2u2SX82e0hKgdMtjR02RdPNEJKmCLuo99D53M7YLaqfj1NDi3ITq
	MtzaOkGPoDCnNwwICkLHIG2DR9EsqrsNPCZJqnYeZhH99f2Ld6MEiOOjTn3JcEkn1oNsMG
	wVPiNsgZM3WQJ4iiRkcUNBI84F0Qru9hvI/OYXQey2iIVc9CJJ5Eq9Ki1bdldr8xC266Az
	RNDTOrsX0/NZdyoNs3NK7N2eemAs7FJy7dMeN9/ufAAOd6eLfU84v39+AbUu7Q==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Fri, 09 Jan 2026 18:18:08 +0100
Subject: [PATCH v2 10/27] mtd: spinand: Make use of the operation templates
 through SPINAND_OP()
MIME-Version: 1.0
Message-Id: <20260109-winbond-v6-17-rc1-oddr-v2-10-1fff6a2ddb80@bootlin.com>
References: <20260109-winbond-v6-17-rc1-oddr-v2-0-1fff6a2ddb80@bootlin.com>
In-Reply-To: <20260109-winbond-v6-17-rc1-oddr-v2-0-1fff6a2ddb80@bootlin.com>
To: Mark Brown <broonie@kernel.org>, Richard Weinberger <richard@nod.at>, 
 Vignesh Raghavendra <vigneshr@ti.com>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Pratyush Yadav <pratyush@kernel.org>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Steam Lin <STLin2@winbond.com>, Santhosh Kumar K <s-k6@ti.com>, 
 linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-mtd@lists.infradead.org, Miquel Raynal <miquel.raynal@bootlin.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260109_091833_178406_503FBFF4 
X-CRM114-Status: GOOD (  15.45  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Create a SPINAND_OP() macro to which we give the name of the operation
we want. This macro retrieves the correct operation template based on
the current bus interface (currently only single SDR, will soon be
extended to octal DTR) and fills it with the usual parameters.

This macro makes the transition from calling directly the low-level
macros into using the (bus interface dependent) templates very smooth.
Use it in all places that can be trivially converted. At this stage
there is no functional change expected, until octal DTR support gets
added.

Reviewed-by: Tudor Ambarus <tudor.ambarus@linaro.org>
Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/mtd/nand/spi/core.c       | 110 +++++++++++++++++++++++++++++++++-----
 drivers/mtd/nand/spi/esmt.c       |   4 +-
 drivers/mtd/nand/spi/gigadevice.c |   8 +--
 drivers/mtd/nand/spi/macronix.c   |   4 +-
 drivers/mtd/nand/spi/micron.c     |   8 +--
 drivers/mtd/nand/spi/toshiba.c    |   3 +-
 drivers/mtd/nand/spi/winbond.c    |   3 +-
 include/linux/mtd/spinand.h       |   8 +++
 8 files changed, 121 insertions(+), 27 deletions(-)

diff --git a/drivers/mtd/nand/spi/core.c b/drivers/mtd/nand/spi/core.c
index 3e1b6c6c6a22..609a955788fa 100644
--- a/drivers/mtd/nand/spi/core.c
+++ b/drivers/mtd/nand/spi/core.c
@@ -20,10 +20,94 @@
 #include <linux/spi/spi.h>
 #include <linux/spi/spi-mem.h>
 
+static struct spi_mem_op
+spinand_fill_reset_op(struct spinand_device *spinand)
+{
+	return spinand->op_templates->reset;
+}
+
+static struct spi_mem_op
+spinand_fill_readid_op(struct spinand_device *spinand,
+		       u8 naddr, u8 ndummy, void *buf, unsigned int len)
+{
+	struct spi_mem_op op = spinand->op_templates->readid;
+
+	op.addr.nbytes = naddr;
+	op.dummy.nbytes = ndummy;
+	op.data.buf.in = buf;
+	op.data.nbytes = len;
+
+	return op;
+}
+
+struct spi_mem_op
+spinand_fill_wr_en_op(struct spinand_device *spinand)
+{
+	return spinand->op_templates->wr_en;
+}
+
+static __maybe_unused struct spi_mem_op
+spinand_fill_wr_dis_op(struct spinand_device *spinand)
+{
+	return spinand->op_templates->wr_dis;
+}
+
+struct spi_mem_op
+spinand_fill_set_feature_op(struct spinand_device *spinand, u64 reg, const void *valptr)
+{
+	struct spi_mem_op op = spinand->op_templates->set_feature;
+
+	op.addr.val = reg;
+	op.data.buf.out = valptr;
+
+	return op;
+}
+
+struct spi_mem_op
+spinand_fill_get_feature_op(struct spinand_device *spinand, u64 reg, void *valptr)
+{
+	struct spi_mem_op op = spinand->op_templates->get_feature;
+
+	op.addr.val = reg;
+	op.data.buf.in = valptr;
+
+	return op;
+}
+
+static struct spi_mem_op
+spinand_fill_blk_erase_op(struct spinand_device *spinand, u64 addr)
+{
+	struct spi_mem_op op = spinand->op_templates->blk_erase;
+
+	op.addr.val = addr;
+
+	return op;
+}
+
+static struct spi_mem_op
+spinand_fill_page_read_op(struct spinand_device *spinand, u64 addr)
+{
+	struct spi_mem_op op = spinand->op_templates->page_read;
+
+	op.addr.val = addr;
+
+	return op;
+}
+
+struct spi_mem_op
+spinand_fill_prog_exec_op(struct spinand_device *spinand, u64 addr)
+{
+	struct spi_mem_op op = spinand->op_templates->prog_exec;
+
+	op.addr.val = addr;
+
+	return op;
+}
+
 int spinand_read_reg_op(struct spinand_device *spinand, u8 reg, u8 *val)
 {
-	struct spi_mem_op op = SPINAND_GET_FEATURE_1S_1S_1S_OP(reg,
-						      spinand->scratchbuf);
+	struct spi_mem_op op = SPINAND_OP(spinand, get_feature,
+					  reg, spinand->scratchbuf);
 	int ret;
 
 	ret = spi_mem_exec_op(spinand->spimem, &op);
@@ -36,8 +120,8 @@ int spinand_read_reg_op(struct spinand_device *spinand, u8 reg, u8 *val)
 
 int spinand_write_reg_op(struct spinand_device *spinand, u8 reg, u8 val)
 {
-	struct spi_mem_op op = SPINAND_SET_FEATURE_1S_1S_1S_OP(reg,
-						      spinand->scratchbuf);
+	struct spi_mem_op op = SPINAND_OP(spinand, set_feature,
+					  reg, spinand->scratchbuf);
 
 	*spinand->scratchbuf = val;
 	return spi_mem_exec_op(spinand->spimem, &op);
@@ -362,7 +446,7 @@ static void spinand_ondie_ecc_save_status(struct nand_device *nand, u8 status)
 
 int spinand_write_enable_op(struct spinand_device *spinand)
 {
-	struct spi_mem_op op = SPINAND_WR_EN_1S_0_0_OP;
+	struct spi_mem_op op = SPINAND_OP(spinand, wr_en);
 
 	return spi_mem_exec_op(spinand->spimem, &op);
 }
@@ -372,7 +456,7 @@ static int spinand_load_page_op(struct spinand_device *spinand,
 {
 	struct nand_device *nand = spinand_to_nand(spinand);
 	unsigned int row = nanddev_pos_to_row(nand, &req->pos);
-	struct spi_mem_op op = SPINAND_PAGE_READ_1S_1S_0_OP(row);
+	struct spi_mem_op op = SPINAND_OP(spinand, page_read, row);
 
 	return spi_mem_exec_op(spinand->spimem, &op);
 }
@@ -527,7 +611,7 @@ static int spinand_program_op(struct spinand_device *spinand,
 {
 	struct nand_device *nand = spinand_to_nand(spinand);
 	unsigned int row = nanddev_pos_to_row(nand, &req->pos);
-	struct spi_mem_op op = SPINAND_PROG_EXEC_1S_1S_0_OP(row);
+	struct spi_mem_op op = SPINAND_OP(spinand, prog_exec, row);
 
 	return spi_mem_exec_op(spinand->spimem, &op);
 }
@@ -537,7 +621,7 @@ static int spinand_erase_op(struct spinand_device *spinand,
 {
 	struct nand_device *nand = spinand_to_nand(spinand);
 	unsigned int row = nanddev_pos_to_row(nand, pos);
-	struct spi_mem_op op = SPINAND_BLK_ERASE_1S_1S_0_OP(row);
+	struct spi_mem_op op = SPINAND_OP(spinand, blk_erase, row);
 
 	return spi_mem_exec_op(spinand->spimem, &op);
 }
@@ -557,8 +641,8 @@ static int spinand_erase_op(struct spinand_device *spinand,
 int spinand_wait(struct spinand_device *spinand, unsigned long initial_delay_us,
 		 unsigned long poll_delay_us, u8 *s)
 {
-	struct spi_mem_op op = SPINAND_GET_FEATURE_1S_1S_1S_OP(REG_STATUS,
-							       spinand->scratchbuf);
+	struct spi_mem_op op = SPINAND_OP(spinand, get_feature,
+					  REG_STATUS, spinand->scratchbuf);
 	u8 status;
 	int ret;
 
@@ -591,8 +675,8 @@ int spinand_wait(struct spinand_device *spinand, unsigned long initial_delay_us,
 static int spinand_read_id_op(struct spinand_device *spinand, u8 naddr,
 			      u8 ndummy, u8 *buf)
 {
-	struct spi_mem_op op = SPINAND_READID_1S_1S_1S_OP(
-		naddr, ndummy, spinand->scratchbuf, SPINAND_MAX_ID_LEN);
+	struct spi_mem_op op = SPINAND_OP(spinand, readid,
+					  naddr, ndummy, spinand->scratchbuf, SPINAND_MAX_ID_LEN);
 	int ret;
 
 	ret = spi_mem_exec_op(spinand->spimem, &op);
@@ -604,7 +688,7 @@ static int spinand_read_id_op(struct spinand_device *spinand, u8 naddr,
 
 static int spinand_reset_op(struct spinand_device *spinand)
 {
-	struct spi_mem_op op = SPINAND_RESET_1S_0_0_OP;
+	struct spi_mem_op op = SPINAND_OP(spinand, reset);
 	int ret;
 
 	ret = spi_mem_exec_op(spinand->spimem, &op);
diff --git a/drivers/mtd/nand/spi/esmt.c b/drivers/mtd/nand/spi/esmt.c
index adadc01e8f2f..3020aa89a495 100644
--- a/drivers/mtd/nand/spi/esmt.c
+++ b/drivers/mtd/nand/spi/esmt.c
@@ -138,8 +138,8 @@ static int f50l1g41lb_user_otp_info(struct spinand_device *spinand, size_t len,
 static int f50l1g41lb_otp_lock(struct spinand_device *spinand, loff_t from,
 			       size_t len)
 {
-	struct spi_mem_op write_op = SPINAND_WR_EN_1S_0_0_OP;
-	struct spi_mem_op exec_op = SPINAND_PROG_EXEC_1S_1S_0_OP(0);
+	struct spi_mem_op write_op = SPINAND_OP(spinand, wr_en);
+	struct spi_mem_op exec_op = SPINAND_OP(spinand, prog_exec, 0);
 	u8 status;
 	int ret;
 
diff --git a/drivers/mtd/nand/spi/gigadevice.c b/drivers/mtd/nand/spi/gigadevice.c
index 72ad36c9a126..e4380208edd0 100644
--- a/drivers/mtd/nand/spi/gigadevice.c
+++ b/drivers/mtd/nand/spi/gigadevice.c
@@ -266,8 +266,8 @@ static int gd5fxgq4uexxg_ecc_get_status(struct spinand_device *spinand,
 					u8 status)
 {
 	u8 status2;
-	struct spi_mem_op op = SPINAND_GET_FEATURE_1S_1S_1S_OP(GD5FXGQXXEXXG_REG_STATUS2,
-						      spinand->scratchbuf);
+	struct spi_mem_op op = SPINAND_OP(spinand, get_feature,
+					  GD5FXGQXXEXXG_REG_STATUS2, spinand->scratchbuf);
 	int ret;
 
 	switch (status & STATUS_ECC_MASK) {
@@ -309,8 +309,8 @@ static int gd5fxgq5xexxg_ecc_get_status(struct spinand_device *spinand,
 					u8 status)
 {
 	u8 status2;
-	struct spi_mem_op op = SPINAND_GET_FEATURE_1S_1S_1S_OP(GD5FXGQXXEXXG_REG_STATUS2,
-						      spinand->scratchbuf);
+	struct spi_mem_op op = SPINAND_OP(spinand, get_feature,
+					  GD5FXGQXXEXXG_REG_STATUS2, spinand->scratchbuf);
 	int ret;
 
 	switch (status & STATUS_ECC_MASK) {
diff --git a/drivers/mtd/nand/spi/macronix.c b/drivers/mtd/nand/spi/macronix.c
index edf63b9996cf..143cc120bdec 100644
--- a/drivers/mtd/nand/spi/macronix.c
+++ b/drivers/mtd/nand/spi/macronix.c
@@ -148,8 +148,8 @@ static int macronix_set_cont_read(struct spinand_device *spinand, bool enable)
 static int macronix_set_read_retry(struct spinand_device *spinand,
 					     unsigned int retry_mode)
 {
-	struct spi_mem_op op = SPINAND_SET_FEATURE_1S_1S_1S_OP(MACRONIX_FEATURE_ADDR_READ_RETRY,
-							       spinand->scratchbuf);
+	struct spi_mem_op op = SPINAND_OP(spinand, set_feature,
+					  MACRONIX_FEATURE_ADDR_READ_RETRY, spinand->scratchbuf);
 
 	*spinand->scratchbuf = retry_mode;
 	return spi_mem_exec_op(spinand->spimem, &op);
diff --git a/drivers/mtd/nand/spi/micron.c b/drivers/mtd/nand/spi/micron.c
index b8130e04e8e7..36f6cbbd7462 100644
--- a/drivers/mtd/nand/spi/micron.c
+++ b/drivers/mtd/nand/spi/micron.c
@@ -137,8 +137,8 @@ static const struct mtd_ooblayout_ops micron_4_ooblayout = {
 static int micron_select_target(struct spinand_device *spinand,
 				unsigned int target)
 {
-	struct spi_mem_op op = SPINAND_SET_FEATURE_1S_1S_1S_OP(MICRON_DIE_SELECT_REG,
-						      spinand->scratchbuf);
+	struct spi_mem_op op = SPINAND_OP(spinand, set_feature,
+					  MICRON_DIE_SELECT_REG, spinand->scratchbuf);
 
 	if (target > 1)
 		return -EINVAL;
@@ -251,8 +251,8 @@ static int mt29f2g01abagd_user_otp_info(struct spinand_device *spinand,
 static int mt29f2g01abagd_otp_lock(struct spinand_device *spinand, loff_t from,
 				   size_t len)
 {
-	struct spi_mem_op write_op = SPINAND_WR_EN_1S_0_0_OP;
-	struct spi_mem_op exec_op = SPINAND_PROG_EXEC_1S_1S_0_OP(0);
+	struct spi_mem_op write_op = SPINAND_OP(spinand, wr_en);
+	struct spi_mem_op exec_op = SPINAND_OP(spinand, prog_exec, 0);
 	u8 status;
 	int ret;
 
diff --git a/drivers/mtd/nand/spi/toshiba.c b/drivers/mtd/nand/spi/toshiba.c
index 6530257ac0be..ef649162ee68 100644
--- a/drivers/mtd/nand/spi/toshiba.c
+++ b/drivers/mtd/nand/spi/toshiba.c
@@ -73,7 +73,8 @@ static int tx58cxgxsxraix_ecc_get_status(struct spinand_device *spinand,
 {
 	struct nand_device *nand = spinand_to_nand(spinand);
 	u8 mbf = 0;
-	struct spi_mem_op op = SPINAND_GET_FEATURE_1S_1S_1S_OP(0x30, spinand->scratchbuf);
+	struct spi_mem_op op = SPINAND_OP(spinand, get_feature,
+					  0x30, spinand->scratchbuf);
 
 	switch (status & STATUS_ECC_MASK) {
 	case STATUS_ECC_NO_BITFLIPS:
diff --git a/drivers/mtd/nand/spi/winbond.c b/drivers/mtd/nand/spi/winbond.c
index d5799c2df065..bfec5d037f25 100644
--- a/drivers/mtd/nand/spi/winbond.c
+++ b/drivers/mtd/nand/spi/winbond.c
@@ -251,7 +251,8 @@ static int w25n02kv_ecc_get_status(struct spinand_device *spinand,
 {
 	struct nand_device *nand = spinand_to_nand(spinand);
 	u8 mbf = 0;
-	struct spi_mem_op op = SPINAND_GET_FEATURE_1S_1S_1S_OP(0x30, spinand->scratchbuf);
+	struct spi_mem_op op = SPINAND_OP(spinand, get_feature,
+					  0x30, spinand->scratchbuf);
 
 	switch (status & STATUS_ECC_MASK) {
 	case STATUS_ECC_NO_BITFLIPS:
diff --git a/include/linux/mtd/spinand.h b/include/linux/mtd/spinand.h
index 2691b5818f77..f579245c90a6 100644
--- a/include/linux/mtd/spinand.h
+++ b/include/linux/mtd/spinand.h
@@ -702,6 +702,14 @@ struct spinand_device {
 			     unsigned int retry_mode);
 };
 
+struct spi_mem_op spinand_fill_wr_en_op(struct spinand_device *spinand);
+struct spi_mem_op spinand_fill_set_feature_op(struct spinand_device *spinand, u64 reg, const void *valptr);
+struct spi_mem_op spinand_fill_get_feature_op(struct spinand_device *spinand, u64 reg, void *valptr);
+struct spi_mem_op spinand_fill_prog_exec_op(struct spinand_device *spinand, u64 addr);
+
+#define SPINAND_OP(spinand, op_name, ...)			\
+	spinand_fill_ ## op_name ## _op(spinand, ##__VA_ARGS__)
+
 /**
  * mtd_to_spinand() - Get the SPI NAND device attached to an MTD instance
  * @mtd: MTD instance

-- 
2.51.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
