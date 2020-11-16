Return-Path: <SRS0=PjdO=EW=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D21F4C56202
	for <linux-mtd@archiver.kernel.org>; Mon, 16 Nov 2020 03:11:50 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8A135204EA
	for <linux-mtd@archiver.kernel.org>; Mon, 16 Nov 2020 03:11:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="f0bibHiW"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8A135204EA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:References:In-Reply-To:Message-Id:Date:Subject:To:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5wD6d5JYGsBIeIBvGzDk1eMyo26S+kKxeW+10SsaB/0=; b=f0bibHiW9RGsU5qG+flzWLKonp
	p/PEo9kJX68UrmH826dzxGgpTVxSCs0ZK/pemDORbccu0+NA6tDe3o4LBuYq8r6UIOTjVlMGxEq56
	SD8HQg5R0AkBOLYHHOjn0hRR0QSiLBavmVryUu393e88YSyASCFUec5nhkzqYR/HRr55ieKw6EyfV
	S9A+tHYLhfPBMrF52df6dIARXRq3wokGQpTI4GPF0CWs0GTmIkbdvNZW4FvCX8Zxu6RcYynfXbGTV
	3s0ImnwerHm5Amm+XNb002jDcQG3rnAGAbA6kkMUyyEJsMqEcdrGm5ahc0yfxuQmhWMKgq4C2O2yT
	egVBvVWg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1keUuY-00079d-C2; Mon, 16 Nov 2020 03:10:34 +0000
Received: from mga09.intel.com ([134.134.136.24])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1keUuU-00078s-Ps
 for linux-mtd@lists.infradead.org; Mon, 16 Nov 2020 03:10:32 +0000
IronPort-SDR: 4hGrbzUCpvv+G5e13SKW6aUD3M+a36RS17zLStU2wm+p+xo2twXKNtL7TH/TVCmP4osnD/5pyf
 S1JfJzZ/AOeQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9806"; a="170866040"
X-IronPort-AV: E=Sophos;i="5.77,481,1596524400"; d="scan'208";a="170866040"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Nov 2020 19:10:29 -0800
IronPort-SDR: HivUB/d/PvXCX8jn/f56hZOjwWHxwuhM5G1ftZmLadpv6KDn/M8+xFW6MI3FTsUytyZdJgmkaG
 6LHPQzTrpN2g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,481,1596524400"; d="scan'208";a="340409142"
Received: from sgsxdev004.isng.intel.com (HELO localhost) ([10.226.88.13])
 by orsmga002.jf.intel.com with ESMTP; 15 Nov 2020 19:10:27 -0800
From: "Ramuthevar,
 Vadivel MuruganX" <vadivel.muruganx.ramuthevar@linux.intel.com>
To: broonie@kernel.org, linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org
Subject: [PATCH v7 5/6] dt-bindings: spi: Convert cadence-quadspi.txt to
 cadence-quadspi.yaml
Date: Mon, 16 Nov 2020 11:10:02 +0800
Message-Id: <20201116031003.19062-6-vadivel.muruganx.ramuthevar@linux.intel.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20201116031003.19062-1-vadivel.muruganx.ramuthevar@linux.intel.com>
References: <20201116031003.19062-1-vadivel.muruganx.ramuthevar@linux.intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201115_221030_995170_DC7BD614 
X-CRM114-Status: GOOD (  25.46  )
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
Cc: cheol.yong.kim@intel.com, devicetree@vger.kernel.org, vigneshr@ti.com,
 Ramuthevar Vadivel Murugan <vadivel.muruganx.ramuthevar@linux.intel.com>,
 robh+dt@kernel.org, linux-mtd@lists.infradead.org, qi-ming.wu@intel.com,
 p.yadav@ti.com
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

From: Ramuthevar Vadivel Murugan <vadivel.muruganx.ramuthevar@linux.intel.com>

Convert the cadence-quadspi.txt documentation to cadence-quadspi.yaml
remove the cadence-quadspi.txt from Documentation/devicetree/bindings/spi/

Signed-off-by: Ramuthevar Vadivel Murugan <vadivel.muruganx.ramuthevar@linux.intel.com>
---
 .../devicetree/bindings/spi/cadence-quadspi.txt    |  67 ----------
 .../devicetree/bindings/spi/cdns,qspi-nor.yaml     | 147 +++++++++++++++++++++
 2 files changed, 147 insertions(+), 67 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/spi/cadence-quadspi.txt
 create mode 100644 Documentation/devicetree/bindings/spi/cdns,qspi-nor.yaml

diff --git a/Documentation/devicetree/bindings/spi/cadence-quadspi.txt b/Documentation/devicetree/bindings/spi/cadence-quadspi.txt
deleted file mode 100644
index 945be7d5b236..000000000000
--- a/Documentation/devicetree/bindings/spi/cadence-quadspi.txt
+++ /dev/null
@@ -1,67 +0,0 @@
-* Cadence Quad SPI controller
-
-Required properties:
-- compatible : should be one of the following:
-	Generic default - "cdns,qspi-nor".
-	For TI 66AK2G SoC - "ti,k2g-qspi", "cdns,qspi-nor".
-	For TI AM654 SoC  - "ti,am654-ospi", "cdns,qspi-nor".
-- reg : Contains two entries, each of which is a tuple consisting of a
-	physical address and length. The first entry is the address and
-	length of the controller register set. The second entry is the
-	address and length of the QSPI Controller data area.
-- interrupts : Unit interrupt specifier for the controller interrupt.
-- clocks : phandle to the Quad SPI clock.
-- cdns,fifo-depth : Size of the data FIFO in words.
-- cdns,fifo-width : Bus width of the data FIFO in bytes.
-- cdns,trigger-address : 32-bit indirect AHB trigger address.
-
-Optional properties:
-- cdns,is-decoded-cs : Flag to indicate whether decoder is used or not.
-- cdns,rclk-en : Flag to indicate that QSPI return clock is used to latch
-  the read data rather than the QSPI clock. Make sure that QSPI return
-  clock is populated on the board before using this property.
-
-Optional subnodes:
-Subnodes of the Cadence Quad SPI controller are spi slave nodes with additional
-custom properties:
-- cdns,read-delay : Delay for read capture logic, in clock cycles
-- cdns,tshsl-ns : Delay in nanoseconds for the length that the master
-                  mode chip select outputs are de-asserted between
-		  transactions.
-- cdns,tsd2d-ns : Delay in nanoseconds between one chip select being
-                  de-activated and the activation of another.
-- cdns,tchsh-ns : Delay in nanoseconds between last bit of current
-                  transaction and deasserting the device chip select
-		  (qspi_n_ss_out).
-- cdns,tslch-ns : Delay in nanoseconds between setting qspi_n_ss_out low
-                  and first bit transfer.
-- resets	: Must contain an entry for each entry in reset-names.
-		  See ../reset/reset.txt for details.
-- reset-names	: Must include either "qspi" and/or "qspi-ocp".
-
-Example:
-
-	qspi: spi@ff705000 {
-		compatible = "cdns,qspi-nor";
-		#address-cells = <1>;
-		#size-cells = <0>;
-		reg = <0xff705000 0x1000>,
-		      <0xffa00000 0x1000>;
-		interrupts = <0 151 4>;
-		clocks = <&qspi_clk>;
-		cdns,is-decoded-cs;
-		cdns,fifo-depth = <128>;
-		cdns,fifo-width = <4>;
-		cdns,trigger-address = <0x00000000>;
-		resets = <&rst QSPI_RESET>, <&rst QSPI_OCP_RESET>;
-		reset-names = "qspi", "qspi-ocp";
-
-		flash0: n25q00@0 {
-			...
-			cdns,read-delay = <4>;
-			cdns,tshsl-ns = <50>;
-			cdns,tsd2d-ns = <50>;
-			cdns,tchsh-ns = <4>;
-			cdns,tslch-ns = <4>;
-		};
-	};
diff --git a/Documentation/devicetree/bindings/spi/cdns,qspi-nor.yaml b/Documentation/devicetree/bindings/spi/cdns,qspi-nor.yaml
new file mode 100644
index 000000000000..5fc54182ed74
--- /dev/null
+++ b/Documentation/devicetree/bindings/spi/cdns,qspi-nor.yaml
@@ -0,0 +1,147 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/spi/cdns,qspi-nor.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Cadence Quad SPI controller
+
+maintainers:
+  - Vadivel Murugan <vadivel.muruganx.ramuthevar@intel.com>
+
+allOf:
+  - $ref: spi-controller.yaml#
+
+properties:
+  compatible:
+    items:
+      - enum:
+          - cdns,qspi-nor
+          - ti,k2g-qspi
+          - ti,am654-ospi
+
+  reg:
+    items:
+      - description: the controller register set
+      - description: the controller data area
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+  cdns,fifo-depth:
+    description:
+      Size of the data FIFO in words.
+    $ref: "/schemas/types.yaml#/definitions/uint32"
+    enum: [ 128, 256 ]
+    default: 128
+
+  cdns,fifo-width:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description:
+      Bus width of the data FIFO in bytes.
+    default: 4
+
+  cdns,trigger-address:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description:
+      32-bit indirect AHB trigger address.
+
+  cdns,is-decoded-cs:
+    type: boolean
+    description:
+      Flag to indicate whether decoder is used to select different chip select
+      for different memory regions.
+
+  cdns,rclk-en:
+    type: boolean
+    description:
+      Flag to indicate that QSPI return clock is used to latch the read
+      data rather than the QSPI clock. Make sure that QSPI return clock
+      is populated on the board before using this property.
+
+  resets:
+    maxItems: 2
+
+  reset-names:
+    minItems: 1
+    maxItems: 2
+    items:
+      enum: [ qspi, qspi-ocp ]
+
+# subnode's properties
+patternProperties:
+  "@[0-9a-f]+$":
+    type: object
+    description:
+      flash device uses the subnodes below defined properties.
+    properties:
+      cdns,read-delay:
+        $ref: /schemas/types.yaml#/definitions/uint32
+        description:
+          Delay for read capture logic, in clock cycles.
+
+      cdns,tshsl-ns:
+        description:
+          Delay in nanoseconds for the length that the master mode chip select
+          outputs are de-asserted between transactions.
+
+      cdns,tsd2d-ns:
+        description:
+          Delay in nanoseconds between one chip select being de-activated
+          and the activation of another.
+
+      cdns,tchsh-ns:
+        description:
+          Delay in nanoseconds between last bit of current transaction and
+          deasserting the device chip select (qspi_n_ss_out).
+
+      cdns,tslch-ns:
+        description:
+          Delay in nanoseconds between setting qspi_n_ss_out low and
+          first bit transfer.
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - clocks
+  - cdns,fifo-depth
+  - cdns,fifo-width
+  - cdns,trigger-address
+  - resets
+  - reset-names
+  - '#address-cells'
+  - '#size-cells'
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    qspi: spi@ff705000 {
+      compatible = "cdns,qspi-nor";
+      #address-cells = <1>;
+      #size-cells = <0>;
+      reg = <0xff705000 0x1000>,
+            <0xffa00000 0x1000>;
+      interrupts = <0 151 4>;
+      clocks = <&qspi_clk>;
+      cdns,fifo-depth = <128>;
+      cdns,fifo-width = <4>;
+      cdns,trigger-address = <0x00000000>;
+      resets = <&rst 0x1>, <&rst 0x2>;
+      reset-names = "qspi", "qspi-ocp";
+
+      flash@0 {
+              compatible = "jedec,spi-nor";
+              reg = <0x0>;
+              cdns,read-delay = <4>;
+              cdns,tshsl-ns = <50>;
+              cdns,tsd2d-ns = <50>;
+              cdns,tchsh-ns = <4>;
+              cdns,tslch-ns = <4>;
+     };
+
+    };
-- 
2.11.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
