Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7849FC43602
	for <linux-mtd@archiver.kernel.org>; Tue, 30 Jun 2026 09:24:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dKJoe1XZxrUsc6EbcIBZPdYiE6/WQn+x+u/Gi1L5PqU=; b=Eub39/eknSos91
	l+msRgmAgQ95q5IUgr4RUmL/ppyn+2xfTarKU+LHLdCD3ejHcSWEJEDWarYJ6R2dSVEziESwZrDz1
	Z2trrUjl6eaF+AIcCXKa6babU1K82JMv4Dn1ZB2W/eBr1ekQjec4CmLxF3inG3UEnhH6DCA1yoEmF
	YBjN0ri+D8FADLF+GRGhaEOcZFzpddnnWt5ejKUlYBBl4Ftil3JXrNV7l21ns+zA+cyRJM0r4DW8/
	kFxyPYT2bcTw5xHM03gEPnhr/vhf5crptJz1jSK+DgulqtzaculLAwy4OIrugwdn9QZPQTlxf+QUx
	b9IBIpVOFp564MqdeGFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weUhx-0000000GOQL-0kPi;
	Tue, 30 Jun 2026 09:24:45 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weUhu-0000000GOOm-3ICj;
	Tue, 30 Jun 2026 09:24:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1782811482; x=1814347482;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=fBjF5q8rMNKv9vykdAVJd2NPBRLDCwvihjU5T1PBix4=;
  b=Y4uO3kpM0Bi1+RWUzONTr9omr/ZvfRW+0zULctlI0BwSgT1nshfMVCFL
   B52p8FaOy1QRQszeZ05K0iIUiPwKqskKpWMSb0GCjy6PFw6j3V7o8sJ7i
   WF2PEW1AkehzrHYzG3zUmd6ul2yEic6sOhXA3Ghpl+ypfZ8mRdS4NQY9N
   RKvWI5S9RekLFA16XNSTRvlZ7NrPKwJdRCANCM8hHImf3ZPw6E4ovtOS+
   I3PxaczMqN5Hw8VbuA03Kf7weEYbYsxMQ8hNeIyQLtboJWNcrlNHGRblw
   mpFPWC3vkXYldhUZzzLuRasnfy/bkfJMjmQmq9RSmPrjMkRYfFZiBQt9C
   A==;
X-CSE-ConnectionGUID: y2UMO1geT8GzPovUCZd3nA==
X-CSE-MsgGUID: TlvWtXBrQO6e5+zhhZ/sog==
X-IronPort-AV: E=Sophos;i="6.24,233,1774335600"; 
   d="scan'208";a="59032186"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa4.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 30 Jun 2026 02:24:40 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.87.72) by
 chn-vm-ex02.mchp-main.com (10.10.87.72) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.58; Tue, 30 Jun 2026 02:24:40 -0700
Received: from che-ll-i67131.microchip.com (10.10.85.11) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server id
 15.1.2507.58 via Frontend Transport; Tue, 30 Jun 2026 02:24:32 -0700
From: Manikandan Muralidharan <manikandan.m@microchip.com>
To: <pratyush@kernel.org>, <mwalle@kernel.org>,
	<takahiro.kuwano@infineon.com>, <miquel.raynal@bootlin.com>,
	<richard@nod.at>, <vigneshr@ti.com>, <robh@kernel.org>, <krzk+dt@kernel.org>,
	<conor+dt@kernel.org>, <srini@kernel.org>, <nicolas.ferre@microchip.com>,
	<alexandre.belloni@bootlin.com>, <claudiu.beznea@tuxon.dev>,
	<linux@armlinux.org.uk>, <richardcochran@gmail.com>, <linusw@kernel.org>,
	<arnd@arndb.de>, <michael@walle.cc>, <linux-mtd@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <netdev@vger.kernel.org>
CC: Manikandan Muralidharan <manikandan.m@microchip.com>
Subject: [PATCH v4 1/7] dt-bindings: mtd: jedec,spi-nor: allow the SFDP to be exposed via NVMEM
Date: Tue, 30 Jun 2026 14:54:00 +0530
Message-ID: <20260630092406.150587-2-manikandan.m@microchip.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260630092406.150587-1-manikandan.m@microchip.com>
References: <20260630092406.150587-1-manikandan.m@microchip.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260630_022442_894998_661A672D 
X-CRM114-Status: UNSURE (   8.23  )
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

Signed-off-by: Manikandan Muralidharan <manikandan.m@microchip.com>
---
 .../devicetree/bindings/mtd/jedec,spi-nor.yaml | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/Documentation/devicetree/bindings/mtd/jedec,spi-nor.yaml b/Documentation/devicetree/bindings/mtd/jedec,spi-nor.yaml
index 587af4968255..98fd954598ab 100644
--- a/Documentation/devicetree/bindings/mtd/jedec,spi-nor.yaml
+++ b/Documentation/devicetree/bindings/mtd/jedec,spi-nor.yaml
@@ -103,6 +103,20 @@ properties:
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
+    properties:
+      compatible:
+        const: jedec,sfdp
+    required:
+      - compatible
+
 dependencies:
   spi-cpol: [ spi-cpha ]
   spi-cpha: [ spi-cpol ]
@@ -122,6 +136,10 @@ examples:
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
