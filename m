Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D12EC04FE1
	for <linux-mtd@archiver.kernel.org>; Fri, 23 Jun 2023 20:39:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2fLJbi6oItK+xU504MFxG+w4OMylf83EefIE56Ho7v8=; b=ectmYYfu6DKMaX
	p9rq5c2MtmrEA1ld1eWYFu4sOLg2AkV0OFCYEiqopfw8IChKt3ofC4FsGsKjT9AWSI29odi1AR/gL
	wadLXSphUoxgpygOVF7q3x//swQ56vQGF2zN9LI2YkWyDTi+6u6Nwuc91EBxjw8TGDpdWyiunPT+x
	1dRoi86DzjSefL2gsF85G/EoFf1yMPFR4SOUtc7OhjwlYs19KJNwZLDTInFMDjkg2yRv9flJOdUw4
	SC+ywtduo3zfy4TT6U+xmb1ZAdd+Ls+FIIWWfyrcNrIjvbbmn2BFk49cSawFuRYeRniXqpJrhpeX+
	wnKhcQJk9b7ysoEY6swQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qCnZ3-004WSV-0Y;
	Fri, 23 Jun 2023 20:39:29 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qCnYz-004WRl-1S;
	Fri, 23 Jun 2023 20:39:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1687552765; x=1719088765;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=BghAzpBOsD/G8yJhbLfihqjeVjiLcTMvY+1q984gv6Q=;
  b=gU6Ds1EMEdtZtj2dvgOm67HmV5j49d9gibhjVnCKz23N1Trl38vd7lOR
   kU3Yt20gBA0ds6rfnX6txy2XwVR/C/tnoE1F/VhjLjvDcgqv8oIN5GMhq
   ZF034Y3K1pg6nWnwm//xlGom1iq1iD+w5oSFRLIsd5n60g89Pz9cOF3RD
   5jy0j5WJAXBaP0Lq4EZPUX5qWYYWnpYByh1Mjndyxt1sLaYnPYtIc0aj9
   wq1zA1Q1DNu7s1W8xVuOk1SsCymH9xEO12ytnm9PVU6lBEjAmKziELiUi
   Mbxvlj8C6qCCK+9EUpqR6OBJnXdX7nbtZYr0mQT38IGZCj2qGtRIau/hv
   g==;
X-IronPort-AV: E=Sophos;i="6.01,153,1684825200"; 
   d="scan'208";a="219551128"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 23 Jun 2023 13:39:23 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Fri, 23 Jun 2023 13:39:17 -0700
Received: from che-lt-i67070.amer.actel.com (10.10.115.15) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server id
 15.1.2507.21 via Frontend Transport; Fri, 23 Jun 2023 13:38:48 -0700
From: Varshini Rajendran <varshini.rajendran@microchip.com>
To: <robh+dt@kernel.org>, <krzysztof.kozlowski+dt@linaro.org>,
	<conor+dt@kernel.org>, <nicolas.ferre@microchip.com>,
	<alexandre.belloni@bootlin.com>, <claudiu.beznea@microchip.com>,
	<mturquette@baylibre.com>, <sboyd@kernel.org>, <herbert@gondor.apana.org.au>,
	<davem@davemloft.net>, <vkoul@kernel.org>, <tglx@linutronix.de>,
	<maz@kernel.org>, <lee@kernel.org>, <ulf.hansson@linaro.org>,
	<tudor.ambarus@linaro.org>, <miquel.raynal@bootlin.com>, <richard@nod.at>,
	<vigneshr@ti.com>, <edumazet@google.com>, <kuba@kernel.org>,
	<pabeni@redhat.com>, <linus.walleij@linaro.org>, <p.zabel@pengutronix.de>,
	<olivia@selenic.com>, <a.zummo@towertech.it>, <radu_nicolae.pirea@upb.ro>,
	<richard.genoud@gmail.com>, <gregkh@linuxfoundation.org>,
	<lgirdwood@gmail.com>, <broonie@kernel.org>, <wim@linux-watchdog.org>,
	<linux@roeck-us.net>, <arnd@arndb.de>, <olof@lixom.net>, <soc@kernel.org>,
	<linux@armlinux.org.uk>, <sre@kernel.org>, <jerry.ray@microchip.com>,
	<horatiu.vultur@microchip.com>, <durai.manickamkr@microchip.com>,
	<varshini.rajendran@microchip.com>, <andrew@lunn.ch>,
	<alain.volmat@foss.st.com>, <neil.armstrong@linaro.org>,
	<mihai.sain@microchip.com>, <eugen.hristev@collabora.com>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <linux-clk@vger.kernel.org>,
	<linux-crypto@vger.kernel.org>, <dmaengine@vger.kernel.org>,
	<linux-i2c@vger.kernel.org>, <linux-mmc@vger.kernel.org>,
	<linux-mtd@lists.infradead.org>, <netdev@vger.kernel.org>,
	<linux-gpio@vger.kernel.org>, <linux-rtc@vger.kernel.org>,
	<linux-spi@vger.kernel.org>, <linux-serial@vger.kernel.org>,
	<alsa-devel@alsa-project.org>, <linux-usb@vger.kernel.org>,
	<linux-watchdog@vger.kernel.org>, <linux-pm@vger.kernel.org>
CC: <Hari.PrasathGE@microchip.com>, <cristian.birsan@microchip.com>,
	<balamanikandan.gunasundar@microchip.com>, <manikandan.m@microchip.com>,
	<dharma.b@microchip.com>, <nayabbasha.sayed@microchip.com>,
	<balakrishnan.s@microchip.com>
Subject: [PATCH v2 16/45] dt-bindings: crypto: add bindings for sam9x7 in Atmel TDES
Date: Sat, 24 Jun 2023 02:00:27 +0530
Message-ID: <20230623203056.689705-17-varshini.rajendran@microchip.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230623203056.689705-1-varshini.rajendran@microchip.com>
References: <20230623203056.689705-1-varshini.rajendran@microchip.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230623_133925_533518_02188788 
X-CRM114-Status: UNSURE (   8.25  )
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

Add DT bindings for atmel TDES.

Signed-off-by: Varshini Rajendran <varshini.rajendran@microchip.com>
---
 .../devicetree/bindings/crypto/atmel,at91sam9g46-tdes.yaml   | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/crypto/atmel,at91sam9g46-tdes.yaml b/Documentation/devicetree/bindings/crypto/atmel,at91sam9g46-tdes.yaml
index 3d6ed24b1b00..0e71bfd32a1c 100644
--- a/Documentation/devicetree/bindings/crypto/atmel,at91sam9g46-tdes.yaml
+++ b/Documentation/devicetree/bindings/crypto/atmel,at91sam9g46-tdes.yaml
@@ -12,7 +12,10 @@ maintainers:
 
 properties:
   compatible:
-    const: atmel,at91sam9g46-tdes
+    oneOf:
+      - items:
+          - const: atmel,at91sam9g46-tdes
+          - const: microchip,sam9x7-tdes
 
   reg:
     maxItems: 1
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
