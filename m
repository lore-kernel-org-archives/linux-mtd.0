Return-Path: <SRS0=UlXy=KX=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1AA94C4708C
	for <linux-mtd@archiver.kernel.org>; Fri, 28 May 2021 10:14:33 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CC7CE61248
	for <linux-mtd@archiver.kernel.org>; Fri, 28 May 2021 10:14:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CC7CE61248
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GWF/GVAJNcm8+QPF/eVwegfPcrQTouGEgn7+fQEBpFM=; b=DBcx8f67c/3PRM
	rqxBu6QzNnwbRQoznp1ICet7q/Qwl97lK2ynd2YCFMAkqz6UCMVaFRMXuzpiro/WnqZQogU6VhzTH
	2TNg575YSlnzEEfXj6NbTwvsnz5kfNAqPRJFXQ3xXhvwY4OoWtiTzqMk6qWGo7a7/M3vQk/UnAsJR
	EVa6HW4Fgq7w+1JvZev1OMC0PEfHm0+PpZuxktzTtn4t3TuUG8e9Ue05VruzfaEA3Nfz/komouIMx
	HUUiMhgON3N/oo5NdMszC9CB0pUDRGAbbdDWIrBqtyTlJxx6tGfe7C47lTwvsaIF2lYjt2neT6ezo
	9He8kd152/6duvBjYvOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lmZV2-00EHY4-7K; Fri, 28 May 2021 10:13:52 +0000
Received: from relay8-d.mail.gandi.net ([217.70.183.201])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lmZJh-00ECbd-BR
 for linux-mtd@lists.infradead.org; Fri, 28 May 2021 10:02:11 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by relay8-d.mail.gandi.net (Postfix) with ESMTPSA id BF0931BF213;
 Fri, 28 May 2021 10:02:06 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>,
 <linux-mtd@lists.infradead.org>
Cc: Michal Simek <monstr@monstr.eu>,
 Naga Sureshkumar Relli <nagasure@xilinx.com>,
 Amit Kumar Mahapatra <akumarma@xilinx.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, helmut.grohne@intenta.de,
 Srinivas Goud <sgoud@xilinx.com>,
 Siva Durga Prasad Paladugu <sivadur@xilinx.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [PATCH v21 09/18] dt-binding: memory: pl353-smc: Convert to yaml
Date: Fri, 28 May 2021 12:01:42 +0200
Message-Id: <20210528100151.286662-10-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210528100151.286662-1-miquel.raynal@bootlin.com>
References: <20210528100151.286662-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210528_030209_721152_7643490B 
X-CRM114-Status: GOOD (  17.11  )
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

Convert this binding file to yaml schema.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 .../memory-controllers/arm,pl353-smc.yaml     | 133 ++++++++++++++++++
 .../bindings/memory-controllers/pl353-smc.txt |  45 ------
 2 files changed, 133 insertions(+), 45 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/memory-controllers/arm,pl353-smc.yaml
 delete mode 100644 Documentation/devicetree/bindings/memory-controllers/pl353-smc.txt

diff --git a/Documentation/devicetree/bindings/memory-controllers/arm,pl353-smc.yaml b/Documentation/devicetree/bindings/memory-controllers/arm,pl353-smc.yaml
new file mode 100644
index 000000000000..1de6f87d4986
--- /dev/null
+++ b/Documentation/devicetree/bindings/memory-controllers/arm,pl353-smc.yaml
@@ -0,0 +1,133 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/memory-controllers/arm,pl353-smc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: ARM PL353 Static Memory Controller (SMC) device-tree bindings
+
+maintainers:
+  - Miquel Raynal <miquel.raynal@bootlin.com>
+  - Naga Sureshkumar Relli <naga.sureshkumar.relli@xilinx.com>
+
+description:
+  The PL353 Static Memory Controller is a bus where you can connect two kinds
+  of memory interfaces, which are NAND and memory mapped interfaces (such as
+  SRAM or NOR).
+
+# We need a select here so we don't match all nodes with 'arm,primecell'
+select:
+  properties:
+    compatible:
+      contains:
+        enum:
+          - arm,pl353-smc-r2p1
+  required:
+    - compatible
+
+properties:
+  $nodename:
+    pattern: "^memory-controller@[0-9a-f]+$"
+
+  compatible:
+    oneOf:
+      - items:
+          - enum:
+              - arm,pl353-smc-r2p1
+          - enum:
+              - arm,primecell
+
+  "#address-cells":
+    const: 2
+
+  "#size-cells":
+    const: 1
+
+  reg:
+    items:
+      - description: configuration registers for the host and sub-controllers
+
+  clocks:
+    items:
+      - description: the clock for the memory device bus
+      - description: the main clock of the controller
+
+  clock-names:
+    items:
+      - const: memclk
+      - const: apb_pclk
+
+  ranges:
+    minItems: 1
+    maxItems: 3
+    description: |
+      Memory bus areas for interacting with the devices. Reflects
+      the memory layout with four integer values following:
+      <cs-number> 0 <offset> <size>
+    items:
+      - description: NAND bank 0
+      - description: NOR/SRAM bank 0
+      - description: NOR/SRAM bank 1
+
+  interrupts: true
+
+patternProperties:
+  ".*@[0-9]+,[0-9]+$":
+    type: object
+    description: |
+      The child device node represents the controller connected to the SMC
+      bus. The controller can be a NAND controller or a pair of any memory
+      mapped controllers such as NOR and SRAM controllers.
+
+    properties:
+      compatible:
+        description:
+          Compatible of memory controller.
+
+      reg:
+        items:
+          - items:
+              - description: |
+                  Chip-select ID, as in the parent range property.
+                minimum: 0
+                maximum: 2
+              - description: |
+                  Offset of the memory region requested by the device.
+              - description: |
+                  Length of the memory region requested by the device.
+
+    required:
+      - compatible
+      - reg
+
+required:
+  - compatible
+  - reg
+  - clock-names
+  - clocks
+  - "#address-cells"
+  - "#size-cells"
+  - ranges
+
+additionalProperties: false
+
+examples:
+  - |
+    smcc: memory-controller@e000e000 {
+      compatible = "arm,pl353-smc-r2p1", "arm,primecell";
+      reg = <0xe000e000 0x0001000>;
+      clock-names = "memclk", "apb_pclk";
+      clocks = <&clkc 11>, <&clkc 44>;
+      ranges = <0x0 0x0 0xe1000000 0x1000000 /* Nand CS region */
+                0x1 0x0 0xe2000000 0x2000000 /* SRAM/NOR CS0 region */
+                0x2 0x0 0xe4000000 0x2000000>; /* SRAM/NOR CS1 region */
+      #address-cells = <2>;
+      #size-cells = <1>;
+
+      nfc0: nand-controller@0,0 {
+        compatible = "arm,pl353-nand-r2p1";
+        reg = <0 0 0x1000000>;
+        #address-cells = <1>;
+        #size-cells = <0>;
+      };
+    };
diff --git a/Documentation/devicetree/bindings/memory-controllers/pl353-smc.txt b/Documentation/devicetree/bindings/memory-controllers/pl353-smc.txt
deleted file mode 100644
index ba6a5426f62b..000000000000
--- a/Documentation/devicetree/bindings/memory-controllers/pl353-smc.txt
+++ /dev/null
@@ -1,45 +0,0 @@
-Device tree bindings for ARM PL353 static memory controller
-
-PL353 Static Memory Controller is a bus where you can connect two kinds
-of memory interfaces: NAND and memory mapped interfaces (such as SRAM or NOR).
-
-Required properties:
-- compatible		: Should be "arm,pl353-smc-r2p1", "arm,primecell".
-- reg			: SMC controller and sub-controllers configuration
-			  registers.
-- clock-names		: List of input clock names - "memclk", "apb_pclk"
-			  (See clock bindings for details).
-- clocks		: Clock phandles (see clock bindings for details).
-- address-cells		: Must be 2.
-- size-cells		: Must be 1.
-- ranges		: Memory bus areas for interacting with the devices.
-			  Encodes CS to memory region association.
-
-The child device node represents the controller connected to the SMC
-bus. Only one between: NAND controller, NOR controller and SRAM controller
-is allowed in a single system.
-
-Required device node properties:
-
-- reg:			Contains the chip-select id, the offset and the length
-			of the memory region requested by the device.
-
-Example:
-	smcc: memory-controller@e000e000 {
-		compatible = "arm,pl353-smc-r2p1", "arm,primecell";
-		clock-names = "memclk", "apb_pclk";
-		clocks = <&clkc 11>, <&clkc 44>;
-		reg = <0xe000e000 0x1000>;
-		#address-cells = <2>;
-		#size-cells = <1>;
-		ranges = <0x0 0x0 0xe1000000 0x1000000 /* Nand CS region */
-			  0x1 0x0 0xe2000000 0x2000000 /* SRAM/NOR CS0 region */
-			  0x2 0x0 0xe4000000 0x2000000>; /* SRAM/NOR CS1 region */
-
-		nfc0: nand-controller@0,0 {
-			compatible = "arm,pl353-nand-r2p1";
-			reg = <0 0 0x1000000>;
-			#address-cells = <1>;
-			#size-cells = <0>;
-		};
-	};
-- 
2.27.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
