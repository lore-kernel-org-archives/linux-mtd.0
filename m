Return-Path: <SRS0=tHFz=4P=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 848DDC4BA24
	for <linux-mtd@archiver.kernel.org>; Thu, 27 Feb 2020 06:27:50 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5B28D2467D
	for <linux-mtd@archiver.kernel.org>; Thu, 27 Feb 2020 06:27:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="eduzWLTy"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5B28D2467D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=HDhStOcNEr+NL7J2g+aHI+7kW5yAxRoKV8W1mZZGMos=; b=eduzWLTyupb3LWbwTkeGZwPWjj
	f5QolX9hzgS9ZhmtXNk7mwnAJh+kFODOXhT8aJtUCsMKnMIF8dO20bJZN8AAK1UMHZ2JcjhKWiGmA
	Ng6dlXiyZ+Te8ZrIHg3VXxEH4toQu5o4NgyOr99R+dX8oR04vuwIg+T5L8DMzgf9UTiYKkvvFA2h6
	GAsBfQQvIJUeVxf16grnJ1Q7szDi2aMzYRH+Jl85hnuZcu+VS9+hOmDAl8aaxQ+9KxzSdEwOgCOou
	2mk/0OXXa3vDiTJD7bl+/IsiYkXKubtb9LPonZS0SVMNYCrfpsdIjPIbbL/U/Z4oW6XmKNC35C/MS
	Z1K3sTvw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j7Cdy-0005m9-LR; Thu, 27 Feb 2020 06:27:34 +0000
Received: from mga14.intel.com ([192.55.52.115])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j7Cds-0005ey-Ce
 for linux-mtd@lists.infradead.org; Thu, 27 Feb 2020 06:27:30 +0000
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 26 Feb 2020 22:27:27 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,490,1574150400"; d="scan'208";a="227014140"
Received: from sgsxdev004.isng.intel.com (HELO localhost) ([10.226.88.13])
 by orsmga007.jf.intel.com with ESMTP; 26 Feb 2020 22:27:21 -0800
From: "Ramuthevar,
 Vadivel MuruganX" <vadivel.muruganx.ramuthevar@linux.intel.com>
To: linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org,
 broonie@kernel.org, vigneshr@ti.com, robh+dt@kernel.org
Subject: [PATCH v11 1/2] dt-bindings: spi: Add schema for Cadence QSPI
 Controller driver
Date: Thu, 27 Feb 2020 14:27:07 +0800
Message-Id: <20200227062708.21544-2-vadivel.muruganx.ramuthevar@linux.intel.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20200227062708.21544-1-vadivel.muruganx.ramuthevar@linux.intel.com>
References: <20200227062708.21544-1-vadivel.muruganx.ramuthevar@linux.intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200226_222728_468068_E8D08634 
X-CRM114-Status: GOOD (  18.22  )
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
Cc: marex@denx.de, devicetree@vger.kernel.org, tien.fong.chee@intel.com,
 tudor.ambarus@gmail.com,
 Ramuthevar Vadivel Murugan <vadivel.muruganx.ramuthevar@linux.intel.com>,
 boris.brezillon@free-electrons.com, richard@nod.at, qi-ming.wu@intel.com,
 simon.k.r.goldschmidt@gmail.com, david.oberhollenzer@sigma-star.at,
 dinguyen@kernel.org, linux-mtd@lists.infradead.org, miquel.raynal@bootlin.com,
 cheol.yong.kim@intel.com, mark.rutland@arm.com, computersforpeace@gmail.com,
 dwmw2@infradead.org, cyrille.pitchen@atmel.com
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
 .../devicetree/bindings/mtd/cadence-quadspi.txt    |  67 ----------
 .../devicetree/bindings/spi/cdns,qspi-nor.yaml     | 142 +++++++++++++++++++++
 2 files changed, 142 insertions(+), 67 deletions(-)
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
index 000000000000..3ad2850c412e
--- /dev/null
+++ b/Documentation/devicetree/bindings/spi/cdns,qspi-nor.yaml
@@ -0,0 +1,142 @@
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
+  - compatible : should be one of the following:
+        Generic default - "cdns,qspi-nor".
+        For TI 66AK2G SoC - "ti,k2g-qspi", "cdns,qspi-nor".
+        For TI AM654 SoC  - "ti,am654-ospi", "cdns,qspi-nor".
+        For Intel LGM SoC - "intel,lgm-qspi", "cdns,qspi-nor".
+
+properties:
+  compatible:
+    oneOf:
+      - items:
+        - enum:
+           - ti,k2g-qspi
+        - const: cdns,qspi-nor
+
+      - items:
+        - enum:
+           - ti,am654-ospi
+        - const: cdns,qspi-nor
+
+      - items:
+        - enum:
+           - intel,lgm-qspi
+        - const: cdns,qspi-nor
+
+      - items:
+        - const: cdns,qspi-nor
+
+  reg:
+    maxItems: 2
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+  cdns,fifo-depth:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description:
+      128 or 256 bytes size of the data FIFO in words.
+
+  cdns,fifo-width:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description:
+      4 byte bus width of the data FIFO in bytes.
+
+  cdns,trigger-address:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description:
+      32-bit indirect AHB trigger address.
+
+  cdns,rclk-en:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: |
+      Flag to indicate that QSPI return clock is used to latch the read data
+      rather than the QSPI clock. Make sure that QSPI return clock is populated
+      on the board before using this property.
+
+# subnode's properties
+patternProperties:
+  "^.*@[0-9a-fA-F]+$":
+    type: object
+    description:
+      flash device uses the subnodes below defined properties.
+
+  cdns,read-delay:
+    description:
+      Delay in 4 microseconds, read capture logic, in clock cycles.
+
+  cdns,tshsl-ns:
+    description: |
+      Delay in 50 nanoseconds, for the length that the master mode chip select
+      outputs are de-asserted between transactions.
+
+  cdns,tsd2d-ns:
+    description: |
+      Delay in 50 nanoseconds, between one chip select being de-activated
+      and the activation of another.
+
+  cdns,tchsh-ns:
+    description: |
+      Delay in 4 nanoseconds, between last bit of current transaction and
+      deasserting the device chip select (qspi_n_ss_out).
+
+  cdns,tslch-ns:
+    description: |
+      Delay in 4 nanoseconds, between setting qspi_n_ss_out low and
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
+    qspi: spi@ff705000 {
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
+          flash0: n25q00@0 {
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
