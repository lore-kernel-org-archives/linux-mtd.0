Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A520CCD1A7
	for <linux-mtd@archiver.kernel.org>; Mon, 20 Oct 2025 10:14:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IRBb+75wY8gE9UACyXv470yjVgI+Ao6rJBPVZ5htbKg=; b=fvDNsNtXWWgIlG
	afQgaBceObgW1FAvw5NDuvy6uk8xbhUAD56NGe6N4AnbXEvvQmea0KoZML4ADhVWKvZdIH/+SmJvT
	+uOlsTNcT8+BfeBYYOfRsWr8rHT0q/cuk2JEs55WH9mRN0CW3tCQZfTUOyVQxg21T0G6plIIY3z0J
	GwP1hdHJsxXZwot2M59HS8PIKWyGIu4r1osUYAQiXyXauXjLcFGQ7RzZLgzZxT0IQE0ZLsv4PTJ2w
	A5nI8JKecG6yTWB/ep+ipVj0k2gKMnd/pxM+qFaw/kisp8voxOuBsDwb3zuYA4wcINuRPL5wQzQMl
	9s/t7iMrYy1BmBYBd9Ng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAmu0-0000000CmqH-2Q5S;
	Mon, 20 Oct 2025 10:14:08 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAmtr-0000000Cmd6-2lFk;
	Mon, 20 Oct 2025 10:14:01 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 17F301A154C;
	Mon, 20 Oct 2025 10:13:58 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id E1AEF606D5;
	Mon, 20 Oct 2025 10:13:57 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 51488102F23B2;
	Mon, 20 Oct 2025 12:13:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1760955236; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=HQ1IhgcFvXBkQ1TsRPeecT3KmPOkwdU0whK+wNY8jxI=;
	b=bC8koX7uJVqD67QaLxyhC/ytzw2wKkGKCOLexVp0xV5TULjmepqEmNRS+bb71IxFEb86yO
	SWInWPGqYQbhepePdNjH4FAH8osA0mJvyhKIVAyE5fvydq7XKBwN1Iq6KfDgD15GH3/GKe
	59UBRu5MahJm+SlBXYrFrNS+lAV12gy4X9wYQf7ePcebWqNvYMWlLzB7GSJPLV9+eElu8P
	t+NuMX+cQ01IAuBD4jR4okTPLEy/VfMjIiAgBRYS995BUf8G2EzJUbjEbeIbcwXZgI21zs
	DYTjJTQ0J/kG5eKeWpb4gLVwS+zFHV9O+9t7ho7mQ8SJ5oXTMJHkMNX30+vpVQ==
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
Subject: [PATCH v3 06/15] mtd: rawnand: sunxi: add has_ecc_block_512 capability
Date: Mon, 20 Oct 2025 12:13:02 +0200
Message-ID: <20251020101311.256819-7-richard.genoud@bootlin.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251020101311.256819-1-richard.genoud@bootlin.com>
References: <20251020101311.256819-1-richard.genoud@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251020_031359_856895_F818F228 
X-CRM114-Status: GOOD (  11.21  )
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

The H616 controller can't handle 512 bytes ECC block size. The
NFC_ECC_BLOCK_512 bit disappeared in H6, and NDFC_RANDOM_EN took its
place.

So, add has_ecc_block_512 capability to only set this bit on SoC having
it.

No functional change.

Signed-off-by: Richard Genoud <richard.genoud@bootlin.com>
---
 drivers/mtd/nand/raw/sunxi_nand.c | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/nand/raw/sunxi_nand.c b/drivers/mtd/nand/raw/sunxi_nand.c
index 4cfb5d3e9c06..70c940840dda 100644
--- a/drivers/mtd/nand/raw/sunxi_nand.c
+++ b/drivers/mtd/nand/raw/sunxi_nand.c
@@ -222,6 +222,7 @@ static inline struct sunxi_nand_chip *to_sunxi_nand(struct nand_chip *nand)
  *
  * @has_mdma:		Use mbus dma mode, otherwise general dma
  *			through MBUS on A23/A33 needs extra configuration.
+ * @has_ecc_block_512:	If the ECC can handle 512B or only 1024B chuncks
  * @reg_io_data:	I/O data register
  * @reg_ecc_err_cnt:	ECC error counter register
  * @reg_user_data:	User data register
@@ -233,6 +234,7 @@ static inline struct sunxi_nand_chip *to_sunxi_nand(struct nand_chip *nand)
  */
 struct sunxi_nfc_caps {
 	bool has_mdma;
+	bool has_ecc_block_512;
 	unsigned int reg_io_data;
 	unsigned int reg_ecc_err_cnt;
 	unsigned int reg_user_data;
@@ -1748,8 +1750,14 @@ static int sunxi_nand_hw_ecc_ctrl_init(struct nand_chip *nand,
 	sunxi_nand->ecc.ecc_ctl = NFC_ECC_MODE(i) | NFC_ECC_EXCEPTION |
 				  NFC_ECC_PIPELINE | NFC_ECC_EN;
 
-	if (ecc->size == 512)
-		sunxi_nand->ecc.ecc_ctl |= NFC_ECC_BLOCK_512;
+	if (ecc->size == 512) {
+		if (nfc->caps->has_ecc_block_512) {
+			sunxi_nand->ecc.ecc_ctl |= NFC_ECC_BLOCK_512;
+		} else {
+			dev_err(nfc->dev, "512B ECC block not supported\n");
+			return -EOPNOTSUPP;
+		}
+	}
 
 	return 0;
 }
@@ -2204,6 +2212,7 @@ static const u8 sunxi_ecc_strengths_a10[] = {
 };
 
 static const struct sunxi_nfc_caps sunxi_nfc_a10_caps = {
+	.has_ecc_block_512 = true,
 	.reg_io_data = NFC_REG_A10_IO_DATA,
 	.reg_ecc_err_cnt = NFC_REG_A10_ECC_ERR_CNT,
 	.reg_user_data = NFC_REG_A10_USER_DATA,
@@ -2216,6 +2225,7 @@ static const struct sunxi_nfc_caps sunxi_nfc_a10_caps = {
 
 static const struct sunxi_nfc_caps sunxi_nfc_a23_caps = {
 	.has_mdma = true,
+	.has_ecc_block_512 = true,
 	.reg_io_data = NFC_REG_A23_IO_DATA,
 	.reg_ecc_err_cnt = NFC_REG_A10_ECC_ERR_CNT,
 	.reg_user_data = NFC_REG_A10_USER_DATA,

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
