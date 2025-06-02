Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 877E4C54FB3
	for <linux-mtd@archiver.kernel.org>; Mon,  2 Jun 2025 05:35:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=D6HLoIlz2AMTu0JmwOkdHE/ZQ3L81zNNsABQHW9HJQI=; b=z3GRTkRpbGhK2O
	0NdRRRW5mfk1gc0e31QbN0T2Z4KgVCXnUQcGVO+3FLBw408CDuitFTgSoiIgkyNoDO647p3Vxk20H
	EY9mS9C42Y7xw46MjEJvH33QJoSgrRRvCjBCl4dddssIWTEhJyr1HoNXNtroUCpBAanjQksLkq1Rs
	eLT1Ca4LyKHQacPqwkRpdGDt4Lz9lAQAinaUrpxSaNRLkctB3tT8mI6/GR1kF+MEyzms/Rf/sDL1B
	ANfG5zGSr8/uZquZj2Oe1L9AkOi/5GjSpOtpvyAWbPrqe/GDQkrGAYlsQOGYN/1VedX2ZFtL4ulsR
	N6v0NV2phdjUljSm5j5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uLxpv-00000006l42-29wq;
	Mon, 02 Jun 2025 05:35:51 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uLxps-00000006l2E-1ghL;
	Mon, 02 Jun 2025 05:35:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1748842548; x=1780378548;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=xYawO1iMI+DktvXg7m+0yXGAuCtCj8eg6S/Kl5Wr6tI=;
  b=Ktv7ARMAIv92idOnaW4AIA7fxMc+kZi2/cTutKeEFJBRBg+ZZxK4HyD1
   BZfLWnfSTDc4nTpiUdSmA0GdPT1mG17kAB70njr1WKej0juDxltA/Icx4
   HxCAbmFbuCno467KJCFbF2cXJvHK6TUjw4GqPXkHUl+2QgWEAQNpCXuKk
   ggyLgx57ExUUTlLZv/+Wl6gSPty+lC7qDI4/JyRrnGzAEVP5klPxpVanU
   ikwVaxJ+gdpRPIHAvNJBpDi+NLzLGTDkCrgs+BYjfT//Z2oaJgzeWaX3c
   Ma4hQZwhKaELuTKmsds0Lfl+zKTska/5zNskRvz19hKQlgQbskUBK4lwU
   Q==;
X-CSE-ConnectionGUID: 8pkaetzaTf2iFp4Ql+AwUg==
X-CSE-MsgGUID: xIBj22/+S1y/yI3wQAnNUQ==
X-IronPort-AV: E=Sophos;i="6.16,202,1744095600"; 
   d="scan'208";a="42865331"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa2.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 01 Jun 2025 22:35:45 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Sun, 1 Jun 2025 22:35:24 -0700
Received: from che-lt-i64410lx.microchip.com (10.10.85.11) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server id
 15.1.2507.44 via Frontend Transport; Sun, 1 Jun 2025 22:35:17 -0700
From: Balamanikandan Gunasundar <balamanikandan.gunasundar@microchip.com>
To: <miquel.raynal@bootlin.com>, <richard@nod.at>, <vigneshr@ti.com>,
	<robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
	<nicolas.ferre@microchip.com>, <alexandre.belloni@bootlin.com>,
	<claudiu.beznea@tuxon.dev>, <krzysztof.kozlowski+dt@linaro.org>
CC: <linux-mtd@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	Balamanikandan Gunasundar <balamanikandan.gunasundar@microchip.com>
Subject: [PATCH v3 0/4] dt-bindings: mtd: microchip-nand: convert txt to yaml
Date: Mon, 2 Jun 2025 11:05:03 +0530
Message-ID: <20250602053507.25864-1-balamanikandan.gunasundar@microchip.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250601_223548_615822_CD230476 
X-CRM114-Status: GOOD (  15.34  )
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

Convert microchip nand controllers from text to yaml

Summary of changes:

Note:
- The changes are made on top of v6.15. 

v2 -> v3:

[PATCH 1/4] dt-bindings: mtd: microchip-nand: convert txt to yaml
- Remove pmecc nodes in example as it has a seperate binding

[PATCH 2/4] dt-bindings: mtd: microchip-nand: add atmel pmecc
- Dropped '|' from description
- Merged the fallback compatibles
- Dropped 'base address and size of' from description
- Dropeed clock source description
- Modifed if/then condition. the clock source is only required for sam9x7
 
[PATCH 3/4] dt-bindings: mtd: atmel-nand: add legacy nand
- Dropped '|' from description
- Fix address-cells and size-cells ranges
- Define each gpio entry. RB, CE and CD
- Move vendor specific properties to last.
- Fix node names in examples.

[PATCH 4/4] MAINTAINERS: add entry for microchip nand controller
- New patch updating myself as maintainer.

v1 -> v2:

https://lore.kernel.org/all/20250311122847.90081-1-balamanikandan.gunasundar@microchip.com/

[PATCH 1/3] dt-bindings: mtd: microchip-nand: convert txt to yaml
- Change the filename to match the compatible string
- Drop items and oneOf in the compatible property as it is just an enum
- Remove the if in the #address-cells and #size-cells
- Remove the unwanted comments that refers to .txt files
- Fix reg property description
- Define the properties in a list and add constraints
- Fix DT coding style and droped unused labels

[PATCH 2/3] dt-bindings: mtd: microchip-nand: add atmel pmecc
- Rename filename to match compatible string
- Add constraints for sam9x7
- Droped unused dt labels 

[PATCH 3/3] dt-bindings: mtd: atmel-nand: add legacy nand
- Filename matching the compatibles
- Remove "bindings" from the subject
- Remove "deprecated" as these are the only bindings available for the devices
- Add missing constraints.
- Add default for nand-ecc-mode
- Add 32 in pmecc-cap for sama5d2
- Add default for sector-size, pmecc-lookup-table-offset, nand-bus-width

Balamanikandan Gunasundar (4):
  dt-bindings: mtd: microchip-nand: convert txt to yaml
  dt-bindings: mtd: microchip-nand: add atmel pmecc
  dt-bindings: mtd: atmel-nand: add legacy nand controllers
  MAINTAINERS: add entry for microchip nand controller

 .../devicetree/bindings/mtd/atmel-nand.txt    | 227 ------------------
 .../devicetree/bindings/mtd/atmel-nand.yaml   | 167 +++++++++++++
 .../mtd/microchip,nand-controller.yaml        | 169 +++++++++++++
 .../bindings/mtd/microchip,pmecc.yaml         |  62 +++++
 MAINTAINERS                                   |   5 +-
 5 files changed, 401 insertions(+), 229 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/mtd/atmel-nand.txt
 create mode 100644 Documentation/devicetree/bindings/mtd/atmel-nand.yaml
 create mode 100644 Documentation/devicetree/bindings/mtd/microchip,nand-controller.yaml
 create mode 100644 Documentation/devicetree/bindings/mtd/microchip,pmecc.yaml

-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
