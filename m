Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79FAAE8FDCB
	for <linux-mtd@archiver.kernel.org>; Wed,  4 Oct 2023 06:15:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=oaYM81bHsjGzMF7gy9HnKhRl8Yi7XAHvxGC55nQJl90=; b=ucnC9rCoiHTekZ
	+vq9NVSjUTDfPit6/53GlEFk/UhgmGHxsAt90v6Kkri9XM3knvhDpsX/PXomqlzSY4zFW7wmW+D2D
	ZOMmf+fi5/QglpFcELiLJKZ98qoxa38icXdY6MX/Q4OMIf1HcGVQ4BThKIEWGCwBr+wqNgVR30Fu6
	TB0xV3KGbj+/T8BYNsZqnxLYELHhfB0Et6jMH8qDtG9P0Q5Nloz0BxUaW2f+pgBTKljoxEhSUJwKc
	MOFw/PZwprFqvlH6ZEgosHdcLV7253/M7LlP05HIdDShB6u/rqqr+KKkElhcTAAtghBRr76scJGdg
	e895zFkOLJfPL9bjUCOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qnv9y-00GN1t-2f;
	Wed, 04 Oct 2023 06:15:02 +0000
Received: from mgamail.intel.com ([134.134.136.126])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qnv9u-00GN03-2Y
	for linux-mtd@lists.infradead.org;
	Wed, 04 Oct 2023 06:15:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696400098; x=1727936098;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=g3qhwjm1v949ji/360/hMlwzoSwFbjiqduhc4qJAhGM=;
  b=VodNGw2cuOAfq9nJCFipHUTLGTgw2uqi4P4jnxAPMAc0ZCAif6zMnopJ
   xgNa/iTI+AmaC//S3MY2l9kTluzvc3mOJialuKiPATLvusKvsfDZYCnam
   o0+MnoBYbCowbm1pT2ODixtwn8LFgSNJJHhfKVmuQCdbgajkO+zgH+KH6
   rHc4cOuj+BmkO4MaE2NbKVSQeFCSdbWEyDUJEuZv4sdLB7OcyOYzBqAou
   Dp6FjUgO9X8heXdSGfseekxlr3I+y/YmjVYpf8IfwJoQttveH0rmZY/7r
   maxVmEQzPiAtNhH6cnKB3egdQT6AzliizTvrxsLFjfwqD3j9Q5a73YBJn
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10852"; a="368128162"
X-IronPort-AV: E=Sophos;i="6.03,199,1694761200"; 
   d="scan'208";a="368128162"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Oct 2023 23:14:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10852"; a="744807083"
X-IronPort-AV: E=Sophos;i="6.03,199,1694761200"; 
   d="scan'208";a="744807083"
Received: from unknown (HELO localhost.localdomain) ([10.226.216.116])
  by orsmga007.jf.intel.com with ESMTP; 03 Oct 2023 23:14:51 -0700
From: niravkumar.l.rabara@intel.com
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Niravkumar L Rabara <niravkumar.l.rabara@intel.com>
Cc: linux-mtd@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] dt-bindings: mtd: cadence: convert cadence-nand-controller.txt to yaml
Date: Wed,  4 Oct 2023 14:12:14 +0800
Message-Id: <20231004061214.17176-1-niravkumar.l.rabara@intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231003_231458_930363_5EA28360 
X-CRM114-Status: GOOD (  18.95  )
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

Signed-off-by: Niravkumar L Rabara <niravkumar.l.rabara@intel.com>
---
 .../devicetree/bindings/mtd/cadence,nand.yaml | 73 +++++++++++++++++++
 .../bindings/mtd/cadence-nand-controller.txt  | 53 --------------
 2 files changed, 73 insertions(+), 53 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/mtd/cadence,nand.yaml
 delete mode 100644 Documentation/devicetree/bindings/mtd/cadence-nand-controller.txt

diff --git a/Documentation/devicetree/bindings/mtd/cadence,nand.yaml b/Documentation/devicetree/bindings/mtd/cadence,nand.yaml
new file mode 100644
index 000000000000..781812ac702f
--- /dev/null
+++ b/Documentation/devicetree/bindings/mtd/cadence,nand.yaml
@@ -0,0 +1,73 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/mtd/cadence,nand.yaml#
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
+      - description: Address and length of the controller register set
+      - description: Address and length of the Slave DMA data port
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
+      nand-controller@10b80000 {
+        compatible = "cdns,hp-nfc";
+        reg = <0x10b80000 0x10000>,
+            <0x10840000 0x10000>;
+        reg-names = "reg", "sdma";
+        #address-cells = <1>;
+        #size-cells = <0>;
+        interrupts = <0 97 4>;
+        clocks = <&nf_clk>;
+        cdns,board-delay-ps = <4830>;
+
+        nand@0 {
+            reg = <0>;
+        };
+      };
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
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
