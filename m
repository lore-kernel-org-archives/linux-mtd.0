Return-Path: <SRS0=jKlu=O4=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EEDCBC433F5
	for <linux-mtd@archiver.kernel.org>; Fri,  8 Oct 2021 16:24:07 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A50A96101E
	for <linux-mtd@archiver.kernel.org>; Fri,  8 Oct 2021 16:24:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org A50A96101E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=advtk8Dw1lXrEe+Z12J01EPrNncz4QZMeHaYMLlJhk4=; b=RblGQqlOZ4CLbe
	/0bltYkLnbd/9ED8QQsYE56Y5ecLWnJyb29q8/paNjCq1+ZonOaSh1+n2EXiQsey4dlpgoBpTV0oW
	ob9IJXqzimcUyM3rzNDdppNEWo8EYPogdO9Q9GdKjzT3uoPFxMVLeZGyUHWBpsIspusU8/+UtBojA
	FqQiQnVirXYkM1Kd2FitTkI2UVcSQYBw3HX7N1BIWvQwZlid3Z3CkMC/bNMgT7CkXLjN9/WP5qsD1
	ACVmxA6L/qPBlf6aZiREz6uNAaFRbTS3tDvjhcbtmdYtwdwpijflB9TMLlegYWu7r/2730j1hSAaP
	U26vFIKxZzes0VaudwFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mYseq-003U9e-GF; Fri, 08 Oct 2021 16:23:40 +0000
Received: from relay10.mail.gandi.net ([217.70.178.230])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mYsdv-003Tpy-14
 for linux-mtd@lists.infradead.org; Fri, 08 Oct 2021 16:22:44 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by relay10.mail.gandi.net (Postfix) with ESMTPSA id A98D5240003;
 Fri,  8 Oct 2021 16:22:39 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>,
 <linux-mtd@lists.infradead.org>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Brown <broonie@kernel.org>,
 Xiangsheng Hou <Xiangsheng.Hou@mediatek.com>,
 Boris Brezillon <bbrezillon@kernel.org>, devicetree@vger.kernel.org,
 linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org,
 jaimeliao@mxic.com.tw, juliensu@mxic.com.tw,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [RFC PATCH 04/10] dt-bindings: mtd: Describe Macronix NAND ECC engine
Date: Fri,  8 Oct 2021 18:22:22 +0200
Message-Id: <20211008162228.1753083-5-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20211008162228.1753083-1-miquel.raynal@bootlin.com>
References: <20211008162228.1753083-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211008_092243_231212_8436A43C 
X-CRM114-Status: GOOD (  12.60  )
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

Describe Macronix NAND ECC engine. This engine may be used as an
external engine or pipelined, both ways are shown in the examples.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 .../bindings/mtd/mxic,nand-ecc-engine.yaml    | 78 +++++++++++++++++++
 1 file changed, 78 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mtd/mxic,nand-ecc-engine.yaml

diff --git a/Documentation/devicetree/bindings/mtd/mxic,nand-ecc-engine.yaml b/Documentation/devicetree/bindings/mtd/mxic,nand-ecc-engine.yaml
new file mode 100644
index 000000000000..2f5cf1a4e826
--- /dev/null
+++ b/Documentation/devicetree/bindings/mtd/mxic,nand-ecc-engine.yaml
@@ -0,0 +1,78 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/mtd/mxic,nand-ecc-engine.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Macronix NAND ECC engine device tree bindings
+
+maintainers:
+  - Miquel Raynal <miquel.raynal@bootlin.com>
+
+properties:
+  compatible:
+    items:
+      - const: mxic,nand-ecc-engine-rev3
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+
+additionalProperties: false
+
+examples:
+  - |
+    /* External configuration */
+    spi_controller0: spi@43c30000 {
+        compatible = "mxicy,mx25f0a-spi";
+       	reg = <0x43c30000 0x10000>, <0xa0000000 0x4000000>;
+       	reg-names = "regs", "dirmap";
+       	clocks = <&clkwizard 0>, <&clkwizard 1>, <&clkc 15>;
+       	clock-names = "send_clk", "send_dly_clk", "ps_clk";
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        flash@0 {
+            compatible = "spi-nand";
+            reg = <0>;
+            nand-ecc-engine = <&ecc_engine0>;
+        };
+    };
+
+    ecc_engine0: ecc@43c40000 {
+        compatible = "mxic,nand-ecc-engine-rev3";
+        reg = <0x43c40000 0x10000>;
+    };
+
+  - |
+    /* Pipelined configuration */
+    spi_controller1: spi@43c30000 {
+        compatible = "mxicy,mx25f0a-spi";
+       	reg = <0x43c30000 0x10000>, <0xa0000000 0x4000000>;
+       	reg-names = "regs", "dirmap";
+       	clocks = <&clkwizard 0>, <&clkwizard 1>, <&clkc 15>;
+       	clock-names = "send_clk", "send_dly_clk", "ps_clk";
+        #address-cells = <1>;
+        #size-cells = <0>;
+        nand-ecc-engine = <&ecc_engine1>;
+
+        flash@0 {
+            compatible = "spi-nand";
+            reg = <0>;
+            nand-ecc-engine = <&spi_controller1>;
+        };
+    };
+
+    ecc_engine1: ecc@43c40000 {
+        compatible = "mxic,nand-ecc-engine-rev3";
+        reg = <0x43c40000 0x10000>;
+    };
-- 
2.27.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
