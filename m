Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7596DCCF9F8
	for <linux-mtd@archiver.kernel.org>; Fri, 31 Oct 2025 17:29:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=C4nkcRu2sSVCQZSXmx1h+HC/eh99vHMToqyEQ57ersA=; b=YMEoWDSxA4rBrb
	Czl7Ew7Q944w+WCVC+KzrbIQlrbRXnTBjaPWPMkvu3RCGcdS2PZsLz5MXf5chbSCBEMAP1i/n4cTR
	+skI3pUPUao3RUQ87EwGGPbQ9rS/dfblY0f6k6ojUVgeCLcprdIYvpu8EbD2+aE58zao5zwQjsluk
	fCcXjZ1vrITEpFElQpt6GTmVgSVjuXrgWGpvvONoRpejTCmSrF0MoLRWDt5LZURzqOgmAluTodyCm
	iLeDFXLYv4F3VjDvdxJ00RI7gBadl72RBjFjP2pTbCiShlmFd5muXjbofTziYuUF2jd3Jo8GJQEir
	fVzw0HyH3S9WJHmiZvfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEsvp-00000006Unt-44VT;
	Fri, 31 Oct 2025 17:28:57 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEsvJ-00000006UCx-1jgB
	for linux-mtd@lists.infradead.org;
	Fri, 31 Oct 2025 17:28:27 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 07E271A17C6;
	Fri, 31 Oct 2025 17:28:24 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id D311C60704;
	Fri, 31 Oct 2025 17:28:23 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 2DCCC11818466;
	Fri, 31 Oct 2025 18:28:22 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1761931703; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=BxTI4mTo3h5fG4XfRzUyD/ZIDWRXmGLam2+xDEWaA4E=;
	b=cNsTa4ZSyBQampFuf7ovFnSu6bgNfSRGhy41h6viRI44Awe7DzvvZVbtYFRLn47W4vpj/K
	2XM30byZjqSZrhQ4iHVmBesLOfNGKrHrNZGxfPb64pDrQ1uiyskLPuc2w5lpCSVrbBvXTU
	LOltk7LUMd5wT00ta5/yBM711HKPkt/aP9haD7YBFuts5CvRmelvUDAyT3Ufjcw6chLfqq
	WKLnfRJVSgSkLXIyYDRbD/42tvcKCgBS2bMe3jryHi/OiDek/Rox9gz1IjCKTKNAdNx4+V
	Y3In0+WXqnGB3L4pL/eygsyaLFVbe5wI50Wo5yU2wmKgu9SvMeTfKD+hGl7usg==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Fri, 31 Oct 2025 18:26:54 +0100
Subject: [PATCH 10/28] mtd: spinand: Make use of the operation templates
 through SPINAND_OP()
MIME-Version: 1.0
Message-Id: <20251031-winbond-v6-17-rc1-oddr-v1-10-be42de23ebf1@bootlin.com>
References: <20251031-winbond-v6-17-rc1-oddr-v1-0-be42de23ebf1@bootlin.com>
In-Reply-To: <20251031-winbond-v6-17-rc1-oddr-v1-0-be42de23ebf1@bootlin.com>
To: Mark Brown <broonie@kernel.org>, Richard Weinberger <richard@nod.at>, 
 Vignesh Raghavendra <vigneshr@ti.com>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Pratyush Yadav <pratyush@kernel.org>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Steam Lin <STLin2@winbond.com>, Santhosh Kumar K <s-k6@ti.com>, 
 linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-mtd@lists.infradead.org, Miquel Raynal <miquel.raynal@bootlin.com>
X-Mailer: b4 0.14.2
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251031_102825_915926_658D4A9F 
X-CRM114-Status: GOOD (  11.55  )
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

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/mtd/nand/spi/core.c    | 26 ++++++-------
 drivers/mtd/nand/spi/winbond.c |  3 +-
 include/linux/mtd/spinand.h    | 87 ++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 102 insertions(+), 14 deletions(-)

diff --git a/drivers/mtd/nand/spi/core.c b/drivers/mtd/nand/spi/core.c
index 11d3b28a14339282360a5ef12be715e532105e73..d4f46a17f77e15ac0ab26397e88d37119636b003 100644
--- a/drivers/mtd/nand/spi/core.c
+++ b/drivers/mtd/nand/spi/core.c
@@ -22,8 +22,8 @@
 
 int spinand_read_reg_op(struct spinand_device *spinand, u8 reg, u8 *val)
 {
-	struct spi_mem_op op = SPINAND_GET_FEATURE_1S_1S_1S_OP(reg,
-						      spinand->scratchbuf);
+	struct spi_mem_op op = SPINAND_OP(spinand, get_feature,
+					  reg, spinand->scratchbuf);
 	int ret;
 
 	ret = spi_mem_exec_op(spinand->spimem, &op);
@@ -36,8 +36,8 @@ int spinand_read_reg_op(struct spinand_device *spinand, u8 reg, u8 *val)
 
 int spinand_write_reg_op(struct spinand_device *spinand, u8 reg, u8 val)
 {
-	struct spi_mem_op op = SPINAND_SET_FEATURE_1S_1S_1S_OP(reg,
-						      spinand->scratchbuf);
+	struct spi_mem_op op = SPINAND_OP(spinand, set_feature,
+					  reg, spinand->scratchbuf);
 
 	*spinand->scratchbuf = val;
 	return spi_mem_exec_op(spinand->spimem, &op);
@@ -362,7 +362,7 @@ static void spinand_ondie_ecc_save_status(struct nand_device *nand, u8 status)
 
 int spinand_write_enable_op(struct spinand_device *spinand)
 {
-	struct spi_mem_op op = SPINAND_WR_EN_1S_0_0_OP;
+	struct spi_mem_op op = SPINAND_OP(spinand, wr_en);
 
 	return spi_mem_exec_op(spinand->spimem, &op);
 }
@@ -372,7 +372,7 @@ static int spinand_load_page_op(struct spinand_device *spinand,
 {
 	struct nand_device *nand = spinand_to_nand(spinand);
 	unsigned int row = nanddev_pos_to_row(nand, &req->pos);
-	struct spi_mem_op op = SPINAND_PAGE_READ_1S_1S_0_OP(row);
+	struct spi_mem_op op = SPINAND_OP(spinand, page_read, row);
 
 	return spi_mem_exec_op(spinand->spimem, &op);
 }
@@ -527,7 +527,7 @@ static int spinand_program_op(struct spinand_device *spinand,
 {
 	struct nand_device *nand = spinand_to_nand(spinand);
 	unsigned int row = nanddev_pos_to_row(nand, &req->pos);
-	struct spi_mem_op op = SPINAND_PROG_EXEC_1S_1S_0_OP(row);
+	struct spi_mem_op op = SPINAND_OP(spinand, prog_exec, row);
 
 	return spi_mem_exec_op(spinand->spimem, &op);
 }
@@ -537,7 +537,7 @@ static int spinand_erase_op(struct spinand_device *spinand,
 {
 	struct nand_device *nand = spinand_to_nand(spinand);
 	unsigned int row = nanddev_pos_to_row(nand, pos);
-	struct spi_mem_op op = SPINAND_BLK_ERASE_1S_1S_0_OP(row);
+	struct spi_mem_op op = SPINAND_OP(spinand, blk_erase, row);
 
 	return spi_mem_exec_op(spinand->spimem, &op);
 }
@@ -557,8 +557,8 @@ static int spinand_erase_op(struct spinand_device *spinand,
 int spinand_wait(struct spinand_device *spinand, unsigned long initial_delay_us,
 		 unsigned long poll_delay_us, u8 *s)
 {
-	struct spi_mem_op op = SPINAND_GET_FEATURE_1S_1S_1S_OP(REG_STATUS,
-							       spinand->scratchbuf);
+	struct spi_mem_op op = SPINAND_OP(spinand, get_feature,
+					  REG_STATUS, spinand->scratchbuf);
 	u8 status;
 	int ret;
 
@@ -591,8 +591,8 @@ int spinand_wait(struct spinand_device *spinand, unsigned long initial_delay_us,
 static int spinand_read_id_op(struct spinand_device *spinand, u8 naddr,
 			      u8 ndummy, u8 *buf)
 {
-	struct spi_mem_op op = SPINAND_READID_1S_1S_1S_OP(
-		naddr, ndummy, spinand->scratchbuf, SPINAND_MAX_ID_LEN);
+	struct spi_mem_op op = SPINAND_OP(spinand, readid,
+					  naddr, ndummy, spinand->scratchbuf, SPINAND_MAX_ID_LEN);
 	int ret;
 
 	ret = spi_mem_exec_op(spinand->spimem, &op);
@@ -604,7 +604,7 @@ static int spinand_read_id_op(struct spinand_device *spinand, u8 naddr,
 
 static int spinand_reset_op(struct spinand_device *spinand)
 {
-	struct spi_mem_op op = SPINAND_RESET_1S_0_0_OP;
+	struct spi_mem_op op = SPINAND_OP(spinand, reset);
 	int ret;
 
 	ret = spi_mem_exec_op(spinand->spimem, &op);
diff --git a/drivers/mtd/nand/spi/winbond.c b/drivers/mtd/nand/spi/winbond.c
index d5799c2df06520de6cb5c5b771ceeb9d11ddf1fb..bfec5d037f25b81a3c90feba666fe8283a41ddb1 100644
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
index 4afebaf5f0195b9bc617ea1f125f637f76fff9f8..a8fd04a67cfa9925bd68c57539d86e0816b76274 100644
--- a/include/linux/mtd/spinand.h
+++ b/include/linux/mtd/spinand.h
@@ -701,6 +701,93 @@ struct spinand_device {
 			     unsigned int retry_mode);
 };
 
+static inline struct spi_mem_op
+spinand_fill_reset_op(struct spinand_device *spinand)
+{
+	return spinand->op_templates->reset;
+}
+
+static inline struct spi_mem_op
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
+static inline struct spi_mem_op
+spinand_fill_wr_en_op(struct spinand_device *spinand)
+{
+	return spinand->op_templates->wr_en;
+}
+
+static inline struct spi_mem_op
+spinand_fill_wr_dis_op(struct spinand_device *spinand)
+{
+	return spinand->op_templates->wr_dis;
+}
+
+static inline struct spi_mem_op
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
+static inline struct spi_mem_op
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
+static inline struct spi_mem_op
+spinand_fill_blk_erase_op(struct spinand_device *spinand, u64 addr)
+{
+	struct spi_mem_op op = spinand->op_templates->blk_erase;
+
+	op.addr.val = addr;
+
+	return op;
+}
+
+static inline struct spi_mem_op
+spinand_fill_page_read_op(struct spinand_device *spinand, u64 addr)
+{
+	struct spi_mem_op op = spinand->op_templates->page_read;
+
+	op.addr.val = addr;
+
+	return op;
+}
+
+static inline struct spi_mem_op
+spinand_fill_prog_exec_op(struct spinand_device *spinand, u64 addr)
+{
+	struct spi_mem_op op = spinand->op_templates->prog_exec;
+
+	op.addr.val = addr;
+
+	return op;
+}
+
+#define SPINAND_OP(spinand, op_name, ...)			\
+	spinand_fill_ ## op_name ## _op(spinand, ##__VA_ARGS__)
+
 /**
  * mtd_to_spinand() - Get the SPI NAND device attached to an MTD instance
  * @mtd: MTD instance

-- 
2.51.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
