Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF54FC433EF
	for <linux-mtd@archiver.kernel.org>; Tue,  7 Dec 2021 09:36:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HT3cs8JAIvxeAQmOS9VIpebw3Y/3w0ji0uk9xSCqh2w=; b=TeWHnMMZMZoTJV
	AaIfVu9h2+IKKXtrVbu0Rks2q8r+6Y/9N45hZWVnZJkvr56CzGVCCiTeX7bJaDpCbGoFvEKRYIWaI
	hLUe/wg4TyQ3cC24bjbEzGKxF74MWV9lIBDwYWjV9bD0Zm4Fjne3Nt5jh0/WCnzlqJyh8QDuBdmwK
	Dt/N9KnHieyNXxwAxHHfgPvaJviQH5u78FzQBAU0Ot1RYuwAjUL/nwc6bdcf6HVPKL4krG+ygJf5H
	9Aj3NM2tBqKgx1J9VsYERjyXnzzE8ITx5Y3ivNw5/fKL++Vx6Nn05uLhCmi/CgPHQS5rKl4nbXVm6
	aAxqh4StvXiM3wBzRRtw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1muWt7-007pQT-BL; Tue, 07 Dec 2021 09:35:53 +0000
Received: from relay3-d.mail.gandi.net ([217.70.183.195])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1muWro-007ooy-2A
 for linux-mtd@lists.infradead.org; Tue, 07 Dec 2021 09:34:41 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by relay3-d.mail.gandi.net (Postfix) with ESMTPSA id 5C32860009;
 Tue,  7 Dec 2021 09:34:29 +0000 (UTC)
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
Subject: [PATCH v3 04/22] dt-bindings: mtd: nand-chip: Create a NAND chip
 description
Date: Tue,  7 Dec 2021 10:34:04 +0100
Message-Id: <20211207093422.166934-5-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20211207093422.166934-1-miquel.raynal@bootlin.com>
References: <20211207093422.166934-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211207_013432_408487_F874A6C1 
X-CRM114-Status: GOOD (  20.39  )
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

Move the NAND chip description out of the NAND controller file. Indeed,
a subsequent part of the properties supported by a raw NAND chip are
also supported by SPI-NAND chips. So let's create a generic NAND chip
description which will be pulled by nand-controller.yaml and later by
spi-nand.yaml as well.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
Reviewed-by: Rob Herring <robh@kernel.org>
---
 .../devicetree/bindings/mtd/nand-chip.yaml    | 70 +++++++++++++++++++
 .../bindings/mtd/nand-controller.yaml         | 50 +------------
 2 files changed, 72 insertions(+), 48 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/mtd/nand-chip.yaml

diff --git a/Documentation/devicetree/bindings/mtd/nand-chip.yaml b/Documentation/devicetree/bindings/mtd/nand-chip.yaml
new file mode 100644
index 000000000000..2e91cf471f81
--- /dev/null
+++ b/Documentation/devicetree/bindings/mtd/nand-chip.yaml
@@ -0,0 +1,70 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/mtd/nand-chip.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: NAND Chip and NAND Controller Generic Binding
+
+maintainers:
+  - Miquel Raynal <miquel.raynal@bootlin.com>
+
+description: |
+  This file covers the generic description of a NAND chip. It implies that the
+  bus interface should not be taken into account: both raw NAND devices and
+  SPI-NAND devices are concerned by this description.
+
+properties:
+  reg:
+    description:
+      Contains the chip-select IDs.
+
+  nand-ecc-engine:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description: |
+      A phandle on the hardware ECC engine if any. There are
+      basically three possibilities:
+      1/ The ECC engine is part of the NAND controller, in this
+      case the phandle should reference the parent node.
+      2/ The ECC engine is part of the NAND part (on-die), in this
+      case the phandle should reference the node itself.
+      3/ The ECC engine is external, in this case the phandle should
+      reference the specific ECC engine node.
+
+  nand-use-soft-ecc-engine:
+    type: boolean
+    description: Use a software ECC engine.
+
+  nand-no-ecc-engine:
+    type: boolean
+    description: Do not use any ECC correction.
+
+  nand-ecc-algo:
+    $ref: /schemas/types.yaml#/definitions/string
+    description:
+      Desired ECC algorithm.
+    enum: [hamming, bch, rs]
+
+  nand-ecc-strength:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description:
+      Maximum number of bits that can be corrected per ECC step.
+    minimum: 1
+
+  nand-ecc-step-size:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description:
+      Number of data bytes covered by a single ECC step.
+    minimum: 1
+
+  secure-regions:
+    $ref: /schemas/types.yaml#/definitions/uint64-matrix
+    description:
+      Regions in the NAND chip which are protected using a secure element
+      like Trustzone. This property contains the start address and size of
+      the secure regions present.
+
+required:
+  - reg
+
+additionalProperties: true
diff --git a/Documentation/devicetree/bindings/mtd/nand-controller.yaml b/Documentation/devicetree/bindings/mtd/nand-controller.yaml
index 7024ca24c2e2..05229d2dbb07 100644
--- a/Documentation/devicetree/bindings/mtd/nand-controller.yaml
+++ b/Documentation/devicetree/bindings/mtd/nand-controller.yaml
@@ -52,31 +52,13 @@ properties:
 patternProperties:
   "^nand@[a-f0-9]$":
     type: object
+    $ref: "nand-chip.yaml#"
+
     properties:
       reg:
         description:
           Contains the chip-select IDs.
 
-      nand-ecc-engine:
-        $ref: /schemas/types.yaml#/definitions/phandle
-        description: |
-          A phandle on the hardware ECC engine if any. There are
-          basically three possibilities:
-          1/ The ECC engine is part of the NAND controller, in this
-          case the phandle should reference the parent node.
-          2/ The ECC engine is part of the NAND part (on-die), in this
-          case the phandle should reference the node itself.
-          3/ The ECC engine is external, in this case the phandle should
-          reference the specific ECC engine node.
-
-      nand-use-soft-ecc-engine:
-        type: boolean
-        description: Use a software ECC engine.
-
-      nand-no-ecc-engine:
-        type: boolean
-        description: Do not use any ECC correction.
-
       nand-ecc-placement:
         $ref: /schemas/types.yaml#/definitions/string
         description:
@@ -86,12 +68,6 @@ patternProperties:
           bytes will be interleaved with regular data in the main area.
         enum: [ oob, interleaved ]
 
-      nand-ecc-algo:
-        $ref: /schemas/types.yaml#/definitions/string
-        description:
-          Desired ECC algorithm.
-        enum: [hamming, bch, rs]
-
       nand-bus-width:
         $ref: /schemas/types.yaml#/definitions/uint32
         description:
@@ -110,18 +86,6 @@ patternProperties:
           find Bad Block Markers (BBM). These markers will help to
           build a volatile BBT in RAM.
 
-      nand-ecc-strength:
-        $ref: /schemas/types.yaml#/definitions/uint32
-        description:
-          Maximum number of bits that can be corrected per ECC step.
-        minimum: 1
-
-      nand-ecc-step-size:
-        $ref: /schemas/types.yaml#/definitions/uint32
-        description:
-          Number of data bytes covered by a single ECC step.
-        minimum: 1
-
       nand-ecc-maximize:
         $ref: /schemas/types.yaml#/definitions/flag
         description:
@@ -152,13 +116,6 @@ patternProperties:
           Ready/Busy pins. Active state refers to the NAND ready state and
           should be set to GPIOD_ACTIVE_HIGH unless the signal is inverted.
 
-      secure-regions:
-        $ref: /schemas/types.yaml#/definitions/uint64-matrix
-        description:
-          Regions in the NAND chip which are protected using a secure element
-          like Trustzone. This property contains the start address and size of
-          the secure regions present.
-
     required:
       - reg
 
@@ -179,9 +136,6 @@ examples:
 
       nand@0 {
         reg = <0>; /* Native CS */
-        nand-use-soft-ecc-engine;
-        nand-ecc-algo = "bch";
-
         /* NAND chip specific properties */
       };
 
-- 
2.27.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
