Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98BBECCF9EF
	for <linux-mtd@archiver.kernel.org>; Tue, 28 Oct 2025 07:37:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YqKgMyL71nJyAl9BaDzFDWiGCRLHqpXPwFax1SMlwUM=; b=aY4HZYi9mUDPrp
	NIU0vtT0FVeHUQnOZi7pSQLbAWNq1QJW0TOf/OdV52PiqNm9y4V/noPpcF90IoZUCzXmzw3a1U5YJ
	JkrLpQZemmr5wVslWmcz2FyJM0gC/389f8Ld2AIGChOZDj8u+xurIoyYOfdwc3SHTvj0LCRGMq6FL
	p/ti/vzUTG3jaTKuDyIxBgXZgVMNC+NPch7+aCntqjl+a3fiQvEt5yvH5D6QGKpkWhKjvyDD7DqWa
	ViJX4I2iM4xTIl9tJzNL2vBBQhq00KdhrAh/zi1na9PDADIplGkKt9YquxhOWbhxAwS3p0Qmjejw3
	rDE+v/w5s3ijERTFts6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDeGs-0000000FS4m-0llj;
	Tue, 28 Oct 2025 07:37:34 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDeG1-0000000FR0S-3mio
	for linux-mtd@bombadil.infradead.org;
	Tue, 28 Oct 2025 07:36:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=r6MGHAAg+AvcWU9kf7Y+2woGGgDVaLstXF32W5Y9zag=; b=O97v0KsWRL/6rJXaTqsWwvG5Vg
	KwimWeDkumnpdexJGjUIOv8La1Fa9lvSeFPjBH+UldnLlVVOQhfW2MFWo4aYThsaQsvFmSPSJXB0n
	N01SAGp6p//+LAo4SncbBVdczVVbuXEOOG1PK/qmWUEej3Tx9gXOGIOkqwXkuBdRNMaHy/NFUYVqk
	sAppEJSAOpjthb0UFTzJYszYtp5Y8MSu9og1Kl3dTHWeyANn1ijjr+p3VsYiWo/u8CDOBT/JxC6yV
	m6NPMiC/hO0zU2/+eyCxxT5TIBPOTfPA4U7LhakGoop6vrpWDgrE/MWsLvJhuKztCchPdhEtg+km4
	4Dtzna0w==;
Received: from smtpout-03.galae.net ([185.246.85.4])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDdOB-00000003p0d-0DlF
	for linux-mtd@lists.infradead.org;
	Tue, 28 Oct 2025 06:41:06 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id F39194E41391;
	Tue, 28 Oct 2025 07:36:26 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id C7595606AB;
	Tue, 28 Oct 2025 07:36:26 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 8F535102F2511;
	Tue, 28 Oct 2025 08:36:23 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1761636985; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=r6MGHAAg+AvcWU9kf7Y+2woGGgDVaLstXF32W5Y9zag=;
	b=IdabTgjfFJFAAxfjIjdnkeb9JfHjG6+uGWfHalW6WfO0Ub7Kt0v9751JmXgWqJQB9+3Q2k
	JOdUK64gjroHq+M3hFQhpNNlyGys4gu/zDxCjUIg2WLvqbIJPVHN4vkodU5Zm+eUvnUsk/
	nw25xNRCWuPzkVJsAOgRr9y2VChVuX9MGvrJQ7tTjTHbw+y+5s2DtBlMKE9U0YTIWEJI8C
	EFcpu3lgvWkmS0oUPSMlamdnu9FKyKRmkhH7fWZ3zfG+o1opRwJj38lJ9J3lEf9QlRrGkn
	02uphn+7CXmmVmlkzqGmvO90/2xraJFNy591IISjGd9IdZxwzI4doy/yuozbOA==
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
Subject: [PATCH v4 12/16] mtd: rawnand: sunxi: introduce reg_spare_area in sunxi_nfc_caps
Date: Tue, 28 Oct 2025 08:35:05 +0100
Message-ID: <20251028073534.526992-13-richard.genoud@bootlin.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251028073534.526992-1-richard.genoud@bootlin.com>
References: <20251028073534.526992-1-richard.genoud@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251028_064103_258959_CA3339D2 
X-CRM114-Status: GOOD (  12.28  )
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
index 3cb84e502ad7..d2e5bcb76925 100644
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
@@ -239,6 +240,7 @@ static inline struct sunxi_nand_chip *to_sunxi_nand(struct nand_chip *nand)
  * @reg_io_data:	I/O data register
  * @reg_ecc_err_cnt:	ECC error counter register
  * @reg_user_data:	User data register
+ * @reg_spare_area:	Spare Area Register
  * @reg_pat_id:		Pattern ID Register
  * @reg_pat_found:	Data Pattern Status Register
  * @random_en_mask:	RANDOM_EN mask in NFC_ECC_CTL register
@@ -255,6 +257,7 @@ struct sunxi_nfc_caps {
 	unsigned int reg_io_data;
 	unsigned int reg_ecc_err_cnt;
 	unsigned int reg_user_data;
+	unsigned int reg_spare_area;
 	unsigned int reg_pat_id;
 	unsigned int reg_pat_found;
 	unsigned int random_en_mask;
@@ -477,7 +480,7 @@ static void sunxi_nfc_select_chip(struct nand_chip *nand, unsigned int cs)
 	if (sel->rb >= 0)
 		ctl |= NFC_RB_SEL(sel->rb);
 
-	writel(mtd->writesize, nfc->regs + NFC_REG_SPARE_AREA);
+	writel(mtd->writesize, nfc->regs + NFC_REG_SPARE_AREA(nfc));
 
 	if (nfc->clk_rate != sunxi_nand->clk_rate) {
 		clk_set_rate(nfc->mod_clk, sunxi_nand->clk_rate);
@@ -2236,6 +2239,7 @@ static const struct sunxi_nfc_caps sunxi_nfc_a10_caps = {
 	.reg_io_data = NFC_REG_A10_IO_DATA,
 	.reg_ecc_err_cnt = NFC_REG_A10_ECC_ERR_CNT,
 	.reg_user_data = NFC_REG_A10_USER_DATA,
+	.reg_spare_area = NFC_REG_A10_SPARE_AREA,
 	.reg_pat_id = NFC_REG_A10_PAT_ID,
 	.reg_pat_found = NFC_REG_ECC_ST,
 	.random_en_mask = BIT(9),
@@ -2253,6 +2257,7 @@ static const struct sunxi_nfc_caps sunxi_nfc_a23_caps = {
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
