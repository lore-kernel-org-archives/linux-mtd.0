Return-Path: <SRS0=rTSM=7C=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58EA4C433E3
	for <linux-mtd@archiver.kernel.org>; Wed, 20 May 2020 12:41:06 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2DDF3207C4
	for <linux-mtd@archiver.kernel.org>; Wed, 20 May 2020 12:41:06 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="pb9V7acU"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2DDF3207C4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=IpT7BmU5reKtWzYCy0+po+eu5csP8XgMP62g2hP7T3Q=; b=pb9
	V7acUUYWVzW0lvjCIMhAXPWVN8FXcqnWhRJDHPv0ufn6p1D7LcGlI3BCPN8kOY0llcKiTtiq6yCFr
	k+W4NcwQB8N5/7yItDUwiyawqI/3x5TsZY2NICuYWZ8ktYMH5uW6L8i+cM5k007kENWEBAgT4qfsA
	ZPUxdJRUXZcGy4cMBGAt2OVqhVy5t3sT9yL+PDfe0YEUIkbLpB//pNlIl2sUqXukHBUqpT6mjIwR9
	sa6mHQa6WrKEpE/JEC4GLvBfDaaZwL02am5SWzzwHhQm0z0M24eLTNoC2ZsQlo11vBfAfPizQz18m
	8LPoYxePHRkXEZ1+G96SkElFPAHm1wg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jbO14-0007Ci-Ka; Wed, 20 May 2020 12:40:10 +0000
Received: from mga02.intel.com ([134.134.136.20])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jbNyT-0004v0-CY
 for linux-mtd@lists.infradead.org; Wed, 20 May 2020 12:37:32 +0000
IronPort-SDR: gX4k/UneV1l4ynq1ysGc0fHvjl18mYfrLz8sUVPfQYFO1YY5o7P0ifKDcRtIENxueyvZLAkYRC
 wvmPToHHrShA==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 May 2020 05:37:27 -0700
IronPort-SDR: D5/HcTSd977KFLxOHQe/HElu2vRfxizSz4HNHvwrYSkd5NtICZkOT9hg2FOQPuV68APxcZxgcg
 vwHJhpKNr74g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,414,1583222400"; d="scan'208";a="412004419"
Received: from sgsxdev004.isng.intel.com (HELO localhost) ([10.226.88.13])
 by orsmga004.jf.intel.com with ESMTP; 20 May 2020 05:37:25 -0700
From: "Ramuthevar,
 Vadivel MuruganX" <vadivel.muruganx.ramuthevar@linux.intel.com>
To: robh@kernel.org
Subject: [PATCH v2 1/1] dt-bindings: spi: Add schema for Cadence QSPI
 Controller driver
Date: Wed, 20 May 2020 20:36:12 +0800
Message-Id: <20200520123612.11797-1-vadivel.muruganx.ramuthevar@linux.intel.com>
X-Mailer: git-send-email 2.11.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200520_053729_490181_5270CD62 
X-CRM114-Status: GOOD (  16.24  )
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
 linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org,
 Ramuthevar Vadivel Murugan <vadivel.muruganx.ramuthevar@linux.intel.com>,
 broonie@kernel.org, linux-mtd@lists.infradead.org, qi-ming.wu@intel.com
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

From: Ramuthevar Vadivel Murugan <vadivel.muruganx.ramuthevar@linux.intel.com>

Add dt-bindings documentation for Cadence-QSPI controller to support
spi based flash memories.

Signed-off-by: Ramuthevar Vadivel Murugan <vadivel.muruganx.ramuthevar@linux.intel.com>
---
 .../devicetree/bindings/mtd/cadence-quadspi.txt    |  67 -----------
 .../devicetree/bindings/spi/cdns,qspi-nor.yaml     | 133 +++++++++++++++++++++
 2 files changed, 133 insertions(+), 67 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/mtd/cadence-quadspi.txt
 create mode 100644 Documentation/devicetree/bindings/spi/cdns,qspi-nor.yaml

diff --git a/Documentation/devicetree/bindings/mtd/cadence-quadspi.txt b/Documentation/devicetree/bindings/mtd/cadence-quadspi.txt
deleted file mode 100644
index 945be7d5b236..000000000000
--- a/Documentation/devicetree/bindings/mtd/cadence-quadspi.txt
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
index 000000000000..1c15acc184b3
--- /dev/null
+++ b/Documentation/devicetree/bindings/spi/cdns,qspi-nor.yaml
@@ -0,0 +1,133 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: "http://devicetree.org/schemas/spi/cdns,qspi-nor.yaml#"
+$schema: "http://devicetree.org/meta-schemas/core.yaml#"
+
+title: Cadence QSPI Flash Controller support
+
+maintainers:
+  - Ramuthevar Vadivel Murugan <vadivel.muruganx.ramuthevar@linux.intel.com>
+
+allOf:
+  - $ref: "spi-controller.yaml#"
+
+description: |
+  Binding Documentation for Cadence QSPI controller,This controller is
+  present in the Intel LGM, Altera SoCFPGA and TI SoCs and this driver
+  has been tested On Intel's LGM SoC.
+
+properties:
+  compatible:
+     enum:
+       - cdns,qspi-nor
+       - ti,k2g-qspi
+       - ti,am654-ospi
+       - intel,lgm-qspi
+
+  reg:
+    items:
+      - description:
+          The first entry is the address and length of
+          the controller register set.
+      - description:
+          The second entry is the address and length of
+          the QSPI Controller data area.
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+  cdns,fifo-depth:
+    description:
+     Depth of hardware FIFO in words.
+    allOf:
+      - $ref: "/schemas/types.yaml#/definitions/uint32"
+      - enum: [ 128, 256 ]
+      - default: 128
+
+  cdns,fifo-width:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    multipleOf: 4
+    description:
+      4 byte bus width of the data FIFO in bytes.
+
+  cdns,trigger-address:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description:
+      32-bit indirect AHB trigger address.
+
+  cdns,rclk-en:
+    type: boolean
+    description: |
+      Flag to indicate that QSPI return clock is used to latch the read data
+      rather than the QSPI clock. Make sure that QSPI return clock is populated
+      on the board before using this property.
+
+# subnode's properties
+patternProperties:
+  "@[0-9a-f]+$":
+    type: object
+    description:
+      flash device uses the subnodes below defined properties.
+
+  cdns,read-delay:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description:
+      Delay for read capture logic, in clock cycles.
+
+  cdns,tshsl-ns:
+    description: |
+      Delay in nanoseconds for the length that the master mode chip select
+      outputs are de-asserted between transactions.
+
+  cdns,tsd2d-ns:
+    description: |
+      Delay in nanoseconds between one chip select being de-activated
+      and the activation of another.
+
+  cdns,tchsh-ns:
+    description: |
+      Delay in nanoseconds between last bit of current transaction and
+      deasserting the device chip select (qspi_n_ss_out).
+
+  cdns,tslch-ns:
+    description: |
+      Delay in nanoseconds between setting qspi_n_ss_out low and
+      first bit transfer.
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - clocks
+  - cdns,fifo-depth
+  - cdns,fifo-width
+  - cdns,trigger-address
+
+examples:
+  - |
+    spi@ff705000 {
+          compatible = "cdns,qspi-nor";
+          #address-cells = <1>;
+          #size-cells = <0>;
+          reg = <0xff705000 0x1000>,
+                <0xffa00000 0x1000>;
+          interrupts = <0 151 4>;
+          clocks = <&qspi_clk>;
+          cdns,fifo-depth = <128>;
+          cdns,fifo-width = <4>;
+          cdns,trigger-address = <0x00000000>;
+
+          flash@0 {
+              compatible = "jedec,spi-nor";
+              reg = <0x0>;
+              cdns,read-delay = <4>;
+              cdns,tshsl-ns = <50>;
+              cdns,tsd2d-ns = <50>;
+              cdns,tchsh-ns = <4>;
+              cdns,tslch-ns = <4>;
+          };
+    };
+
-- 
2.11.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
