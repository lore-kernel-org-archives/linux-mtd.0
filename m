Return-Path: <SRS0=r5sn=OE=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BED2DC433EF
	for <linux-mtd@archiver.kernel.org>; Tue, 14 Sep 2021 12:29:57 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 84AFC6109E
	for <linux-mtd@archiver.kernel.org>; Tue, 14 Sep 2021 12:29:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 84AFC6109E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wbelkVZp2iG9rbpjV8r1WGSK6S92jbZ25jBdGcXTOCg=; b=ZZia1QNjjrnF03
	eFvyGMQebYgqH5vw+pLjulKAsW9DH3nufrJzuhVW4oOHX/I+b3VOjWs+DKaA+J8hDubQW9ALukkR/
	hsCdxrCuB6IRi6pPD3LQlWfzQKA1u5iD+K/I4Sw6a6LhLtBgx9pk2QWQP6mTEaEwy5fs4I8k8dv1q
	z1GgEIw3WFsFli6LO1yAGUG15YZcz9tn9HKtpIFx04RBxJeZLDENJFoxfHsSw7DT9Vvqwhg73+xhN
	LGN0o5NkD5DYtxfcb9dM3atoNGX6BWzlWbNiL8nmR+ZmPeZZUK8N7YZ267jzFhyYPujlx3Sr5mgMf
	ggT26lSRs9U/Bjy9G3uQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mQ7Yv-005fO1-PW; Tue, 14 Sep 2021 12:29:21 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mQ7X7-005enH-D5
 for linux-mtd@lists.infradead.org; Tue, 14 Sep 2021 12:27:31 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id A5AAB610D1;
 Tue, 14 Sep 2021 12:27:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1631622449;
 bh=Bwud0fP3iNmVaqY9vJHe5wuYcTefF0iauOEY29BG9Oc=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=cxIrbJIx0PpGUuVOsqbM1sSzjYec2hfwcN6vBpM7b9BmUBavl4fv2xTn6BjtLLVV3
 /WLeT+cgam4dldPB/EVza4mdCMW/ukcbldV3WMMhUSP2Z5JcPkkrnb3TnGKPl+8q5T
 Xk4T7YoyxYLDP3GlN3n2YL//Am5kkcKVhVoa+IktAduRVh7WHdHlqJIHT0k7Yp+wQr
 776/YV42NeuYMoS+Qgl0tpjsAwL509tLaaV3x9AkZUuCpr5d/Mm4F+okPQzbnaxQaT
 x7MlmuzoZpYy8fWxHj/1RDnGLTeCVsbMFg0FzqPZ++DE2GUKwuUwmIut3y2wtP5N/o
 9jxiSJXaQMjZQ==
From: Roger Quadros <rogerq@kernel.org>
To: tony@atomide.com
Cc: robh+dt@kernel.org, grygorii.strashko@ti.com, nm@ti.com,
 lokeshvutla@ti.com, nsekhar@ti.com, krzysztof.kozlowski@canonical.com,
 miquel.raynal@bootlin.com, devicetree@vger.kernel.org,
 linux-mtd@lists.infradead.org, linux-omap@vger.kernel.org,
 linux-kernel@vger.kernel.org, Roger Quadros <rogerq@kernel.org>
Subject: [PATCH v4 6/8] dt-bindings: mtd: ti,gpmc-onenand: Convert to yaml
Date: Tue, 14 Sep 2021 15:27:03 +0300
Message-Id: <20210914122705.15421-7-rogerq@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210914122705.15421-1-rogerq@kernel.org>
References: <20210914122705.15421-1-rogerq@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210914_052729_517009_E52D3A33 
X-CRM114-Status: GOOD (  15.26  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Convert gpmc-onenand.txt to ti,gpmc-onenand.yaml.

Signed-off-by: Roger Quadros <rogerq@kernel.org>
---
 .../devicetree/bindings/mtd/gpmc-onenand.txt  | 48 -----------
 .../bindings/mtd/ti,gpmc-onenand.yaml         | 81 +++++++++++++++++++
 2 files changed, 81 insertions(+), 48 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/mtd/gpmc-onenand.txt
 create mode 100644 Documentation/devicetree/bindings/mtd/ti,gpmc-onenand.yaml

diff --git a/Documentation/devicetree/bindings/mtd/gpmc-onenand.txt b/Documentation/devicetree/bindings/mtd/gpmc-onenand.txt
deleted file mode 100644
index e9f01a963a0a..000000000000
--- a/Documentation/devicetree/bindings/mtd/gpmc-onenand.txt
+++ /dev/null
@@ -1,48 +0,0 @@
-Device tree bindings for GPMC connected OneNANDs
-
-GPMC connected OneNAND (found on OMAP boards) are represented as child nodes of
-the GPMC controller with a name of "onenand".
-
-All timing relevant properties as well as generic gpmc child properties are
-explained in a separate documents - please refer to
-Documentation/devicetree/bindings/memory-controllers/omap-gpmc.txt
-
-Required properties:
-
- - compatible:		"ti,omap2-onenand"
- - reg:			The CS line the peripheral is connected to
- - gpmc,device-width:	Width of the ONENAND device connected to the GPMC
-			in bytes. Must be 1 or 2.
-
-Optional properties:
-
- - int-gpios:		GPIO specifier for the INT pin.
-
-For inline partition table parsing (optional):
-
- - #address-cells: should be set to 1
- - #size-cells: should be set to 1
-
-Example for an OMAP3430 board:
-
-	gpmc: gpmc@6e000000 {
-		compatible = "ti,omap3430-gpmc";
-		ti,hwmods = "gpmc";
-		reg = <0x6e000000 0x1000000>;
-		interrupts = <20>;
-		gpmc,num-cs = <8>;
-		gpmc,num-waitpins = <4>;
-		#address-cells = <2>;
-		#size-cells = <1>;
-
-		onenand@0 {
-			compatible = "ti,omap2-onenand";
-			reg = <0 0 0>; /* CS0, offset 0 */
-			gpmc,device-width = <2>;
-
-			#address-cells = <1>;
-			#size-cells = <1>;
-
-			/* partitions go here */
-		};
-	};
diff --git a/Documentation/devicetree/bindings/mtd/ti,gpmc-onenand.yaml b/Documentation/devicetree/bindings/mtd/ti,gpmc-onenand.yaml
new file mode 100644
index 000000000000..42149a9c3a8d
--- /dev/null
+++ b/Documentation/devicetree/bindings/mtd/ti,gpmc-onenand.yaml
@@ -0,0 +1,81 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/mtd/ti,gpmc-onenand.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: OneNAND over Texas Instruments GPMC bus.
+
+maintainers:
+  - Tony Lindgren <tony@atomide.com>
+  - Roger Quadros <rogerq@kernel.org>
+
+description:
+  GPMC connected OneNAND (found on OMAP boards) are represented
+  as child nodes of the GPMC controller.
+
+properties:
+  compatible:
+    const: ti,omap2-onenand
+
+  reg:
+    items:
+      - description: |
+          Chip Select number, register offset and size of
+          OneNAND register window.
+
+  "#address-cells": true
+
+  "#size-cells": true
+
+  int-gpios:
+    description: GPIO specifier for the INT pin.
+
+patternProperties:
+  "@[0-9a-f]+$":
+    $ref: "/schemas/mtd/partitions/partition.yaml"
+
+allOf:
+  - $ref: "/schemas/memory-controllers/ti,gpmc-child.yaml"
+
+required:
+  - compatible
+  - reg
+  - "#address-cells"
+  - "#size-cells"
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    gpmc: memory-controller@6e000000 {
+      compatible = "ti,omap3430-gpmc";
+      reg = <0x6e000000 0x02d0>;
+      interrupts = <20>;
+      gpmc,num-cs = <8>;
+      gpmc,num-waitpins = <4>;
+      clocks = <&l3s_clkctrl>;
+      clock-names = "fck";
+      #address-cells = <2>;
+      #size-cells = <1>;
+
+      ranges = <0 0 0x01000000 0x01000000>,   /* 16 MB for OneNAND */
+               <1 0 0x02000000 0x01000000>;   /* 16 MB for smc91c96 */
+
+      onenand@0,0 {
+        compatible = "ti,omap2-onenand";
+        reg = <0 0 0x20000>;    /* CS0, offset 0, IO size 128K */
+        #address-cells = <1>;
+        #size-cells = <1>;
+
+        partition@0 {
+          label = "bootloader";
+          reg = <0x00000000 0x00100000>;
+        };
+
+        partition@1 {
+          label = "config";
+          reg = <0x00100000 0x002c0000>;
+        };
+      };
+    };
-- 
2.17.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
