Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F258CCA476
	for <linux-mtd@archiver.kernel.org>; Fri, 10 Oct 2025 08:42:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TcPMIRrUQyzFpITtoC5buvqz777m6Ez/wo6h5BK5fp4=; b=RnYak9jc4tDUaH
	V9vuNJsBxumjSoqBA1yggrurqhlx0dz30K6R0RUTDDnJDUZUODHbH1W649kPRCxvbft80CEM1QeWC
	Or0hUF2Z2Zkia30BugeG/aAxQPfsBEb5gLAQtMYObVEiS+woP82q9CaB5KHHlcVOmVOK+OwEv0StA
	P4QE05t+OF1OtabsDXC1NZGsuiyXEEovddvT7NUcgoP7BD/n6Qt8wrg1s4zwJOWtU1rmXO+hFq22T
	G08Qro/yh4OJUN4pd8wV0TRD/PLaRa0b9+ewKyQrASkNVzzrBODBQUKyejGdgiHYdzCMSL9mHkWN5
	na7nNtQYrB3WktxOf9EA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v78hV-0000000829F-3OMM;
	Fri, 10 Oct 2025 08:42:09 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v78hL-000000081mY-0Uwt
	for linux-mtd@lists.infradead.org;
	Fri, 10 Oct 2025 08:42:02 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 22CCCC08CCC;
	Fri, 10 Oct 2025 08:41:36 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id C1A3C60667;
	Fri, 10 Oct 2025 08:41:54 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id B17E4102F2206;
	Fri, 10 Oct 2025 10:41:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1760085713; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=0h90jbJtC3ZJW0B/G8iBt4NQc4cwXcvlZB6O9BQam/Q=;
	b=yGbZAl6h9oArIHNS0WWvQUnLVquve8odbHB69bXkWdK5XdI6H5rfz/p8DDVB5g3SlAuvb3
	QkDt9p5i4sqY97TS+rec89beY+wTCM3t5laGq+bTjavT+dNY6BjpOth977zCuDzY/JUYvc
	xLvgcoUS/vucRwKwBUaLjPr9x0daK55AlODNak43ZATlAwIrK5y+Ex0tPvJvGgbc2kpnqd
	1PDLCgxjwmgH/Ddl573oo4sQFsPZB/gZJ33B3EhibqvZg3+jzi4KuEHHGznZT/8AcCdvG9
	IuJOOnpZI5bmzz6bgBfzptI+IcJwI/Qn2YskYu+6WWYvvsojtO/dPn3v71xA6A==
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
Subject: [PATCH 10/15] mtd: nand: sunxi: introduce random en/dir in sunxi_nfc_caps
Date: Fri, 10 Oct 2025 10:40:37 +0200
Message-ID: <20251010084042.341224-11-richard.genoud@bootlin.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251010084042.341224-1-richard.genoud@bootlin.com>
References: <20251010084042.341224-1-richard.genoud@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251010_014159_591466_D716544B 
X-CRM114-Status: UNSURE (   9.90  )
X-CRM114-Notice: Please train this message.
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

The H6/H616 RANDOM EN/DIRECTION masks are different from A10/A23.
So move the masks into sunxi_nfc_caps.

No functional change.

Signed-off-by: Richard Genoud <richard.genoud@bootlin.com>
---
 drivers/mtd/nand/raw/sunxi_nand.c | 16 ++++++++++++----
 1 file changed, 12 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/nand/raw/sunxi_nand.c b/drivers/mtd/nand/raw/sunxi_nand.c
index 3c21f54e8e3f..5161dfff46ed 100644
--- a/drivers/mtd/nand/raw/sunxi_nand.c
+++ b/drivers/mtd/nand/raw/sunxi_nand.c
@@ -144,8 +144,8 @@
 #define NFC_ECC_EXCEPTION	BIT(4)
 #define NFC_ECC_BLOCK_SIZE_MSK	BIT(5)
 #define NFC_ECC_BLOCK_512	BIT(5)
-#define NFC_RANDOM_EN		BIT(9)
-#define NFC_RANDOM_DIRECTION	BIT(10)
+#define NFC_RANDOM_EN(nfc)	(nfc->caps->random_en_mask)
+#define NFC_RANDOM_DIRECTION(nfc) (nfc->caps->random_dir_mask)
 #define NFC_ECC_MODE_MSK(nfc)	(nfc->caps->ecc_mode_mask)
 #define NFC_ECC_MODE(nfc, x)	field_prep(NFC_ECC_MODE_MSK(nfc), (x))
 #define NFC_RANDOM_SEED_MSK	GENMASK(30, 16)
@@ -228,6 +228,8 @@ static inline struct sunxi_nand_chip *to_sunxi_nand(struct nand_chip *nand)
  * @reg_ecc_err_cnt:	ECC error counter register
  * @reg_user_data:	User data register
  * @reg_pat_found:	Data Pattern Status Register
+ * @random_en_mask:	RANDOM_EN mask in NFC_ECC_CTL register
+ * @random_dir_mask:	RANDOM_DIRECTION mask in NFC_ECC_CTL register
  * @ecc_mode_mask:	ECC_MODE mask in NFC_ECC_CTL register
  * @pat_found_mask:	ECC_PAT_FOUND mask in NFC_REG_PAT_FOUND register
  * @dma_maxburst:	DMA maxburst
@@ -241,6 +243,8 @@ struct sunxi_nfc_caps {
 	unsigned int reg_ecc_err_cnt;
 	unsigned int reg_user_data;
 	unsigned int reg_pat_found;
+	unsigned int random_en_mask;
+	unsigned int random_dir_mask;
 	unsigned int ecc_mode_mask;
 	unsigned int pat_found_mask;
 	unsigned int dma_maxburst;
@@ -669,7 +673,7 @@ static void sunxi_nfc_randomizer_enable(struct nand_chip *nand)
 	if (!(nand->options & NAND_NEED_SCRAMBLING))
 		return;
 
-	writel(readl(nfc->regs + NFC_REG_ECC_CTL) | NFC_RANDOM_EN,
+	writel(readl(nfc->regs + NFC_REG_ECC_CTL) | NFC_RANDOM_EN(nfc),
 	       nfc->regs + NFC_REG_ECC_CTL);
 }
 
@@ -680,7 +684,7 @@ static void sunxi_nfc_randomizer_disable(struct nand_chip *nand)
 	if (!(nand->options & NAND_NEED_SCRAMBLING))
 		return;
 
-	writel(readl(nfc->regs + NFC_REG_ECC_CTL) & ~NFC_RANDOM_EN,
+	writel(readl(nfc->regs + NFC_REG_ECC_CTL) & ~NFC_RANDOM_EN(nfc),
 	       nfc->regs + NFC_REG_ECC_CTL);
 }
 
@@ -2220,6 +2224,8 @@ static const struct sunxi_nfc_caps sunxi_nfc_a10_caps = {
 	.reg_ecc_err_cnt = NFC_REG_A10_ECC_ERR_CNT,
 	.reg_user_data = NFC_REG_A10_USER_DATA,
 	.reg_pat_found = NFC_REG_ECC_ST,
+	.random_en_mask = BIT(9),
+	.random_dir_mask = BIT(10),
 	.ecc_mode_mask = GENMASK(15, 12),
 	.pat_found_mask = GENMASK(31, 16),
 	.dma_maxburst = 4,
@@ -2234,6 +2240,8 @@ static const struct sunxi_nfc_caps sunxi_nfc_a23_caps = {
 	.reg_ecc_err_cnt = NFC_REG_A10_ECC_ERR_CNT,
 	.reg_user_data = NFC_REG_A10_USER_DATA,
 	.reg_pat_found = NFC_REG_ECC_ST,
+	.random_en_mask = BIT(9),
+	.random_dir_mask = BIT(10),
 	.ecc_mode_mask = GENMASK(15, 12),
 	.pat_found_mask = GENMASK(31, 16),
 	.dma_maxburst = 8,
-- 
2.47.3


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
