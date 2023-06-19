Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC8DBEB64DB
	for <linux-mtd@archiver.kernel.org>; Mon, 19 Jun 2023 09:29:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AQvts5JBouFJPvgREdUnECtscMLu36Kpa+IJYYEWLr0=; b=bN6gwtgu7Gefja
	x2d+/fCDQwrb2hUs/P5Y6snz6c8pW7Mp1/XuE4gv9O+P3xfUeddlXt+iKS514czNUI79m3KZeSGpO
	GpRQR3NB9pFTLBoWviKoP7/udqTxV6WymWRLRtMJNQdHR12Hx2umiCfOCAoE+CGe0NGYdpXn8fafo
	oInf8hjnztBcitfCMT3wlzWe5SMLwWjdNDcsvOUTC1i/gszWCpjsGKFDrnbYgG4mlQKNLIOqLD7HE
	bZ5c4rVstLW2r7X9rhoxSEZtSmm4V/DDbnrenv/aRIgEzCegTEdsXpoUJWqHVWKDwrbMrF1wLISLA
	B5OrQ7o8DLsj8RzyhFSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qBBCU-0080SE-1J;
	Mon, 19 Jun 2023 09:29:30 +0000
Received: from relay8-d.mail.gandi.net ([217.70.183.201])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qBBCQ-0080P5-10
	for linux-mtd@lists.infradead.org;
	Mon, 19 Jun 2023 09:29:28 +0000
X-GND-Sasl: miquel.raynal@bootlin.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1687166965;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0deo1sCqZPvcxv3hWzdd9xwp6LIJeBhlyjLpaHqVONQ=;
	b=puZUwAQOeKIPFWjmaxX0Dyjmx09NkHpu/J5x5sDz7sqYIl7IavuXzdYNO8oTJPrWEjw3OJ
	EcN+SleXhMY3i7XnLtr8+isZEAsh+PXv7iyeJjw9KasD19CAqvv9h+z7Een/eBcUSkI4zb
	g+kL16HJG0hjic3VT8YKMT4vsmgkrc+HYUW4AVFrZGC0ORhgjnn1zzeRaBcN0qglOv0Ct0
	G3quE4/RrVwdaJQN0ssnpiheqTdVUPtxOYIKiVHTNyL5Dx7f73oSVCy8S/7akefHriGwWp
	WftNpEOmsezYHcF+3RQcrHBbBqswy1RtBUTmp3tlFOMBeI578M2up0r0DtVT3Q==
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id B91B41BF210;
	Mon, 19 Jun 2023 09:29:23 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	devicetree@vger.kernel.org
Cc: Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Pratyush Yadav <pratyush@kernel.org>,
	Michael Walle <michael@walle.cc>,
	<linux-mtd@lists.infradead.org>,
	Chris Packham <Chris.Packham@alliedtelesis.co.nz>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Rob Herring <robh@kernel.org>
Subject: [PATCH v3 02/17] dt-bindings: mtd: Create a file for raw NAND chip properties
Date: Mon, 19 Jun 2023 11:29:01 +0200
Message-Id: <20230619092916.3028470-3-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230619092916.3028470-1-miquel.raynal@bootlin.com>
References: <20230619092916.3028470-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230619_022926_616206_F00D82EE 
X-CRM114-Status: GOOD (  27.91  )
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

In an effort to constrain as much as we can the existing binding, we
want to add "unevaluatedProperties: false" in all the NAND chip
descriptions part of NAND controller bindings. But in order to do that
properly, we also need to reference a file which contains all the
"allowed" properties. Right now this file is nand-chip.yaml but in
practice raw NAND controllers may use additional properties in their
NAND chip children node. These properties are listed under
nand-controller.yaml, which makes the "unevaluatedProperties" checks
fail while the description are valid. We need to move these NAND chip
related properties into another file, because we do not want to pollute
nand-chip.yaml which is also referenced by eg. SPI-NAND devices.

Let's create a raw-nand-chip.yaml file to reference all the properties a
raw NAND chip description can contain. The chain of inheritance becomes:
  nand-controller.yaml <- raw-nand-chip.yaml
  raw-nand-chip.yaml   <- nand-chip.yaml
  spi-nand.yaml        <- nand-chip.yaml

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
Reviewed-by: Rob Herring <robh@kernel.org>
---
 .../bindings/mtd/nand-controller.yaml         |  85 +--------------
 .../bindings/mtd/raw-nand-chip.yaml           | 102 ++++++++++++++++++
 2 files changed, 104 insertions(+), 83 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/mtd/raw-nand-chip.yaml

diff --git a/Documentation/devicetree/bindings/mtd/nand-controller.yaml b/Documentation/devicetree/bindings/mtd/nand-controller.yaml
index f70a32d2d9d4..83a4fe4cc29d 100644
--- a/Documentation/devicetree/bindings/mtd/nand-controller.yaml
+++ b/Documentation/devicetree/bindings/mtd/nand-controller.yaml
@@ -16,16 +16,6 @@ description: |
   children nodes of the NAND controller. This representation should be
   enforced even for simple controllers supporting only one chip.
 
-  The ECC strength and ECC step size properties define the user
-  desires in terms of correction capability of a controller. Together,
-  they request the ECC engine to correct {strength} bit errors per
-  {size} bytes.
-
-  The interpretation of these parameters is implementation-defined, so
-  not all implementations must support all possible
-  combinations. However, implementations are encouraged to further
-  specify the value(s) they support.
-
 properties:
   $nodename:
     pattern: "^nand-controller(@.*)?"
@@ -51,79 +41,8 @@ properties:
 
 patternProperties:
   "^nand@[a-f0-9]$":
-    $ref: nand-chip.yaml#
-
-    properties:
-      reg:
-        description:
-          Contains the chip-select IDs.
-
-      nand-ecc-placement:
-        description:
-          Location of the ECC bytes. This location is unknown by default
-          but can be explicitly set to "oob", if all ECC bytes are
-          known to be stored in the OOB area, or "interleaved" if ECC
-          bytes will be interleaved with regular data in the main area.
-        $ref: /schemas/types.yaml#/definitions/string
-        enum: [ oob, interleaved ]
-
-      nand-bus-width:
-        description:
-          Bus width to the NAND chip
-        $ref: /schemas/types.yaml#/definitions/uint32
-        enum: [8, 16]
-        default: 8
-
-      nand-on-flash-bbt:
-        description:
-          With this property, the OS will search the device for a Bad
-          Block Table (BBT). If not found, it will create one, reserve
-          a few blocks at the end of the device to store it and update
-          it as the device ages. Otherwise, the out-of-band area of a
-          few pages of all the blocks will be scanned at boot time to
-          find Bad Block Markers (BBM). These markers will help to
-          build a volatile BBT in RAM.
-        $ref: /schemas/types.yaml#/definitions/flag
-
-      nand-ecc-maximize:
-        description:
-          Whether or not the ECC strength should be maximized. The
-          maximum ECC strength is both controller and chip
-          dependent. The ECC engine has to select the ECC config
-          providing the best strength and taking the OOB area size
-          constraint into account. This is particularly useful when
-          only the in-band area is used by the upper layers, and you
-          want to make your NAND as reliable as possible.
-        $ref: /schemas/types.yaml#/definitions/flag
-
-      nand-is-boot-medium:
-        description:
-          Whether or not the NAND chip is a boot medium. Drivers might
-          use this information to select ECC algorithms supported by
-          the boot ROM or similar restrictions.
-        $ref: /schemas/types.yaml#/definitions/flag
-
-      nand-rb:
-        description:
-          Contains the native Ready/Busy IDs.
-        $ref: /schemas/types.yaml#/definitions/uint32-array
-
-      rb-gpios:
-        description:
-          Contains one or more GPIO descriptor (the numper of descriptor
-          depends on the number of R/B pins exposed by the flash) for the
-          Ready/Busy pins. Active state refers to the NAND ready state and
-          should be set to GPIOD_ACTIVE_HIGH unless the signal is inverted.
-
-      wp-gpios:
-        description:
-          Contains one GPIO descriptor for the Write Protect pin.
-          Active state refers to the NAND Write Protect state and should be
-          set to GPIOD_ACTIVE_LOW unless the signal is inverted.
-        maxItems: 1
-
-    required:
-      - reg
+    type: object
+    $ref: raw-nand-chip.yaml#
 
 required:
   - "#address-cells"
diff --git a/Documentation/devicetree/bindings/mtd/raw-nand-chip.yaml b/Documentation/devicetree/bindings/mtd/raw-nand-chip.yaml
new file mode 100644
index 000000000000..2caa6a9a73d3
--- /dev/null
+++ b/Documentation/devicetree/bindings/mtd/raw-nand-chip.yaml
@@ -0,0 +1,102 @@
+# SPDX-License-Identifier: GPL-2.0
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/mtd/raw-nand-chip.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Raw NAND Chip Common Properties
+
+maintainers:
+  - Miquel Raynal <miquel.raynal@bootlin.com>
+
+allOf:
+  - $ref: nand-chip.yaml#
+
+description: |
+  The ECC strength and ECC step size properties define the user
+  desires in terms of correction capability of a controller. Together,
+  they request the ECC engine to correct {strength} bit errors per
+  {size} bytes for a particular raw NAND chip.
+
+  The interpretation of these parameters is implementation-defined, so
+  not all implementations must support all possible
+  combinations. However, implementations are encouraged to further
+  specify the value(s) they support.
+
+properties:
+  $nodename:
+    pattern: "^nand@[a-f0-9]$"
+
+  reg:
+    description:
+      Contains the chip-select IDs.
+
+  nand-ecc-placement:
+    description:
+      Location of the ECC bytes. This location is unknown by default
+      but can be explicitly set to "oob", if all ECC bytes are
+      known to be stored in the OOB area, or "interleaved" if ECC
+      bytes will be interleaved with regular data in the main area.
+    $ref: /schemas/types.yaml#/definitions/string
+    enum: [ oob, interleaved ]
+
+  nand-bus-width:
+    description:
+      Bus width to the NAND chip
+    $ref: /schemas/types.yaml#/definitions/uint32
+    enum: [8, 16]
+    default: 8
+
+  nand-on-flash-bbt:
+    description:
+      With this property, the OS will search the device for a Bad
+      Block Table (BBT). If not found, it will create one, reserve
+      a few blocks at the end of the device to store it and update
+      it as the device ages. Otherwise, the out-of-band area of a
+      few pages of all the blocks will be scanned at boot time to
+      find Bad Block Markers (BBM). These markers will help to
+      build a volatile BBT in RAM.
+    $ref: /schemas/types.yaml#/definitions/flag
+
+  nand-ecc-maximize:
+    description:
+      Whether or not the ECC strength should be maximized. The
+      maximum ECC strength is both controller and chip
+      dependent. The ECC engine has to select the ECC config
+      providing the best strength and taking the OOB area size
+      constraint into account. This is particularly useful when
+      only the in-band area is used by the upper layers, and you
+      want to make your NAND as reliable as possible.
+    $ref: /schemas/types.yaml#/definitions/flag
+
+  nand-is-boot-medium:
+    description:
+      Whether or not the NAND chip is a boot medium. Drivers might
+      use this information to select ECC algorithms supported by
+      the boot ROM or similar restrictions.
+    $ref: /schemas/types.yaml#/definitions/flag
+
+  nand-rb:
+    description:
+      Contains the native Ready/Busy IDs.
+    $ref: /schemas/types.yaml#/definitions/uint32-array
+
+  rb-gpios:
+    description:
+      Contains one or more GPIO descriptor (the numper of descriptor
+      depends on the number of R/B pins exposed by the flash) for the
+      Ready/Busy pins. Active state refers to the NAND ready state and
+      should be set to GPIOD_ACTIVE_HIGH unless the signal is inverted.
+
+  wp-gpios:
+    description:
+      Contains one GPIO descriptor for the Write Protect pin.
+      Active state refers to the NAND Write Protect state and should be
+      set to GPIOD_ACTIVE_LOW unless the signal is inverted.
+    maxItems: 1
+
+required:
+  - reg
+
+# This is a generic file other binding inherit from and extend
+additionalProperties: true
-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
