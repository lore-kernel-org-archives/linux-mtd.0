Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABEE2C4332F
	for <linux-mtd@archiver.kernel.org>; Thu, 17 Nov 2022 11:01:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=z8vry87ZeJ9VedhN2tQCCnFqqmLFd5vYgleYzsLIfpU=; b=swOU4sWH6cEqsu
	pX1CGvYv8w9POUSdWA+k37MAbhkNjZhSPx5TpaWrttSPx6biOwO3zLUoj9lVhcJwGps9NKPWngUT+
	dIzJQftcZlTzhI1Wg98PqjkEPLpuanawOONQul/M2cA3zgT7HosmK0JA9dg6XBpdzXcpshsjah9fm
	M7dvuoj7MW45e4xK4ZTfIOGTiUipPgZ7Q3Lauub5lPMbTYotHZ3aTjuNsvZgTyJMBMxqfWEFla3tN
	9+e81Fh2ahowoFjRs/ZVgBk5JgzlacAT6sdtwy9/yMCO8ApYbGvkoHZWJ/tQY6Mw6gr3q/PCMnnqG
	vtoxzTKAuHMgi0KtO0mA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ovcdp-00CssJ-K6; Thu, 17 Nov 2022 11:01:09 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ovcW5-00CoBT-2g; Thu, 17 Nov 2022 10:53:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1668682390; x=1700218390;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=pNGHdixQJ8kphWteopGCeA+0rgR0b/xkVnhBdzmmawA=;
  b=DVQwpQ8tYQIBlYS76b0+WtGW2BOxUz18FuKi9bqHBjLTZfLYkNec6jwY
   f1rAaIXF3tdjsb+h8Y7z8WDkxpty2hyeguryvRVVd8xVXd+IZEoimKz1j
   Ph/YGJraQlTW1Bzs6z7WSA3sYbNkcuMK6flnrUfTDYFDEGOgN4mfpXyK5
   tfHiHhMfwz2utXIgAKRTjGQAcOEW4r7h+QN//2k49tquTNFx5kMi0s+qS
   e05t9t5wZSUVxC8xZSa+4y+sDwfEplrWGr43oYBPx81hD4asDukKae9t4
   0/rsa4YEzDmJFSpEVtqPputNCT2+s6WZ5EHH3/Uvp1/shfx8nDrwi4wvK
   Q==;
X-IronPort-AV: E=Sophos;i="5.96,171,1665471600"; 
   d="scan'208";a="183965612"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 17 Nov 2022 03:53:00 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12; Thu, 17 Nov 2022 03:52:59 -0700
Received: from ROB-ULT-M18064N.mchp-main.com (10.10.115.15) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server id
 15.1.2507.12 via Frontend Transport; Thu, 17 Nov 2022 03:52:56 -0700
From: Tudor Ambarus <tudor.ambarus@microchip.com>
To: <broonie@kernel.org>, <robh+dt@kernel.org>,
	<krzysztof.kozlowski+dt@linaro.org>, <nicolas.ferre@microchip.com>,
	<alexandre.belloni@bootlin.com>, <claudiu.beznea@microchip.com>
CC: <linux-spi@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mtd@lists.infradead.org>, Tudor Ambarus <tudor.ambarus@microchip.com>
Subject: [PATCH 2/8] spi: Introduce spi-cs-setup-ns property
Date: Thu, 17 Nov 2022 12:52:43 +0200
Message-ID: <20221117105249.115649-3-tudor.ambarus@microchip.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221117105249.115649-1-tudor.ambarus@microchip.com>
References: <20221117105249.115649-1-tudor.ambarus@microchip.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221117_025309_250451_B8F23038 
X-CRM114-Status: UNSURE (   8.02  )
X-CRM114-Notice: Please train this message.
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

SPI NOR flashes have specific cs-setup time requirements without which
they can't work at frequencies close to their maximum supported frequency,
as they miss the first bits of the instruction command. Unrecognized
commands are ignored, thus the flash will be unresponsive. Introduce the
spi-cs-setup-ns property to allow spi devices to specify their cs setup
time.

Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>
---
 drivers/spi/spi.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/spi/spi.c b/drivers/spi/spi.c
index 4ddd250481f5..b93a6085d9a0 100644
--- a/drivers/spi/spi.c
+++ b/drivers/spi/spi.c
@@ -2224,6 +2224,7 @@ static int of_spi_parse_dt(struct spi_controller *ctlr, struct spi_device *spi,
 			   struct device_node *nc)
 {
 	u32 value;
+	u16 cs_setup;
 	int rc;
 
 	/* Mode (clock phase/polarity/etc.) */
@@ -2309,6 +2310,11 @@ static int of_spi_parse_dt(struct spi_controller *ctlr, struct spi_device *spi,
 	if (!of_property_read_u32(nc, "spi-max-frequency", &value))
 		spi->max_speed_hz = value;
 
+	if (!of_property_read_u16(nc, "spi-cs-setup-ns", &cs_setup)) {
+		spi->cs_setup.value = cs_setup;
+		spi->cs_setup.unit = SPI_DELAY_UNIT_NSECS;
+	}
+
 	return 0;
 }
 
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
