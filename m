Return-Path: <SRS0=+yQj=7O=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 898AFC433E0
	for <linux-mtd@archiver.kernel.org>; Mon,  1 Jun 2020 07:06:05 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 524DC2074B
	for <linux-mtd@archiver.kernel.org>; Mon,  1 Jun 2020 07:06:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="PmrzK+oW";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=ti.com header.i=@ti.com header.b="iF3+cW5l"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 524DC2074B
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=ti.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=d+BRZSTxt5N8P5iIjUYb67J5AvN79LReGAlIiBW/khQ=; b=PmrzK+oWJl2Yph
	bY2/CtpvzJRM1C0ls7LU4Oxgf+N3HpwEWVZmRhgp0k8azaCzjt+qPieIBcLDRVCGV/yxouoQtbqBr
	KULGPNYPEroesGHAkUslXSBwyhQraFxPCHQmzyc0vGQNIsxiEJI1td5TtA7NB/9FDWBLnqSrbpwBb
	sCQQHsCDOX2EckcoblnybtfDX7j3uXEioJ3E6rQ41R64znnayBRfyW4eCk0vy9Hq3Jum4HqZmM5cB
	hpfnSHa706H7pnnqTzw5WY8f6CSV90OtHIEhsWplueg3p5Eg4cnSbi0ZrwWtMIKm8LbFl1AoQBVxY
	+G57fy8jAgVd4KCq0a7A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jfeWC-0005qL-B5; Mon, 01 Jun 2020 07:05:56 +0000
Received: from lelv0143.ext.ti.com ([198.47.23.248])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jfeVp-0005SP-1K
 for linux-mtd@lists.infradead.org; Mon, 01 Jun 2020 07:05:35 +0000
Received: from fllv0035.itg.ti.com ([10.64.41.0])
 by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 05175G8e069524;
 Mon, 1 Jun 2020 02:05:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1590995116;
 bh=0/mu1i+hzFf5b/DPhps7GzhDTK/PLKJI6yv6Vv9jYvU=;
 h=From:To:CC:Subject:Date:In-Reply-To:References;
 b=iF3+cW5lT3nnUxcSBB/yuQu7NDGImOQfXjDe2/ah6Fbf4DLZZ0K4b47kdUbaoWwTL
 EpSHZJHnfQq4VEeR5/6C8m9bnKQDZBeXmtrDiohMxSVbgApTrVlhZ3q79N1cBdUNW7
 Psyjqp+qj2u1nkfzjxbgelxwhMOA5MyeMTQbrczM=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
 by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id 05175Gqj052185;
 Mon, 1 Jun 2020 02:05:16 -0500
Received: from DFLE111.ent.ti.com (10.64.6.32) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Mon, 1 Jun
 2020 02:05:16 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Mon, 1 Jun 2020 02:05:16 -0500
Received: from ula0132425.ent.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 051758s3016257;
 Mon, 1 Jun 2020 02:05:13 -0500
From: Vignesh Raghavendra <vigneshr@ti.com>
To: Tudor Ambarus <tudor.ambarus@microchip.com>, Mark Brown
 <broonie@kernel.org>
Subject: [RESEND PATCH v3 1/8] mtd: spi-nor: cadence-quadspi: Make driver
 independent of flash geometry
Date: Mon, 1 Jun 2020 12:34:37 +0530
Message-ID: <20200601070444.16923-2-vigneshr@ti.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200601070444.16923-1-vigneshr@ti.com>
References: <20200601070444.16923-1-vigneshr@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200601_000533_272887_BC33AA8E 
X-CRM114-Status: GOOD (  14.41  )
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
Cc: marex@denx.de, Vignesh Raghavendra <vigneshr@ti.com>,
 Boris Brezillon <bbrezillon@kernel.org>, dinguyen@kernel.org,
 simon.k.r.goldschmidt@gmail.com, linux-kernel@vger.kernel.org,
 linux-spi@vger.kernel.org,
 Ramuthevar Vadivel Murugan <vadivel.muruganx.ramuthevar@linux.intel.com>,
 linux-mtd@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Drop configuration of Flash size, erase size and page size
configuration. Flash size is needed only if using AHB decoder (BIT 23 of
CONFIG_REG) which is not used by the driver.
Erase size and page size are needed if IP is configured to send WREN
automatically. But since SPI NOR layer takes care of sending WREN, there
is no need to configure these fields either.

Therefore drop these in preparation to move the driver to spi-mem
framework where flash geometry is not visible to controller driver.

Signed-off-by: Vignesh Raghavendra <vigneshr@ti.com>
Reviewed-by: Tudor Ambarus <tudor.ambarus@microchip.com>
---
 .../mtd/spi-nor/controllers/cadence-quadspi.c | 36 +------------------
 1 file changed, 1 insertion(+), 35 deletions(-)

diff --git a/drivers/mtd/spi-nor/controllers/cadence-quadspi.c b/drivers/mtd/spi-nor/controllers/cadence-quadspi.c
index 494dcab4aaaab..9b8554d44fac8 100644
--- a/drivers/mtd/spi-nor/controllers/cadence-quadspi.c
+++ b/drivers/mtd/spi-nor/controllers/cadence-quadspi.c
@@ -77,9 +77,6 @@ struct cqspi_st {
 	dma_addr_t		mmap_phys_base;
 
 	int			current_cs;
-	int			current_page_size;
-	int			current_erase_size;
-	int			current_addr_width;
 	unsigned long		master_ref_clk_hz;
 	bool			is_decoded_cs;
 	u32			fifo_depth;
@@ -736,32 +733,6 @@ static void cqspi_chipselect(struct spi_nor *nor)
 	writel(reg, reg_base + CQSPI_REG_CONFIG);
 }
 
-static void cqspi_configure_cs_and_sizes(struct spi_nor *nor)
-{
-	struct cqspi_flash_pdata *f_pdata = nor->priv;
-	struct cqspi_st *cqspi = f_pdata->cqspi;
-	void __iomem *iobase = cqspi->iobase;
-	unsigned int reg;
-
-	/* configure page size and block size. */
-	reg = readl(iobase + CQSPI_REG_SIZE);
-	reg &= ~(CQSPI_REG_SIZE_PAGE_MASK << CQSPI_REG_SIZE_PAGE_LSB);
-	reg &= ~(CQSPI_REG_SIZE_BLOCK_MASK << CQSPI_REG_SIZE_BLOCK_LSB);
-	reg &= ~CQSPI_REG_SIZE_ADDRESS_MASK;
-	reg |= (nor->page_size << CQSPI_REG_SIZE_PAGE_LSB);
-	reg |= (ilog2(nor->mtd.erasesize) << CQSPI_REG_SIZE_BLOCK_LSB);
-	reg |= (nor->addr_width - 1);
-	writel(reg, iobase + CQSPI_REG_SIZE);
-
-	/* configure the chip select */
-	cqspi_chipselect(nor);
-
-	/* Store the new configuration of the controller */
-	cqspi->current_page_size = nor->page_size;
-	cqspi->current_erase_size = nor->mtd.erasesize;
-	cqspi->current_addr_width = nor->addr_width;
-}
-
 static unsigned int calculate_ticks_for_ns(const unsigned int ref_clk_hz,
 					   const unsigned int ns_val)
 {
@@ -867,18 +838,13 @@ static void cqspi_configure(struct spi_nor *nor)
 	int switch_cs = (cqspi->current_cs != f_pdata->cs);
 	int switch_ck = (cqspi->sclk != sclk);
 
-	if ((cqspi->current_page_size != nor->page_size) ||
-	    (cqspi->current_erase_size != nor->mtd.erasesize) ||
-	    (cqspi->current_addr_width != nor->addr_width))
-		switch_cs = 1;
-
 	if (switch_cs || switch_ck)
 		cqspi_controller_enable(cqspi, 0);
 
 	/* Switch chip select. */
 	if (switch_cs) {
 		cqspi->current_cs = f_pdata->cs;
-		cqspi_configure_cs_and_sizes(nor);
+		cqspi_chipselect(nor);
 	}
 
 	/* Setup baudrate divisor and delays */
-- 
2.26.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
