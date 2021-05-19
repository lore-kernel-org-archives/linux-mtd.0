Return-Path: <SRS0=R0RB=KO=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6967BC433B4
	for <linux-mtd@archiver.kernel.org>; Wed, 19 May 2021 18:36:48 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E285A61001
	for <linux-mtd@archiver.kernel.org>; Wed, 19 May 2021 18:36:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E285A61001
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=LXL6AcvwmFFZXYb7ygMIPgqrA46s3J5wXnLkPknDq6w=; b=rFnvmkFa9Zumg2S4GkIDLY8mL
	5vwKmaEYtPtjNEEFGZCKT1W7dZ2l32A3gCewS24jg11HZeFPeZ8Si+bxwQnTNkv0lqofvD+DzN22h
	xMU1qkx22MwLKZhVQIhB9P7OmkKb42MX0Dt31XBCOjfRojPWV+RvNE0xgojnLWVwF1R3K3UFn4dfc
	kNk14ZOUM15O7hHBnErZKShOver3V++sT437j8JD1IMPifeNzOOfFmOKfXpFi+MkEAzAdLxpPmXKU
	Q+Guysnh4Fn0DghOiwdOBN18vOsM2tK6Ci+jlkMqQFhfKSoqnFUbSzpBU28szHgA6S3PaQZJJFMAs
	ftn1ONHkA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1ljR2X-004mb5-2r; Wed, 19 May 2021 18:35:29 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1ljQuM-004lOT-OI
 for linux-mtd@desiato.infradead.org; Wed, 19 May 2021 18:27:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
 To:From:Sender:Reply-To:Content-ID:Content-Description;
 bh=ytvhNaVHDsoBPP30kb4G0YW0mGDow6Jey6UPA6/gu/s=; b=IKyjo+Cb4T0bEAv+mK0o0JvRHH
 PxvBliD7aSaOdje2/aHJKgcjzSZ1MMixwRJjDSYPw6Eqc5zqGuXMM7hVKFpSR1z3j2GxSD0qcROWC
 hPCkQn4eyHCjovz2mF/LhKEqdMeFDmeO2v2q5ioAAstY3g9mJbb6kZz6sgU0C6uSpJPObtyIz2Eiq
 39EWrkAwzF8wjT6IfodlT3jeddnyMYZpO7xGn6o1K0Whm4LnjSrRx/FTnhFUAa449Cxjg9fKodmMC
 xrI/D4Q5kRJCfw2GE4qdsITsHs6uc4WUMOGPlqcWqGi5oozRovzW9aLmVbA+yFtZlfJYoAzFmwZAj
 cWPEhiaQ==;
Received: from relay6-d.mail.gandi.net ([217.70.183.198])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1ljQuJ-00Fh82-Gc
 for linux-mtd@lists.infradead.org; Wed, 19 May 2021 18:27:01 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id B3E9DC0012;
 Wed, 19 May 2021 18:26:56 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Helmut Grohne <helmut.grohne@intenta.de>
Cc: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>,
 <linux-mtd@lists.infradead.org>, Rob Herring <robh+dt@kernel.org>,
 <devicetree@vger.kernel.org>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Naga Sureshkumar Relli <nagasure@xilinx.com>,
 Michal Simek <monstr@monstr.eu>,
 Amit Kumar Mahapatra <akumarma@xilinx.com>,
 Srinivas Goud <sgoud@xilinx.com>,
 Siva Durga Prasad Paladugu <sivadur@xilinx.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [PATCH v20 10/19] dt-binding: memory: pl353-smc: Convert to yaml
Date: Wed, 19 May 2021 20:26:27 +0200
Message-Id: <20210519182636.1110080-11-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210519182636.1110080-1-miquel.raynal@bootlin.com>
References: <20210519182636.1110080-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210519_112659_853720_E029B678 
X-CRM114-Status: GOOD (  19.00  )
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
 .../memory-controllers/arm,pl353-smc.yaml     | 124 ++++++++++++++++++
 .../bindings/memory-controllers/pl353-smc.txt |  46 -------
 2 files changed, 124 insertions(+), 46 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/memory-controllers/arm,pl353-smc.yaml
 delete mode 100644 Documentation/devicetree/bindings/memory-controllers/pl353-smc.txt

diff --git a/Documentation/devicetree/bindings/memory-controllers/arm,pl353-smc.yaml b/Documentation/devicetree/bindings/memory-controllers/arm,pl353-smc.yaml
new file mode 100644
index 000000000000..37cfc877c53c
--- /dev/null
+++ b/Documentation/devicetree/bindings/memory-controllers/arm,pl353-smc.yaml
@@ -0,0 +1,124 @@
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
+properties:
+  $nodename:
+    pattern: "^memory-controller@[0-9a-f]+$"
+
+  compatible:
+    oneOf:
+      - items:
+        - enum:
+          - arm,pl353-smc-r2p1
+        - enum:
+          - arm,primecell
+
+  "#address-cells":
+    const: 2
+
+  "#size-cells":
+    const: 1
+
+  reg:
+    items:
+      - description: configuration registers for the host controller
+      - description: memory bus area for interactions with the device
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
+      Reflects the memory layout with four integer values following:
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
+      reg = <0xe000e000 0x0001000>,
+            <0xe1000000 0x5000000>;
+      clock-names = "memclk", "apb_pclk";
+      clocks = <&clkc 11>, <&clkc 44>;
+      ranges = <0x0 0x0 0xe1000000 0x1000000 /* Nand CS region */
+                0x1 0x0 0xe2000000 0x2000000 /* SRAM/NOR CS0 region */
+                0x2 0x0 0xe4000000 0x2000000>; /* SRAM/NOR CS1 region */
+      #address-cells = <2>;
+      #size-cells = <1>;
+
+      nand0: nand-controller@0,0 {
+        compatible = "arm,pl353-nand-r2p1";
+        reg = <0 0 0x1000000>;
+        #address-cells = <1>;
+        #size-cells = <0>;
+      };
+    };
diff --git a/Documentation/devicetree/bindings/memory-controllers/pl353-smc.txt b/Documentation/devicetree/bindings/memory-controllers/pl353-smc.txt
deleted file mode 100644
index d388bb87365f..000000000000
--- a/Documentation/devicetree/bindings/memory-controllers/pl353-smc.txt
+++ /dev/null
@@ -1,46 +0,0 @@
-Device tree bindings for ARM PL353 static memory controller
-
-PL353 Static Memory Controller is a bus where you can connect two kinds
-of memory interfaces: NAND and memory mapped interfaces (such as SRAM or NOR).
-
-Required properties:
-- compatible		: Should be "arm,pl353-smc-r2p1", "arm,primecell".
-- reg			: Controller registers map and length.
-			  First entry is for the configuration registers,
-			  second entry covers the memory bus transfers.
-- clock-names		: List of input clock names - "memclk", "apb_pclk"
-			  (See clock bindings for details).
-- clocks		: Clock phandles (see clock bindings for details).
-- address-cells		: Must be 2.
-- size-cells		: Must be 1.
-- ranges		: Encodes CS to memory region association.
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
-		reg = <0xe000e000 0x0001000>,
-		      <0xe1000000 0x5000000>;
-		#address-cells = <2>;
-		#size-cells = <1>;
-		ranges = <0x0 0x0 0xe1000000 0x1000000 /* Nand CS region */
-			  0x1 0x0 0xe2000000 0x2000000 /* SRAM/NOR CS0 region */
-			  0x2 0x0 0xe4000000 0x2000000>; /* SRAM/NOR CS1 region */
-
-		nand0: nand-controller@0,0 {
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
