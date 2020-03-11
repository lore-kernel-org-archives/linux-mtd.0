Return-Path: <SRS0=SuWK=44=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8617C10F27
	for <linux-mtd@archiver.kernel.org>; Wed, 11 Mar 2020 05:09:42 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BFB9B208C4
	for <linux-mtd@archiver.kernel.org>; Wed, 11 Mar 2020 05:09:42 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="aa0r8dDb"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BFB9B208C4
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=perches.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4TEaK8w1xNF5tS2kEzKmVd4Mf7sjAe7VL0TjNBw0w5I=; b=aa0r8dDbctTPYk
	F+MggehmlRVlg5zDFlD8e5cxkoVM/r4JSznJjxLMNzaD+l7UL8hzD9HJpcYFRuibNmMQOW6eixkmH
	4QFB/notrK+s+QTJQ296uFyedFf2UUbUWYRGsT5H9k0ITmSH1F3dEJ+ZbP6xF2+K8wBad8uIpItGg
	GQl4KI019ZGl73rUVhsf7HeYwM79zLNBemO/j1kLS+FElxhtZt+5aNBVZfmd3XQgdpMFFlWdPh9N4
	TQ3VnBSzwJb0867dwPvc+lXHOLjmfc2XfcdTIz9KjKKnmT5Pgnu4nF4SFndyPxeUSsoecn64hxc9N
	+h+DZf7gUP2Gk6DoYo8g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jBtcO-00010s-UH; Wed, 11 Mar 2020 05:09:20 +0000
Received: from smtprelay0151.hostedemail.com ([216.40.44.151]
 helo=smtprelay.hostedemail.com)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jBtaJ-0007LK-Su
 for linux-mtd@lists.infradead.org; Wed, 11 Mar 2020 05:07:15 +0000
Received: from filter.hostedemail.com (clb03-v110.bra.tucows.net
 [216.40.38.60])
 by smtprelay06.hostedemail.com (Postfix) with ESMTP id 69F6618224519;
 Wed, 11 Mar 2020 05:07:10 +0000 (UTC)
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-HE-Tag: cream52_212c176dc7e35
X-Filterd-Recvd-Size: 5395
Received: from joe-laptop.perches.com (unknown [47.151.143.254])
 (Authenticated sender: joe@perches.com)
 by omf16.hostedemail.com (Postfix) with ESMTPA;
 Wed, 11 Mar 2020 05:07:07 +0000 (UTC)
From: Joe Perches <joe@perches.com>
To: Paul Cercueil <paul@crapouillou.net>,
 Harvey Hunt <harveyhuntnexus@gmail.com>
Subject: [PATCH -next 013/491] INGENIC JZ47xx SoCs: Use fallthrough;
Date: Tue, 10 Mar 2020 21:51:27 -0700
Message-Id: <ad408ff8dc4e5fae0884312cb0aa618664e546e5.1583896348.git.joe@perches.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <cover.1583896344.git.joe@perches.com>
References: <cover.1583896344.git.joe@perches.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200310_220712_096412_B60A0A83 
X-CRM114-Status: GOOD (  10.41  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Ulf Hansson <ulf.hansson@linaro.org>, Vignesh Raghavendra <vigneshr@ti.com>,
 alsa-devel@alsa-project.org, David Airlie <airlied@linux.ie>,
 Richard Weinberger <richard@nod.at>, Takashi Iwai <tiwai@suse.com>,
 linux-mmc@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>,
 dri-devel@lists.freedesktop.org, Jaroslav Kysela <perex@perex.cz>,
 Mark Brown <broonie@kernel.org>, linux-mtd@lists.infradead.org,
 Daniel Vetter <daniel@ffwll.ch>, Miquel Raynal <miquel.raynal@bootlin.com>,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Convert the various uses of fallthrough comments to fallthrough;

Done via script
Link: https://lore.kernel.org/lkml/b56602fcf79f849e733e7b521bb0e17895d390fa.1582230379.git.joe.com/

Signed-off-by: Joe Perches <joe@perches.com>
---
 drivers/gpu/drm/ingenic/ingenic-drm.c           | 2 +-
 drivers/mmc/host/jz4740_mmc.c                   | 6 ++----
 drivers/mtd/nand/raw/ingenic/ingenic_nand_drv.c | 2 +-
 drivers/mtd/nand/raw/ingenic/jz4725b_bch.c      | 4 ++--
 drivers/mtd/nand/raw/ingenic/jz4780_bch.c       | 4 ++--
 sound/soc/codecs/jz4770.c                       | 2 +-
 6 files changed, 9 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/ingenic/ingenic-drm.c b/drivers/gpu/drm/ingenic/ingenic-drm.c
index 9dfe7c..8eefe7 100644
--- a/drivers/gpu/drm/ingenic/ingenic-drm.c
+++ b/drivers/gpu/drm/ingenic/ingenic-drm.c
@@ -305,7 +305,7 @@ static void ingenic_drm_crtc_update_ctrl(struct ingenic_drm *priv,
 	switch (finfo->format) {
 	case DRM_FORMAT_XRGB1555:
 		ctrl |= JZ_LCD_CTRL_RGB555;
-		/* fall-through */
+		fallthrough;
 	case DRM_FORMAT_RGB565:
 		ctrl |= JZ_LCD_CTRL_BPP_15_16;
 		break;
diff --git a/drivers/mmc/host/jz4740_mmc.c b/drivers/mmc/host/jz4740_mmc.c
index fbae87..9026af6 100644
--- a/drivers/mmc/host/jz4740_mmc.c
+++ b/drivers/mmc/host/jz4740_mmc.c
@@ -737,8 +737,7 @@ static irqreturn_t jz_mmc_irq_worker(int irq, void *devid)
 			break;
 
 		jz_mmc_prepare_data_transfer(host);
-		/* fall through */
-
+		fallthrough;
 	case JZ4740_MMC_STATE_TRANSFER_DATA:
 		if (host->use_dma) {
 			/* Use DMA if enabled.
@@ -772,8 +771,7 @@ static irqreturn_t jz_mmc_irq_worker(int irq, void *devid)
 			break;
 		}
 		jz4740_mmc_write_irq_reg(host, JZ_MMC_IRQ_DATA_TRAN_DONE);
-		/* fall through */
-
+		fallthrough;
 	case JZ4740_MMC_STATE_SEND_STOP:
 		if (!req->stop)
 			break;
diff --git a/drivers/mtd/nand/raw/ingenic/ingenic_nand_drv.c b/drivers/mtd/nand/raw/ingenic/ingenic_nand_drv.c
index 49afeb..935c49 100644
--- a/drivers/mtd/nand/raw/ingenic/ingenic_nand_drv.c
+++ b/drivers/mtd/nand/raw/ingenic/ingenic_nand_drv.c
@@ -253,7 +253,7 @@ static int ingenic_nand_attach_chip(struct nand_chip *chip)
 		chip->ecc.hwctl = ingenic_nand_ecc_hwctl;
 		chip->ecc.calculate = ingenic_nand_ecc_calculate;
 		chip->ecc.correct = ingenic_nand_ecc_correct;
-		/* fall through */
+		fallthrough;
 	case NAND_ECC_SOFT:
 		dev_info(nfc->dev, "using %s (strength %d, size %d, bytes %d)\n",
 			 (nfc->ecc) ? "hardware ECC" : "software ECC",
diff --git a/drivers/mtd/nand/raw/ingenic/jz4725b_bch.c b/drivers/mtd/nand/raw/ingenic/jz4725b_bch.c
index 6c852ea..2d0e0a 100644
--- a/drivers/mtd/nand/raw/ingenic/jz4725b_bch.c
+++ b/drivers/mtd/nand/raw/ingenic/jz4725b_bch.c
@@ -145,10 +145,10 @@ static void jz4725b_bch_read_parity(struct ingenic_ecc *bch, u8 *buf,
 	switch (size8) {
 	case 3:
 		dest8[2] = (val >> 16) & 0xff;
-		/* fall-through */
+		fallthrough;
 	case 2:
 		dest8[1] = (val >> 8) & 0xff;
-		/* fall-through */
+		fallthrough;
 	case 1:
 		dest8[0] = val & 0xff;
 		break;
diff --git a/drivers/mtd/nand/raw/ingenic/jz4780_bch.c b/drivers/mtd/nand/raw/ingenic/jz4780_bch.c
index 079266a..d67dbf 100644
--- a/drivers/mtd/nand/raw/ingenic/jz4780_bch.c
+++ b/drivers/mtd/nand/raw/ingenic/jz4780_bch.c
@@ -123,10 +123,10 @@ static void jz4780_bch_read_parity(struct ingenic_ecc *bch, void *buf,
 	switch (size8) {
 	case 3:
 		dest8[2] = (val >> 16) & 0xff;
-		/* fall through */
+		fallthrough;
 	case 2:
 		dest8[1] = (val >> 8) & 0xff;
-		/* fall through */
+		fallthrough;
 	case 1:
 		dest8[0] = val & 0xff;
 		break;
diff --git a/sound/soc/codecs/jz4770.c b/sound/soc/codecs/jz4770.c
index e7cf2c..6e2a91 100644
--- a/sound/soc/codecs/jz4770.c
+++ b/sound/soc/codecs/jz4770.c
@@ -202,7 +202,7 @@ static int jz4770_codec_set_bias_level(struct snd_soc_component *codec,
 				   REG_CR_VIC_SB_SLEEP, REG_CR_VIC_SB_SLEEP);
 		regmap_update_bits(regmap, JZ4770_CODEC_REG_CR_VIC,
 				   REG_CR_VIC_SB, REG_CR_VIC_SB);
-	/* fall-through */
+		fallthrough;
 	default:
 		break;
 	}
-- 
2.24.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
