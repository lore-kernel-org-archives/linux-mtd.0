Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DC71CCD187
	for <linux-mtd@archiver.kernel.org>; Fri, 10 Oct 2025 08:41:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=j15vig/qBUquEccd47SYlD3Tp+pMpEiuW9TuQ11gRCI=; b=B/Ti+EFNbwTcS8
	+0jJnV3R7xbE5LgQPBqL+iH+maXKhYszL5qCbV99leWrpJp06uYgX4ZH7rTHcQNi2EQuU8KLAuAsa
	QI7i80v8CuXYQEqt1lsuxHUD8bnEUblQw7ZzDPi6azHZ31fNWgeOcCGDpwP1djDBUkgX8HnvrqsIT
	0by2reYPe0IgLL5jkV0TkXfdKWvN4d3Kpx5T5K33s8aB4efj53exUnwzQ4bAtI4ps6ouz4XwTGOX8
	59J+QQZYcHo/vBRs7SWirxDve9a8ca0T8yQLBhWYsbD4R3i9V8pJvQeBpW0XRp6s6tjRIDK/ZquNo
	n4t76Zu7wghmvGufyaJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v78h9-000000081YC-1NFv;
	Fri, 10 Oct 2025 08:41:47 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v78h3-000000081OL-3jpT
	for linux-mtd@lists.infradead.org;
	Fri, 10 Oct 2025 08:41:43 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 7F6DB1A127F;
	Fri, 10 Oct 2025 08:41:40 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 5410E60667;
	Fri, 10 Oct 2025 08:41:40 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id D5C4D102F2206;
	Fri, 10 Oct 2025 10:41:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1760085699; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=hVZorgzw7GlkbAdhTKmVPXOZ3kOeGcl6Fd44HKki10Y=;
	b=G1sVoDR7mhyS/3l1/qp5qMx0gdaSfLz5nK74NQEqMU8O721Wx10zNs8xOReVRkIDWQrkuH
	1YUVf5DFMkYPUIsBi36RBOJDS/qyi9OA/A5V84UmSkaGmXb4JAGIuOFYj4F8Qvry2NClc/
	ayRjDsNNoVmYXZFzHo4n/xk2WYNTUnwN6NtE1KYpRTyJH17mRdWajoP6Nj+O8AeFZlV6FG
	8RpPQped2jZFfI8SnyGq38Y3KspzWOb3XZMtLwip5wpel2Zj69zZW6TKof0yraQuP+SF1N
	JxMOsL70q7r916vYuo82Q+HhIF/duRkazFHhZ6xeomTh6t7YqNr6dsugl6NiTA==
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
Subject: [PATCH 04/15] mtd: nand: sunxi: move ecc strenghts in sunxi_nfc_caps
Date: Fri, 10 Oct 2025 10:40:31 +0200
Message-ID: <20251010084042.341224-5-richard.genoud@bootlin.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251010084042.341224-1-richard.genoud@bootlin.com>
References: <20251010084042.341224-1-richard.genoud@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251010_014142_073076_AD00EF10 
X-CRM114-Status: GOOD (  13.17  )
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

H6/H616 has more ecc strenghts.
This commit prepares the change.
No functional change.

Signed-off-by: Richard Genoud <richard.genoud@bootlin.com>
---
 drivers/mtd/nand/raw/sunxi_nand.c | 20 ++++++++++++++++----
 1 file changed, 16 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/nand/raw/sunxi_nand.c b/drivers/mtd/nand/raw/sunxi_nand.c
index 10a48e0d361f..198dd40f9220 100644
--- a/drivers/mtd/nand/raw/sunxi_nand.c
+++ b/drivers/mtd/nand/raw/sunxi_nand.c
@@ -213,11 +213,15 @@ static inline struct sunxi_nand_chip *to_sunxi_nand(struct nand_chip *nand)
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
@@ -1619,9 +1623,9 @@ static int sunxi_nand_hw_ecc_ctrl_init(struct nand_chip *nand,
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
@@ -1645,7 +1649,7 @@ static int sunxi_nand_hw_ecc_ctrl_init(struct nand_chip *nand,
 
 		ecc->strength = bytes * 8 / fls(8 * ecc->size);
 
-		for (i = 0; i < ARRAY_SIZE(strengths); i++) {
+		for (i = 0; i < nfc->caps->nstrengths; i++) {
 			if (strengths[i] > ecc->strength)
 				break;
 		}
@@ -1666,7 +1670,7 @@ static int sunxi_nand_hw_ecc_ctrl_init(struct nand_chip *nand,
 	}
 
 	/* Add ECC info retrieval from DT */
-	for (i = 0; i < ARRAY_SIZE(strengths); i++) {
+	for (i = 0; i < nfc->caps->nstrengths; i++) {
 		if (ecc->strength <= strengths[i]) {
 			/*
 			 * Update ecc->strength value with the actual strength
@@ -1677,7 +1681,7 @@ static int sunxi_nand_hw_ecc_ctrl_init(struct nand_chip *nand,
 		}
 	}
 
-	if (i >= ARRAY_SIZE(strengths)) {
+	if (i >= nfc->caps->nstrengths) {
 		dev_err(nfc->dev, "unsupported strength\n");
 		return -ENOTSUPP;
 	}
@@ -2167,15 +2171,23 @@ static void sunxi_nfc_remove(struct platform_device *pdev)
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
