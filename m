Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52579C5AD5A
	for <linux-mtd@archiver.kernel.org>; Wed, 12 Aug 2026 10:50:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ic1b+h578gnm5U6L7MQA+oB845Z4NBiplxbqYyUbyTg=; b=nNW2vSfQKh2elG
	U7pazBKplVolP+mhgMORmEvfraBH6Y/N4Fqusnj5OMLQpAbmjxnlRYRomo29EwaZ5ViB2rqsKgbcX
	l02vx1SwhNzSiM7phwSMWv2lvKlRL9heTPzF479T24JCvwHXojppMn3529awrLusVbGKEZOORFNDU
	aE8/hfYHCVehKnekb4bzhCdfjaieU+B8FWyNxOJp9zbM2cAmOeK/vl/aLPE17GyoNdZ38G2r3jfx2
	/Iq2oeL86Jql1soKXb7IMADmVZU9Z1SujCQS9eU46W2Y3mt6kFW2bZdU/1RHtjIzCoTlYOnYYSoT7
	PgkGFyQEyKfuAeORJHgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wu6Xa-0000000FwlG-2Vm8;
	Wed, 12 Aug 2026 10:50:34 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wu6XV-0000000FwjW-0FQQ;
	Wed, 12 Aug 2026 10:50:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1786531829; x=1818067829;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ZbNAFzSIw3R2cm7Wm2v5oyHJUBSuXKlXSqen3A0swWY=;
  b=scIiR3xcOd0hDs8j2BLgm7ZFFv7CwlZ3/Cg5M/9hnSItP0ctIeS/z2dO
   xRZN6hEvsy4Xb20AJRzC1eq2Onb5kXaPlqGvT8AOk9OlQd8nOFHMDVd3k
   0PpmHMBXQc5n/SQz9tTuh8B1Xt+QxlcIkFrCBc2BjyzUpDdRyj0NxTfo+
   Nq1XX5KPWNa0Vi6tFvJMMQGgAHAH3l8aQD9HKR2MA0QsHtb84CObh44eN
   hF001E7e5bepOE3AAAbUYMTn8HZwWnWIxvIG9uQdXY4ChbYmqrt2/P/RI
   63uwvdlgaTdpg4LkasQ+Wndp9GunL5wlcDSNKJaF5x36QoZF48AWu7UCD
   g==;
X-CSE-ConnectionGUID: DONMir8iQPOoqeFD/87JYg==
X-CSE-MsgGUID: gtfK8EHuRHatpaSlu7C0Lw==
X-IronPort-AV: E=Sophos;i="6.25,219,1779174000"; 
   d="scan'208";a="293389497"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa5.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Aug 2026 03:50:29 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.87.151) by
 chn-vm-ex4.mchp-main.com (10.10.87.33) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.2562.45; Wed, 12 Aug 2026 03:50:27 -0700
Received: from che-ll-i67131.microchip.com (10.10.85.11) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server id
 15.1.2507.58 via Frontend Transport; Wed, 12 Aug 2026 03:50:17 -0700
From: Manikandan Muralidharan <manikandan.m@microchip.com>
To: <pratyush@kernel.org>, <mwalle@kernel.org>,
	<takahiro.kuwano@infineon.com>, <miquel.raynal@bootlin.com>,
	<richard@nod.at>, <vigneshr@ti.com>, <robh@kernel.org>, <krzk+dt@kernel.org>,
	<conor+dt@kernel.org>, <srini@kernel.org>, <nicolas.ferre@microchip.com>,
	<alexandre.belloni@bootlin.com>, <claudiu.beznea@tuxon.dev>,
	<linux@armlinux.org.uk>, <richardcochran@gmail.com>, <arnd@arndb.de>,
	<linusw@kernel.org>, <gregkh@linuxfoundation.org>,
	<mathieu.dubois-briand@bootlin.com>, <michael@walle.cc>,
	<linux-mtd@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<netdev@vger.kernel.org>
CC: Manikandan Muralidharan <manikandan.m@microchip.com>
Subject: [PATCH v7 1/7] dt-bindings: mtd: jedec,spi-nor: allow the SFDP to be exposed via NVMEM
Date: Wed, 12 Aug 2026 16:19:49 +0530
Message-ID: <20260812104955.485667-2-manikandan.m@microchip.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260812104955.485667-1-manikandan.m@microchip.com>
References: <20260812104955.485667-1-manikandan.m@microchip.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260812_035030_357975_ECB395D8 
X-CRM114-Status: UNSURE (   9.35  )
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

Add an optional "sfdp" child node (compatible "jedec,sfdp") that
describes the SFDP as a read-only NVMEM provider via nvmem.yaml, so its
contents (e.g. a vendor EUI-48/EUI-64) can be read through NVMEM cells.

Reviewed-by: Linus Walleij <linusw@kernel.org>
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Manikandan Muralidharan <manikandan.m@microchip.com>
---
 .../bindings/mtd/jedec,spi-nor.yaml           | 20 +++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/Documentation/devicetree/bindings/mtd/jedec,spi-nor.yaml b/Documentation/devicetree/bindings/mtd/jedec,spi-nor.yaml
index 587af4968255..d7e659912b4a 100644
--- a/Documentation/devicetree/bindings/mtd/jedec,spi-nor.yaml
+++ b/Documentation/devicetree/bindings/mtd/jedec,spi-nor.yaml
@@ -103,6 +103,22 @@ properties:
   spi-cpol: true
   spi-cpha: true
 
+  sfdp:
+    $ref: /schemas/nvmem/nvmem.yaml#
+    unevaluatedProperties: false
+    description:
+      The Serial Flash Discoverable Parameters (SFDP) tables exposed as a
+      read-only NVMEM device. This allows standard or vendor-specific SFDP
+      data (for example a factory-programmed EUI-48/EUI-64 identifier) to be
+      consumed through NVMEM cells.
+
+    properties:
+      compatible:
+        const: jedec,sfdp
+
+    required:
+      - compatible
+
 dependencies:
   spi-cpol: [ spi-cpha ]
   spi-cpha: [ spi-cpol ]
@@ -122,6 +138,10 @@ examples:
             spi-max-frequency = <40000000>;
             m25p,fast-read;
             reset-gpios = <&gpio 12 GPIO_ACTIVE_LOW>;
+
+            sfdp {
+                compatible = "jedec,sfdp";
+            };
         };
     };
 ...
-- 
2.43.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
