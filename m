Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F285CC433F5
	for <linux-mtd@archiver.kernel.org>; Fri, 26 Nov 2021 14:07:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PPQg1NHZuskCxkrcL6PD1m94NkNzk+/pAOAzhjeOhbk=; b=mAzrKuqk7B8c3/
	YVM0i7NzdFL+XbzGr6aHlP7IPbg4RbnMxM+Ho+B5cp8MYELg4f//OtC+17acs9WPlQ6Z+9DOg+y1z
	Eys3KTXWP6TlR9fzQIuCSGszmNpkeem4n4luXqSl53AhxM/Z+ncKlS46EC4EpREiaG0Nf+T/ZwsOO
	nwz2HCL3oxBnc9g9FTeFYkKDbmZWwNwYflMPHynBk3l/Z+19YVXkvkV10/ClGmCA0Okx2dIHkod8r
	fme/eSMHkkoeJRHEznu1+le0WVyq6G/8SH/kC1XIT/nXj9afiJ9gU6NQoHZYLlXroZAihJ37GMbQs
	AVoocezKzkYzSf9ryUpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mqbse-00AgO1-LM; Fri, 26 Nov 2021 14:07:12 +0000
Received: from relay9-d.mail.gandi.net ([217.70.183.199])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mqbs4-00AgJO-RI; Fri, 26 Nov 2021 14:06:38 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id 24517FF81E;
 Fri, 26 Nov 2021 14:06:34 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>,
 Pratyush Yadav <p.yadav@ti.com>, Michael Walle <michael@walle.cc>,
 <linux-mtd@lists.infradead.org>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>,
 Jimmy Lalande <jimmy.lalande@se.com>,
 Milan Stevanovic <milan.stevanovic@se.com>,
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
 Magnus Damm <magnus.damm@gmail.com>,
 Gareth Williams <gareth.williams.jx@renesas.com>,
 Phil Edworthy <phil.edworthy@renesas.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 <linux-arm-kernel@lists.infradead.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [PATCH v2 1/3] dt-bindings: mtd: rzn1: Describe Renesas RZ/N1 NAND
 controller
Date: Fri, 26 Nov 2021 15:06:23 +0100
Message-Id: <20211126140625.351697-2-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20211126140625.351697-1-miquel.raynal@bootlin.com>
References: <20211126140625.351697-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211126_060637_048850_54B8AC1E 
X-CRM114-Status: GOOD (  10.73  )
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
---
 .../mtd/renesas,rzn1-nand-controller.yaml     | 64 +++++++++++++++++++
 1 file changed, 64 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mtd/renesas,rzn1-nand-controller.yaml

diff --git a/Documentation/devicetree/bindings/mtd/renesas,rzn1-nand-controller.yaml b/Documentation/devicetree/bindings/mtd/renesas,rzn1-nand-controller.yaml
new file mode 100644
index 000000000000..65d45962b5b1
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
+      - description: Host controller clock
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
+additionalProperties: true
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+
+    nand-controller@40102000 {
+        compatible = "renesas,r9a06g032-nand-controller",
+                     "renesas,rzn1-nand-controller";
+        reg = <0x40102000 0x2000>;
+        interrupts = <GIC_SPI 58 IRQ_TYPE_LEVEL_HIGH>;
+        clocks = <&hclk_nand>, <&clk_nand>;
+        clock-names = "hclk", "eclk";
+        #address-cells = <1>;
+        #size-cells = <0>;
+    };
-- 
2.27.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
