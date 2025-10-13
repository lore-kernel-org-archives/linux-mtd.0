Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04A49CCD18E
	for <linux-mtd@archiver.kernel.org>; Mon, 13 Oct 2025 15:28:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3J/hHDUVR2iiguj/TEYy6RjdiTa8wuy5Qmr1hFPplzQ=; b=O6TXdl5ghNzt/x
	hiqpWsC18tmGsCyOq790s8n3AeQgXUVaALptzA45+T1S5JwCxfAQZMdg8zIVsBBGqOsPprXFUs7dg
	pKFEkgjfsoCLtjVzwNYKMvqmwJ0iVU9MU+NT5/OBPoUFRvcsU/unbrtA0dOyGEA6StbMQmfb4yzUQ
	/Tg4o5JXlNukoan4xuJjslsT0CxVeSzlBQpOZ8Wq5FAgVeW8+UOZzkBcrPdY4SWL6zTcrob1ELCiV
	OeG03lvWrUFWWOXqMeFBSdc/mdRHdIJODOWxoGiZdtR0MrEmTk2bA/jrUo7Ij9gi6dt43yJHJZaf8
	sAsrM+Pa/8k9P9C6VVbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8KTF-0000000DfGM-1XDN;
	Mon, 13 Oct 2025 15:28:21 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8KTB-0000000Df8F-0b4Y
	for linux-mtd@bombadil.infradead.org;
	Mon, 13 Oct 2025 15:28:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=FMTlrYQnhBYB/I9vVH4uQ6alkyuaVWds87Lxblu5MFA=; b=Fw6DBhexoWX/IC4xBiSBAI1hGg
	ST0AqvbWha8GHQAeungli8ETV0IdOk3MTiueZG3PlNH9k6IWP4OixsKb+iJ3O8DFHx0LrSW0nXf+w
	K8uljA0GCzVTQftujlkroQAIZeeFAGd+fdqyGlE9DaWTpLQntQqqmvvQPDxeBY86lFSJP9ti3tAyd
	ih1DHuRDqZDwiOgqjgGDTsN6ZtewMEoN7foFhXRyZR5JFpBlyeOQDNGejytmWcUCVLXnOPHBJYByo
	r2hmuEpNNAeyXkXi6Ax8BH4EKATVWGGEUx7omj5Ho2bD7jIWAnBVf1O+MJx4OesPnNbG9vTvtC/Et
	M6vJkB7Q==;
Received: from smtpout-03.galae.net ([185.246.85.4])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8KSr-00000004PcD-1qC5
	for linux-mtd@lists.infradead.org;
	Mon, 13 Oct 2025 15:28:08 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 3761F4E4106C;
	Mon, 13 Oct 2025 15:27:55 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 0CFC06067B;
	Mon, 13 Oct 2025 15:27:55 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id D74CE102F2278;
	Mon, 13 Oct 2025 17:27:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1760369274; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=FMTlrYQnhBYB/I9vVH4uQ6alkyuaVWds87Lxblu5MFA=;
	b=ZygzAa6YwmOcFmcZe/Fzf8CQzS1NfTYqfY9A90F6WSwQdPnY5OtYne/ZpD4RQCOOxNdfli
	Q1oV6hjRSiCAp1o4d7KQmNWhktWtO645KVRMXJhzrzHVNN6B1j/xehdX41LZFD7T7rhzj1
	hHwkTIHsExXAQUmluLaIjwBfYaWXPd2/QwIlh3l97n/MOH7do+s5q6d5eWCOSLX9d0Yqlh
	c1aAQerpV7yCm1g504kONDv8bgNC8sfMga8nRmTWNyBSQoYkpcFEaSRLzk/bDcafgFKunk
	fRtyH9VXm9l9ZZA/BINjTzEUpGPt2v5A0NCh/jdVqDWj+w0tT4LELw0aieN1gA==
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
Subject: [PATCH v2 11/15] mtd: rawnand: sunxi: introduce ecc_err_mask in sunxi_nfc_caps
Date: Mon, 13 Oct 2025 17:26:41 +0200
Message-ID: <20251013152645.1119308-12-richard.genoud@bootlin.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251013152645.1119308-1-richard.genoud@bootlin.com>
References: <20251013152645.1119308-1-richard.genoud@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251013_162759_462725_69D9D7A6 
X-CRM114-Status: GOOD (  11.95  )
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
