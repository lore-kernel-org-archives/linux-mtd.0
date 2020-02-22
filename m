Return-Path: <SRS0=xqJM=4K=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB2D1C35666
	for <linux-mtd@archiver.kernel.org>; Sat, 22 Feb 2020 14:20:31 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 735F4206ED
	for <linux-mtd@archiver.kernel.org>; Sat, 22 Feb 2020 14:20:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="eZuOUspr";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=nifty.com header.i=@nifty.com header.b="Z1nJarhy"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 735F4206ED
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=socionext.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=86j+8FcO2ylTH6Rdxm3nBobCeei6z3wVgCuBaye3wns=; b=eZu
	OUsprToLLPXzyCTbMjXnWOgzldQY3c440ddSTWDun1YRpe8oGENDZQBwYxytIL8mOX5823DPJwfJ3
	xTUnWZ43h1u2IZDLkpjNkRutpzykwqlzi3tlHy9YecqbgPh+7OUFv1BgW69lTYhuGGlnxCxlpSnUc
	b8ISOhkfWq1cp9moLkd35AlY1/lbmwn7hBpOYHpxXPg8KghmCdmRAF0Ex29HoR45LUSqAUsgdO3uZ
	VOiLmODsr10q1MKG3kc7bXtJ/2LwZbGv/n+ChmvCvxrX3ZFLnl1529AYwRbPBxNvGeTT3WFfWwROu
	OVq32gS8It/hY3BfedeG0pUwX0Ccncw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j5Vdg-0006mf-BA; Sat, 22 Feb 2020 14:20:16 +0000
Received: from conuserg-09.nifty.com ([210.131.2.76])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j5VdY-0006H1-U5
 for linux-mtd@lists.infradead.org; Sat, 22 Feb 2020 14:20:11 +0000
Received: from grover.flets-west.jp (softbank126093102113.bbtec.net
 [126.93.102.113]) (authenticated)
 by conuserg-09.nifty.com with ESMTP id 01MEJTnM022196;
 Sat, 22 Feb 2020 23:19:29 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-09.nifty.com 01MEJTnM022196
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
 s=dec2015msa; t=1582381170;
 bh=xLfxSqfVKee2lu25Ls16f9ofw1JrrI1YOJYCrR/A9ww=;
 h=From:To:Cc:Subject:Date:From;
 b=Z1nJarhyQa+8kEp+a50668sXTKIeHbOUmeuxpWJ/7laBumpVZcf+lDWSop49+cqCL
 qLY0tyHCynquHJyXhA2fsJvqOgIEj1CJFrWu53DfXy64pWwGYTUjEc6WODhrSTPGyP
 Zhygi0xH/SqMQn/Uo+cpmHhNdenVoKB0onH1HqtgKf6vyD8J/RSi4F5vLeVAOw+vCo
 TRcszV/r0DbaezK3gSZzXoH9NfxHYtDe8dmwXFKzHf5V9R5NdBqA2XgP5e8B15E/gk
 kzwopZb9AsYUMQxpc1eDX64kM6+F3k++0w6peC1nqJuu9Dg9O8QAojyz97oLIurv+S
 DeFSuzD5wIVnQ==
X-Nifty-SrcIP: [126.93.102.113]
From: Masahiro Yamada <yamada.masahiro@socionext.com>
To: Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org
Subject: [PATCH] dt-bindings: mtd: Convert Denali NAND controller to
 json-schema
Date: Sat, 22 Feb 2020 23:19:26 +0900
Message-Id: <20200222141927.3868-1-yamada.masahiro@socionext.com>
X-Mailer: git-send-email 2.17.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200222_062009_317768_AFC36C38 
X-CRM114-Status: GOOD (  10.26  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, Vignesh Raghavendra <vigneshr@ti.com>,
 Richard Weinberger <richard@nod.at>, masahiroy@kernel.org,
 linux-kernel@vger.kernel.org, Masahiro Yamada <yamada.masahiro@socionext.com>,
 linux-mtd@lists.infradead.org, Miquel Raynal <miquel.raynal@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Convert the Denali NAND controller binding to DT schema format.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 .../devicetree/bindings/mtd/denali,nand.yaml  | 149 ++++++++++++++++++
 .../devicetree/bindings/mtd/denali-nand.txt   |  61 -------
 2 files changed, 149 insertions(+), 61 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/mtd/denali,nand.yaml
 delete mode 100644 Documentation/devicetree/bindings/mtd/denali-nand.txt

diff --git a/Documentation/devicetree/bindings/mtd/denali,nand.yaml b/Documentation/devicetree/bindings/mtd/denali,nand.yaml
new file mode 100644
index 000000000000..b41b7e4bfe78
--- /dev/null
+++ b/Documentation/devicetree/bindings/mtd/denali,nand.yaml
@@ -0,0 +1,149 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/mtd/denali,nand.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Denali NAND controller
+
+maintainers:
+  - Masahiro Yamada <yamada.masahiro@socionext.com>
+
+properties:
+  compatible:
+    description: version 2.91, 3.1, 3.1.1, respectively
+    enum:
+      - altr,socfpga-denali-nand
+      - socionext,uniphier-denali-nand-v5a
+      - socionext,uniphier-denali-nand-v5b
+
+  reg-names:
+    description: |
+      There are two register regions:
+        nand_data:  host data/command interface
+        denali_reg: register interface
+    items:
+      - const: nand_data
+      - const: denali_reg
+
+  reg:
+    minItems: 2
+    maxItems: 2
+
+  interrupts:
+    maxItems: 1
+
+  clock-names:
+    description: |
+      There are three clocks:
+        nand:   controller core clock
+        nand_x: bus interface clock
+        ecc:    ECC circuit clock
+    items:
+      - const: nand
+      - const: nand_x
+      - const: ecc
+
+  clocks:
+    minItems: 3
+    maxItems: 3
+
+  reset-names:
+    description: |
+      There are two optional resets:
+        nand: controller core reset
+        reg:  register reset
+    oneOf:
+      - items:
+        - const: nand
+        - const: reg
+      - const: nand
+      - const: reg
+
+  resets:
+    minItems: 1
+    maxItems: 2
+
+allOf:
+  - $ref: nand-controller.yaml
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: altr,socfpga-denali-nand
+    then:
+      patternProperties:
+        "^nand@[a-f0-9]$":
+          type: object
+          properties:
+            nand-ecc-strength:
+              enum:
+                - 8
+                - 15
+            nand-ecc-step-size:
+              enum:
+                - 512
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: socionext,uniphier-denali-nand-v5a
+    then:
+      patternProperties:
+        "^nand@[a-f0-9]$":
+          type: object
+          properties:
+            nand-ecc-strength:
+              enum:
+                - 8
+                - 16
+                - 24
+            nand-ecc-step-size:
+              enum:
+                - 1024
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: socionext,uniphier-denali-nand-v5b
+    then:
+      patternProperties:
+        "^nand@[a-f0-9]$":
+          type: object
+          properties:
+            nand-ecc-strength:
+              enum:
+                - 8
+                - 16
+            nand-ecc-step-size:
+              enum:
+                - 1024
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - clock-names
+  - clocks
+
+examples:
+  - |
+    nand-controller@ff900000 {
+        compatible = "altr,socfpga-denali-nand";
+        reg-names = "nand_data", "denali_reg";
+        reg = <0xff900000 0x20>, <0xffb80000 0x1000>;
+        interrupts = <0 144 4>;
+        clock-names = "nand", "nand_x", "ecc";
+        clocks = <&nand_clk>, <&nand_x_clk>, <&nand_ecc_clk>;
+        reset-names = "nand", "reg";
+        resets = <&nand_rst>, <&nand_reg_rst>;
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        nand@0 {
+                reg = <0>;
+        };
+    };
diff --git a/Documentation/devicetree/bindings/mtd/denali-nand.txt b/Documentation/devicetree/bindings/mtd/denali-nand.txt
deleted file mode 100644
index 98916a84bbf6..000000000000
--- a/Documentation/devicetree/bindings/mtd/denali-nand.txt
+++ /dev/null
@@ -1,61 +0,0 @@
-* Denali NAND controller
-
-Required properties:
-  - compatible : should be one of the following:
-      "altr,socfpga-denali-nand"            - for Altera SOCFPGA
-      "socionext,uniphier-denali-nand-v5a"  - for Socionext UniPhier (v5a)
-      "socionext,uniphier-denali-nand-v5b"  - for Socionext UniPhier (v5b)
-  - reg : should contain registers location and length for data and reg.
-  - reg-names: Should contain the reg names "nand_data" and "denali_reg"
-  - #address-cells: should be 1. The cell encodes the chip select connection.
-  - #size-cells : should be 0.
-  - interrupts : The interrupt number.
-  - clocks: should contain phandle of the controller core clock, the bus
-    interface clock, and the ECC circuit clock.
-  - clock-names: should contain "nand", "nand_x", "ecc"
-
-Optional properties:
-  - resets: may contain phandles to the controller core reset, the register
-    reset
-  - reset-names: may contain "nand", "reg"
-
-Sub-nodes:
-  Sub-nodes represent available NAND chips.
-
-  Required properties:
-    - reg: should contain the bank ID of the controller to which each chip
-      select is connected.
-
-  Optional properties:
-    - nand-ecc-step-size: see nand-controller.yaml for details.
-      If present, the value must be
-        512        for "altr,socfpga-denali-nand"
-        1024       for "socionext,uniphier-denali-nand-v5a"
-        1024       for "socionext,uniphier-denali-nand-v5b"
-    - nand-ecc-strength: see nand-controller.yaml for details. Valid values are:
-        8, 15      for "altr,socfpga-denali-nand"
-        8, 16, 24  for "socionext,uniphier-denali-nand-v5a"
-        8, 16      for "socionext,uniphier-denali-nand-v5b"
-    - nand-ecc-maximize: see nand-controller.yaml for details
-
-The chip nodes may optionally contain sub-nodes describing partitions of the
-address space. See partition.txt for more detail.
-
-Examples:
-
-nand: nand@ff900000 {
-	#address-cells = <1>;
-	#size-cells = <0>;
-	compatible = "altr,socfpga-denali-nand";
-	reg = <0xff900000 0x20>, <0xffb80000 0x1000>;
-	reg-names = "nand_data", "denali_reg";
-	clocks = <&nand_clk>, <&nand_x_clk>, <&nand_ecc_clk>;
-	clock-names = "nand", "nand_x", "ecc";
-	resets = <&nand_rst>, <&nand_reg_rst>;
-	reset-names = "nand", "reg";
-	interrupts = <0 144 4>;
-
-	nand@0 {
-		reg = <0>;
-	}
-};
-- 
2.17.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
