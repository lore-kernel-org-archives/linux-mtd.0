Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 595C5C433FE
	for <linux-mtd@archiver.kernel.org>; Thu, 17 Nov 2022 11:03:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JFDpDj25uvqqJ4rX6n9RRBeF1agRmix/VLdCL4MiUkU=; b=wZdnsR7SWxnO+Q
	H0pEa0vi/UXrBef8C4nI7aPpjn95pK7FUAtipC+2a7IjdG4n84bc3YGaKih3zrgbfvieuxPyZ4lbQ
	TXnxlp61OG0SAkAFaIi90EqqQzq7hD66W2tXEx/NufUSAsZ3almaYNOqmEK/CDkt/c0qEdwI3GVSl
	d1caA9F36naxuVYKPCJUxbTw0w0nnaPGgdgq1/HWWZm/Za1/7Jl+gaEilWT0LtLysOtb66Zx54tyG
	8v8N+OC4j/lwf8RHKyKw0o/bLy02kZuYc0+calGRE1h/pwjikIFht+aTY8vTCDLgIEwwuMAjBs+j8
	TuinVZj0bU0nYGANKdpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ovcf6-00CtZU-RG; Thu, 17 Nov 2022 11:02:28 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ovcW8-00CoBT-T4; Thu, 17 Nov 2022 10:53:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1668682394; x=1700218394;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=IV3iY/5nH2v6r5LMDzPfNG3LT1Nn/MAxR36s7csPy5k=;
  b=tvy4fCBS4+vCx4uUni5pnqNGQhzg6E75hGXtI7nTuivgCnJs4MFbloQp
   i1e95V7qKf6TlAg17oecLN0RXrCzIxW9qO8nUsR2OL91D5cPv14ZGQBjZ
   JH4e2ioz3M9fVC5MCaNDqH4Bxeb0QmwdDfa2QGLPtIy8ivh9I1QlN8kOA
   DdYo19MlX1JiqUCbAZDNSKBH7TaxcrJTPno4yIAqTWPJrhrpascQRdy7z
   gQT9C4/X3Xi0EVZQYhOLjzlL7vo2wVZ8sNU29fX2AH1n1PMPBEznFq5WA
   id3XbvCiFVohVCyhHgraVZLZvmOL8RaN6vETX9Q5ptDdC5M0Uz2llk3KM
   w==;
X-IronPort-AV: E=Sophos;i="5.96,171,1665471600"; 
   d="scan'208";a="183965627"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 17 Nov 2022 03:53:09 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.87.72) by
 chn-vm-ex02.mchp-main.com (10.10.87.72) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12; Thu, 17 Nov 2022 03:53:05 -0700
Received: from ROB-ULT-M18064N.mchp-main.com (10.10.115.15) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server id
 15.1.2507.12 via Frontend Transport; Thu, 17 Nov 2022 03:53:02 -0700
From: Tudor Ambarus <tudor.ambarus@microchip.com>
To: <broonie@kernel.org>, <robh+dt@kernel.org>,
	<krzysztof.kozlowski+dt@linaro.org>, <nicolas.ferre@microchip.com>,
	<alexandre.belloni@bootlin.com>, <claudiu.beznea@microchip.com>
CC: <linux-spi@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mtd@lists.infradead.org>, Tudor Ambarus <tudor.ambarus@microchip.com>
Subject: [PATCH 4/8] spi: atmel-quadspi: Add support for configuring CS timing
Date: Thu, 17 Nov 2022 12:52:45 +0200
Message-ID: <20221117105249.115649-5-tudor.ambarus@microchip.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221117105249.115649-1-tudor.ambarus@microchip.com>
References: <20221117105249.115649-1-tudor.ambarus@microchip.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221117_025313_048803_F53E07FD 
X-CRM114-Status: GOOD (  11.62  )
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

The at91 QSPI IP uses a default value of half of the period of the QSPI
clock period for the cs-setup time, which is not always enough, an example
being the sst26vf064b SPI NOR flash which requires a minimum cs-setup time
of 5 ns. It was observed that none of the at91 SoCs can fulfill the
minimum CS setup time for the aforementioned flash, as they operate at
high frequencies and half a period does not suffice for the required CS
setup time. Add support for configuring the CS timing in the controller.

Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>
---
 drivers/spi/atmel-quadspi.c | 34 ++++++++++++++++++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/drivers/spi/atmel-quadspi.c b/drivers/spi/atmel-quadspi.c
index 976a217e356d..70637e46290a 100644
--- a/drivers/spi/atmel-quadspi.c
+++ b/drivers/spi/atmel-quadspi.c
@@ -510,6 +510,39 @@ static int atmel_qspi_setup(struct spi_device *spi)
 	return 0;
 }
 
+static int atmel_qspi_set_cs_timing(struct spi_device *spi)
+{
+	struct spi_controller *ctrl = spi->master;
+	struct atmel_qspi *aq = spi_controller_get_devdata(ctrl);
+	unsigned long clk_rate;
+	u32 cs_setup;
+	int delay;
+	int ret;
+
+	delay = spi_delay_to_ns(&spi->cs_setup, NULL);
+	if (delay <= 0)
+		return delay;
+
+	clk_rate = clk_get_rate(aq->pclk);
+	if (!clk_rate)
+		return -EINVAL;
+
+	cs_setup = DIV_ROUND_UP((delay * DIV_ROUND_UP(clk_rate, 1000000)),
+				1000);
+
+	ret = pm_runtime_resume_and_get(ctrl->dev.parent);
+	if (ret < 0)
+		return ret;
+
+	aq->scr |= QSPI_SCR_DLYBS(cs_setup);
+	atmel_qspi_write(aq->scr, aq, QSPI_SCR);
+
+	pm_runtime_mark_last_busy(ctrl->dev.parent);
+	pm_runtime_put_autosuspend(ctrl->dev.parent);
+
+	return 0;
+}
+
 static void atmel_qspi_init(struct atmel_qspi *aq)
 {
 	/* Reset the QSPI controller */
@@ -555,6 +588,7 @@ static int atmel_qspi_probe(struct platform_device *pdev)
 
 	ctrl->mode_bits = SPI_RX_DUAL | SPI_RX_QUAD | SPI_TX_DUAL | SPI_TX_QUAD;
 	ctrl->setup = atmel_qspi_setup;
+	ctrl->set_cs_timing = atmel_qspi_set_cs_timing;
 	ctrl->bus_num = -1;
 	ctrl->mem_ops = &atmel_qspi_mem_ops;
 	ctrl->num_chipselect = 1;
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
