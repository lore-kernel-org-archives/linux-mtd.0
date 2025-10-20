Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED076CCD199
	for <linux-mtd@archiver.kernel.org>; Mon, 20 Oct 2025 10:14:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3J/hHDUVR2iiguj/TEYy6RjdiTa8wuy5Qmr1hFPplzQ=; b=epVD0Yu6th8t1+
	o/qlsftUzNSB/WyxRX/3srT/NbZQ96A204MIiX1OzuLSQg4GQ5qSVfZQF7Jq2xkHbYgKcYROqOOqO
	Oixhz+owMIPrF1CMismaWOnjDJopaoh/LoMo3UKdmsvixGEDns80F/hVdZluNAAqqQL2AIjOK3j92
	voyqQbo6MmHU+YE3fMrXioRpxuvWInrX0dolnsbY2NI/WzZTHLgY1E0hed25RJYxq3gRIxGr34uox
	HQ2BQTD2hBetIUxTQcDsyCVVu6lHmmY7vczxfnmP1SiZHgZJC19x/QkBd0gyD1En3mFNC7ob3gqQK
	1x7xBcANFm9/sojgKhZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAmuR-0000000CnRZ-3kXT;
	Mon, 20 Oct 2025 10:14:35 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAmu1-0000000Cmo7-0fcT
	for linux-mtd@lists.infradead.org;
	Mon, 20 Oct 2025 10:14:10 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 58C3AC0AFE4;
	Mon, 20 Oct 2025 10:13:47 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id DEEF6606D5;
	Mon, 20 Oct 2025 10:14:06 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 85A58102F0848;
	Mon, 20 Oct 2025 12:14:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1760955246; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=FMTlrYQnhBYB/I9vVH4uQ6alkyuaVWds87Lxblu5MFA=;
	b=JTi3XvXqyLRTc+1kHnPUqWRUc9qyZwtWY0VW5qn0J0rDE6U+sZLJTLmaR8LU8yygaX35fJ
	Uq470RNzBS0TJKthvzrCIbdrpK6i4jU+74OyjQaz9ufFx3GNS7qWim3I+iQ7Flee+ro7KH
	x+A3/dXToE7lBwsAXWzCh1dgrZ/ySZVcLRPSTxu+2MVYUWfuRqodXv9/t3xOzz1L4+jylC
	Z8phuAlG4sP6WWhBcAqnFfy9VudrUXoAdYA/JYsb4SxdS06zazNzqE37SNEaVkr4+09y6O
	wlrEz9X1nNeTj7Z0PwTRDUiq8M++OSn+dDBsAk9bdemWuv0cFzsHuH3x0gtpwA==
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
Subject: [PATCH v3 11/15] mtd: rawnand: sunxi: introduce ecc_err_mask in sunxi_nfc_caps
Date: Mon, 20 Oct 2025 12:13:07 +0200
Message-ID: <20251020101311.256819-12-richard.genoud@bootlin.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251020101311.256819-1-richard.genoud@bootlin.com>
References: <20251020101311.256819-1-richard.genoud@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251020_031409_461687_13F83443 
X-CRM114-Status: GOOD (  12.31  )
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

The H6/H616 error mask register is bigger than the A10/A23 one, so move
its mask into sunxi_nfc_caps.

No functional change

Signed-off-by: Richard Genoud <richard.genoud@bootlin.com>
---
 drivers/mtd/nand/raw/sunxi_nand.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/nand/raw/sunxi_nand.c b/drivers/mtd/nand/raw/sunxi_nand.c
index da7b8b81d39e..3de5642c05a8 100644
--- a/drivers/mtd/nand/raw/sunxi_nand.c
+++ b/drivers/mtd/nand/raw/sunxi_nand.c
@@ -155,7 +155,7 @@
 
 /* define bit use in NFC_ECC_ST */
 #define NFC_ECC_ERR(x)		BIT(x)
-#define NFC_ECC_ERR_MSK		GENMASK(15, 0)
+#define NFC_ECC_ERR_MSK(nfc)	(nfc->caps->ecc_err_mask)
 
 /*
  * define bit use in NFC_REG_PAT_FOUND
@@ -235,6 +235,7 @@ static inline struct sunxi_nand_chip *to_sunxi_nand(struct nand_chip *nand)
  * @random_en_mask:	RANDOM_EN mask in NFC_ECC_CTL register
  * @random_dir_mask:	RANDOM_DIRECTION mask in NFC_ECC_CTL register
  * @ecc_mode_mask:	ECC_MODE mask in NFC_ECC_CTL register
+ * @ecc_err_mask:	NFC_ECC_ERR mask in NFC_ECC_ST register
  * @pat_found_mask:	ECC_PAT_FOUND mask in NFC_REG_PAT_FOUND register
  * @dma_maxburst:	DMA maxburst
  * @ecc_strengths:	Available ECC strengths array
@@ -252,6 +253,7 @@ struct sunxi_nfc_caps {
 	unsigned int random_en_mask;
 	unsigned int random_dir_mask;
 	unsigned int ecc_mode_mask;
+	unsigned int ecc_err_mask;
 	unsigned int pat_found_mask;
 	unsigned int dma_maxburst;
 	const u8 *ecc_strengths;
@@ -1030,7 +1032,7 @@ static int sunxi_nfc_hw_ecc_read_chunks_dma(struct nand_chip *nand, uint8_t *buf
 		sunxi_nfc_hw_ecc_update_stats(nand, &max_bitflips, ret);
 	}
 
-	if (status & NFC_ECC_ERR_MSK) {
+	if (status & NFC_ECC_ERR_MSK(nfc)) {
 		for (i = 0; i < nchunks; i++) {
 			int data_off = i * ecc->size;
 			int oob_off = i * (ecc->bytes + 4);
@@ -2235,6 +2237,7 @@ static const struct sunxi_nfc_caps sunxi_nfc_a10_caps = {
 	.random_en_mask = BIT(9),
 	.random_dir_mask = BIT(10),
 	.ecc_mode_mask = GENMASK(15, 12),
+	.ecc_err_mask = GENMASK(15, 0),
 	.pat_found_mask = GENMASK(31, 16),
 	.dma_maxburst = 4,
 	.ecc_strengths = sunxi_ecc_strengths_a10,
@@ -2253,6 +2256,7 @@ static const struct sunxi_nfc_caps sunxi_nfc_a23_caps = {
 	.random_en_mask = BIT(9),
 	.random_dir_mask = BIT(10),
 	.ecc_mode_mask = GENMASK(15, 12),
+	.ecc_err_mask = GENMASK(15, 0),
 	.pat_found_mask = GENMASK(31, 16),
 	.dma_maxburst = 8,
 	.ecc_strengths = sunxi_ecc_strengths_a10,

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
