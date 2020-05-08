Return-Path: <SRS0=/+zL=6W=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8F71C38A2A
	for <linux-mtd@archiver.kernel.org>; Fri,  8 May 2020 18:55:33 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7BE8E2083B
	for <linux-mtd@archiver.kernel.org>; Fri,  8 May 2020 18:55:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="VGPazdk1";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=ti.com header.i=@ti.com header.b="MEskzfXV"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7BE8E2083B
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=ti.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=74rPVVXqJRc1wWo5sk3dPQlGeBDsfOTclZeYRMZmRA8=; b=VGPazdk1IfY3+l
	Es7sz12R4oqHZl4Qy4OSHEpFuHHJwDzmrY3eP2414lKNRoTBh0pmo0cx768YZt3QYWrS/Ss/5W1+/
	e3g4OvHkR2Fav7NKHY/mujYEtAkpIzGRQXjVZpuxIgbW1PHkfHKaYdteiA9kNaJCSnRNYUzCivSuX
	B+Bmkl9Gc14y/XmjPNKWTPgX+0HHM2uY96PTiK591ArEO0T3c2rA34b+tcvbTA84/jw6Ea7LDUtU5
	yvOMgQsBQOKtCs2AQ6kh+zQwVLDMg6nSeNbzWbkCHxtsZURIUfqqvNO2pNhvWvvAxkz8Oq+9Jyqnn
	IaEJS0PgsdDW1CvIka0w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jX89a-0007Jv-DG; Fri, 08 May 2020 18:55:22 +0000
Received: from fllv0015.ext.ti.com ([198.47.19.141])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jX890-0004Ty-Hp
 for linux-mtd@lists.infradead.org; Fri, 08 May 2020 18:54:48 +0000
Received: from fllv0035.itg.ti.com ([10.64.41.0])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 048IsQRZ041420;
 Fri, 8 May 2020 13:54:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1588964066;
 bh=toNupare+j2SQ6enk8i6S7cHswN/UrZuCnT/Z5/dVbA=;
 h=From:To:CC:Subject:Date:In-Reply-To:References;
 b=MEskzfXVUnoGbHeTvQfc1g3MrlzA9L7cqBcrgfzARtZS/mvLp1fBZmntPAlOt2ymX
 J76x6cy9kV0DS1RAfnggxeoRytzkjA/YUqW/dy3grii0iiwQpwGLqZUE3pIoIoOz6d
 SvDaDA8LN6b1XqNtSrs7ALzhtSS47s42qVLHXobA=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
 by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id 048IsQW0117476;
 Fri, 8 May 2020 13:54:26 -0500
Received: from DFLE114.ent.ti.com (10.64.6.35) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Fri, 8 May
 2020 13:54:26 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Fri, 8 May 2020 13:54:26 -0500
Received: from ula0132425.ent.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 048IsGpT077355;
 Fri, 8 May 2020 13:54:22 -0500
From: Vignesh Raghavendra <vigneshr@ti.com>
To: Tudor Ambarus <tudor.ambarus@microchip.com>, Mark Brown
 <broonie@kernel.org>
Subject: [PATCH 1/6] mtd: spi-nor: cadence-quadspi: Drop cdns,
 is-decoded-cs property
Date: Sat, 9 May 2020 00:24:06 +0530
Message-ID: <20200508185411.487-2-vigneshr@ti.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200508185411.487-1-vigneshr@ti.com>
References: <20200508185411.487-1-vigneshr@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200508_115446_680215_CBBF9D9F 
X-CRM114-Status: GOOD (  14.88  )
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

Cadence QSPI provides a way to automatically decode CS based on the
offset accessed within memory map window. This feature cannot be
supported in spi-mem framework as controller driver would not have
access to flash geometry. Therefore drop this feature in preparation to
moving to spi-mem.

Note that, this feature never worked in the driver (Direct/Indirect mode
accesses did not take into account size of flash on other CSs) and there
are no users of this feature in kernel. Therefore dropping this should
not cause a regression

Signed-off-by: Vignesh Raghavendra <vigneshr@ti.com>
---
 .../mtd/spi-nor/controllers/cadence-quadspi.c | 59 +++----------------
 1 file changed, 9 insertions(+), 50 deletions(-)

diff --git a/drivers/mtd/spi-nor/controllers/cadence-quadspi.c b/drivers/mtd/spi-nor/controllers/cadence-quadspi.c
index 494dcab4aaaa..fa54f85e16d7 100644
--- a/drivers/mtd/spi-nor/controllers/cadence-quadspi.c
+++ b/drivers/mtd/spi-nor/controllers/cadence-quadspi.c
@@ -77,11 +77,7 @@ struct cqspi_st {
 	dma_addr_t		mmap_phys_base;
 
 	int			current_cs;
-	int			current_page_size;
-	int			current_erase_size;
-	int			current_addr_width;
 	unsigned long		master_ref_clk_hz;
-	bool			is_decoded_cs;
 	u32			fifo_depth;
 	u32			fifo_width;
 	bool			rclk_en;
@@ -715,19 +711,15 @@ static void cqspi_chipselect(struct spi_nor *nor)
 	unsigned int reg;
 
 	reg = readl(reg_base + CQSPI_REG_CONFIG);
-	if (cqspi->is_decoded_cs) {
-		reg |= CQSPI_REG_CONFIG_DECODE_MASK;
-	} else {
-		reg &= ~CQSPI_REG_CONFIG_DECODE_MASK;
+	reg &= ~CQSPI_REG_CONFIG_DECODE_MASK;
 
-		/* Convert CS if without decoder.
-		 * CS0 to 4b'1110
-		 * CS1 to 4b'1101
-		 * CS2 to 4b'1011
-		 * CS3 to 4b'0111
-		 */
-		chip_select = 0xF & ~(1 << chip_select);
-	}
+	/* Convert CS if without decoder.
+	 * CS0 to 4b'1110
+	 * CS1 to 4b'1101
+	 * CS2 to 4b'1011
+	 * CS3 to 4b'0111
+	 */
+	chip_select = 0xF & ~(1 << chip_select);
 
 	reg &= ~(CQSPI_REG_CONFIG_CHIPSELECT_MASK
 		 << CQSPI_REG_CONFIG_CHIPSELECT_LSB);
@@ -736,32 +728,6 @@ static void cqspi_chipselect(struct spi_nor *nor)
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
@@ -867,18 +833,13 @@ static void cqspi_configure(struct spi_nor *nor)
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
@@ -1145,8 +1106,6 @@ static int cqspi_of_get_pdata(struct platform_device *pdev)
 	struct device_node *np = pdev->dev.of_node;
 	struct cqspi_st *cqspi = platform_get_drvdata(pdev);
 
-	cqspi->is_decoded_cs = of_property_read_bool(np, "cdns,is-decoded-cs");
-
 	if (of_property_read_u32(np, "cdns,fifo-depth", &cqspi->fifo_depth)) {
 		dev_err(&pdev->dev, "couldn't determine fifo-depth\n");
 		return -ENXIO;
-- 
2.26.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
