Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B58DC43217
	for <linux-mtd@archiver.kernel.org>; Wed, 15 Dec 2021 15:48:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RCNoNeU8CA9BOo1YeJs/J5+p8kCf8BmtAC/CKmguMaI=; b=NxiAoZh9led3zw
	Dw/j4kpUe4gOZhY1CyFgIF4ygG/xlwqpVL6T6LTVr9fcazrgCKN3qNAZOc8bQff3AXDbQqgnAsv2I
	sUfPcx9nMTYhWmcFH6wY6gabPgNqjhsk6JiwHEtut+UP38YA8IUtbD2sYpQeJZ/L574Nwd9P0Lsrf
	Kn3ddMlorvw0SoXNvQgvWkNF3pL3UH+3heHsx3Eolu5vBjU2qK25lZFAGO02NcUmHlOI9EUL8z7/g
	St6bEShLsLhT7nCOl9nZ+z17DK+dTH/UH3CYNLtA2P4r7nRn9WiPuGpUdDAbrJT1XpUbqVTYKd/ZM
	LfcUgz2G47zuTM/5qBsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mxWUO-001Qvd-0L; Wed, 15 Dec 2021 15:46:44 +0000
Received: from relay9-d.mail.gandi.net ([217.70.183.199])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mxWU7-001Qqi-Lx
 for linux-mtd@lists.infradead.org; Wed, 15 Dec 2021 15:46:30 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id 36083FF811;
 Wed, 15 Dec 2021 15:46:24 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>,
 Pratyush Yadav <p.yadav@ti.com>, Michael Walle <michael@walle.cc>,
 <linux-mtd@lists.infradead.org>
Cc: linux-renesas-soc@vger.kernel.org, Magnus Damm <magnus.damm@gmail.com>,
 Gareth Williams <gareth.williams.jx@renesas.com>,
 Phil Edworthy <phil.edworthy@renesas.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Milan Stevanovic <milan.stevanovic@se.com>,
 Jimmy Lalande <jimmy.lalande@se.com>, Rob Herring <robh+dt@kernel.org>,
 <devicetree@vger.kernel.org>, Miquel Raynal <miquel.raynal@bootlin.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v4 1/4] dt-bindings: mtd: rzn1: Describe Renesas RZ/N1 NAND
 controller
Date: Wed, 15 Dec 2021 16:46:16 +0100
Message-Id: <20211215154619.166360-2-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20211215154619.166360-1-miquel.raynal@bootlin.com>
References: <20211215154619.166360-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211215_074627_898475_B175BAB1 
X-CRM114-Status: GOOD (  11.05  )
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

Add a Yaml description for this Renesas NAND controller bindings.

Provide a family-specific "rzn1" compatible and a more specific
"r9a06g032" one.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 .../mtd/renesas,rzn1-nand-controller.yaml     | 64 +++++++++++++++++++
 1 file changed, 64 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mtd/renesas,rzn1-nand-controller.yaml

diff --git a/Documentation/devicetree/bindings/mtd/renesas,rzn1-nand-controller.yaml b/Documentation/devicetree/bindings/mtd/renesas,rzn1-nand-controller.yaml
new file mode 100644
index 000000000000..03a4e99b4d89
--- /dev/null
+++ b/Documentation/devicetree/bindings/mtd/renesas,rzn1-nand-controller.yaml
@@ -0,0 +1,64 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/mtd/renesas,rzn1-nand-controller.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Renesas RZ/N1x NAND flash controller device tree bindings
+
+maintainers:
+  - Miquel Raynal <miquel.raynal@bootlin.com>
+
+allOf:
+  - $ref: "nand-controller.yaml"
+
+properties:
+  compatible:
+    items:
+      - enum:
+          - renesas,r9a06g032-nand-controller
+      - const: renesas,rzn1-nand-controller
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: APB host controller clock
+      - description: External NAND bus clock
+
+  clock-names:
+    items:
+      - const: hclk
+      - const: eclk
+
+  "#address-cells": true
+  "#size-cells": true
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - clock-names
+  - interrupts
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/clock/r9a06g032-sysctrl.h>
+
+    nand-controller@40102000 {
+        compatible = "renesas,r9a06g032-nand-controller",
+                     "renesas,rzn1-nand-controller";
+        reg = <0x40102000 0x2000>;
+        interrupts = <GIC_SPI 58 IRQ_TYPE_LEVEL_HIGH>;
+        clocks = <&sysctrl R9A06G032_HCLK_NAND>, <&sysctrl R9A06G032_CLK_NAND>;
+        clock-names = "hclk", "eclk";
+        #address-cells = <1>;
+        #size-cells = <0>;
+    };
-- 
2.27.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
