Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDB82CCD183
	for <linux-mtd@archiver.kernel.org>; Mon, 13 Oct 2025 15:27:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Qjs1uavrDLzR9hcglWINOkDyqJXdJBbWTDvxvYRFk68=; b=YtPrm6QudGzOL4
	tEVY5ZDGo2Xw3GSIp1EW/0UKeQ/Y55g6yuslVZ95u3sxLGC+GfxCc3pBmRTcpRnblnRXuP0FMEzNg
	V+p4HEF8JlceXAzftSqKHVOxbaQyOM02eU8ticc1h4BGa5wpEzw++sZb6IxCSrnrhjSTIfOlc3Z5a
	PjomwP6uc7a4Q8HaxfJKKS1B8aDhhNqufftA5/O2MEssa0VFRtpUl60I+0Ecv54l/BJaFMxjP+IO3
	YSd2hHH9sp8oR/EzKHqFWQdXrlxxS5ujFNT00r5nOiSoE9HaYp2RMIPCuyQFtoZpWmKfaWJIsdWEf
	YJJhVmxex/OSB+ISNWjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8KSk-0000000DeWe-1ytI;
	Mon, 13 Oct 2025 15:27:50 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8KSf-0000000DeMO-1nws
	for linux-mtd@lists.infradead.org;
	Mon, 13 Oct 2025 15:27:47 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 63821C093AE;
	Mon, 13 Oct 2025 15:27:24 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 561B66067B;
	Mon, 13 Oct 2025 15:27:43 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id AC2C8102F2275;
	Mon, 13 Oct 2025 17:27:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1760369261; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=st75JxbS+dE80KXQ+nIOup4Lt/bHkhA0Xk0EIDuORe8=;
	b=kKjhMiQIR1ONltBRK+YCPfF8hPjRa5CLfZBI6cVuvfP4pcy43B9HY/9w6WdwhWamcJLctZ
	eLVADg+Aly2GInle8xbd5MztEu7ibP8fPWOEwm4QHFxbyoNk7v+9xDjmWFnLAvED6ImPT8
	69WL849RJzHFGqTpw/R9GOXS29IVebGG8jMr/2YIEZUbC2S3ZxtlF0Quc7UnJVaqz4hqOU
	Xx2/ZtTP92m7xcvYsg9NU7ttDSG0xGna3OGipVJLDNG9A5rm2N87TWDVBIlrTJ00sKDSQ1
	y21i23Ut3CcBmHoAPtr+4SrlqbE8Bs3gUPMNcfKHCYdC0J8cURqXa9Gcj+piig==
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
Cc: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
	Wentao Liang <vulab@iscas.ac.cn>,
	Johan Hovold <johan@kernel.org>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	linux-mtd@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Richard Genoud <richard.genoud@bootlin.com>
Subject: [PATCH v2 07/15] mtd: rawnand: sunxi: introduce ecc_mode_mask in sunxi_nfc_caps
Date: Mon, 13 Oct 2025 17:26:37 +0200
Message-ID: <20251013152645.1119308-8-richard.genoud@bootlin.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251013152645.1119308-1-richard.genoud@bootlin.com>
References: <20251013152645.1119308-1-richard.genoud@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251013_082745_716649_55FEF11C 
X-CRM114-Status: GOOD (  12.20  )
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

The H6/H616 ECC_MODE field is not at the same offset, and has not the
same size.
So move the mask into sunxi_nfc_caps.

No functional change.

Signed-off-by: Richard Genoud <richard.genoud@bootlin.com>
---
 drivers/mtd/nand/raw/sunxi_nand.c | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/nand/raw/sunxi_nand.c b/drivers/mtd/nand/raw/sunxi_nand.c
index 70c940840dda..4118307cac15 100644
--- a/drivers/mtd/nand/raw/sunxi_nand.c
+++ b/drivers/mtd/nand/raw/sunxi_nand.c
@@ -29,8 +29,9 @@
 #include <linux/iopoll.h>
 #include <linux/reset.h>
 
-/* non compile-time field get */
+/* non compile-time field get/prep */
 #define field_get(_mask, _reg) (((_reg) & (_mask)) >> (ffs(_mask) - 1))
+#define field_prep(_mask, _val) (((_val) << (ffs(_mask) - 1)) & (_mask))
 
 #define NFC_REG_CTL		0x0000
 #define NFC_REG_ST		0x0004
@@ -145,8 +146,8 @@
 #define NFC_ECC_BLOCK_512	BIT(5)
 #define NFC_RANDOM_EN		BIT(9)
 #define NFC_RANDOM_DIRECTION	BIT(10)
-#define NFC_ECC_MODE_MSK	GENMASK(15, 12)
-#define NFC_ECC_MODE(x)		((x) << 12)
+#define NFC_ECC_MODE_MSK(nfc)	(nfc->caps->ecc_mode_mask)
+#define NFC_ECC_MODE(nfc, x)	field_prep(NFC_ECC_MODE_MSK(nfc), (x))
 #define NFC_RANDOM_SEED_MSK	GENMASK(30, 16)
 #define NFC_RANDOM_SEED(x)	((x) << 16)
 
@@ -227,6 +228,7 @@ static inline struct sunxi_nand_chip *to_sunxi_nand(struct nand_chip *nand)
  * @reg_ecc_err_cnt:	ECC error counter register
  * @reg_user_data:	User data register
  * @reg_pat_found:	Data Pattern Status Register
+ * @ecc_mode_mask:	ECC_MODE mask in NFC_ECC_CTL register
  * @pat_found_mask:	ECC_PAT_FOUND mask in NFC_REG_PAT_FOUND register
  * @dma_maxburst:	DMA maxburst
  * @ecc_strengths:	Available ECC strengths array
@@ -239,6 +241,7 @@ struct sunxi_nfc_caps {
 	unsigned int reg_ecc_err_cnt;
 	unsigned int reg_user_data;
 	unsigned int reg_pat_found;
+	unsigned int ecc_mode_mask;
 	unsigned int pat_found_mask;
 	unsigned int dma_maxburst;
 	const u8 *ecc_strengths;
@@ -1747,7 +1750,7 @@ static int sunxi_nand_hw_ecc_ctrl_init(struct nand_chip *nand,
 	ecc->read_oob_raw = nand_read_oob_std;
 	ecc->write_oob_raw = nand_write_oob_std;
 
-	sunxi_nand->ecc.ecc_ctl = NFC_ECC_MODE(i) | NFC_ECC_EXCEPTION |
+	sunxi_nand->ecc.ecc_ctl = NFC_ECC_MODE(nfc, i) | NFC_ECC_EXCEPTION |
 				  NFC_ECC_PIPELINE | NFC_ECC_EN;
 
 	if (ecc->size == 512) {
@@ -2217,6 +2220,7 @@ static const struct sunxi_nfc_caps sunxi_nfc_a10_caps = {
 	.reg_ecc_err_cnt = NFC_REG_A10_ECC_ERR_CNT,
 	.reg_user_data = NFC_REG_A10_USER_DATA,
 	.reg_pat_found = NFC_REG_ECC_ST,
+	.ecc_mode_mask = GENMASK(15, 12),
 	.pat_found_mask = GENMASK(31, 16),
 	.dma_maxburst = 4,
 	.ecc_strengths = sunxi_ecc_strengths_a10,
@@ -2230,6 +2234,7 @@ static const struct sunxi_nfc_caps sunxi_nfc_a23_caps = {
 	.reg_ecc_err_cnt = NFC_REG_A10_ECC_ERR_CNT,
 	.reg_user_data = NFC_REG_A10_USER_DATA,
 	.reg_pat_found = NFC_REG_ECC_ST,
+	.ecc_mode_mask = GENMASK(15, 12),
 	.pat_found_mask = GENMASK(31, 16),
 	.dma_maxburst = 8,
 	.ecc_strengths = sunxi_ecc_strengths_a10,

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
