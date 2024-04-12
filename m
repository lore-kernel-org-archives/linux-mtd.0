Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46789C4345F
	for <linux-mtd@archiver.kernel.org>; Fri, 12 Apr 2024 13:44:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=etU36GPICb1zauYubnMkE3lVpUeK9iOlnu1npycawmA=; b=GMTxzXkmA4djYV
	/VNR0LBLCe7MWu+x1X9R1Cg+9MgFpZT6O9FgSDZUNWMgiBtJpTNuD2bw6rLO+IaCG7lbIEQkJk2WH
	8AbVZs33YPUiJXQ8Exlra+YMQAG0tAQOFNcdSyTSm6XKlS18VJ1jzfb5dNHm4b3TMq2NCX1eG4a/s
	/Ro3gmofIhUDu1zcyOdtg1dm+9fcFH2ej/BA/t0GMEOK2PmsJYGTQB3MoNcy6O8i6i/ZSgJCuMV19
	NdYbaUqkj8VGrsDm0I0JtH2/VhLFBHqAsipxxp8dEWIf7AD0VWG1djjU3KXKannK7a++D7AlVtI0f
	gr6vkE2gKuBl0ZzGO49A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rvHCg-0000000HONX-3xbz;
	Fri, 12 Apr 2024 13:44:30 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rvHCY-0000000HOH5-2QsS
	for linux-mtd@lists.infradead.org;
	Fri, 12 Apr 2024 13:44:27 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id E8F84CE3947;
	Fri, 12 Apr 2024 13:44:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D2D29C113CC;
	Fri, 12 Apr 2024 13:44:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712929460;
	bh=AWw8QbtlrB4/ifJTs50t8o18KiRdvOyj1VqAGw4riZg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Y5bW4N7YtsBTPZQWSl+W7pqUwakqlNtumlkAg3tNKkn33l87kakt6DdsnqGeyuBDA
	 IrHE+Csk5ZZ2gM8lNWKZQzuL6LB/ttsAtxdBLEdBF2Mt7rHGHuEWyjwivTspBisfFh
	 XEUXOq0vPnOTHYrK+WKNRKCPtGPWFJ4W7wlEZxK3xSNsCPKUOLRdAPoHNBkXivy/tw
	 X7Cy1uEJsQSHgpFNM2OSjXW2BTJaQZ8mmnBf8fSQtME0rY4eBJq56ImlqUaRaoApWD
	 xCqwVXBclDHmA9aMU94FzT6n61R1GBQT4x1uCBKl8iLOiT1qFM2W+VnEYsdldxxyyu
	 t/lzEfqalFtwQ==
From: Michael Walle <mwalle@kernel.org>
To: Tudor Ambarus <tudor.ambarus@linaro.org>,
	Pratyush Yadav <pratyush@kernel.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-kernel@vger.kernel.org,
	linux-mtd@lists.infradead.org,
	Michael Walle <mwalle@kernel.org>
Subject: [PATCH v1 3/6] mtd: spi-nor: get rid of SPI_NOR_NO_FR
Date: Fri, 12 Apr 2024 15:44:02 +0200
Message-Id: <20240412134405.381832-4-mwalle@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240412134405.381832-1-mwalle@kernel.org>
References: <20240412134405.381832-1-mwalle@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240412_064423_279766_8ECBE7C7 
X-CRM114-Status: GOOD (  15.87  )
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

The evervision FRAM devices are the only user of the NO_FR flag. Drop
the global flag and instead use a manufacturer fixup for the evervision
flashes to drop the fast read support.

Signed-off-by: Michael Walle <mwalle@kernel.org>
---
Please note, that the fast read opcode will still be set in
spi_nor_init_default_params(), but the selection of the read opcodes
just depends on the mask.

That is also something I want to fix soon: the opcodes can always
be set and the drivers/SFDP will only set the mask. Opcodes then can be
switched between 3b and 4b ones if necessary.
---
 drivers/mtd/spi-nor/core.c     | 12 +++++-------
 drivers/mtd/spi-nor/core.h     |  2 --
 drivers/mtd/spi-nor/everspin.c | 19 +++++++++++++++----
 3 files changed, 20 insertions(+), 13 deletions(-)

diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
index fb76e0522665..65e6531ada0a 100644
--- a/drivers/mtd/spi-nor/core.c
+++ b/drivers/mtd/spi-nor/core.c
@@ -2952,14 +2952,12 @@ static void spi_nor_init_default_params(struct spi_nor *nor)
 	params->page_size = info->page_size ?: SPI_NOR_DEFAULT_PAGE_SIZE;
 	params->n_banks = info->n_banks ?: SPI_NOR_DEFAULT_N_BANKS;
 
-	if (!(info->flags & SPI_NOR_NO_FR)) {
-		/* Default to Fast Read for DT and non-DT platform devices. */
-		params->hwcaps.mask |= SNOR_HWCAPS_READ_FAST;
+	/* Default to Fast Read for DT and non-DT platform devices. */
+	params->hwcaps.mask |= SNOR_HWCAPS_READ_FAST;
 
-		/* Mask out Fast Read if not requested at DT instantiation. */
-		if (np && !of_property_read_bool(np, "m25p,fast-read"))
-			params->hwcaps.mask &= ~SNOR_HWCAPS_READ_FAST;
-	}
+	/* Mask out Fast Read if not requested at DT instantiation. */
+	if (np && !of_property_read_bool(np, "m25p,fast-read"))
+		params->hwcaps.mask &= ~SNOR_HWCAPS_READ_FAST;
 
 	/* (Fast) Read settings. */
 	params->hwcaps.mask |= SNOR_HWCAPS_READ;
diff --git a/drivers/mtd/spi-nor/core.h b/drivers/mtd/spi-nor/core.h
index 072c69b0d06c..9aa7d6399c8a 100644
--- a/drivers/mtd/spi-nor/core.h
+++ b/drivers/mtd/spi-nor/core.h
@@ -479,7 +479,6 @@ struct spi_nor_id {
  *                            Usually these will power-up in a write-protected
  *                            state.
  *   SPI_NOR_NO_ERASE:        no erase command needed.
- *   SPI_NOR_NO_FR:           can't do fastread.
  *   SPI_NOR_QUAD_PP:         flash supports Quad Input Page Program.
  *   SPI_NOR_RWW:             flash supports reads while write.
  *
@@ -528,7 +527,6 @@ struct flash_info {
 #define SPI_NOR_BP3_SR_BIT6		BIT(4)
 #define SPI_NOR_SWP_IS_VOLATILE		BIT(5)
 #define SPI_NOR_NO_ERASE		BIT(6)
-#define SPI_NOR_NO_FR			BIT(7)
 #define SPI_NOR_QUAD_PP			BIT(8)
 #define SPI_NOR_RWW			BIT(9)
 
diff --git a/drivers/mtd/spi-nor/everspin.c b/drivers/mtd/spi-nor/everspin.c
index 5f321e24ae7d..0720a61947e7 100644
--- a/drivers/mtd/spi-nor/everspin.c
+++ b/drivers/mtd/spi-nor/everspin.c
@@ -14,28 +14,39 @@ static const struct flash_info everspin_nor_parts[] = {
 		.size = SZ_16K,
 		.sector_size = SZ_16K,
 		.addr_nbytes = 2,
-		.flags = SPI_NOR_NO_ERASE | SPI_NOR_NO_FR,
+		.flags = SPI_NOR_NO_ERASE,
 	}, {
 		.name = "mr25h256",
 		.size = SZ_32K,
 		.sector_size = SZ_32K,
 		.addr_nbytes = 2,
-		.flags = SPI_NOR_NO_ERASE | SPI_NOR_NO_FR,
+		.flags = SPI_NOR_NO_ERASE,
 	}, {
 		.name = "mr25h10",
 		.size = SZ_128K,
 		.sector_size = SZ_128K,
-		.flags = SPI_NOR_NO_ERASE | SPI_NOR_NO_FR,
+		.flags = SPI_NOR_NO_ERASE,
 	}, {
 		.name = "mr25h40",
 		.size = SZ_512K,
 		.sector_size = SZ_512K,
-		.flags = SPI_NOR_NO_ERASE | SPI_NOR_NO_FR,
+		.flags = SPI_NOR_NO_ERASE,
 	}
 };
 
+static void evervision_nor_default_init(struct spi_nor *nor)
+{
+	/* Everspin FRAMs don't support the fast read opcode. */
+	nor->params->hwcaps.mask &= ~SNOR_HWCAPS_READ_FAST;
+}
+
+static const struct spi_nor_fixups evervision_nor_fixups = {
+	.default_init = evervision_nor_default_init,
+};
+
 const struct spi_nor_manufacturer spi_nor_everspin = {
 	.name = "everspin",
 	.parts = everspin_nor_parts,
 	.nparts = ARRAY_SIZE(everspin_nor_parts),
+	.fixups = &evervision_nor_fixups,
 };
-- 
2.39.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
