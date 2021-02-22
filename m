Return-Path: <SRS0=UneP=HY=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3BC7AC433E0
	for <linux-mtd@archiver.kernel.org>; Mon, 22 Feb 2021 12:04:13 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CB26764E2E
	for <linux-mtd@archiver.kernel.org>; Mon, 22 Feb 2021 12:04:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CB26764E2E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=790Y+RU4cgSfLho61f2atoJOlxM9QHxiDrlD4ZVfXWg=; b=mMNh1ZYhpJg+9+BuifnB5Lmp1
	zUDtZD4rjl0tFZkGwwOe533cwETno7/aWHmZ6IJscyCligxqAf4yteV4pUi5e/89EW6HSmXyk49tf
	YXv3a8xkAGbN+Lxu5fV207Mot6gObpC8+LY3tBfCzcxakVn8dGY5SObvyu63+TlCAaJJhNtR69nR+
	7GoAXv/PQICQX9PewyEfCr5i4qPW2HztdZVRP64Erh82goM9Ihtl66a9QvWtifIXA3EmDchU1GSeQ
	TXa9v5PGKQ10+A9yJ+FSMjXsSh1QY2J4r71tUdDQmu3LLKttL0xJ6+guJRVIFMO/dRb0t/UE2XJ4C
	Ebvy7Vmsg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1lE9vv-0000ip-6e; Mon, 22 Feb 2021 12:03:23 +0000
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1lE9vr-0000i7-Km
 for linux-mtd@lists.infradead.org; Mon, 22 Feb 2021 12:03:20 +0000
Received: by mail-pj1-x102e.google.com with SMTP id t9so3684169pjl.5
 for <linux-mtd@lists.infradead.org>; Mon, 22 Feb 2021 04:03:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=bfZTeA+Jde84B+GicbEWi+k/3jsa4kFVqHGVsksw8n4=;
 b=xX13pPVBHE1S3IpqseDa3UL5xHd8s9ggTbKjQ2G961QjAm6mIRpW6OX2akRooT5buT
 RvQJpPtJAlRLfIBZZ703B0dzbr6Bs1e/WB3f52FqikZ4Wfb9syDPLIxUvTxgJEGCyOS3
 yXAspeJvUcBdJv3Oe1jLl9GH6X9uVIE5swdJG4dSl61WEaT9z8Bfasac3J5NkVLGoRoN
 bB/5dN9DUv5qIc1atatzwyYnsRPj3TIo0prmGZv18GI1D2O7ut1q8j8OKPpOMLvDsYKp
 cSM7RzCmiN6bSLYnt6Dyihe/e7EiRMdmeiFiXscuIMEV71RrkDgc4f5JeEIk3J1SNU/2
 sdDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=bfZTeA+Jde84B+GicbEWi+k/3jsa4kFVqHGVsksw8n4=;
 b=OpI/vunzv/esfDcHl16/+Ewh3hj0WlCzmYphCNg4px6iFxh7vND2DHBoOzBqqyhbjq
 WRiHr2fRWa5wzn3vOl4s8lahe3JpepZ2Ce0EL8gHr04qHjcBGzH4ZzO5/4zhiU1or4S/
 wXmuvBPr+MMqOtEoShUIWgM5dJKEwCgwDc8STT94ijqESeV5CyeQxDaZDOSt9eLE/3xn
 fYd42lQ1s4gaQSMiustQHIvsmjc6oif1dznKbipakz0RFCSJHN5vvvARRIFNZZMN+nKj
 27fEq57MvA670hkticvU2E3PjEVwZPhYEwGhKJQ3L644hBD81aWxRSDUHLWx5Of3kWGx
 TyfQ==
X-Gm-Message-State: AOAM531OxKexnyzgQWcxhZ+s8JCiKOJ0wbI8jik3qWrgY41heasEtWnV
 /3m61bybo3KmQf0JosAfTPcK
X-Google-Smtp-Source: ABdhPJw182LwYwQZ0ySOWWOa2L243+OZrXO8bVoORSOgu2R37DuZpYWvCRzucDGi6VAPpwBkGXtjWg==
X-Received: by 2002:a17:90a:2c9:: with SMTP id
 d9mr23231254pjd.67.1613995396699; 
 Mon, 22 Feb 2021 04:03:16 -0800 (PST)
Received: from localhost.localdomain
 ([2409:4072:6215:cc7b:cb8f:abf4:d1c9:3864])
 by smtp.gmail.com with ESMTPSA id g17sm17017221pfh.14.2021.02.22.04.03.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Feb 2021 04:03:16 -0800 (PST)
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
 robh+dt@kernel.org
Subject: [PATCH 1/3] dt-bindings: mtd: Convert Qcom NANDc binding to YAML
Date: Mon, 22 Feb 2021 17:32:57 +0530
Message-Id: <20210222120259.94465-2-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210222120259.94465-1-manivannan.sadhasivam@linaro.org>
References: <20210222120259.94465-1-manivannan.sadhasivam@linaro.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210222_070319_695165_2C95314D 
X-CRM114-Status: GOOD (  18.37  )
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
Cc: devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, boris.brezillon@collabora.com,
 linux-mtd@lists.infradead.org,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Convert Qcom NANDc devicetree binding to YAML.

Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 .../devicetree/bindings/mtd/qcom,nandc.yaml   | 196 ++++++++++++++++++
 .../devicetree/bindings/mtd/qcom_nandc.txt    | 142 -------------
 2 files changed, 196 insertions(+), 142 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/mtd/qcom,nandc.yaml
 delete mode 100644 Documentation/devicetree/bindings/mtd/qcom_nandc.txt

diff --git a/Documentation/devicetree/bindings/mtd/qcom,nandc.yaml b/Documentation/devicetree/bindings/mtd/qcom,nandc.yaml
new file mode 100644
index 000000000000..84ad7ff30121
--- /dev/null
+++ b/Documentation/devicetree/bindings/mtd/qcom,nandc.yaml
@@ -0,0 +1,196 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/mtd/qcom,nandc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm NAND controller
+
+maintainers:
+  - Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
+
+properties:
+  compatible:
+    enum:
+      - qcom,ipq806x-nand
+      - qcom,ipq4019-nand
+      - qcom,ipq6018-nand
+      - qcom,ipq8074-nand
+      - qcom,sdx55-nand
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: Core Clock
+      - description: Always ON Clock
+
+  clock-names:
+    items:
+      - const: core
+      - const: aon
+
+  "#address-cells": true
+  "#size-cells": true
+
+patternProperties:
+  "^nand@[a-f0-9]$":
+    type: object
+    properties:
+      nand-bus-width:
+        const: 8
+
+      nand-ecc-strength:
+        enum: [1, 4, 8]
+
+      nand-ecc-step-size:
+        enum:
+          - 512
+
+allOf:
+  - $ref: "nand-controller.yaml#"
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: qcom,ipq806x-nand
+    then:
+      properties:
+        dmas:
+          items:
+            - description: rxtx DMA channel
+
+        dma-names:
+          items:
+            - const: rxtx
+
+        qcom,cmd-crci:
+          $ref: /schemas/types.yaml#/definitions/uint32
+          description:
+            Must contain the ADM command type CRCI block instance number
+            specified for the NAND controller on the given platform
+
+        qcom,data-crci:
+          $ref: /schemas/types.yaml#/definitions/uint32
+          description:
+            Must contain the ADM data type CRCI block instance number
+            specified for the NAND controller on the given platform
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - qcom,ipq4019-nand
+              - qcom,ipq6018-nand
+              - qcom,ipq8074-nand
+              - qcom,sdx55-nand
+
+    then:
+      properties:
+        dmas:
+          items:
+            - description: tx DMA channel
+            - description: rx DMA channel
+            - description: cmd DMA channel
+
+        dma-names:
+          items:
+            - const: tx
+            - const: rx
+            - const: cmd
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - clock-names
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/qcom,gcc-ipq806x.h>
+    nand-controller@1ac00000 {
+      compatible = "qcom,ipq806x-nand";
+      reg = <0x1ac00000 0x800>;
+
+      clocks = <&gcc EBI2_CLK>,
+               <&gcc EBI2_AON_CLK>;
+      clock-names = "core", "aon";
+
+      dmas = <&adm_dma 3>;
+      dma-names = "rxtx";
+      qcom,cmd-crci = <15>;
+      qcom,data-crci = <3>;
+
+      #address-cells = <1>;
+      #size-cells = <0>;
+
+      nand@0 {
+        reg = <0>;
+
+        nand-ecc-strength = <4>;
+        nand-bus-width = <8>;
+
+        partitions {
+          compatible = "fixed-partitions";
+          #address-cells = <1>;
+          #size-cells = <1>;
+
+          partition@0 {
+            label = "boot-nand";
+            reg = <0 0x58a0000>;
+          };
+
+          partition@58a0000 {
+            label = "fs-nand";
+            reg = <0x58a0000 0x4000000>;
+          };
+        };
+      };
+    };
+
+    #include <dt-bindings/clock/qcom,gcc-ipq4019.h>
+    nand-controller@79b0000 {
+      compatible = "qcom,ipq4019-nand";
+      reg = <0x79b0000 0x1000>;
+
+      clocks = <&gcc GCC_QPIC_CLK>,
+               <&gcc GCC_QPIC_AHB_CLK>;
+      clock-names = "core", "aon";
+
+      dmas = <&qpicbam 0>,
+             <&qpicbam 1>,
+             <&qpicbam 2>;
+      dma-names = "tx", "rx", "cmd";
+
+      #address-cells = <1>;
+      #size-cells = <0>;
+
+      nand@0 {
+        reg = <0>;
+        nand-ecc-strength = <4>;
+        nand-bus-width = <8>;
+
+        partitions {
+          compatible = "fixed-partitions";
+          #address-cells = <1>;
+          #size-cells = <1>;
+
+          partition@0 {
+            label = "boot-nand";
+            reg = <0 0x58a0000>;
+          };
+
+          partition@58a0000 {
+            label = "fs-nand";
+            reg = <0x58a0000 0x4000000>;
+          };
+        };
+      };
+    };
+
+...
diff --git a/Documentation/devicetree/bindings/mtd/qcom_nandc.txt b/Documentation/devicetree/bindings/mtd/qcom_nandc.txt
deleted file mode 100644
index 5647913d8837..000000000000
--- a/Documentation/devicetree/bindings/mtd/qcom_nandc.txt
+++ /dev/null
@@ -1,142 +0,0 @@
-* Qualcomm NAND controller
-
-Required properties:
-- compatible:		must be one of the following:
-    * "qcom,ipq806x-nand" - for EBI2 NAND controller being used in IPQ806x
-			    SoC and it uses ADM DMA
-    * "qcom,ipq4019-nand" - for QPIC NAND controller v1.4.0 being used in
-                            IPQ4019 SoC and it uses BAM DMA
-    * "qcom,ipq6018-nand" - for QPIC NAND controller v1.5.0 being used in
-                            IPQ6018 SoC and it uses BAM DMA
-    * "qcom,ipq8074-nand" - for QPIC NAND controller v1.5.0 being used in
-                            IPQ8074 SoC and it uses BAM DMA
-    * "qcom,sdx55-nand"   - for QPIC NAND controller v2.0.0 being used in
-                            SDX55 SoC and it uses BAM DMA
-
-- reg:			MMIO address range
-- clocks:		must contain core clock and always on clock
-- clock-names:		must contain "core" for the core clock and "aon" for the
-			always on clock
-
-EBI2 specific properties:
-- dmas:			DMA specifier, consisting of a phandle to the ADM DMA
-			controller node and the channel number to be used for
-			NAND. Refer to dma.txt and qcom_adm.txt for more details
-- dma-names:		must be "rxtx"
-- qcom,cmd-crci:	must contain the ADM command type CRCI block instance
-			number specified for the NAND controller on the given
-			platform
-- qcom,data-crci:	must contain the ADM data type CRCI block instance
-			number specified for the NAND controller on the given
-			platform
-
-QPIC specific properties:
-- dmas:			DMA specifier, consisting of a phandle to the BAM DMA
-			and the channel number to be used for NAND. Refer to
-			dma.txt, qcom_bam_dma.txt for more details
-- dma-names:		must contain all 3 channel names : "tx", "rx", "cmd"
-- #address-cells:	<1> - subnodes give the chip-select number
-- #size-cells:		<0>
-
-* NAND chip-select
-
-Each controller may contain one or more subnodes to represent enabled
-chip-selects which (may) contain NAND flash chips. Their properties are as
-follows.
-
-Required properties:
-- reg:			a single integer representing the chip-select
-			number (e.g., 0, 1, 2, etc.)
-- #address-cells:	see partition.txt
-- #size-cells:		see partition.txt
-
-Optional properties:
-- nand-bus-width:	see nand-controller.yaml
-- nand-ecc-strength:	see nand-controller.yaml. If not specified, then ECC strength will
-			be used according to chip requirement and available
-			OOB size.
-
-Each nandcs device node may optionally contain a 'partitions' sub-node, which
-further contains sub-nodes describing the flash partition mapping. See
-partition.txt for more detail.
-
-Example:
-
-nand-controller@1ac00000 {
-	compatible = "qcom,ipq806x-nand";
-	reg = <0x1ac00000 0x800>;
-
-	clocks = <&gcc EBI2_CLK>,
-		 <&gcc EBI2_AON_CLK>;
-	clock-names = "core", "aon";
-
-	dmas = <&adm_dma 3>;
-	dma-names = "rxtx";
-	qcom,cmd-crci = <15>;
-	qcom,data-crci = <3>;
-
-	#address-cells = <1>;
-	#size-cells = <0>;
-
-	nand@0 {
-		reg = <0>;
-
-		nand-ecc-strength = <4>;
-		nand-bus-width = <8>;
-
-		partitions {
-			compatible = "fixed-partitions";
-			#address-cells = <1>;
-			#size-cells = <1>;
-
-			partition@0 {
-				label = "boot-nand";
-				reg = <0 0x58a0000>;
-			};
-
-			partition@58a0000 {
-				label = "fs-nand";
-				reg = <0x58a0000 0x4000000>;
-			};
-		};
-	};
-};
-
-nand-controller@79b0000 {
-	compatible = "qcom,ipq4019-nand";
-	reg = <0x79b0000 0x1000>;
-
-	clocks = <&gcc GCC_QPIC_CLK>,
-		<&gcc GCC_QPIC_AHB_CLK>;
-	clock-names = "core", "aon";
-
-	dmas = <&qpicbam 0>,
-		<&qpicbam 1>,
-		<&qpicbam 2>;
-	dma-names = "tx", "rx", "cmd";
-
-	#address-cells = <1>;
-	#size-cells = <0>;
-
-	nand@0 {
-		reg = <0>;
-		nand-ecc-strength = <4>;
-		nand-bus-width = <8>;
-
-		partitions {
-			compatible = "fixed-partitions";
-			#address-cells = <1>;
-			#size-cells = <1>;
-
-			partition@0 {
-				label = "boot-nand";
-				reg = <0 0x58a0000>;
-			};
-
-			partition@58a0000 {
-				label = "fs-nand";
-				reg = <0x58a0000 0x4000000>;
-			};
-		};
-	};
-};
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
