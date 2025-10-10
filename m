Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 018B6CAC5BB
	for <linux-mtd@archiver.kernel.org>; Fri, 10 Oct 2025 08:42:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tns+92dXu0Kdkkh21HSB0LaPQ3E/R+J4FTT/ijaUjK0=; b=G9wQ3QDZpFdjA+
	x+iqaTW04fYP1eillMQEZvMvZ8+ZFTRV3yholq/qkXlIkoNTIGSDPBrVmeeXPCmpSH+tofXhWQS6a
	vOGpGVr316mOAqLD1/nI84WTIZiCkvyT705iIkiPybB1xv8Kxjmv2NN/Go0j1o0M21CS/Hlz3UXPK
	LVr9wIk/tyG8zUCy+/PwX6ujMrqnDTvJ/Api79AI/dB2Wbv57njw24f0ce679G/u+M3agpDPeTbkH
	YJkIE8a5zpB1nctL0AaJJUr9f3HghHIOsI+ldl4WPjqBtHCLaUmoXT2Y8nVP3Ih64fGhTO7RT/4O8
	PX61escgBnrU9W0UU1dw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v78hc-000000082Io-070O;
	Fri, 10 Oct 2025 08:42:16 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v78hV-0000000828f-3ujg
	for linux-mtd@bombadil.infradead.org;
	Fri, 10 Oct 2025 08:42:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=xBC8LNngzpgWuLk6Iaxw78Ekk5fw7GlULT04baQhk6A=; b=OVF0cm2rXLXKrid9jTw3yo1K5y
	ErQk6rpCvy+65jEIQMMseGucYKQzrJVd1p5arYwUXJq8PmjD/Lj2TvGJ1nlsPTNDZ4hI2QUe/ec4e
	pKosvoTu53sYxRWErbKmaqAQKSZHh9gvHT0nmVNGVqt5NkId/4uyhPhsjFBIDdarVLaVqZp4xrAav
	S86MzoA++RO1Sc3TrGiJLkA7q824rMrd0iFPiFBLROpjddb9EejCCOhDyv7odAaktvy6V2RTM3pji
	JN7jxEDNiygsMx9LvNXwI1Xegm9AOpOPqnXU8Z/BP2eVchXoQXQu0iqZkctMd7fzyWPhh+C/r3a3v
	lt5MVNFQ==;
Received: from smtpout-04.galae.net ([185.171.202.116])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v78hQ-000000021nZ-41p7
	for linux-mtd@lists.infradead.org;
	Fri, 10 Oct 2025 08:42:08 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 76786C08CCB;
	Fri, 10 Oct 2025 08:41:43 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 2073860667;
	Fri, 10 Oct 2025 08:42:02 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id D39B1102F21F6;
	Fri, 10 Oct 2025 10:41:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1760085720; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=xBC8LNngzpgWuLk6Iaxw78Ekk5fw7GlULT04baQhk6A=;
	b=0HaMos45nHtmvcPEgvdxfUvSvNERAh0a4+FTd8TKlvL9WGObj5JEeNfO96cRJboo4xUElo
	vYvhVBBDORZahnmNc9q6goXzKfGYYOsD16spyFb+Wffjl9StdFrWfe/Hh3m8Qq4mfKViic
	xrOPe68/TlfY9MK8HM3RUhZEwKhJwAk6TcJUdLD3OJNvZo3JM/IEOERR/doz5znqkHblWr
	PUKZWObVdJCg3wBm7Y/JE6cSnLGZwntoHuSZTk+QlGfJ8Ju4CoeZQxZv+Vy0eXZtNxW9mt
	stdJi/uEqmsvTsauB84razb99kccAdRRJlJiQ53hDhZq7PXTkepMeCobX2ybPg==
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
Subject: [PATCH 13/15] mtd: nand: sunxi: introduce ecc_err_mask in sunxi_nfc_caps
Date: Fri, 10 Oct 2025 10:40:40 +0200
Message-ID: <20251010084042.341224-14-richard.genoud@bootlin.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251010084042.341224-1-richard.genoud@bootlin.com>
References: <20251010084042.341224-1-richard.genoud@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251010_094205_079789_EFE85D8F 
X-CRM114-Status: GOOD (  12.26  )
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
index 80aafa4e1844..3912878e7645 100644
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
-- 
2.47.3


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
