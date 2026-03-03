Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2637EDA68D
	for <linux-mtd@archiver.kernel.org>; Tue,  3 Mar 2026 16:37:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6fKX90iOTxj8AlAgyNiM1WC7qbeFgQ0YOmr2B/kMlho=; b=b5UUh7rNjyNJGe
	h4uYhIYd6c1Od/K6pfHI6jpHw2+QfmP+awXT08E1cak2Bx3kG7vXtXfhlko/QN2yR0sYcM4Dv3QhS
	kF5VNPpYN5By+hnl+yRa/PYzriMsGB4cdsOR2fPCR2Wu47lZFdsUL+INN++FmsgYHetHt4rZteHt6
	vXb3WxjC/joHqFcppWX0WCaOutmahKhGKhOk9OpGwV7E8uGvtNS85dgtUEoE2gbgfx7qZbeCEN9v1
	dT1m+Ue9XG8OTzoDt26jbnDO4+NycerGfs9Xm5QO3gjX6Cl/cUHxbkylVsja/lJneBPFPKKLC0Hx0
	tVvva6L5mmF5BIx6RE/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxSkD-0000000Faek-3G1s;
	Tue, 03 Mar 2026 16:37:13 +0000
Received: from mail.fris.de ([116.203.77.234])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxSkB-0000000Fae6-0F65
	for linux-mtd@lists.infradead.org;
	Tue, 03 Mar 2026 16:37:12 +0000
From: Frieder Schrempf <frieder@fris.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fris.de; s=mail;
	t=1772555397;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=fHCcxgpay9q2fQOrVBGP3YNnaqk0n6N/P64jHvnyofU=;
	b=iogRgar7uYnzR+8yuvbkV8DUafaYRQNvYxN+zNlkjQ3TPx8eqQJFCMXCdMCYC/XoXFoaE9
	xb5mjVj+s4g6TUia8H60bSjERiWF/W1QW1jmboQOFkqkvSsTUZtFmLV//q3r3kT7yEzKxr
	pIB9Cm19dIjCo0sKuNPK94ngayx04bn0IYug5oz9vAQ1be1ophIOEFrhVJcr7Nf3d8AufR
	lz9HlLvSrnCx7iDNH198HHxL2rL1io3gobl1zyl2TrOF0WpDyXRJNWXEx49AHNydhVqHyY
	soEUIZYdho4rZHPgYUmhkWWwcRvao2MyTkFeaBwImtf+A1RcmOKQZe04AgY1+g==
Date: Tue, 03 Mar 2026 17:29:23 +0100
Subject: [PATCH RFC 2/7] mtd: spinand: Add support for clock to RX delay
 setting
MIME-Version: 1.0
Message-Id: <20260303-fsl-qspi-rx-sampling-delay-v1-2-9326bbc492d6@kontron.de>
References: <20260303-fsl-qspi-rx-sampling-delay-v1-0-9326bbc492d6@kontron.de>
In-Reply-To: <20260303-fsl-qspi-rx-sampling-delay-v1-0-9326bbc492d6@kontron.de>
To: Mark Brown <broonie@kernel.org>, 
 Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Han Xu <han.xu@nxp.com>
Cc: Eberhard Stoll <eberhard.stoll@kontron.de>, 
 Frieder Schrempf <frieder.schrempf@kontron.de>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Pratyush Yadav <pratyush@kernel.org>, Michael Walle <mwalle@kernel.org>, 
 linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-mtd@lists.infradead.org, imx@lists.linux.dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=2067;
 i=frieder.schrempf@kontron.de; h=from:subject:message-id;
 bh=aPAds6dnQdXTjjQL53ALn43JPMhWJpGj9MuI9SkzCsc=;
 b=owGbwMvMwCWWWSatKlDTJMZ4Wi2JIXM5T9Pk3NsnP/6KlLPaWSkf85rzh4DYrLz4zsJf+3PFm
 PsT5/p1lLIwiHExyIopskjxW7y2NYv1kT9WHQUzh5UJZAgDF6cATOSuJCPDeacbgeJCr6uWmpQe
 nXZ7R+0TM/MDq+bwvDy190jwz2wVd0aG2RuXm7UH2HeJ/7Lecld28gytuEt8J20rrjaZ/45bmNb
 NAQA=
X-Developer-Key: i=frieder.schrempf@kontron.de; a=openpgp;
 fpr=1A0F38EB3D365D4C1FC67B5A69761B25107C8216
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260303_083711_248377_36E013E8 
X-CRM114-Status: GOOD (  10.19  )
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

From: Eberhard Stoll <eberhard.stoll@kontron.de>

Add the configuration parameter to set the SPI clock to receive
data delay parameter for SPI NAND devices.

This parameter is often referenced as tCLQV in SPI NAND device
data sheets.

Signed-off-by: Eberhard Stoll <eberhard.stoll@kontron.de>
Signed-off-by: Frieder Schrempf <frieder.schrempf@kontron.de>
---
 drivers/mtd/nand/spi/core.c | 1 +
 include/linux/mtd/spinand.h | 5 +++++
 2 files changed, 6 insertions(+)

diff --git a/drivers/mtd/nand/spi/core.c b/drivers/mtd/nand/spi/core.c
index 8aa3753aaaa1d..782a605018bc3 100644
--- a/drivers/mtd/nand/spi/core.c
+++ b/drivers/mtd/nand/spi/core.c
@@ -1594,6 +1594,7 @@ int spinand_match_and_init(struct spinand_device *spinand,
 		spinand->user_otp = &table[i].user_otp;
 		spinand->read_retries = table[i].read_retries;
 		spinand->set_read_retry = table[i].set_read_retry;
+		spinand->spimem->spi->rx_sampling_delay_ns = table[i].rx_sampling_delay_ns;
 
 		/* I/O variants selection with single-spi SDR commands */
 
diff --git a/include/linux/mtd/spinand.h b/include/linux/mtd/spinand.h
index 6a024cf1c53ac..b76aaf0747962 100644
--- a/include/linux/mtd/spinand.h
+++ b/include/linux/mtd/spinand.h
@@ -568,6 +568,7 @@ enum spinand_bus_interface {
  * @model: model name
  * @devid: device ID
  * @flags: OR-ing of the SPINAND_XXX flags
+ * @rx_sampling_delay_ns: clock to rx data delay timing (tCLQV)
  * @memorg: memory organization
  * @eccreq: ECC requirements
  * @eccinfo: on-die ECC info
@@ -592,6 +593,7 @@ struct spinand_info {
 	const char *model;
 	struct spinand_devid devid;
 	u32 flags;
+	u32 rx_sampling_delay_ns;
 	struct nand_memory_organization memorg;
 	struct nand_ecc_props eccreq;
 	struct spinand_ecc_info eccinfo;
@@ -643,6 +645,9 @@ struct spinand_info {
 #define SPINAND_CONFIGURE_CHIP(__configure_chip)			\
 	.configure_chip = __configure_chip
 
+#define SPINAND_RX_SAMPLING_DELAY(__delay)				\
+	.rx_sampling_delay_ns = __delay
+
 #define SPINAND_CONT_READ(__set_cont_read)				\
 	.set_cont_read = __set_cont_read
 

-- 
2.53.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
