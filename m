Return-Path: <SRS0=0ZJr=25=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F07DC33CA2
	for <linux-mtd@archiver.kernel.org>; Wed,  8 Jan 2020 12:56:52 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 229E82072A
	for <linux-mtd@archiver.kernel.org>; Wed,  8 Jan 2020 12:56:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="e+A/HMqD"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 229E82072A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aHm7nRuNCjlOt+XyaXc6Yu0ooM9HU1nAEEu8sJsZMsU=; b=e+A/HMqDEGUS7V
	I1wHAOkhxpmLoxuZK9jJJnHcCrcXWwfzHvj9OnqJ2Dbk/LB8zLTWeYJwxnYYuwGS7x4R1bZ25wnA/
	E16xjIZ14eKDtrktz6gL8IljErUhPs4iukdSCtDw0CkRG9kQ8NT6CdyorWUWUC3ezld6SX+5YxlJH
	1FrrMMjInHKj35MAuT8+2J8+fLUS3uqXmGVC7kTSAMhWfiVjxTwSXkvt4eJ3Hb3RaA9JUJM7N1VVq
	YvHidaiUUvBh89FyTmbkYSLN+VyD17Oukgyi92emre3SZ9XhEc4Kmib87tpgkeYZPIy20DUB+uQyT
	FzZX4ekrjMXFZZbNdcBg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ipAt1-00034z-Tt; Wed, 08 Jan 2020 12:56:35 +0000
Received: from esa6.microchip.iphmx.com ([216.71.154.253])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ipAso-0002pt-Fc; Wed, 08 Jan 2020 12:56:23 +0000
Received-SPF: Pass (esa6.microchip.iphmx.com: domain of
 Claudiu.Beznea@microchip.com designates 198.175.253.82 as
 permitted sender) identity=mailfrom;
 client-ip=198.175.253.82; receiver=esa6.microchip.iphmx.com;
 envelope-from="Claudiu.Beznea@microchip.com";
 x-sender="Claudiu.Beznea@microchip.com";
 x-conformance=spf_only; x-record-type="v=spf1";
 x-record-text="v=spf1 mx a:ushub1.microchip.com
 a:smtpout.microchip.com -exists:%{i}.spf.microchip.iphmx.com
 include:servers.mcsv.net include:mktomail.com
 include:spf.protection.outlook.com ~all"
Received-SPF: None (esa6.microchip.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@email.microchip.com) identity=helo;
 client-ip=198.175.253.82; receiver=esa6.microchip.iphmx.com;
 envelope-from="Claudiu.Beznea@microchip.com";
 x-sender="postmaster@email.microchip.com"; x-conformance=spf_only
Authentication-Results: esa6.microchip.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=Pass smtp.mailfrom=Claudiu.Beznea@microchip.com;
 spf=None smtp.helo=postmaster@email.microchip.com;
 dmarc=pass (p=none dis=none) d=microchip.com
IronPort-SDR: zadowVfpm98rk3g1yJaeWBUjFoJMAeylN63mQ5n4xXDZR9a5gy/7DT52p/N0IxkWy5h1B0v6R2
 CK0ZQxEEAOifHaM4ALdMfuCMGH3K7TuptN3sj3K7PXMlKqvXBS9N3aUbYek8tfP0wuz4zYVADK
 oLI+9hG3VSLiWnX1rodcY+U1Cs1qUvoAU741MAr0Cy08ghIZOb27JDXABZm+mxNswYrpZGs/1K
 w+cKxiU0ph3cX4fLTGTGoupeoJ0MNtNSIM1h3UwL4es7XvQO8oZR5sF0y3nwxG9KrZI0xv8IYK
 TcI=
X-IronPort-AV: E=Sophos;i="5.69,410,1571727600"; d="scan'208";a="60095950"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 08 Jan 2020 05:56:18 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Wed, 8 Jan 2020 05:56:18 -0700
Received: from m18063-ThinkPad-T460p.microchip.com (10.10.85.251) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server id
 15.1.1713.5 via Frontend Transport; Wed, 8 Jan 2020 05:56:11 -0700
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
Subject: [PATCH 02/16] dt-bindings: atmel-can: add microchip,sam9x60-can
Date: Wed, 8 Jan 2020 14:55:09 +0200
Message-ID: <1578488123-26127-3-git-send-email-claudiu.beznea@microchip.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1578488123-26127-1-git-send-email-claudiu.beznea@microchip.com>
References: <1578488123-26127-1-git-send-email-claudiu.beznea@microchip.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200108_045622_560734_E5C22667 
X-CRM114-Status: UNSURE (   7.91  )
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

Add microchip,sam9x60-can to DT bindings documentation.

Signed-off-by: Claudiu Beznea <claudiu.beznea@microchip.com>
---
 Documentation/devicetree/bindings/net/can/atmel-can.txt | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/net/can/atmel-can.txt b/Documentation/devicetree/bindings/net/can/atmel-can.txt
index 14e52a0d86ec..218a3b3eb27e 100644
--- a/Documentation/devicetree/bindings/net/can/atmel-can.txt
+++ b/Documentation/devicetree/bindings/net/can/atmel-can.txt
@@ -1,7 +1,8 @@
 * AT91 CAN *
 
 Required properties:
-  - compatible: Should be "atmel,at91sam9263-can" or "atmel,at91sam9x5-can"
+  - compatible: Should be "atmel,at91sam9263-can", "atmel,at91sam9x5-can" or
+    "microchip,sam9x60-can"
   - reg: Should contain CAN controller registers location and length
   - interrupts: Should contain IRQ line for the CAN controller
 
-- 
2.7.4


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
