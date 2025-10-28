Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99835CCF9EA
	for <linux-mtd@archiver.kernel.org>; Tue, 28 Oct 2025 07:36:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ExOnoOswp/CvvKRYllxqL12YrsQ8G29Do6SxzQOjXsA=; b=3oRVjVj4hGiTcn
	SQWK4++f3KE+WiSVa6IuWoXXIbcB3HASvUaEo2DCP7ngRlOLaLcwXryiaYF8o4sx3kMfB2fdn76mS
	6UvY8fgpJBVpSdlLjDCZ6U2yzdNK+HYjo6ZjteX2eFISoPTwLo2K9GRW6JfOjz1rNvSByC69ngku/
	fRHkTv1bBcVDHoCL9CDtQFZ5AdYIKKnJ1Kl/OYEdCUxn1bzH0FQkFWre3MigaQQYj1kH5TNH4FUcQ
	j6ZiSfNp/mHHJjvOh9LDpUomdmMJ79rstoR+jfXMA2CrYdMT+A4f5ambCmNcUYl2PwOLtVS3e+nAj
	r9u6u2CRgYBSKn5KqGAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDeFg-0000000FQdR-0sTD;
	Tue, 28 Oct 2025 07:36:20 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDeFX-0000000FQRy-2Hy7
	for linux-mtd@lists.infradead.org;
	Tue, 28 Oct 2025 07:36:14 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 2246E4E41391;
	Tue, 28 Oct 2025 07:36:10 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id EA971606AB;
	Tue, 28 Oct 2025 07:36:09 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 391D1102F251B;
	Tue, 28 Oct 2025 08:36:07 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1761636969; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=ifAJqTgwm8F4FEEPqzOTM9nQ8UFLDfY1PWOvTI7AfHE=;
	b=GLp35+q0eSEMSMgsGU7ui1Womvs4a/x6Ir/1sv5gNa7lThDfb9sqwJG8NRl9EEbms9ZHPt
	W+jGH7+Y4u9cqEvzxNQdKmAPvtODo41isJdrxbxZNV/ehs2k2n/hC5IF0UYDX8jG5dNvxL
	VkzE6KmdOOIpAPrCpWIbj0daEFJH6SGzuQbjYDfbOMA+VL/0Vncee6+3cwvUgqXQOBIurZ
	C4kHRdCzk8TsDmRD8Eq9MQPjkzRL3clrC3U9pqr3WgS1eAxT4Ch2vpUF6n8Zw5g/gTEWls
	5G/Goa7Y3HRvEhKGLb7MP0aGeK9a11hVgz5qrl9/V+ZBjLyXWyLiu+/lZJa7ww==
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
Subject: [PATCH v4 04/16] mtd: rawnand: sunxi: move ECC strenghts in sunxi_nfc_caps
Date: Tue, 28 Oct 2025 08:34:57 +0100
Message-ID: <20251028073534.526992-5-richard.genoud@bootlin.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251028073534.526992-1-richard.genoud@bootlin.com>
References: <20251028073534.526992-1-richard.genoud@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251028_003612_427347_8F48B2A1 
X-CRM114-Status: GOOD (  13.99  )
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

H6/H616 has more ECC strenghts than A10/A23.

Move the ECC strenghts array to sunxi_nfc_caps to make it ready for
H6/H616 support.

No functional change.

Reviewed-by: Chen-Yu Tsai <wens@csie.org>
Signed-off-by: Richard Genoud <richard.genoud@bootlin.com>
---
 drivers/mtd/nand/raw/sunxi_nand.c | 20 ++++++++++++++++----
 1 file changed, 16 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/nand/raw/sunxi_nand.c b/drivers/mtd/nand/raw/sunxi_nand.c
index f24e8d2083f8..89115a8f0718 100644
--- a/drivers/mtd/nand/raw/sunxi_nand.c
+++ b/drivers/mtd/nand/raw/sunxi_nand.c
@@ -224,11 +224,15 @@ static inline struct sunxi_nand_chip *to_sunxi_nand(struct nand_chip *nand)
  *			through MBUS on A23/A33 needs extra configuration.
  * @reg_io_data:	I/O data register
  * @dma_maxburst:	DMA maxburst
+ * @ecc_strengths:	Available ECC strengths array
+ * @nstrengths:		Size of @ecc_strengths
  */
 struct sunxi_nfc_caps {
 	bool has_mdma;
 	unsigned int reg_io_data;
 	unsigned int dma_maxburst;
+	const u8 *ecc_strengths;
+	unsigned int nstrengths;
 };
 
 /**
@@ -1630,9 +1634,9 @@ static int sunxi_nand_hw_ecc_ctrl_init(struct nand_chip *nand,
 				       struct nand_ecc_ctrl *ecc,
 				       struct device_node *np)
 {
-	static const u8 strengths[] = { 16, 24, 28, 32, 40, 48, 56, 60, 64 };
 	struct sunxi_nand_chip *sunxi_nand = to_sunxi_nand(nand);
 	struct sunxi_nfc *nfc = to_sunxi_nfc(nand->controller);
+	const u8 *strengths = nfc->caps->ecc_strengths;
 	struct mtd_info *mtd = nand_to_mtd(nand);
 	struct nand_device *nanddev = mtd_to_nanddev(mtd);
 	int nsectors;
@@ -1656,7 +1660,7 @@ static int sunxi_nand_hw_ecc_ctrl_init(struct nand_chip *nand,
 
 		ecc->strength = bytes * 8 / fls(8 * ecc->size);
 
-		for (i = 0; i < ARRAY_SIZE(strengths); i++) {
+		for (i = 0; i < nfc->caps->nstrengths; i++) {
 			if (strengths[i] > ecc->strength)
 				break;
 		}
@@ -1677,7 +1681,7 @@ static int sunxi_nand_hw_ecc_ctrl_init(struct nand_chip *nand,
 	}
 
 	/* Add ECC info retrieval from DT */
-	for (i = 0; i < ARRAY_SIZE(strengths); i++) {
+	for (i = 0; i < nfc->caps->nstrengths; i++) {
 		if (ecc->strength <= strengths[i]) {
 			/*
 			 * Update ecc->strength value with the actual strength
@@ -1688,7 +1692,7 @@ static int sunxi_nand_hw_ecc_ctrl_init(struct nand_chip *nand,
 		}
 	}
 
-	if (i >= ARRAY_SIZE(strengths)) {
+	if (i >= nfc->caps->nstrengths) {
 		dev_err(nfc->dev, "unsupported strength\n");
 		return -ENOTSUPP;
 	}
@@ -2178,15 +2182,23 @@ static void sunxi_nfc_remove(struct platform_device *pdev)
 		dma_release_channel(nfc->dmac);
 }
 
+static const u8 sunxi_ecc_strengths_a10[] = {
+	16, 24, 28, 32, 40, 48, 56, 60, 64
+};
+
 static const struct sunxi_nfc_caps sunxi_nfc_a10_caps = {
 	.reg_io_data = NFC_REG_A10_IO_DATA,
 	.dma_maxburst = 4,
+	.ecc_strengths = sunxi_ecc_strengths_a10,
+	.nstrengths = ARRAY_SIZE(sunxi_ecc_strengths_a10),
 };
 
 static const struct sunxi_nfc_caps sunxi_nfc_a23_caps = {
 	.has_mdma = true,
 	.reg_io_data = NFC_REG_A23_IO_DATA,
 	.dma_maxburst = 8,
+	.ecc_strengths = sunxi_ecc_strengths_a10,
+	.nstrengths = ARRAY_SIZE(sunxi_ecc_strengths_a10),
 };
 
 static const struct of_device_id sunxi_nfc_ids[] = {
-- 
2.47.3


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
