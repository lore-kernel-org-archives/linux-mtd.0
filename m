Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE3CDCCD187
	for <linux-mtd@archiver.kernel.org>; Fri, 10 Oct 2025 08:42:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2hgM32gxbgb9/Ar1s+UgVbxj1fpesc3sHyf0NxhKkiA=; b=o9LuOhilsT9WEi
	4jauk2NvafJFgD7k93vjd2+c77PYxMWxzk4hz7mlq/SM4JmcffkTdzlaQPP801wow9yU11XlJfykK
	TKrC8aaF9Q4h/mJvuIzBVGtHUllkXMoX3pkANihgs0y8wMqfvadnzKtaD+7SyI8OwxeYpiMl3HDWx
	avGSBtb7N3ejmb+klUZWLvEyoDFEdJrBoNwEVOXZgLK6XpKXMotD2aLBNqq/0vIN//i98ZA6V1SfZ
	8v+zbRZvvLP9Kh/pNYImr0oR7eBiCyVV/NReWWdLPn1Vmo9xap7W+lDNFPvZY7y41Jx/HFhlkCtJV
	aj9ih+xpSy/re1FZpldg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v78hS-0000000825F-3m04;
	Fri, 10 Oct 2025 08:42:06 +0000
Received: from [185.171.202.116] (helo=smtpout-04.galae.net)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v78hH-000000081Ub-3oki
	for linux-mtd@lists.infradead.org;
	Fri, 10 Oct 2025 08:41:58 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 7ABC5C08CC8;
	Fri, 10 Oct 2025 08:41:26 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 2464160667;
	Fri, 10 Oct 2025 08:41:45 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 01C7B102F2208;
	Fri, 10 Oct 2025 10:41:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1760085703; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=lW1eckNNd4gUWt6X3y+zdKi8wIuDsKB6Px2Lg2bPV3A=;
	b=LpU9p1ffpGEUeYTIuGZkdQj3DKkIaaHGucVWXc3d0Gi4Ns0Km0feYRSJTofCozJeQozaj2
	Be1IYEumru8wNU5eYF7dsZi207ezDL5VO6BWQ1zNXF35AoJX3Rm4o7VCGdA0Go7kqhZxJt
	V7hUrMTU/+Z2AeVWc0Ts1U3mw5mqG8vtCe6HvtwjCAjPN+Uhcb66TuI5kh71Zp+Xng1Uwy
	EijpeIo6uHMjV9TU3MxU2nATzwJDh4LRy5nULNT/xCLKXLZDIHbUFysBWAKVuZuwWm9JWv
	sXnW6Nco7YQ3BZJwa5DMnkAn0h+NY7CyFdivdpq+an/pLkuxJ9M19Ii3RJmkhg==
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
Subject: [PATCH 06/15] mtd: nand: sunxi: introduce reg_user_data in sunxi_nfc_caps
Date: Fri, 10 Oct 2025 10:40:33 +0200
Message-ID: <20251010084042.341224-7-richard.genoud@bootlin.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251010084042.341224-1-richard.genoud@bootlin.com>
References: <20251010084042.341224-1-richard.genoud@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251010_014156_599317_19D61E6B 
X-CRM114-Status: GOOD (  12.12  )
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

The H6/H616 USER_DATA register is not at the same offset as the
A10/A23 one, so move its offset into sunxi_nfc_caps

No functional change.

Signed-off-by: Richard Genoud <richard.genoud@bootlin.com>
---
 drivers/mtd/nand/raw/sunxi_nand.c | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/nand/raw/sunxi_nand.c b/drivers/mtd/nand/raw/sunxi_nand.c
index faaac71e7be3..6c78370a6095 100644
--- a/drivers/mtd/nand/raw/sunxi_nand.c
+++ b/drivers/mtd/nand/raw/sunxi_nand.c
@@ -48,7 +48,8 @@
 #define NFC_REG_DEBUG		0x003C
 #define NFC_REG_A10_ECC_ERR_CNT	0x0040
 #define NFC_REG_ECC_ERR_CNT(nfc, x)	((nfc->caps->reg_ecc_err_cnt + (x)) & ~0x3)
-#define NFC_REG_USER_DATA(x)	(0x0050 + ((x) * 4))
+#define NFC_REG_A10_USER_DATA	0x0050
+#define NFC_REG_USER_DATA(nfc, x)	(nfc->caps->reg_user_data + ((x) * 4))
 #define NFC_REG_SPARE_AREA	0x00A0
 #define NFC_REG_PAT_ID		0x00A4
 #define NFC_REG_MDMA_ADDR	0x00C0
@@ -214,6 +215,7 @@ static inline struct sunxi_nand_chip *to_sunxi_nand(struct nand_chip *nand)
  *			through MBUS on A23/A33 needs extra configuration.
  * @reg_io_data:	I/O data register
  * @reg_ecc_err_cnt:	ECC error counter register
+ * @reg_user_data:	User data register
  * @dma_maxburst:	DMA maxburst
  * @ecc_strengths:	Available ECC strengths array
  * @nstrengths:		Size of @ecc_strengths
@@ -222,6 +224,7 @@ struct sunxi_nfc_caps {
 	bool has_mdma;
 	unsigned int reg_io_data;
 	unsigned int reg_ecc_err_cnt;
+	unsigned int reg_user_data;
 	unsigned int dma_maxburst;
 	const u8 *ecc_strengths;
 	unsigned int nstrengths;
@@ -723,8 +726,8 @@ static void sunxi_nfc_hw_ecc_get_prot_oob_bytes(struct nand_chip *nand, u8 *oob,
 {
 	struct sunxi_nfc *nfc = to_sunxi_nfc(nand->controller);
 
-	sunxi_nfc_user_data_to_buf(readl(nfc->regs + NFC_REG_USER_DATA(step)),
-				   oob);
+	sunxi_nfc_user_data_to_buf(readl(nfc->regs +
+					 NFC_REG_USER_DATA(nfc, step)), oob);
 
 	/* De-randomize the Bad Block Marker. */
 	if (bbm && (nand->options & NAND_NEED_SCRAMBLING))
@@ -746,7 +749,7 @@ static void sunxi_nfc_hw_ecc_set_prot_oob_bytes(struct nand_chip *nand,
 	}
 
 	writel(sunxi_nfc_buf_to_user_data(oob),
-	       nfc->regs + NFC_REG_USER_DATA(step));
+	       nfc->regs + NFC_REG_USER_DATA(nfc, step));
 }
 
 static void sunxi_nfc_hw_ecc_update_stats(struct nand_chip *nand,
@@ -2181,6 +2184,7 @@ static const u8 sunxi_ecc_strengths_a10[] = {
 static const struct sunxi_nfc_caps sunxi_nfc_a10_caps = {
 	.reg_io_data = NFC_REG_A10_IO_DATA,
 	.reg_ecc_err_cnt = NFC_REG_A10_ECC_ERR_CNT,
+	.reg_user_data = NFC_REG_A10_USER_DATA,
 	.dma_maxburst = 4,
 	.ecc_strengths = sunxi_ecc_strengths_a10,
 	.nstrengths = ARRAY_SIZE(sunxi_ecc_strengths_a10),
@@ -2190,6 +2194,7 @@ static const struct sunxi_nfc_caps sunxi_nfc_a23_caps = {
 	.has_mdma = true,
 	.reg_io_data = NFC_REG_A23_IO_DATA,
 	.reg_ecc_err_cnt = NFC_REG_A10_ECC_ERR_CNT,
+	.reg_user_data = NFC_REG_A10_USER_DATA,
 	.dma_maxburst = 8,
 	.ecc_strengths = sunxi_ecc_strengths_a10,
 	.nstrengths = ARRAY_SIZE(sunxi_ecc_strengths_a10),
-- 
2.47.3


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
