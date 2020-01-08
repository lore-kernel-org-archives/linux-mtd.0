Return-Path: <SRS0=0ZJr=25=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9108C33CA1
	for <linux-mtd@archiver.kernel.org>; Wed,  8 Jan 2020 12:56:25 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BE828206F0
	for <linux-mtd@archiver.kernel.org>; Wed,  8 Jan 2020 12:56:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="LiKmruHC"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BE828206F0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ASS6fTcjCJ4EsihZTY++o2mboqKO1BrilCjBeFUpf+E=; b=LiKmruHCYCYzj+
	bqutQ7hYpH/heSS6/heJ3cSWbUUPdVgDZN/zvDTqAO9FKakcC4Cytn0p5GmXs2NvLmS9nOSQ9xi9P
	P167diXA50OJVVUMlLQVcvApwWY1+MhUNqq7x9a6TmM7Tcnm/WpJNSAG3aFYpMnZ7sVmwfRkCTzbz
	MTYj9nCIpF1VLy8u7BSZqyKpu1jvTtrJd6gYo5Hudey+oOa+0KdRcSlOLhG2h+OvpfH5LR/2YjzLe
	ZgcQVgWZm6oKD0sOL3tT7x+UZiNY8C5rBoohxjkpiE3tJuB7ulTtXMTNZkDWaVaHZoZvVVZtfEog6
	tyWKZZ2jACzJ186Y0TuQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ipAse-0002by-4s; Wed, 08 Jan 2020 12:56:12 +0000
Received: from esa4.microchip.iphmx.com ([68.232.154.123])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ipAsZ-0002av-Op; Wed, 08 Jan 2020 12:56:11 +0000
Received-SPF: Pass (esa4.microchip.iphmx.com: domain of
 Claudiu.Beznea@microchip.com designates 198.175.253.82 as
 permitted sender) identity=mailfrom;
 client-ip=198.175.253.82; receiver=esa4.microchip.iphmx.com;
 envelope-from="Claudiu.Beznea@microchip.com";
 x-sender="Claudiu.Beznea@microchip.com";
 x-conformance=spf_only; x-record-type="v=spf1";
 x-record-text="v=spf1 mx a:ushub1.microchip.com
 a:smtpout.microchip.com -exists:%{i}.spf.microchip.iphmx.com
 include:servers.mcsv.net include:mktomail.com
 include:spf.protection.outlook.com ~all"
Received-SPF: None (esa4.microchip.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@email.microchip.com) identity=helo;
 client-ip=198.175.253.82; receiver=esa4.microchip.iphmx.com;
 envelope-from="Claudiu.Beznea@microchip.com";
 x-sender="postmaster@email.microchip.com"; x-conformance=spf_only
Authentication-Results: esa4.microchip.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=Pass smtp.mailfrom=Claudiu.Beznea@microchip.com;
 spf=None smtp.helo=postmaster@email.microchip.com;
 dmarc=pass (p=none dis=none) d=microchip.com
IronPort-SDR: feLro1JNCFp1+UpYxfUe+bG2IPLSvnlmgEXzWgR/sW3uX4OwPBSjnIj8qhK2OnwOjjDOqzVpbt
 g8bZUzYBbwpp+khpk6/ata/+DQPt9aBwtnPADf6kO2iqyJour8APSLqAWRCsC61k0Iv5val3AB
 +w32RZ3p2/hGM7Abr6FCBcun5Lp4TmpY9srfoUiBepWiL5KArSMVzb6N8wh8mTDnlI4CxH7Kr6
 OQwyP26353aBoemlTeFG5Bpj+fE3wiMJjSz0Au3d7cS/SPDHITUHuvh3QHOPTtmyV4EvzqeVnH
 K3Q=
X-IronPort-AV: E=Sophos;i="5.69,410,1571727600"; d="scan'208";a="60517506"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 08 Jan 2020 05:56:03 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Wed, 8 Jan 2020 05:56:02 -0700
Received: from m18063-ThinkPad-T460p.microchip.com (10.10.85.251) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server id
 15.1.1713.5 via Frontend Transport; Wed, 8 Jan 2020 05:55:55 -0700
From: Claudiu Beznea <claudiu.beznea@microchip.com>
To: <robh+dt@kernel.org>, <mark.rutland@arm.com>,
 <nicolas.ferre@microchip.com>, <alexandre.belloni@bootlin.com>,
 <ludovic.desroches@microchip.com>, <vkoul@kernel.org>,
 <eugen.hristev@microchip.com>, <jic23@kernel.org>, <knaack.h@gmx.de>,
 <lars@metafoo.de>, <pmeerw@pmeerw.net>, <mchehab@kernel.org>,
 <lee.jones@linaro.org>, <richard.genoud@gmail.com>,
 <radu_nicolae.pirea@upb.ro>, <tudor.ambarus@microchip.com>,
 <miquel.raynal@bootlin.com>, <richard@nod.at>, <vigneshr@ti.com>,
 <wg@grandegger.com>, <mkl@pengutronix.de>, <a.zummo@towertech.it>,
 <broonie@kernel.org>
Subject: [PATCH 00/16] add device tree for SAM9X60 SoC and SAM9X60-EK board
Date: Wed, 8 Jan 2020 14:55:07 +0200
Message-ID: <1578488123-26127-1-git-send-email-claudiu.beznea@microchip.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200108_045607_836714_DCCA198A 
X-CRM114-Status: UNSURE (   8.27  )
X-CRM114-Notice: Please train this message.
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
Cc: linux-rtc@vger.kernel.org, devicetree@vger.kernel.org,
 linux-iio@vger.kernel.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org,
 linux-mtd@lists.infradead.org, dmaengine@vger.kernel.org,
 linux-can@vger.kernel.org, Claudiu Beznea <claudiu.beznea@microchip.com>,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

This series add device tree for SAM9X60 SoC and SAM9X60-EK board.
Allong with these, there are patches that documents some compatibles
for SAM9X60's IPs.

Claudiu Beznea (15):
  dt-bindings: at_xdmac: add entry for microchip compatibles
  dt-bindings: atmel-can: add microchip,sam9x60-can
  dt-bindings: atmel-tcb: add microchip,<chip>-tcb
  dt-bindings: atmel-isi: add microchip,sam9x60-isi
  dt-bindings: at91-sama5d2_adc: add microchip,sam9x60-adc
  dt-bindings: atmel-matrix: add microchip,sam9x60-matrix
  dt-bindings: atmel-nand: add microchip,sam9x60-pmecc
  dt-bindings: atmel-sysreg: add microchip,sam9x60-ddramc
  dt-bindings: atmel-smc: add microchip,sam9x60-smc
  dt-bindings: atmel-gpbr: add microchip,sam9x60-gpbr
  dt-bindings: atmel,at91rm9200-rtc: add microchip,sam9x60-rtc
  dt-bindings: spi_atmel: add microchip,sam9x60-spi
  dt-bindings: atmel-usart: add microchip,<chip>-usart
  dt-bindings: arm: add sam9x60-ek board
  ARM: at91/defconfig: enable MMC_SDHCI_OF_AT91 and MICROCHIP_PIT64B

Sandeep Sheriker Mallikarjun (1):
  ARM: dts: at91: sam9x60: add device tree for soc and board

 .../devicetree/bindings/arm/atmel-at91.yaml        |   6 +
 .../devicetree/bindings/arm/atmel-sysregs.txt      |   1 +
 .../devicetree/bindings/dma/atmel-xdma.txt         |   3 +-
 .../bindings/iio/adc/at91-sama5d2_adc.txt          |   2 +-
 .../devicetree/bindings/media/atmel-isi.txt        |   2 +-
 .../devicetree/bindings/mfd/atmel-gpbr.txt         |   4 +-
 .../devicetree/bindings/mfd/atmel-matrix.txt       |   1 +
 .../devicetree/bindings/mfd/atmel-smc.txt          |   1 +
 .../devicetree/bindings/mfd/atmel-tcb.txt          |   5 +-
 .../devicetree/bindings/mfd/atmel-usart.txt        |   6 +-
 .../devicetree/bindings/mtd/atmel-nand.txt         |   1 +
 .../devicetree/bindings/net/can/atmel-can.txt      |   3 +-
 .../bindings/rtc/atmel,at91rm9200-rtc.txt          |   3 +-
 .../devicetree/bindings/spi/spi_atmel.txt          |   2 +-
 arch/arm/boot/dts/Makefile                         |   2 +
 arch/arm/boot/dts/at91-sam9x60ek.dts               | 647 +++++++++++++++++++
 arch/arm/boot/dts/sam9x60.dtsi                     | 691 +++++++++++++++++++++
 arch/arm/configs/at91_dt_defconfig                 |   4 +
 18 files changed, 1373 insertions(+), 11 deletions(-)
 create mode 100644 arch/arm/boot/dts/at91-sam9x60ek.dts
 create mode 100644 arch/arm/boot/dts/sam9x60.dtsi

-- 
2.7.4


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
