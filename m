Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4AA99CCA476
	for <linux-mtd@archiver.kernel.org>; Fri, 10 Oct 2025 08:42:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5KpoJ98pN1IsACgJvP597sqa6liJComE40C39lHY+pc=; b=ODH+AbCiqW6rq+
	6tqpKy2LWVd0/EqMbH/87P+msn0nNuFN4maA77k0ZqbF9e6NprtyE+wkY0LeKOvQDAE3QOvCzEk51
	hCmiezZTzBWkogCG1gfxa4ts/fHUcCxJS5iHhENvncLcS5zUuoIndgYi6QdjfRwLI2c6u25/wsxGj
	437ajhD/B5PGAIuqa4+Bdn8x11IjT43grTr1WsPEyUgjwTGKZcvAt1uHlOmHQbMnfocAxHehOvKyq
	h+2vs4svgGmJDjP2RMZ4mds7wDhjJfoccOcZH/byoSsKYHhv8qrisU7OiUe6OqTRIljDA5PhRKgjd
	v3IxtHTupl6CnrsRwDSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v78hu-000000082jA-0EKC;
	Fri, 10 Oct 2025 08:42:34 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v78hY-000000082CT-1ErD;
	Fri, 10 Oct 2025 08:42:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=zrFppuVA4Tx0AXaKZV03Ob6lPPggHgdPbLxorTpS1EI=; b=eR5yokojzNR1yTl3KyZOFQlkTW
	r6z9Me3m3sg7UuyLdOT3CkvBfQuvtPiNWD9UpQjeUOkc9fpyjNGuYiVud6QfwBsFAWDlPUkMEymkD
	CK/QXxNqUJO6Q8ZBur2RCe+afROs8vfR8l37ulkXkjv3RA3bSQnuBJ+IvbTDqMWziEuXDXYcsWt8G
	Et8Hv0Q5c6c1sFSAP9CLEqjN8heGNRyTGrDjIdSVHsqfg9Sgca8njdCLzAsVqZJVy9nKjMBLaC68Q
	BscKQnv9ecnOTh/LcppB1gTy7kGPiOAt8n9dlWjazArTm2/mUkivmrrAfctF/UyMCXStSSeP/llrO
	jlzTeZKA==;
Received: from smtpout-02.galae.net ([185.246.84.56])
	by casper.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v78hS-00000007Yz3-2sfK;
	Fri, 10 Oct 2025 08:42:10 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id A6B511A1285;
	Fri, 10 Oct 2025 08:41:59 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 7D32860667;
	Fri, 10 Oct 2025 08:41:59 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 73A52102F220B;
	Fri, 10 Oct 2025 10:41:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1760085718; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=zrFppuVA4Tx0AXaKZV03Ob6lPPggHgdPbLxorTpS1EI=;
	b=tg/jynavBKvnWr887Qh4TPjrYBuOq9cxIE7UmUNIbWruIpJu0/MR30tXD5D8cFygaYJGtz
	Rjr0ux0r6sXvmGLC77uJVOCvPHgDg7TtY0zUEkOaxA+ByKkBaFofBwp4nOKKHgmmBZMUfd
	8g2ZmUUffiNgnGm+yJd4eUxROXcUfWqhcjf/DtPAsAcLRbIFSanI6qWvRmthZpLFyCFdZc
	llsxWcAh7CyDxLj80s0wNPEDdluxwlGLaEDXZ78SkoDQdFSvqxgCeBkswE3O+LcZ4FWStN
	4hYuwJJeAkkOmolRN2KmO2vuz0SjaGWy3jzfZs/W5RjdeYWX5Gs55lH8z8BJ9A==
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
Subject: [PATCH 12/15] mtd: nand: sunxi: introduce reg_spare_area in sunxi_nfc_caps
Date: Fri, 10 Oct 2025 10:40:39 +0200
Message-ID: <20251010084042.341224-13-richard.genoud@bootlin.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251010084042.341224-1-richard.genoud@bootlin.com>
References: <20251010084042.341224-1-richard.genoud@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251010_094207_972981_BA9D3F2A 
X-CRM114-Status: GOOD (  11.67  )
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

The H6/H616 spare area register is not at the same offset as the
A10/A23 one, so move its offset into sunxi_nfc_caps.

No functional change.

Signed-off-by: Richard Genoud <richard.genoud@bootlin.com>
---
 drivers/mtd/nand/raw/sunxi_nand.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/nand/raw/sunxi_nand.c b/drivers/mtd/nand/raw/sunxi_nand.c
index 8921e66e0c6d..80aafa4e1844 100644
--- a/drivers/mtd/nand/raw/sunxi_nand.c
+++ b/drivers/mtd/nand/raw/sunxi_nand.c
@@ -54,7 +54,8 @@
 #define NFC_REG_ECC_ERR_CNT(nfc, x)	((nfc->caps->reg_ecc_err_cnt + (x)) & ~0x3)
 #define NFC_REG_A10_USER_DATA	0x0050
 #define NFC_REG_USER_DATA(nfc, x)	(nfc->caps->reg_user_data + ((x) * 4))
-#define NFC_REG_SPARE_AREA	0x00A0
+#define NFC_REG_SPARE_AREA(nfc) (nfc->caps->reg_spare_area)
+#define NFC_REG_A10_SPARE_AREA	0x00A0
 #define NFC_REG_PAT_ID(nfc) (nfc->caps->reg_pat_id)
 #define NFC_REG_A10_PAT_ID	0x00A4
 #define NFC_REG_MDMA_ADDR	0x00C0
@@ -228,6 +229,7 @@ static inline struct sunxi_nand_chip *to_sunxi_nand(struct nand_chip *nand)
  * @reg_io_data:	I/O data register
  * @reg_ecc_err_cnt:	ECC error counter register
  * @reg_user_data:	User data register
+ * @reg_spare_area:	Spare Area Register
  * @reg_pat_id:		Pattern ID Register
  * @reg_pat_found:	Data Pattern Status Register
  * @random_en_mask:	RANDOM_EN mask in NFC_ECC_CTL register
@@ -244,6 +246,7 @@ struct sunxi_nfc_caps {
 	unsigned int reg_io_data;
 	unsigned int reg_ecc_err_cnt;
 	unsigned int reg_user_data;
+	unsigned int reg_spare_area;
 	unsigned int reg_pat_id;
 	unsigned int reg_pat_found;
 	unsigned int random_en_mask;
@@ -466,7 +469,7 @@ static void sunxi_nfc_select_chip(struct nand_chip *nand, unsigned int cs)
 	if (sel->rb >= 0)
 		ctl |= NFC_RB_SEL(sel->rb);
 
-	writel(mtd->writesize, nfc->regs + NFC_REG_SPARE_AREA);
+	writel(mtd->writesize, nfc->regs + NFC_REG_SPARE_AREA(nfc));
 
 	if (nfc->clk_rate != sunxi_nand->clk_rate) {
 		clk_set_rate(nfc->mod_clk, sunxi_nand->clk_rate);
@@ -2226,6 +2229,7 @@ static const struct sunxi_nfc_caps sunxi_nfc_a10_caps = {
 	.reg_io_data = NFC_REG_A10_IO_DATA,
 	.reg_ecc_err_cnt = NFC_REG_A10_ECC_ERR_CNT,
 	.reg_user_data = NFC_REG_A10_USER_DATA,
+	.reg_spare_area = NFC_REG_A10_SPARE_AREA,
 	.reg_pat_id = NFC_REG_A10_PAT_ID,
 	.reg_pat_found = NFC_REG_ECC_ST,
 	.random_en_mask = BIT(9),
@@ -2243,6 +2247,7 @@ static const struct sunxi_nfc_caps sunxi_nfc_a23_caps = {
 	.reg_io_data = NFC_REG_A23_IO_DATA,
 	.reg_ecc_err_cnt = NFC_REG_A10_ECC_ERR_CNT,
 	.reg_user_data = NFC_REG_A10_USER_DATA,
+	.reg_spare_area = NFC_REG_A10_SPARE_AREA,
 	.reg_pat_id = NFC_REG_A10_PAT_ID,
 	.reg_pat_found = NFC_REG_ECC_ST,
 	.random_en_mask = BIT(9),
-- 
2.47.3


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
