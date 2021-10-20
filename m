Return-Path: <SRS0=lu4o=PI=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0ED4C433F5
	for <linux-mtd@archiver.kernel.org>; Wed, 20 Oct 2021 14:29:36 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 642EF60EE9
	for <linux-mtd@archiver.kernel.org>; Wed, 20 Oct 2021 14:29:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 642EF60EE9
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SR41nlChZTiDwH3W0m0KoVb/RyV8495d46+IZ0lljrk=; b=bL4Ng7Noj7SOiQ
	eZQQTqkTtU3YmC1F+VO2AjJe61DVFtoCvCZxpA2L4HaOxEnVCayEqczO8vXGRX1YT3TTnQH2nORsc
	MFBkwnJ7EjbjzPh7nAYOtyJqD+6pgTWqnwdC3Fp862d2jVZYKZg/YD1pUVoBQZSyPsloINMaG/MOa
	+TjV7v4VDHiDOglXkZ1LlJXxnp762HZ1lsSsu/7bLr3bQmznU1IcKC/lYWCqqIkBdZWfyZWsjEZ24
	IyV96QAGUh/kSLz4BAttP/14t+KEghJ15wMqW5niuKsWwBW0+1kWrWvdZAelQiXbbF5ss+7tWXGpZ
	hujJv+ElVpPWiGlpFpQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mdCaV-004kwY-62; Wed, 20 Oct 2021 14:29:03 +0000
Received: from relay7-d.mail.gandi.net ([217.70.183.200])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mdCZl-004kdy-Q6
 for linux-mtd@lists.infradead.org; Wed, 20 Oct 2021 14:28:20 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id 47FC520008;
 Wed, 20 Oct 2021 14:28:15 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>,
 Mark Brown <broonie@kernel.org>, Rob Herring <robh+dt@kernel.org>
Cc: <linux-mtd@lists.infradead.org>, <linux-spi@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 Julien Su <juliensu@mxic.com.tw>, Jaime Liao <jaimeliao@mxic.com.tw>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Xiangsheng Hou <Xiangsheng.Hou@mediatek.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [PATCH 03/18] dt-bindings: mtd: nand-chip: Create a NAND chip
 description
Date: Wed, 20 Oct 2021 16:27:54 +0200
Message-Id: <20211020142809.349347-4-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20211020142809.349347-1-miquel.raynal@bootlin.com>
References: <20211020142809.349347-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211020_072818_154464_3AAFC077 
X-CRM114-Status: GOOD (  21.10  )
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
---
 .../devicetree/bindings/mtd/nand-chip.yaml    | 71 +++++++++++++++++++
 .../bindings/mtd/nand-controller.yaml         | 53 ++------------
 2 files changed, 75 insertions(+), 49 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/mtd/nand-chip.yaml

diff --git a/Documentation/devicetree/bindings/mtd/nand-chip.yaml b/Documentation/devicetree/bindings/mtd/nand-chip.yaml
new file mode 100644
index 000000000000..1f230a3ee27d
--- /dev/null
+++ b/Documentation/devicetree/bindings/mtd/nand-chip.yaml
@@ -0,0 +1,71 @@
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
+    allOf:
+      - $ref: /schemas/types.yaml#/definitions/phandle
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
+    description:
+      Desired ECC algorithm.
+    $ref: /schemas/types.yaml#/definitions/string
+    enum: [hamming, bch, rs]
+
+  nand-ecc-strength:
+    description:
+      Maximum number of bits that can be corrected per ECC step.
+    $ref: /schemas/types.yaml#/definitions/uint32
+    minimum: 1
+
+  nand-ecc-step-size:
+    description:
+      Number of data bytes covered by a single ECC step.
+    $ref: /schemas/types.yaml#/definitions/uint32
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
+additionalProperties: false
diff --git a/Documentation/devicetree/bindings/mtd/nand-controller.yaml b/Documentation/devicetree/bindings/mtd/nand-controller.yaml
index 5cd144a9ec99..44825dc95412 100644
--- a/Documentation/devicetree/bindings/mtd/nand-controller.yaml
+++ b/Documentation/devicetree/bindings/mtd/nand-controller.yaml
@@ -52,32 +52,15 @@ properties:
 patternProperties:
   "^nand@[a-f0-9]$":
     type: object
+
+    allOf:
+      - $ref: "nand-chip.yaml#"
+
     properties:
       reg:
         description:
           Contains the chip-select IDs.
 
-      nand-ecc-engine:
-        allOf:
-          - $ref: /schemas/types.yaml#/definitions/phandle
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
         allOf:
           - $ref: /schemas/types.yaml#/definitions/string
@@ -88,12 +71,6 @@ patternProperties:
           known to be stored in the OOB area, or "interleaved" if ECC
           bytes will be interleaved with regular data in the main area.
 
-      nand-ecc-algo:
-        description:
-          Desired ECC algorithm.
-        $ref: /schemas/types.yaml#/definitions/string
-        enum: [hamming, bch, rs]
-
       nand-bus-width:
         description:
           Bus width to the NAND chip
@@ -112,18 +89,6 @@ patternProperties:
           find Bad Block Markers (BBM). These markers will help to
           build a volatile BBT in RAM.
 
-      nand-ecc-strength:
-        description:
-          Maximum number of bits that can be corrected per ECC step.
-        $ref: /schemas/types.yaml#/definitions/uint32
-        minimum: 1
-
-      nand-ecc-step-size:
-        description:
-          Number of data bytes covered by a single ECC step.
-        $ref: /schemas/types.yaml#/definitions/uint32
-        minimum: 1
-
       nand-ecc-maximize:
         $ref: /schemas/types.yaml#/definitions/flag
         description:
@@ -154,13 +119,6 @@ patternProperties:
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
 
@@ -181,9 +139,6 @@ examples:
 
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
