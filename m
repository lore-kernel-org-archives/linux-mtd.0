Return-Path: <SRS0=QmfO=LB=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47CC9C47082
	for <linux-mtd@archiver.kernel.org>; Mon,  7 Jun 2021 19:36:08 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 009F161130
	for <linux-mtd@archiver.kernel.org>; Mon,  7 Jun 2021 19:36:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 009F161130
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=DGXDJdtHuxwsCGEkq0ewt7Z95hzgRIwkhLK/VjKuGZ0=; b=LviXUqHIk6keAh
	H5oLQaZ8ocN7lZ7Aloqua/PqiV8MhxOESujJCowoiAX1YvprE3+vJV0dfH0vZ9kh0L5SFUcaNrpyF
	HRKKST69EUwtrCDzNrkMobLpwWoXQdhEXVp+IZOtcTyDOXDEGCPQsmpSOxwEHmlHMQN+HAFdhsU6o
	LrhjI3ue931WQI2hucjxuVdFzDQmPNDHvzR5iEqStmWSPtxbwwPnuhJ4zvYd9C+uopRwe+vKlwtYv
	o4Cog1TBwQ7lZ6bWesMbNTDrufgZNnHE1xUXTUEEVh8BukbXVAQIita3WM7zoW8RBKz24grxPdy+a
	SGJFY7guF1omPzwpP5ug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lqL1m-005BZD-Dr; Mon, 07 Jun 2021 19:35:14 +0000
Received: from mail-oi1-f177.google.com ([209.85.167.177])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lqL1e-005BY7-03
 for linux-mtd@lists.infradead.org; Mon, 07 Jun 2021 19:35:08 +0000
Received: by mail-oi1-f177.google.com with SMTP id c13so13662706oib.13
 for <linux-mtd@lists.infradead.org>; Mon, 07 Jun 2021 12:35:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ixNO//YtumYHIqR/2SU1mtI4xJNsOrY9CWVad6/LqGk=;
 b=SY01BSvgdPM+vveXHZogJwxPCDVUxyUsBbohO2mPcz5h0aocjHv84uNP3u42YP4WuO
 chocgn7hwyL5r3nb2oPkGDLe6DzpeXJcSUedJT9zXVllqOVrjda36HVDQK7uLlKk25kG
 vw0ByKPKIKISwXXBHIZXfAo2Zsz7QRvf4bCacgmqX0vAWF0ae5jrWDQXac67ocGCRNra
 D08PcruCRvFybUPdSKzE2gHVodUeIFBaXOBqrmbFziW6CPuY4/l37RlWLfKMPEcrH5Vd
 ZZ/omYgIE4MCv2kcfav5NvLK62doV18wZ8EcOVujP68dp23ePSLWD9ZTLwMcyyUkMg6D
 GbBw==
X-Gm-Message-State: AOAM532tpOoKdIelyJYdBVJxju0vENeYgZHsgcFgCuNYgpmoGNIRYFL6
 0hL8pyGWq2VKPZCl6K/DMw==
X-Google-Smtp-Source: ABdhPJyszHAAy/lQ8a9jC7RXF+LAb6K7Zf2pWZc3nTpHILA2u0gQr5vmkj178SpXnvp3CSTju2sj5w==
X-Received: by 2002:a54:4684:: with SMTP id k4mr559597oic.20.1623094502764;
 Mon, 07 Jun 2021 12:35:02 -0700 (PDT)
Received: from xps15.herring.priv (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.googlemail.com with ESMTPSA id u24sm2583884otg.73.2021.06.07.12.35.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Jun 2021 12:35:02 -0700 (PDT)
From: Rob Herring <robh@kernel.org>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Linus Walleij <linus.walleij@linaro.org>,
 Vignesh Raghavendra <vigneshr@ti.com>, linux-mtd@lists.infradead.org
Subject: [PATCH] dt-bindings: mtd: Convert mtd-physmap to DT schema
Date: Mon,  7 Jun 2021 14:35:00 -0500
Message-Id: <20210607193500.3085920-1-robh@kernel.org>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210607_123506_086127_D4860BF4 
X-CRM114-Status: GOOD (  27.72  )
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

Convert the mtd-physmap binding to DT schema format. The arm-versatile,
cypress,hyperflash and intel,ixp4xx-flash are all just an additional
compatible string, so they are all merged into the main schema.

There doesn't appear to be any users nor support for 'vendor-id' and
'device-id', so these have been dropped.

Cc: Linus Walleij <linus.walleij@linaro.org>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>
Cc: Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org
Signed-off-by: Rob Herring <robh@kernel.org>
---
 .../devicetree/bindings/mtd/arm-versatile.txt |  26 ---
 .../bindings/mtd/cypress,hyperflash.txt       |  13 --
 .../bindings/mtd/intel,ixp4xx-flash.txt       |  22 --
 .../devicetree/bindings/mtd/mtd-physmap.txt   | 114 ----------
 .../devicetree/bindings/mtd/mtd-physmap.yaml  | 208 ++++++++++++++++++
 5 files changed, 208 insertions(+), 175 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/mtd/arm-versatile.txt
 delete mode 100644 Documentation/devicetree/bindings/mtd/cypress,hyperflash.txt
 delete mode 100644 Documentation/devicetree/bindings/mtd/intel,ixp4xx-flash.txt
 delete mode 100644 Documentation/devicetree/bindings/mtd/mtd-physmap.txt
 create mode 100644 Documentation/devicetree/bindings/mtd/mtd-physmap.yaml

diff --git a/Documentation/devicetree/bindings/mtd/arm-versatile.txt b/Documentation/devicetree/bindings/mtd/arm-versatile.txt
deleted file mode 100644
index 4ec28796a3c0..000000000000
--- a/Documentation/devicetree/bindings/mtd/arm-versatile.txt
+++ /dev/null
@@ -1,26 +0,0 @@
-Flash device on ARM Versatile board
-
-These flash chips are found in the ARM reference designs like Integrator,
-Versatile, RealView, Versatile Express etc.
-
-They are regular CFI compatible (Intel or AMD extended) flash chips with
-some special write protect/VPP bits that can be controlled by the machine's
-system controller.
-
-Required properties:
-- compatible : must be "arm,versatile-flash", "cfi-flash";
-- reg : memory address for the flash chip
-- bank-width : width in bytes of flash interface.
-
-For the rest of the properties, see mtd-physmap.txt.
-
-The device tree may optionally contain sub-nodes describing partitions of the
-address space. See partition.txt for more detail.
-
-Example:
-
-flash@34000000 {
-	compatible = "arm,versatile-flash", "cfi-flash";
-	reg = <0x34000000 0x4000000>;
-	bank-width = <4>;
-};
diff --git a/Documentation/devicetree/bindings/mtd/cypress,hyperflash.txt b/Documentation/devicetree/bindings/mtd/cypress,hyperflash.txt
deleted file mode 100644
index ad42f4db32f1..000000000000
--- a/Documentation/devicetree/bindings/mtd/cypress,hyperflash.txt
+++ /dev/null
@@ -1,13 +0,0 @@
-Bindings for HyperFlash NOR flash chips compliant with Cypress HyperBus
-specification and supports Cypress CFI specification 1.5 command set.
-
-Required properties:
-- compatible : "cypress,hyperflash", "cfi-flash" for HyperFlash NOR chips
-- reg : Address of flash's memory map
-
-Example:
-
-	flash@0 {
-		compatible = "cypress,hyperflash", "cfi-flash";
-		reg = <0x0 0x4000000>;
-	};
diff --git a/Documentation/devicetree/bindings/mtd/intel,ixp4xx-flash.txt b/Documentation/devicetree/bindings/mtd/intel,ixp4xx-flash.txt
deleted file mode 100644
index 4bdcb92ae381..000000000000
--- a/Documentation/devicetree/bindings/mtd/intel,ixp4xx-flash.txt
+++ /dev/null
@@ -1,22 +0,0 @@
-Flash device on Intel IXP4xx SoC
-
-This flash is regular CFI compatible (Intel or AMD extended) flash chips with
-specific big-endian or mixed-endian memory access pattern.
-
-Required properties:
-- compatible : must be "intel,ixp4xx-flash", "cfi-flash";
-- reg : memory address for the flash chip
-- bank-width : width in bytes of flash interface, should be <2>
-
-For the rest of the properties, see mtd-physmap.txt.
-
-The device tree may optionally contain sub-nodes describing partitions of the
-address space. See partition.txt for more detail.
-
-Example:
-
-flash@50000000 {
-	compatible = "intel,ixp4xx-flash", "cfi-flash";
-	reg = <0x50000000 0x01000000>;
-	bank-width = <2>;
-};
diff --git a/Documentation/devicetree/bindings/mtd/mtd-physmap.txt b/Documentation/devicetree/bindings/mtd/mtd-physmap.txt
deleted file mode 100644
index c69f4f065d23..000000000000
--- a/Documentation/devicetree/bindings/mtd/mtd-physmap.txt
+++ /dev/null
@@ -1,114 +0,0 @@
-CFI or JEDEC memory-mapped NOR flash, MTD-RAM (NVRAM...)
-
-Flash chips (Memory Technology Devices) are often used for solid state
-file systems on embedded devices.
-
- - compatible : should contain the specific model of mtd chip(s)
-   used, if known, followed by either "cfi-flash", "jedec-flash",
-   "mtd-ram" or "mtd-rom".
- - reg : Address range(s) of the mtd chip(s)
-   It's possible to (optionally) define multiple "reg" tuples so that
-   non-identical chips can be described in one node.
- - bank-width : Width (in bytes) of the bank.  Equal to the
-   device width times the number of interleaved chips.
- - device-width : (optional) Width of a single mtd chip.  If
-   omitted, assumed to be equal to 'bank-width'.
- - #address-cells, #size-cells : Must be present if the device has
-   sub-nodes representing partitions (see below).  In this case
-   both #address-cells and #size-cells must be equal to 1.
- - no-unaligned-direct-access: boolean to disable the default direct
-   mapping of the flash.
-   On some platforms (e.g. MPC5200) a direct 1:1 mapping may cause
-   problems with JFFS2 usage, as the local bus (LPB) doesn't support
-   unaligned accesses as implemented in the JFFS2 code via memcpy().
-   By defining "no-unaligned-direct-access", the flash will not be
-   exposed directly to the MTD users (e.g. JFFS2) any more.
- - linux,mtd-name: allow to specify the mtd name for retro capability with
-   physmap-flash drivers as boot loader pass the mtd partition via the old
-   device name physmap-flash.
- - use-advanced-sector-protection: boolean to enable support for the
-   advanced sector protection (Spansion: PPB - Persistent Protection
-   Bits) locking.
- - addr-gpios : (optional) List of GPIO descriptors that will be used to
-   address the MSBs address lines. The order goes from LSB to MSB.
-
-For JEDEC compatible devices, the following additional properties
-are defined:
-
- - vendor-id : Contains the flash chip's vendor id (1 byte).
- - device-id : Contains the flash chip's device id (1 byte).
-
-For ROM compatible devices (and ROM fallback from cfi-flash), the following
-additional (optional) property is defined:
-
- - erase-size : The chip's physical erase block size in bytes.
-
- The device tree may optionally contain endianness property.
- little-endian or big-endian : It Represents the endianness that should be used
-                               by the controller to  properly read/write data
-			       from/to the flash. If this property is missing,
-			       the endianness is chosen by the system
-			       (potentially based on extra configuration options).
-
-The device tree may optionally contain sub-nodes describing partitions of the
-address space. See partition.txt for more detail.
-
-Example:
-
-	flash@ff000000 {
-		compatible = "amd,am29lv128ml", "cfi-flash";
-		reg = <ff000000 01000000>;
-		bank-width = <4>;
-		device-width = <1>;
-		#address-cells = <1>;
-		#size-cells = <1>;
-		fs@0 {
-			label = "fs";
-			reg = <0 f80000>;
-		};
-		firmware@f80000 {
-			label ="firmware";
-			reg = <f80000 80000>;
-			read-only;
-		};
-	};
-
-Here an example with multiple "reg" tuples:
-
-	flash@f0000000,0 {
-		#address-cells = <1>;
-		#size-cells = <1>;
-		compatible = "intel,PC48F4400P0VB", "cfi-flash";
-		reg = <0 0x00000000 0x02000000
-		       0 0x02000000 0x02000000>;
-		bank-width = <2>;
-		partition@0 {
-			label = "test-part1";
-			reg = <0 0x04000000>;
-		};
-	};
-
-An example using SRAM:
-
-	sram@2,0 {
-		compatible = "samsung,k6f1616u6a", "mtd-ram";
-		reg = <2 0 0x00200000>;
-		bank-width = <2>;
-	};
-
-An example using gpio-addrs
-
-	flash@20000000 {
-		#address-cells = <1>;
-		#size-cells = <1>;
-		compatible = "cfi-flash", "jedec-flash";
-		reg = <0x20000000 0x02000000>;
-		ranges = <0 0x00000000 0x02000000
-		          1 0x02000000 0x02000000>;
-		bank-width = <2>;
-		addr-gpios = <&gpio1 2 GPIO_ACTIVE_HIGH>;
-		partition@0 {
-			label = "test-part1";
-			reg = <0 0x04000000>;
-		};
-	};
diff --git a/Documentation/devicetree/bindings/mtd/mtd-physmap.yaml b/Documentation/devicetree/bindings/mtd/mtd-physmap.yaml
new file mode 100644
index 000000000000..13c29cc91b59
--- /dev/null
+++ b/Documentation/devicetree/bindings/mtd/mtd-physmap.yaml
@@ -0,0 +1,208 @@
+# SPDX-License-Identifier: GPL-2.0
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/mtd/mtd-physmap.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: CFI or JEDEC memory-mapped NOR flash, MTD-RAM (NVRAM...)
+
+maintainers:
+  - Rob Herring <robh@kernel.org>
+
+description: |
+  Flash chips (Memory Technology Devices) are often used for solid state
+  file systems on embedded devices.
+
+properties:
+  compatible:
+    oneOf:
+      - items:
+          - enum:
+              - amd,s29gl01gp
+              - amd,s29gl032a
+              - amd,s29gl256n
+              - amd,s29gl512n
+              - arm,versatile-flash
+              - cortina,gemini-flash
+              - cypress,hyperflash
+              - ge,imp3a-firmware-mirror
+              - ge,imp3a-paged-flash
+              - gef,ppc9a-firmware-mirror
+              - gef,ppc9a-paged-flash
+              - gef,sbc310-firmware-mirror
+              - gef,sbc310-paged-flash
+              - gef,sbc610-firmware-mirror
+              - gef,sbc610-paged-flash
+              - intel,28f128j3
+              - intel,dt28f160
+              - intel,ixp4xx-flash
+              - intel,JS28F128
+              - intel,JS28F640
+              - intel,PC28F640P30T85
+              - numonyx,js28f00a
+              - numonyx,js28f128
+              - sst,sst39vf320
+              - xlnx,xps-mch-emc-2.00.a
+          - const: cfi-flash
+      - items:
+          - enum:
+              - cypress,cy7c1019dv33-10zsxi
+              - arm,vexpress-psram
+          - const: mtd-ram
+      - enum:
+          - cfi-flash
+          - jedec-flash
+          - mtd-ram
+          - mtd-rom
+
+  reg:
+    description: |
+      It's possible to (optionally) define multiple "reg" tuples so that
+      non-identical chips can be described in one node.
+    minItems: 1
+    maxItems: 8
+
+  bank-width:
+    description: Width (in bytes) of the bank.  Equal to the device width times
+      the number of interleaved chips.
+    $ref: /schemas/types.yaml#/definitions/uint32
+    enum: [ 1, 2, 4 ]
+
+  device-width:
+    description:
+      Width of a single mtd chip. If omitted, assumed to be equal to 'bank-width'.
+    $ref: /schemas/types.yaml#/definitions/uint32
+    enum: [ 1, 2 ]
+
+  no-unaligned-direct-access:
+    type: boolean
+    description: |
+      Disables the default direct mapping of the flash.
+
+      On some platforms (e.g. MPC5200) a direct 1:1 mapping may cause problems
+      with JFFS2 usage, as the local bus (LPB) doesn't support unaligned
+      accesses as implemented in the JFFS2 code via memcpy(). By defining
+      "no-unaligned-direct-access", the flash will not be exposed directly to
+      the MTD users (e.g. JFFS2) any more.
+
+  linux,mtd-name:
+    description:
+      Allows specifying the mtd name for retro capability with physmap-flash
+      drivers as boot loader pass the mtd partition via the old device name
+      physmap-flash.
+    $ref: /schemas/types.yaml#/definitions/string
+
+  use-advanced-sector-protection:
+    type: boolean
+    description: |
+      Enables support for the advanced sector protection (Spansion: PPB -
+      Persistent Protection Bits) locking.
+
+  erase-size:
+    description: The chip's physical erase block size in bytes.
+    $ref: /schemas/types.yaml#/definitions/uint32
+
+  addr-gpios:
+    description:
+      List of GPIO descriptors that will be used to address the MSBs address
+      lines. The order goes from LSB to MSB.
+    minItems: 1
+    maxItems: 8
+
+  '#address-cells':
+    const: 1
+
+  '#size-cells':
+    const: 1
+
+  big-endian: true
+  little-endian: true
+
+patternProperties:
+  '@[0-9a-f]+$':
+    $ref: partitions/partition.yaml
+
+required:
+  - compatible
+  - reg
+
+# FIXME: A parent bus may define timing properties
+additionalProperties: true
+
+examples:
+  - |
+
+    flash@ff000000 {
+        compatible = "cfi-flash";
+        reg = <0xff000000 0x01000000>;
+        bank-width = <4>;
+        device-width = <1>;
+
+        #address-cells = <1>;
+        #size-cells = <1>;
+        ranges = <0 0xff000000 0x01000000>;
+
+        fs@0 {
+            label = "fs";
+            reg = <0 0xf80000>;
+        };
+        firmware@f80000 {
+            label ="firmware";
+            reg = <0xf80000 0x80000>;
+            read-only;
+        };
+    };
+
+  - |
+    /* An example with multiple "reg" tuples */
+
+    flash@0 {
+        compatible = "intel,PC28F640P30T85", "cfi-flash";
+        reg = <0x00000000 0x02000000>,
+              <0x02000000 0x02000000>;
+        bank-width = <2>;
+
+        #address-cells = <1>;
+        #size-cells = <1>;
+        ranges = <0 0 0x04000000>;
+
+        partition@0 {
+            label = "test-part1";
+            reg = <0 0x04000000>;
+        };
+    };
+
+  - |
+    /* An example using SRAM */
+    bus {
+        #address-cells = <2>;
+        #size-cells = <1>;
+
+        sram@2,0 {
+            compatible = "mtd-ram";
+            reg = <2 0 0x00200000>;
+            bank-width = <2>;
+        };
+    };
+
+  - |
+    /* An example using addr-gpios */
+    #include <dt-bindings/gpio/gpio.h>
+
+    flash@20000000 {
+        compatible = "cfi-flash";
+        reg = <0x20000000 0x02000000>;
+        bank-width = <2>;
+        addr-gpios = <&gpio1 2 GPIO_ACTIVE_HIGH>;
+
+        #address-cells = <1>;
+        #size-cells = <1>;
+        ranges = <0 0x00000000 0x02000000>,
+                 <1 0x02000000 0x02000000>;
+
+        partition@0 {
+            label = "test-part1";
+            reg = <0 0x04000000>;
+        };
+    };
+...
-- 
2.27.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
