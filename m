Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF13CC433FE
	for <linux-mtd@archiver.kernel.org>; Thu, 17 Nov 2022 10:59:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3EfbAuIOEad0MXFQy6hLEVvR9vgMJhhlcmF/h2p81iw=; b=c0UEhOZLRZRXH6
	HoJ+av94J/ppY5JRUtDbplN5CoCR75ccG2puBEubOn7pQDN01ZQ+t9OuB/9bJY209UvIV08/5W2lH
	aUAlMYTS0k8KnARlFM6anBBLASKxNxx0T9ihITJjlhHz6OQrpJtHEQzEYSQo2dmIB27JSF0tMx922
	ondb8W1CHQdDOztb+3bldtAgMcgNXjX5qYI4Ts4Xui1rYknYAVLJ9EUGaxgBJnqsLG3xauvV2mbr2
	2K3oATd2IL3qIwwmx4B+IhDexxZrQ4Kqvhs39rMBwLZnLToDLcoYNAtqpj2BGr9POVhmGSjda6jLH
	Yy7OniYv6ob+qpe5m7zQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ovcbe-00CrqM-St; Thu, 17 Nov 2022 10:58:54 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ovcW4-00CoB4-QP; Thu, 17 Nov 2022 10:53:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1668682388; x=1700218388;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=gNtn9WfsbwYVLh4+RkqUoRwPVNMtyYltmpBOWMDfWsw=;
  b=BbogJ65terS7OzzgJOQEMMYI923imLqMZEVAYBZrb0wuInPx453s/x2U
   Ke1UjXF81j2u+pFzCSVieBS1gtpikYVbwFe5bWFXn+VsDqoNiZQjqEiQG
   tisOdhiyPq45Ix6Pr26e9EbRNLDvXF0alphtYEiuxYTBRunbSCKfoZcJ6
   4u+JiU9lQ7VC2wdl6dSaHv7MgdlF3ONzmX47LI+/0Ku1yggPNQa01aSuJ
   zuj16517b0OzqdU+0M5eP7X2J9j3yjeHvy8BsDEUJ1ajB1OkWHAg+7UXi
   T6xJAIH1ZjwY8qPtPTTXdb5aMwWTZOJmdRBjM/Ms1ZXj7FLiW1wNTOCGG
   A==;
X-IronPort-AV: E=Sophos;i="5.96,171,1665471600"; 
   d="scan'208";a="123873129"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 17 Nov 2022 03:52:56 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.87.72) by
 chn-vm-ex02.mchp-main.com (10.10.87.72) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12; Thu, 17 Nov 2022 03:52:56 -0700
Received: from ROB-ULT-M18064N.mchp-main.com (10.10.115.15) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server id
 15.1.2507.12 via Frontend Transport; Thu, 17 Nov 2022 03:52:53 -0700
From: Tudor Ambarus <tudor.ambarus@microchip.com>
To: <broonie@kernel.org>, <robh+dt@kernel.org>,
	<krzysztof.kozlowski+dt@linaro.org>, <nicolas.ferre@microchip.com>,
	<alexandre.belloni@bootlin.com>, <claudiu.beznea@microchip.com>
CC: <linux-spi@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mtd@lists.infradead.org>, Tudor Ambarus <tudor.ambarus@microchip.com>
Subject: [PATCH 1/8] spi: dt-bindings: Introduce spi-cs-setup-ns property
Date: Thu, 17 Nov 2022 12:52:42 +0200
Message-ID: <20221117105249.115649-2-tudor.ambarus@microchip.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221117105249.115649-1-tudor.ambarus@microchip.com>
References: <20221117105249.115649-1-tudor.ambarus@microchip.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221117_025309_023845_9CDF8B48 
X-CRM114-Status: UNSURE (   7.12  )
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
 .../devicetree/bindings/spi/spi-peripheral-props.yaml        | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/spi/spi-peripheral-props.yaml b/Documentation/devicetree/bindings/spi/spi-peripheral-props.yaml
index dca677f9e1b9..ead2cccf658f 100644
--- a/Documentation/devicetree/bindings/spi/spi-peripheral-props.yaml
+++ b/Documentation/devicetree/bindings/spi/spi-peripheral-props.yaml
@@ -44,6 +44,11 @@ properties:
     description:
       Maximum SPI clocking speed of the device in Hz.
 
+  spi-cs-setup-ns:
+    description:
+      Delay in nanosecods to be introduced by the controller after CS is
+      asserted.
+
   spi-rx-bus-width:
     description:
       Bus width to the SPI bus used for read transfers.
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
