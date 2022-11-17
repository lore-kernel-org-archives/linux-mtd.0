Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C85CC433FE
	for <linux-mtd@archiver.kernel.org>; Thu, 17 Nov 2022 11:03:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=wloya6y8Q1cW1msI3u8aIBcoMK544asLDN5PfZD42JM=; b=YFhCY3vR9EhFfA
	4elv1fyZdmZmttubNT1Y6JDAI+wnV02A827QLB0CblzdWe5SahhKYGuY2+/s6ZOyRmaUz7jLEJ6yy
	oUsOvyx6GBbmZtGBkCaBdAEi6OersP27EB/Zu1Sng2KRPVimNbZl7Avgk60i5r1ncfFGWLLEflBpp
	k3fU26XAmWThlc2DHJAO/n9f+MYpdNcCf6BJSiJqu1SuIClRNDZE0L0MmTH2YiULQ+sq/9HoXp8TV
	dhzt4VwtdSlLbvdO2fi0IsaxcsKVagXVK2Motqlo/rZsQ2wgPVov2vne1PvOj+gPIsoEQARDns012
	uNCCCnxrQuyxRnd1t9Mw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ovcel-00CtLY-TV; Thu, 17 Nov 2022 11:02:08 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ovcW5-00Co8f-34; Thu, 17 Nov 2022 10:53:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1668682390; x=1700218390;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=PgRUd/gJcLJbdlYAmpEJ7HzosgEa1Fgc6gekCvI/uMM=;
  b=KVC1xrD/xPmLvorQgjI/otrsPloPvPyWhnRjLMj0nC6mEuYZnWirc6tY
   mzlA4dLOaDUUCGau6p6lpO6Hac21MBd3reANmMG5XL04G2/rgahJB/OC6
   sJeHL9Mx4xGPhIb2uoxWECvdpNDVd+gMiIa6rKyL5zteioVqmbfmhdZW2
   y8lPRnD+D++MYou6UKLVTNkpB99JKjnC1y4U1D8lStgu20e3vcz80wwDA
   OOwVyVZhuPauUe/yAe6iUlNUsJuRnnHd5OhOthIf9K4JEzXQTGIpZpjc8
   6pNDw/IRLUfcrOheQMwC0I6XWqRZBxH4tj38bOlgFpQuffoir39Wf/Poi
   A==;
X-IronPort-AV: E=Sophos;i="5.96,171,1665471600"; 
   d="scan'208";a="183965587"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 17 Nov 2022 03:52:58 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12; Thu, 17 Nov 2022 03:52:53 -0700
Received: from ROB-ULT-M18064N.mchp-main.com (10.10.115.15) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server id
 15.1.2507.12 via Frontend Transport; Thu, 17 Nov 2022 03:52:50 -0700
From: Tudor Ambarus <tudor.ambarus@microchip.com>
To: <broonie@kernel.org>, <robh+dt@kernel.org>,
	<krzysztof.kozlowski+dt@linaro.org>, <nicolas.ferre@microchip.com>,
	<alexandre.belloni@bootlin.com>, <claudiu.beznea@microchip.com>
CC: <linux-spi@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mtd@lists.infradead.org>, Tudor Ambarus <tudor.ambarus@microchip.com>
Subject: [PATCH 0/8] spi: Introduce spi-cs-setup-ns dt property
Date: Thu, 17 Nov 2022 12:52:41 +0200
Message-ID: <20221117105249.115649-1-tudor.ambarus@microchip.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221117_025309_283806_01D2BA71 
X-CRM114-Status: UNSURE (   5.16  )
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

Tudor Ambarus (8):
  spi: dt-bindings: Introduce spi-cs-setup-ns property
  spi: Introduce spi-cs-setup-ns property
  spi: Reintroduce spi_set_cs_timing()
  spi: atmel-quadspi: Add support for configuring CS timing
  ARM: dts: at91-sama5d27_wlsom1: Set sst26vf064b SPI NOR flash at its
    maximum frequency
  ARM: dts: at91-sama5d27_som1: Set sst26vf064b SPI NOR flash at its
    maximum frequency
  ARM: dts: at91: sama5d2_icp: Set sst26vf064b SPI NOR flash at its
    maximum frequency
  ARM: dts: at91: sam9x60ek: Set sst26vf064b SPI NOR flash at its
    maximum frequency

 .../bindings/spi/spi-peripheral-props.yaml    |  5 +++
 arch/arm/boot/dts/at91-sam9x60ek.dts          |  3 +-
 arch/arm/boot/dts/at91-sama5d27_som1.dtsi     |  3 +-
 arch/arm/boot/dts/at91-sama5d27_wlsom1.dtsi   |  3 +-
 arch/arm/boot/dts/at91-sama5d2_icp.dts        |  3 +-
 drivers/spi/atmel-quadspi.c                   | 34 +++++++++++++++
 drivers/spi/spi.c                             | 43 +++++++++++++++++++
 7 files changed, 90 insertions(+), 4 deletions(-)

-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
