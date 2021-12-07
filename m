Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2132FC433EF
	for <linux-mtd@archiver.kernel.org>; Tue,  7 Dec 2021 09:39:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jlXeisH4Ja2SX+dI4Obu3x8hX3eUbc0pOKrcoH0NgV8=; b=eurx3472AApOjj
	cSJ5f+4JZuZN7ZKlAYT/8a5RMHeH4MfwlkhFn+k0vGXd/9hTyYtuyVbzGFHv7SjWMBVwelbkCjRbT
	0ywkQm8V8V2F7vpGNpivGI64iyyI4/PdXAY1hOijA4H2i3BUXAEnVbHD6ndadwAWjvk2OSpxGcRYI
	UFFwN4WVpFT9s7ZILHMkibh1zqwA3NVViCRYVjdOuGiOpaUeJfBl6trxvznPDQiZJhdmj3frLpu+D
	rI9ABa+Rm3Sgt5B6SX54vGFezglcuRUOlnqy1VVSLQMLAwWjJGPsfWNrdEAh2GbP0qJdV7g5AtykQ
	dxxIhu4YN4FIImWuY9vQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1muWvo-007qGi-PU; Tue, 07 Dec 2021 09:38:40 +0000
Received: from relay3-d.mail.gandi.net ([217.70.183.195])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1muWru-007otO-C3
 for linux-mtd@lists.infradead.org; Tue, 07 Dec 2021 09:34:46 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by relay3-d.mail.gandi.net (Postfix) with ESMTPSA id A60FF60007;
 Tue,  7 Dec 2021 09:34:35 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>,
 Pratyush Yadav <p.yadav@ti.com>, Michael Walle <michael@walle.cc>,
 <linux-mtd@lists.infradead.org>, Mark Brown <broonie@kernel.org>,
 <linux-spi@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>,
 <devicetree@vger.kernel.org>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Xiangsheng Hou <Xiangsheng.Hou@mediatek.com>,
 Julien Su <juliensu@mxic.com.tw>, Jaime Liao <jaimeliao@mxic.com.tw>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>, Rob Herring <robh@kernel.org>
Subject: [PATCH v3 08/22] dt-bindings: spi: mxic: Convert to yaml
Date: Tue,  7 Dec 2021 10:34:08 +0100
Message-Id: <20211207093422.166934-9-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20211207093422.166934-1-miquel.raynal@bootlin.com>
References: <20211207093422.166934-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211207_013438_712730_261E1CF0 
X-CRM114-Status: GOOD (  14.06  )
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

Straightforward conversion from regular text to yaml schema of the
Macronix SPI controller DT bindings.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
Reviewed-by: Rob Herring <robh@kernel.org>
Reviewed-by: Mark Brown <broonie@kernel.org>
---
 .../bindings/spi/mxicy,mx25f0a-spi.yaml       | 60 +++++++++++++++++++
 .../devicetree/bindings/spi/spi-mxic.txt      | 36 -----------
 2 files changed, 60 insertions(+), 36 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/spi/mxicy,mx25f0a-spi.yaml
 delete mode 100644 Documentation/devicetree/bindings/spi/spi-mxic.txt

diff --git a/Documentation/devicetree/bindings/spi/mxicy,mx25f0a-spi.yaml b/Documentation/devicetree/bindings/spi/mxicy,mx25f0a-spi.yaml
new file mode 100644
index 000000000000..f20d100b4a68
--- /dev/null
+++ b/Documentation/devicetree/bindings/spi/mxicy,mx25f0a-spi.yaml
@@ -0,0 +1,60 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/spi/mxicy,mx25f0a-spi.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Macronix SPI controller device tree bindings
+
+maintainers:
+  - Miquel Raynal <miquel.raynal@bootlin.com>
+
+allOf:
+  - $ref: "spi-controller.yaml#"
+
+properties:
+  compatible:
+    const: mxicy,mx25f0a-spi
+
+  reg:
+    minItems: 2
+    maxItems: 2
+
+  reg-names:
+    items:
+      - const: regs
+      - const: dirmap
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    minItems: 3
+    maxItems: 3
+
+  clock-names:
+    items:
+      - const: send_clk
+      - const: send_dly_clk
+      - const: ps_clk
+
+required:
+  - compatible
+  - reg
+  - reg-names
+  - clocks
+  - clock-names
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    spi@43c30000 {
+      compatible = "mxicy,mx25f0a-spi";
+      reg = <0x43c30000 0x10000>, <0xa0000000 0x20000000>;
+      reg-names = "regs", "dirmap";
+      clocks = <&clkwizard 0>, <&clkwizard 1>, <&clkc 18>;
+      clock-names = "send_clk", "send_dly_clk", "ps_clk";
+      #address-cells = <1>;
+      #size-cells = <0>;
+    };
diff --git a/Documentation/devicetree/bindings/spi/spi-mxic.txt b/Documentation/devicetree/bindings/spi/spi-mxic.txt
deleted file mode 100644
index 7bcbb229b78b..000000000000
--- a/Documentation/devicetree/bindings/spi/spi-mxic.txt
+++ /dev/null
@@ -1,36 +0,0 @@
-Macronix SPI controller Device Tree Bindings
---------------------------------------------
-
-Required properties:
-- compatible: should be "mxicy,mx25f0a-spi"
-- #address-cells: should be 1
-- #size-cells: should be 0
-- reg: should contain 2 entries, one for the registers and one for the direct
-       mapping area
-- reg-names: should contain "regs" and "dirmap"
-- clock-names: should contain "ps_clk", "send_clk" and "send_dly_clk"
-- clocks: should contain 3 entries for the "ps_clk", "send_clk" and
-	  "send_dly_clk" clocks
-
-Optional properties:
-- interrupts: interrupt line connected to the SPI controller
-
-Example:
-
-	spi@43c30000 {
-		compatible = "mxicy,mx25f0a-spi";
-		reg = <0x43c30000 0x10000>, <0xa0000000 0x20000000>;
-		reg-names = "regs", "dirmap";
-		clocks = <&clkwizard 0>, <&clkwizard 1>, <&clkc 18>;
-		clock-names = "send_clk", "send_dly_clk", "ps_clk";
-		#address-cells = <1>;
-		#size-cells = <0>;
-
-		flash@0 {
-			compatible = "jedec,spi-nor";
-			reg = <0>;
-			spi-max-frequency = <25000000>;
-			spi-tx-bus-width = <4>;
-			spi-rx-bus-width = <4>;
-		};
-	};
-- 
2.27.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
