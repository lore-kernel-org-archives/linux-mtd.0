Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92F9BE77173
	for <linux-mtd@archiver.kernel.org>; Mon,  9 Dec 2024 08:23:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Cedbvic2SE9sN0eStIMzTiQ/fnxpnf9HMS8gB+PfSjY=; b=tBQ9NZZLVJy2dZ
	K+T46erq+SOYxpu1Aph5N5jgKkekwS9rdTGQpdSqXtK9EaWYvJGBWbPua/gzatHdl4SYK2tDOAN/8
	RPAc0kxOMX/A78RtG4UnEYBsY2uCmKGxIombod8KMJ32FeYICsT5GhQKyhYJ7f7uu3eFz+RNK1dEf
	XJjiwFWsZ5PsA7awyZrb5IXYbzeGSO1Geo1iabNtLFEIV9FHF71A2DI1dMiVnN9nJWvgGIMunTefK
	PkRbmVuQSSy2xoi7jUWMbv6X+AaMNbpI5QNfV90UCYW9Y5JaxTxQQ0mz41cQZf3wsTXy/uc5sfgQ+
	+UhVZlOAfF65xWYJz/uQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKZ2w-00000006tSU-1ap7;
	Mon, 09 Dec 2024 08:23:14 +0000
Received: from mgamail.intel.com ([192.198.163.14])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tKZ1L-00000006t49-2Cvn
	for linux-mtd@lists.infradead.org;
	Mon, 09 Dec 2024 08:21:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733732495; x=1765268495;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=Um7JMO3CYMOMtg9MkzluQOsT7g1qLmgYaKW8k1A2Eq4=;
  b=CKr2e7R6lRa8yZh+ROFLwNlWjaf0MZ7rVDDWx0/XcEIdG8wu2MRYM8nO
   LFiMA2V+1BMjrRtHfW6NU7OmiItRQJepSn/b6nBVJp1n50B8b+lKN0XEn
   kx4mnTVqn8uOMl3VO6+pY3jIH0RNIIkvLVMF78y1zg+eu3XJZKgUjKiO1
   o8w1rDlS3przEb/qfV7bnOUIRxOpu9jThLnhxo18VidQ0r7HkQEQH5+QD
   +9ovELO1dRG7PzFXSk/HrS9eGAo5e1XVm8y2oANFwR1GDUEiM2XAoC7bv
   74nV/dNesxo4v21yGmhYgevsX9DkVxJ8gxnK69cgUO5AM19lRjtW+E706
   Q==;
X-CSE-ConnectionGUID: H7NsUfPGR3yitOg5jHYPVg==
X-CSE-MsgGUID: pExjsmccQYm9ENFmhufcDA==
X-IronPort-AV: E=McAfee;i="6700,10204,11280"; a="34252469"
X-IronPort-AV: E=Sophos;i="6.12,218,1728975600"; 
   d="scan'208";a="34252469"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Dec 2024 00:21:33 -0800
X-CSE-ConnectionGUID: B/NeFFu8QAmlGISAw3VL7Q==
X-CSE-MsgGUID: 5TZQxXd4Rz+mCZ6xhe9UCQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,218,1728975600"; 
   d="scan'208";a="95339983"
Received: from pg15swiplab1181.png.altera.com ([10.244.232.167])
  by fmviesa010.fm.intel.com with ESMTP; 09 Dec 2024 00:21:27 -0800
From: niravkumar.l.rabara@intel.com
To: devicetree@vger.kernel.org
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Niravkumar L Rabara <niravkumar.l.rabara@intel.com>,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH RESEND v4] dt-bindings: mtd: cadence: convert cadence-nand-controller.txt to yaml
Date: Mon,  9 Dec 2024 16:18:26 +0800
Message-Id: <20241209081826.1242214-1-niravkumar.l.rabara@intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241209_002135_580246_DC645947 
X-CRM114-Status: GOOD (  19.65  )
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

From: Niravkumar L Rabara <niravkumar.l.rabara@intel.com>

Convert cadence-nand-controller.txt to yaml format.
Update cadence-nand-controller.txt to cdns,hp-nfc.yaml in MAINTAINER file.

Signed-off-by: Niravkumar L Rabara <niravkumar.l.rabara@intel.com>
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
---

Changes in v4 resend:
- Include missing Reviewed-by tag.

Changes in v4:
- Fixed the identation for examples as per review comment in v3.

Changes in v3:
- Changed file name to cdns,hp-nfc.yaml to match with compatible.
- Update description, fixed alignment, and used defines for interrupt
  flag as per review comments in v2.

Changes in v2:
- Update name cadence-nand-controller.txt to cadence,nand.yaml in MAINTAINER
  file to resolve the warning.

 .../bindings/mtd/cadence-nand-controller.txt  | 53 -------------
 .../devicetree/bindings/mtd/cdns,hp-nfc.yaml  | 75 +++++++++++++++++++
 MAINTAINERS                                   |  2 +-
 3 files changed, 76 insertions(+), 54 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/mtd/cadence-nand-controller.txt
 create mode 100644 Documentation/devicetree/bindings/mtd/cdns,hp-nfc.yaml

diff --git a/Documentation/devicetree/bindings/mtd/cadence-nand-controller.txt b/Documentation/devicetree/bindings/mtd/cadence-nand-controller.txt
deleted file mode 100644
index d2eada5044b2..000000000000
--- a/Documentation/devicetree/bindings/mtd/cadence-nand-controller.txt
+++ /dev/null
@@ -1,53 +0,0 @@
-* Cadence NAND controller
-
-Required properties:
-  - compatible : "cdns,hp-nfc"
-  - reg : Contains two entries, each of which is a tuple consisting of a
-	  physical address and length. The first entry is the address and
-	  length of the controller register set. The second entry is the
-	  address and length of the Slave DMA data port.
-  - reg-names: should contain "reg" and "sdma"
-  - #address-cells: should be 1. The cell encodes the chip select connection.
-  - #size-cells : should be 0.
-  - interrupts : The interrupt number.
-  - clocks: phandle of the controller core clock (nf_clk).
-
-Optional properties:
-  - dmas: shall reference DMA channel associated to the NAND controller
-  - cdns,board-delay-ps : Estimated Board delay. The value includes the total
-    round trip delay for the signals and is used for deciding on values
-    associated with data read capture. The example formula for SDR mode is
-    the following:
-    board delay = RE#PAD delay + PCB trace to device + PCB trace from device
-    + DQ PAD delay
-
-Child nodes represent the available NAND chips.
-
-Required properties of NAND chips:
-  - reg: shall contain the native Chip Select ids from 0 to max supported by
-    the cadence nand flash controller
-
-See Documentation/devicetree/bindings/mtd/nand-controller.yaml for more details on
-generic bindings.
-
-Example:
-
-nand_controller: nand-controller@60000000 {
-	  compatible = "cdns,hp-nfc";
-	  #address-cells = <1>;
-	  #size-cells = <0>;
-	  reg = <0x60000000 0x10000>, <0x80000000 0x10000>;
-	  reg-names = "reg", "sdma";
-	  clocks = <&nf_clk>;
-	  cdns,board-delay-ps = <4830>;
-	  interrupts = <2 0>;
-	  nand@0 {
-	      reg = <0>;
-	      label = "nand-1";
-	  };
-	  nand@1 {
-	      reg = <1>;
-	      label = "nand-2";
-	  };
-
-};
diff --git a/Documentation/devicetree/bindings/mtd/cdns,hp-nfc.yaml b/Documentation/devicetree/bindings/mtd/cdns,hp-nfc.yaml
new file mode 100644
index 000000000000..0bed37a994c3
--- /dev/null
+++ b/Documentation/devicetree/bindings/mtd/cdns,hp-nfc.yaml
@@ -0,0 +1,75 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/mtd/cdns,hp-nfc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Cadence NAND controller
+
+maintainers:
+  - Niravkumar L Rabara <niravkumar.l.rabara@intel.com>
+
+allOf:
+  - $ref: nand-controller.yaml
+
+properties:
+  compatible:
+    items:
+      - const: cdns,hp-nfc
+
+  reg:
+    items:
+      - description: Controller register set
+      - description: Slave DMA data port register set
+
+  reg-names:
+    items:
+      - const: reg
+      - const: sdma
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+  dmas:
+    maxItems: 1
+
+  cdns,board-delay-ps:
+    description: |
+      Estimated Board delay. The value includes the total round trip
+      delay for the signals and is used for deciding on values associated
+      with data read capture. The example formula for SDR mode is the
+      following.
+      board delay = RE#PAD delay + PCB trace to device + PCB trace from device
+      + DQ PAD delay
+
+required:
+  - compatible
+  - reg
+  - reg-names
+  - interrupts
+  - clocks
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    nand-controller@10b80000 {
+        compatible = "cdns,hp-nfc";
+        reg = <0x10b80000 0x10000>,
+              <0x10840000 0x10000>;
+        reg-names = "reg", "sdma";
+        #address-cells = <1>;
+        #size-cells = <0>;
+        interrupts = <GIC_SPI 97 IRQ_TYPE_LEVEL_HIGH>;
+        clocks = <&nf_clk>;
+        cdns,board-delay-ps = <4830>;
+
+        nand@0 {
+            reg = <0>;
+        };
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index 1e930c7a58b1..9fab4b4a75a1 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -5009,7 +5009,7 @@ F:	drivers/media/platform/cadence/cdns-csi2*
 CADENCE NAND DRIVER
 L:	linux-mtd@lists.infradead.org
 S:	Orphan
-F:	Documentation/devicetree/bindings/mtd/cadence-nand-controller.txt
+F:	Documentation/devicetree/bindings/mtd/cdns,hp-nfc.yaml
 F:	drivers/mtd/nand/raw/cadence-nand-controller.c
 
 CADENCE USB3 DRD IP DRIVER
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
