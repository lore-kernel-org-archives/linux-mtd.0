Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5244DCCA476
	for <linux-mtd@archiver.kernel.org>; Fri, 10 Oct 2025 08:42:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GxXM7+8Q8THkL55cCaR649y+gZ77tnZhGGbb4ub0keE=; b=NpAANO2tsfLtVY
	J/kWLEzN6xFpUkfkQ6QgS7KHKMq67RKAGFaPCjRXAzhG41s5tA2H2S4L+aPU4T0fUGk0ilyxAG/47
	EqEZ37cisd3HMZ2XzCucmQyoqMFmz92AMJj27B3HXQRsGMuyjmddDRFq//d0rNqKuhs0CFu8w1lnY
	G4idPXRrp6+Y6zeRNRbrZg/G0W314sQITagVobInd58CxQHROlILuJL+CNWFgFd8cfZprgjbmuKrC
	ffn0QQzqnDAcE57Kj0i+ci1aolY8xyQE5Cxkfe/6h9lmRhn6FIi+6WiicUgayWXDbtaILI9yF5Spx
	/xtqPMqtDU+Bf9fMk8tg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v78iA-0000000837r-1Yc1;
	Fri, 10 Oct 2025 08:42:50 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v78hd-000000082Ja-0egv;
	Fri, 10 Oct 2025 08:42:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=rRUQJ34yBDEQRJECh1MeBCDCN7q5t1MV6jZLuQSFP2g=; b=khlgpKdwSgVKsftOrsFHkQ3Az6
	D64VFIm091PxLWpZRuEnv+Y31xdIwpZMRlaKtwdHZXqNk0t4TRKj6Vwx6I5nEk+QS/W0EBPNAadCj
	GkPWk2PaLsnPxTiwF8wpTdw31p8JOSKqMAmlD/rzMjeL/hFJQcg20h5Yhgh/MiuKoA5BHYqTQuHiR
	It6JTjTOzOr33o5+IottWu0SHET+dyTTDRiWG0Dg8Onq7rG6VMbD+rC1aW7I7muZQZUq7YO1+MbDD
	6d5Y8TJwYW49giZ8czV3u893wPh8UMNbJX7hMztZhXhk6F3IY8tRA2tTn0nlUNjUZguk6Ctxu9gTY
	t/bpI05w==;
Received: from smtpout-04.galae.net ([185.171.202.116])
	by casper.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v78hX-00000007ZFY-1nGk;
	Fri, 10 Oct 2025 08:42:15 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 50506C08CCA;
	Fri, 10 Oct 2025 08:41:46 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id EDA4860667;
	Fri, 10 Oct 2025 08:42:04 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 52819102F2207;
	Fri, 10 Oct 2025 10:42:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1760085723; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=rRUQJ34yBDEQRJECh1MeBCDCN7q5t1MV6jZLuQSFP2g=;
	b=Tkd4UNkK3WjiPjOrsD0l9gsyO2oU43kzmJwd3LHFb5HHG3HmadoK0OTbXbe2yvNPk2hcTy
	JGpakH+FT1KoYPYtrpn7V3jmk/e5jMCjRWtz53dAoAhKaX/ZEthzuHEheFrjo+g8rAPXv9
	+8ucUMMklbhZtdNIMZ2nmmMa3b1Zu3wuuGWIqNUxc+JxmxwuEYupIcBV+66dIpidQo/liK
	Rij+nA4++61e7BDEGN+3ppJ5wRH76YzwdLw4ak8BzoQafHvuGbLEPK+gUjE1EagJ5Wg7nX
	U4/T5VQHAsuxGBvS/j9/S/nNmPrceAyLBJGp3aYDeh5zMzED/DoXHg3jdyE/kQ==
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
Subject: [PATCH 14/15] mtd: nand: sunxi: introduce sram_size in sunxi_nfc_caps
Date: Fri, 10 Oct 2025 10:40:41 +0200
Message-ID: <20251010084042.341224-15-richard.genoud@bootlin.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251010084042.341224-1-richard.genoud@bootlin.com>
References: <20251010084042.341224-1-richard.genoud@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251010_094212_726683_FDA7EF50 
X-CRM114-Status: GOOD (  13.07  )
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

The H6/H616 the SRAM is bigger than the A10/A23 one, so move its size
into sunxi_nfc_caps.

No functional change

Signed-off-by: Richard Genoud <richard.genoud@bootlin.com>
---
 drivers/mtd/nand/raw/sunxi_nand.c | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/drivers/mtd/nand/raw/sunxi_nand.c b/drivers/mtd/nand/raw/sunxi_nand.c
index 3912878e7645..e81d74c6633a 100644
--- a/drivers/mtd/nand/raw/sunxi_nand.c
+++ b/drivers/mtd/nand/raw/sunxi_nand.c
@@ -167,8 +167,6 @@
 
 #define NFC_DEFAULT_TIMEOUT_MS	1000
 
-#define NFC_SRAM_SIZE		1024
-
 #define NFC_MAX_CS		7
 
 /**
@@ -240,6 +238,7 @@ static inline struct sunxi_nand_chip *to_sunxi_nand(struct nand_chip *nand)
  * @dma_maxburst:	DMA maxburst
  * @ecc_strengths:	Available ECC strengths array
  * @nstrengths:		Size of @ecc_strengths
+ * @sram_size:		Size of the NAND controller SRAM
  */
 struct sunxi_nfc_caps {
 	bool has_mdma;
@@ -258,6 +257,7 @@ struct sunxi_nfc_caps {
 	unsigned int dma_maxburst;
 	const u8 *ecc_strengths;
 	unsigned int nstrengths;
+	int sram_size;
 };
 
 /**
@@ -495,7 +495,7 @@ static void sunxi_nfc_read_buf(struct nand_chip *nand, uint8_t *buf, int len)
 	while (len > offs) {
 		bool poll = false;
 
-		cnt = min(len - offs, NFC_SRAM_SIZE);
+		cnt = min(len - offs, nfc->caps->sram_size);
 
 		ret = sunxi_nfc_wait_cmd_fifo_empty(nfc);
 		if (ret)
@@ -533,7 +533,7 @@ static void sunxi_nfc_write_buf(struct nand_chip *nand, const uint8_t *buf,
 	while (len > offs) {
 		bool poll = false;
 
-		cnt = min(len - offs, NFC_SRAM_SIZE);
+		cnt = min(len - offs, nfc->caps->sram_size);
 
 		ret = sunxi_nfc_wait_cmd_fifo_empty(nfc);
 		if (ret)
@@ -1861,7 +1861,7 @@ static int sunxi_nfc_exec_subop(struct nand_chip *nand,
 		case NAND_OP_DATA_OUT_INSTR:
 			start = nand_subop_get_data_start_off(subop, i);
 			remaining = nand_subop_get_data_len(subop, i);
-			cnt = min_t(u32, remaining, NFC_SRAM_SIZE);
+			cnt = min_t(u32, remaining, nfc->caps->sram_size);
 			cmd |= NFC_DATA_TRANS | NFC_DATA_SWAP_METHOD;
 
 			if (instr->type == NAND_OP_DATA_OUT_INSTR) {
@@ -2242,6 +2242,7 @@ static const struct sunxi_nfc_caps sunxi_nfc_a10_caps = {
 	.dma_maxburst = 4,
 	.ecc_strengths = sunxi_ecc_strengths_a10,
 	.nstrengths = ARRAY_SIZE(sunxi_ecc_strengths_a10),
+	.sram_size = 1024,
 };
 
 static const struct sunxi_nfc_caps sunxi_nfc_a23_caps = {
@@ -2261,6 +2262,7 @@ static const struct sunxi_nfc_caps sunxi_nfc_a23_caps = {
 	.dma_maxburst = 8,
 	.ecc_strengths = sunxi_ecc_strengths_a10,
 	.nstrengths = ARRAY_SIZE(sunxi_ecc_strengths_a10),
+	.sram_size = 1024,
 };
 
 static const struct of_device_id sunxi_nfc_ids[] = {
-- 
2.47.3


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
