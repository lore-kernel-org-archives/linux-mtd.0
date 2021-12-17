Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7AFCC433FE
	for <linux-mtd@archiver.kernel.org>; Fri, 17 Dec 2021 14:21:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XcLAMLqrGjIKhtGA9MxhJqEjXrrlRkdiSUF83qjs4RU=; b=PuBuVCxyq54HH/
	XRVLCLH/5Xfd0M0vTw+QNmrjx86tOMPbs3CD62EozsnaGLLGztn21sFaU7l97Nw0ijRWvb1YP3hzG
	hHPg+ifotv1n0InYA9zOs+q73LgKIr1kPzRptaJZCZCEV/pFlgDKdiAGZWHgtfphd/vE8U5QfLFOf
	+9WnCXHRO55vVw0Qbo51LcburRuq+fQbsO1tf9wkd0hXXvXhAjXE96/DGE9htmk/kwcC0gJwkpou7
	vwLBMdjCuB7c9pXvz/HdFoDLeVqqfIqFnJKijJEITsbcFYLCDwQAX89Q+Q1vje7CnMhx5wfoz19za
	/4mo0DDhAsH+Mg9kW1oA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1myE6S-00AbGm-91; Fri, 17 Dec 2021 14:20:56 +0000
Received: from relay3-d.mail.gandi.net ([217.70.183.195])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1myE6E-00AbEC-Dm
 for linux-mtd@lists.infradead.org; Fri, 17 Dec 2021 14:20:44 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by relay3-d.mail.gandi.net (Postfix) with ESMTPSA id 4B4EB60014;
 Fri, 17 Dec 2021 14:20:38 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>,
 Pratyush Yadav <p.yadav@ti.com>, Michael Walle <michael@walle.cc>,
 <linux-mtd@lists.infradead.org>
Cc: Rob Herring <robh+dt@kernel.org>, <devicetree@vger.kernel.org>,
 Milan Stevanovic <milan.stevanovic@se.com>,
 Jimmy Lalande <jimmy.lalande@se.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 linux-renesas-soc@vger.kernel.org, Magnus Damm <magnus.damm@gmail.com>,
 Gareth Williams <gareth.williams.jx@renesas.com>,
 Phil Edworthy <phil.edworthy@renesas.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>, Wolfram Sang <wsa@kernel.org>,
 Chris Brandt <Chris.Brandt@renesas.com>,
 Ralph Siemsen <ralph.siemsen@linaro.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>, Rob Herring <robh@kernel.org>
Subject: [PATCH v6 1/4] dt-bindings: mtd: renesas: Describe Renesas R-Car Gen3
 & RZ/N1 NAND controller
Date: Fri, 17 Dec 2021 15:20:30 +0100
Message-Id: <20211217142033.353599-2-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20211217142033.353599-1-miquel.raynal@bootlin.com>
References: <20211217142033.353599-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211217_062042_762097_82395745 
X-CRM114-Status: GOOD (  11.80  )
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

Add a Yaml description for this Renesas NAND controller.

As this controller is embedded on different SoC families, provide:
* a family-specific "r-car-gen3" compatible and a more specific
  "r8a77951" one
* a family-specific "rzn1" compatible and a more specific "r9a06g032"
  one

More compatibles can be added later if new SoCs with this controller
must be supported.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Reviewed-by: Rob Herring <robh@kernel.org>
---
 .../bindings/mtd/renesas-nandc.yaml           | 66 +++++++++++++++++++
 1 file changed, 66 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mtd/renesas-nandc.yaml

diff --git a/Documentation/devicetree/bindings/mtd/renesas-nandc.yaml b/Documentation/devicetree/bindings/mtd/renesas-nandc.yaml
new file mode 100644
index 000000000000..71886dbda35c
--- /dev/null
+++ b/Documentation/devicetree/bindings/mtd/renesas-nandc.yaml
@@ -0,0 +1,66 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/mtd/renesas-nandc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Renesas R-Car Gen3 & RZ/N1x NAND flash controller device tree bindings
+
+maintainers:
+  - Miquel Raynal <miquel.raynal@bootlin.com>
+
+allOf:
+  - $ref: "nand-controller.yaml"
+
+properties:
+  compatible:
+    oneOf:
+      - items:
+          - enum:
+              - renesas,r8a77951-nandc
+          - const: renesas,rcar-gen3-nandc
+
+      - items:
+          - enum:
+              - renesas,r9a06g032-nandc
+          - const: renesas,rzn1-nandc
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
+        compatible = "renesas,r9a06g032-nandc", "renesas,rzn1-nandc";
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
