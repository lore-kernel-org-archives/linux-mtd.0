Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A607C54E94
	for <linux-mtd@archiver.kernel.org>; Wed, 25 Jan 2023 08:11:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7euwwBdEoAgQDU9WTSImM50kC20LjWunRIwUaXDLvAo=; b=DPmDBOyi63/f5z
	hpvIINcmcQF64QXAyV0tqd26laiS6MGD+AZ0q1dhPbb1un1B+Pnx1k9iduHHMBJesKiM+7kdcL5wT
	zlWsIN1/aBuB0tyFRyLXgAv6A19/gAbBzSjjqB9yUJjUPeIzs+Jo2ZGB2Ql4Ffl6JsOU0aJmUy3q1
	ulF4NyxbXfqbceqP3LK4iEt9ILvXRd1Z55PtQOD1/yUiSM+RPqbCfptRMyuIerPkCUZXlaXzbNGa3
	12U5Iu2Z0EjbsDletVRiUTlFtA59AgJgIHGvNdVN+HAjkKIULn4OgkOkbA464Fe8abSo8I8uXO8vM
	QTXAcHRRPRc/zsM3xpqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pKash-006Kre-6l; Wed, 25 Jan 2023 08:11:43 +0000
Received: from fllv0015.ext.ti.com ([198.47.19.141])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pKas8-006Kh7-6m; Wed, 25 Jan 2023 08:11:11 +0000
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 30P8Axjh100110;
	Wed, 25 Jan 2023 02:10:59 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1674634259;
	bh=jJEIxkjBuCyQ2kRnrK0zrFDRWiVOz4giHjGrLWfCLP8=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=Bxb/TfHtczeBJO1G9NyNjHiXwFWGiFv1R+tMxcfyxWkOtJXoOrA2iJ8GJ2xxgiqWW
	 3YakzbG0LKPOrRlvWVtSkOWzKED0JlVE8R9uLwuCY6iT+jKp5TnDaWaohOmKuTZ6dD
	 HBluk+cp/NPJVlvX0/7KOT8evurI37h89CDUxh7s=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 30P8Ax9L027212
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 25 Jan 2023 02:10:59 -0600
Received: from DFLE109.ent.ti.com (10.64.6.30) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16; Wed, 25
 Jan 2023 02:10:59 -0600
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16 via
 Frontend Transport; Wed, 25 Jan 2023 02:10:59 -0600
Received: from localhost (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 30P8AvTW033327;
	Wed, 25 Jan 2023 02:10:58 -0600
From: Dhruva Gole <d-gole@ti.com>
To: Mark Brown <broonie@kernel.org>
CC: <linux-spi@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Vignesh
 Raghavendra <vigneshr@ti.com>,
        Vaishnav Achath <vaishnav.a@ti.com>, Dhruva
 Gole <d-gole@ti.com>,
        <linux-mtd@lists.infradead.org>,
        <linux-arm-kernel@lists.infradead.org>, <Takahiro.Kuwano@infineon.com>,
        Pratyush Yadav <ptyadav@amazon.de>
Subject: [PATCH v2 2/4] spi: cadence-quadspi: Add flag for direct mode writes
Date: Wed, 25 Jan 2023 13:40:21 +0530
Message-ID: <20230125081023.1573712-3-d-gole@ti.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230125081023.1573712-1-d-gole@ti.com>
References: <20230125081023.1573712-1-d-gole@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230125_001108_355649_7B17EA2C 
X-CRM114-Status: GOOD (  14.43  )
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

Create new flag inorder to avoid playing with use_direct_mode
flag currently being used throughout the driver.
Disable DAC write if auto polling is disabled or CQSPI_DISABLE_DAC_MODE
is set.

Signed-off-by: Dhruva Gole <d-gole@ti.com>
---
 drivers/spi/spi-cadence-quadspi.c | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/drivers/spi/spi-cadence-quadspi.c b/drivers/spi/spi-cadence-quadspi.c
index 6030da942c6e..4bbf6e3ad34a 100644
--- a/drivers/spi/spi-cadence-quadspi.c
+++ b/drivers/spi/spi-cadence-quadspi.c
@@ -84,6 +84,7 @@ struct cqspi_st {
 	u32			trigger_address;
 	u32			wr_delay;
 	bool			use_direct_mode;
+	bool			use_direct_mode_wr;
 	struct cqspi_flash_pdata f_pdata[CQSPI_MAX_CHIPSELECT];
 	bool			use_dma_read;
 	u32			pd_dev_id;
@@ -945,6 +946,12 @@ static int cqspi_write_setup(struct cqspi_flash_pdata *f_pdata,
 		reg = readl(reg_base + CQSPI_REG_WR_COMPLETION_CTRL);
 		reg |= CQSPI_REG_WR_DISABLE_AUTO_POLL;
 		writel(reg, reg_base + CQSPI_REG_WR_COMPLETION_CTRL);
+		/*
+		 * DAC mode require auto polling as flash needs to be polled
+		 * for write completion in case of bubble in SPI transaction
+		 * due to slow CPU/DMA master.
+		 */
+		cqspi->use_direct_mode_wr = false;
 	}

 	reg = readl(reg_base + CQSPI_REG_SIZE);
@@ -1230,7 +1237,7 @@ static ssize_t cqspi_write(struct cqspi_flash_pdata *f_pdata,
 	 * data.
 	 */
 	if (!op->cmd.dtr && cqspi->use_direct_mode &&
-	    ((to + len) <= cqspi->ahb_size)) {
+	    cqspi->use_direct_mode_wr && ((to + len) <= cqspi->ahb_size)) {
 		memcpy_toio(cqspi->ahb_base + to, buf, len);
 		return cqspi_wait_idle(cqspi);
 	}
@@ -1700,8 +1707,10 @@ static int cqspi_probe(struct platform_device *pdev)
 						cqspi->master_ref_clk_hz);
 		if (ddata->hwcaps_mask & CQSPI_SUPPORTS_OCTAL)
 			master->mode_bits |= SPI_RX_OCTAL | SPI_TX_OCTAL;
-		if (!(ddata->quirks & CQSPI_DISABLE_DAC_MODE))
+		if (!(ddata->quirks & CQSPI_DISABLE_DAC_MODE)) {
 			cqspi->use_direct_mode = true;
+			cqspi->use_direct_mode_wr = true;
+		}
 		if (ddata->quirks & CQSPI_SUPPORT_EXTERNAL_DMA)
 			cqspi->use_dma_read = true;
 		if (ddata->quirks & CQSPI_NO_SUPPORT_WR_COMPLETION)
--
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
