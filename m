Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D6D8CCA476
	for <linux-mtd@archiver.kernel.org>; Fri, 10 Oct 2025 08:41:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XtC9R4GzeMWhoagp5w2elX3fQ2HWmywhoaUhJxIC+Bg=; b=Ao3EgXcxU0xkR0
	lWGBmwphkm0BvPRE86P8sPpY+gDOjURwKkG7rxJfjBMY68sEVFdROYZlkzzC6GkcOV5IeWlrcr/ZP
	MLu8XYu4fxq2v4f2E77m6UDUlWGaHh4oZmx/ETJpF7jKFUctK9HgsotpLrHmBTmS/awq1hERpEwO0
	Qnk4ADNTNuoF/6S4B39+AE8UoC3ziuh8HqF/p0OW9hS1fmTDa8sildhvQVC8Daz7EuChgbK/MsYRu
	s9ztJzsigHGDGdjK0Q+wM7rDUjGBSEm/rrurHtEI5geX18zXyBnBtlOrc404HDOdaS99LeFBWv3O7
	xpjeZYYananMyjo0ZQbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v78hF-000000081j2-2CFs;
	Fri, 10 Oct 2025 08:41:53 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v78hA-000000081Yh-3VGD
	for linux-mtd@lists.infradead.org;
	Fri, 10 Oct 2025 08:41:51 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 423FA1A127C;
	Fri, 10 Oct 2025 08:41:47 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 1986F60667;
	Fri, 10 Oct 2025 08:41:47 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 49547102F220A;
	Fri, 10 Oct 2025 10:41:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1760085706; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=nsm0jkpZq7oor+4Zs4Zh7Ccpu02kkLyILA1Ksn0/JSQ=;
	b=aJmBKMExRjWX9Zcru1X4GKU7Bv6EojWcypnflNV+u2InhDIGSJRLg28FyHDrnNFnd7alrK
	BsEgrqCh6NUODHQRMcQJHagUlW5L4n+sI2UF4zRp7AC2sr/mkjtogf1la1ZDyavBeJpt+3
	5wuLcbfoQwcmaeHkN4XZuRYA1LKyd7GUQZMkDeIH7KZ71vOeAjig/KKxQ/0oySb/oV7sUQ
	+WfKOx7NSHUw18mBVN2nq4zvtgb5uwh+cQRP/c3z3DqHfzTAOGpEhxTM0ZAjz4G+K2y4b3
	1Xfc3aY7kmjcC1GA2pXqCqmPwa121DmerKwzCqULWgBdpEgTBrn4iLJUxl0g6w==
From: Richard Genoud <richard.genoud@bootlin.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>
Cc: Wentao Liang <vulab@iscas.ac.cn>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	linux-mtd@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Richard Genoud <richard.genoud@bootlin.com>
Subject: [PATCH 07/15] mtd: nand: sunxi: rework pattern found registers
Date: Fri, 10 Oct 2025 10:40:34 +0200
Message-ID: <20251010084042.341224-8-richard.genoud@bootlin.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251010084042.341224-1-richard.genoud@bootlin.com>
References: <20251010084042.341224-1-richard.genoud@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251010_014149_012840_55A38FC6 
X-CRM114-Status: GOOD (  15.15  )
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

On H6/H616, the register ECC_PAT_FOUND is at its own address, and not
part of ECC status register.
So, we introduce the pattern found register offset in sunxi_nfc_caps,
along with its mask.

Also, introduce a non compile-time field_get() because FIELD_GET() and
u32_get_bits() don't work with non compile-time constant.
https://lore.kernel.org/lkml/cover.1739540679.git.geert+renesas@glider.be/

No functional change.

Signed-off-by: Richard Genoud <richard.genoud@bootlin.com>
---
 drivers/mtd/nand/raw/sunxi_nand.c | 36 ++++++++++++++++++++++++++-----
 1 file changed, 31 insertions(+), 5 deletions(-)

diff --git a/drivers/mtd/nand/raw/sunxi_nand.c b/drivers/mtd/nand/raw/sunxi_nand.c
index 6c78370a6095..8c0430fbbb38 100644
--- a/drivers/mtd/nand/raw/sunxi_nand.c
+++ b/drivers/mtd/nand/raw/sunxi_nand.c
@@ -29,6 +29,9 @@
 #include <linux/iopoll.h>
 #include <linux/reset.h>
 
+/* non compile-time field get */
+#define field_get(_mask, _reg) (((_reg) & (_mask)) >> (ffs(_mask) - 1))
+
 #define NFC_REG_CTL		0x0000
 #define NFC_REG_ST		0x0004
 #define NFC_REG_INT		0x0008
@@ -150,7 +153,13 @@
 /* define bit use in NFC_ECC_ST */
 #define NFC_ECC_ERR(x)		BIT(x)
 #define NFC_ECC_ERR_MSK		GENMASK(15, 0)
-#define NFC_ECC_PAT_FOUND(x)	BIT(x + 16)
+
+/*
+ * define bit use in NFC_REG_PAT_FOUND
+ * For A10/A23, NFC_REG_PAT_FOUND == NFC_ECC_ST register
+ */
+#define NFC_ECC_PAT_FOUND_MSK(nfc) (nfc->caps->pat_found_mask)
+
 #define NFC_ECC_ERR_CNT(b, x)	(((x) >> (((b) % 4) * 8)) & 0xff)
 
 #define NFC_DEFAULT_TIMEOUT_MS	1000
@@ -216,6 +225,8 @@ static inline struct sunxi_nand_chip *to_sunxi_nand(struct nand_chip *nand)
  * @reg_io_data:	I/O data register
  * @reg_ecc_err_cnt:	ECC error counter register
  * @reg_user_data:	User data register
+ * @reg_pat_found:	Data Pattern Status Register
+ * @pat_found_mask:	ECC_PAT_FOUND mask in NFC_REG_PAT_FOUND register
  * @dma_maxburst:	DMA maxburst
  * @ecc_strengths:	Available ECC strengths array
  * @nstrengths:		Size of @ecc_strengths
@@ -225,6 +236,8 @@ struct sunxi_nfc_caps {
 	unsigned int reg_io_data;
 	unsigned int reg_ecc_err_cnt;
 	unsigned int reg_user_data;
+	unsigned int reg_pat_found;
+	unsigned int pat_found_mask;
 	unsigned int dma_maxburst;
 	const u8 *ecc_strengths;
 	unsigned int nstrengths;
@@ -766,7 +779,8 @@ static void sunxi_nfc_hw_ecc_update_stats(struct nand_chip *nand,
 }
 
 static int sunxi_nfc_hw_ecc_correct(struct nand_chip *nand, u8 *data, u8 *oob,
-				    int step, u32 status, bool *erased)
+				    int step, u32 status, u32 pattern_found,
+				    bool *erased)
 {
 	struct sunxi_nfc *nfc = to_sunxi_nfc(nand->controller);
 	struct nand_ecc_ctrl *ecc = &nand->ecc;
@@ -777,7 +791,7 @@ static int sunxi_nfc_hw_ecc_correct(struct nand_chip *nand, u8 *data, u8 *oob,
 	if (status & NFC_ECC_ERR(step))
 		return -EBADMSG;
 
-	if (status & NFC_ECC_PAT_FOUND(step)) {
+	if (pattern_found & BIT(step)) {
 		u8 pattern;
 
 		if (unlikely(!(readl(nfc->regs + NFC_REG_PAT_ID) & 0x1))) {
@@ -811,6 +825,7 @@ static int sunxi_nfc_hw_ecc_read_chunk(struct nand_chip *nand,
 	struct sunxi_nfc *nfc = to_sunxi_nfc(nand->controller);
 	struct nand_ecc_ctrl *ecc = &nand->ecc;
 	int raw_mode = 0;
+	u32 pattern_found;
 	bool erased;
 	int ret;
 
@@ -838,8 +853,12 @@ static int sunxi_nfc_hw_ecc_read_chunk(struct nand_chip *nand,
 
 	*cur_off = oob_off + ecc->bytes + 4;
 
+	pattern_found = readl(nfc->regs + nfc->caps->reg_pat_found);
+	pattern_found = field_get(NFC_ECC_PAT_FOUND_MSK(nfc), pattern_found);
+
 	ret = sunxi_nfc_hw_ecc_correct(nand, data, oob_required ? oob : NULL, 0,
 				       readl(nfc->regs + NFC_REG_ECC_ST),
+				       pattern_found,
 				       &erased);
 	if (erased)
 		return 1;
@@ -920,7 +939,7 @@ static int sunxi_nfc_hw_ecc_read_chunks_dma(struct nand_chip *nand, uint8_t *buf
 	unsigned int max_bitflips = 0;
 	int ret, i, raw_mode = 0;
 	struct scatterlist sg;
-	u32 status, wait;
+	u32 status, pattern_found, wait;
 
 	ret = sunxi_nfc_wait_cmd_fifo_empty(nfc);
 	if (ret)
@@ -961,6 +980,8 @@ static int sunxi_nfc_hw_ecc_read_chunks_dma(struct nand_chip *nand, uint8_t *buf
 		return ret;
 
 	status = readl(nfc->regs + NFC_REG_ECC_ST);
+	pattern_found = readl(nfc->regs + nfc->caps->reg_pat_found);
+	pattern_found = field_get(NFC_ECC_PAT_FOUND_MSK(nfc), pattern_found);
 
 	for (i = 0; i < nchunks; i++) {
 		int data_off = i * ecc->size;
@@ -971,7 +992,8 @@ static int sunxi_nfc_hw_ecc_read_chunks_dma(struct nand_chip *nand, uint8_t *buf
 
 		ret = sunxi_nfc_hw_ecc_correct(nand, randomized ? data : NULL,
 					       oob_required ? oob : NULL,
-					       i, status, &erased);
+					       i, status, pattern_found,
+					       &erased);
 
 		/* ECC errors are handled in the second loop. */
 		if (ret < 0)
@@ -2185,6 +2207,8 @@ static const struct sunxi_nfc_caps sunxi_nfc_a10_caps = {
 	.reg_io_data = NFC_REG_A10_IO_DATA,
 	.reg_ecc_err_cnt = NFC_REG_A10_ECC_ERR_CNT,
 	.reg_user_data = NFC_REG_A10_USER_DATA,
+	.reg_pat_found = NFC_REG_ECC_ST,
+	.pat_found_mask = GENMASK(31, 16),
 	.dma_maxburst = 4,
 	.ecc_strengths = sunxi_ecc_strengths_a10,
 	.nstrengths = ARRAY_SIZE(sunxi_ecc_strengths_a10),
@@ -2195,6 +2219,8 @@ static const struct sunxi_nfc_caps sunxi_nfc_a23_caps = {
 	.reg_io_data = NFC_REG_A23_IO_DATA,
 	.reg_ecc_err_cnt = NFC_REG_A10_ECC_ERR_CNT,
 	.reg_user_data = NFC_REG_A10_USER_DATA,
+	.reg_pat_found = NFC_REG_ECC_ST,
+	.pat_found_mask = GENMASK(31, 16),
 	.dma_maxburst = 8,
 	.ecc_strengths = sunxi_ecc_strengths_a10,
 	.nstrengths = ARRAY_SIZE(sunxi_ecc_strengths_a10),
-- 
2.47.3


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
