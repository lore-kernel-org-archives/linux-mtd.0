Return-Path: <SRS0=WWUw=ZN=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7764EC43141
	for <linux-mtd@archiver.kernel.org>; Thu, 21 Nov 2019 13:06:57 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4DED5208A1
	for <linux-mtd@archiver.kernel.org>; Thu, 21 Nov 2019 13:06:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="DW5zvuej";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=st.com header.i=@st.com header.b="f81Mnilf"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4DED5208A1
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=st.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=WunTKpBtir3ekv8oYocfNPCFyI1tnvk0BhlKB0e+s0M=; b=DW5zvuej4iXzi7
	QT4/EMqJWfyRWKX+UP6pp4cYpx0xpJzOM7riuH1xzYIBGTDi4UTTsg1iv6wLzKl8z8PNOl9yLCXhd
	OpzMBf47/59r/NZUk0OiFwNFl0L138DtyT2fj9KrVmFJQnyeX/bhaXMuIDtpwkr0CoZiACOVSXpJP
	vYHbn6xZzwkSG2wb5/3IYa4Uq07bCuXfzB2f7Ip2SNRLH8tj76eB5AsAM3NjvSzJwgEH99FdQzWCL
	poacw/+ZHM+11QvyAKz57Om0v1YGT9NAuL8ndU6r+vGeNqQgI33RTcZovmLuG7l0migNy3VugLstP
	Hzh+MvLwtBaU9tZWFHdw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iXmAV-0007lL-6d; Thu, 21 Nov 2019 13:06:43 +0000
Received: from mx07-00178001.pphosted.com ([62.209.51.94])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iXmAP-0007kc-QW; Thu, 21 Nov 2019 13:06:39 +0000
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 xALD2sic023372; Thu, 21 Nov 2019 14:06:22 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-type; s=STMicroelectronics;
 bh=CZLchOtGzzjkcSU/Amhs8d3lsV5kVJY44jLWirDhTC0=;
 b=f81Mnilf5iGhL2LVdhHNWiAXVKxuTj+fahFGZ0UGGF98dtC6xBdnPZ5VHJbLDz3yn+cy
 RHyJ5BxJDsIBVzaIDnidRfHI4HBF4O9MKtavjH5uZeR/00DETFhqL5hnFdiKH77Z8DAq
 Kl3O/VN9wZ9dZuIplkr47jsngG7jqv1/m+pquWGXP8KZ2TvTU7cskgJFLQZwx4Pr4QIq
 zovQii3tRWUBj1lH/drLHLk1HsKaQLIrnJCnBNoNS1oL3FqD77F0w272F8R6K4YqtLPv
 876iSdjvLmYqMI/bfUWaFrZfh0kIXXk/pYSD7eRILyKuLF7n4/NT1hbfb8ujne9feRT4 9g== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2wa9uskdhk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 21 Nov 2019 14:06:22 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 48B83100039;
 Thu, 21 Nov 2019 14:06:17 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag3node3.st.com [10.75.127.9])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 2E59C2BEC5B;
 Thu, 21 Nov 2019 14:06:17 +0100 (CET)
Received: from localhost (10.75.127.49) by SFHDAG3NODE3.st.com (10.75.127.9)
 with Microsoft SMTP Server (TLS) id 15.0.1347.2; Thu, 21 Nov 2019 14:06:16
 +0100
From: Benjamin Gaignard <benjamin.gaignard@st.com>
To: <dwmw2@infradead.org>, <computersforpeace@gmail.com>,
 <marek.vasut@gmail.com>, <miquel.raynal@bootlin.com>, <richard@nod.at>,
 <vigneshr@ti.com>, <robh+dt@kernel.org>, <mark.rutland@arm.com>,
 <alexandre.torgue@st.com>, <linux-stm32@st-md-mailman.stormreply.com>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH] dt-bindings: mtd: Convert stm32 fmc2-nand bindings to
 json-schema
Date: Thu, 21 Nov 2019 14:06:15 +0100
Message-ID: <20191121130615.13007-1-benjamin.gaignard@st.com>
X-Mailer: git-send-email 2.15.0
MIME-Version: 1.0
X-Originating-IP: [10.75.127.49]
X-ClientProxiedBy: SFHDAG4NODE3.st.com (10.75.127.12) To SFHDAG3NODE3.st.com
 (10.75.127.9)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,18.0.572
 definitions=2019-11-21_02:2019-11-21,2019-11-21 signatures=0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191121_050638_223940_4A1A1ED1 
X-CRM114-Status: GOOD (  16.97  )
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
Cc: devicetree@vger.kernel.org, Christophe Kerello <christophe.kerello@st.com>,
 linux-mtd@lists.infradead.org, Benjamin Gaignard <benjamin.gaignard@st.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Convert the STM32 fmc2-nand binding to DT schema format using json-schema

Signed-off-by: Benjamin Gaignard <benjamin.gaignard@st.com>
CC: Christophe Kerello <christophe.kerello@st.com>
---
 .../bindings/mtd/st,stm32-fmc2-nand.yaml           | 98 ++++++++++++++++++++++
 .../devicetree/bindings/mtd/stm32-fmc2-nand.txt    | 61 --------------
 2 files changed, 98 insertions(+), 61 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/mtd/st,stm32-fmc2-nand.yaml
 delete mode 100644 Documentation/devicetree/bindings/mtd/stm32-fmc2-nand.txt

diff --git a/Documentation/devicetree/bindings/mtd/st,stm32-fmc2-nand.yaml b/Documentation/devicetree/bindings/mtd/st,stm32-fmc2-nand.yaml
new file mode 100644
index 000000000000..b059267f6d20
--- /dev/null
+++ b/Documentation/devicetree/bindings/mtd/st,stm32-fmc2-nand.yaml
@@ -0,0 +1,98 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/mtd/st,stm32-fmc2-nand.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: STMicroelectronics Flexible Memory Controller 2 (FMC2) Bindings
+
+maintainers:
+  - Christophe Kerello <christophe.kerello@st.com>
+
+allOf:
+  - $ref: "nand-controller.yaml#"
+
+properties:
+  compatible:
+    const: st,stm32mp15-fmc2
+
+  reg:
+    items:
+      - description: Registers
+      - description: Chip select 0 data
+      - description: Chip select 0 command
+      - description: Chip select 0 address space
+      - description: Chip select 1 data
+      - description: Chip select 1 command
+      - description: Chip select 1 address space
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+  resets:
+    maxItems: 1
+
+  dmas:
+    items:
+      - description: tx DMA channel
+      - description: rx DMA channel
+      - description: ecc DMA channel
+
+  dma-names:
+    items:
+      - const: tx
+      - const: rx
+      - const: ecc
+
+patternProperties:
+  "^nand@[a-f0-9]$":
+    type: object
+    properties:
+      nand-ecc-step-size:
+        const: 512
+
+      nand-ecc-strength:
+        enum: [1, 4 ,8 ]
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - clocks
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/clock/stm32mp1-clks.h>
+    #include <dt-bindings/reset/stm32mp1-resets.h>
+    nand-controller@58002000 {
+      compatible = "st,stm32mp15-fmc2";
+      reg = <0x58002000 0x1000>,
+            <0x80000000 0x1000>,
+            <0x88010000 0x1000>,
+            <0x88020000 0x1000>,
+            <0x81000000 0x1000>,
+            <0x89010000 0x1000>,
+            <0x89020000 0x1000>;
+            interrupts = <GIC_SPI 48 IRQ_TYPE_LEVEL_HIGH>;
+            dmas = <&mdma1 20 0x10 0x12000a02 0x0 0x0>,
+                   <&mdma1 20 0x10 0x12000a08 0x0 0x0>,
+                   <&mdma1 21 0x10 0x12000a0a 0x0 0x0>;
+            dma-names = "tx", "rx", "ecc";
+            clocks = <&rcc FMC_K>;
+            resets = <&rcc FMC_R>;
+      #address-cells = <1>;
+      #size-cells = <0>;
+
+      nand@0 {
+        reg = <0>;
+        nand-on-flash-bbt;
+        #address-cells = <1>;
+        #size-cells = <1>;
+      };
+    };
+
+...
diff --git a/Documentation/devicetree/bindings/mtd/stm32-fmc2-nand.txt b/Documentation/devicetree/bindings/mtd/stm32-fmc2-nand.txt
deleted file mode 100644
index e55895e8dae4..000000000000
--- a/Documentation/devicetree/bindings/mtd/stm32-fmc2-nand.txt
+++ /dev/null
@@ -1,61 +0,0 @@
-STMicroelectronics Flexible Memory Controller 2 (FMC2)
-NAND Interface
-
-Required properties:
-- compatible: Should be one of:
-              * st,stm32mp15-fmc2
-- reg: NAND flash controller memory areas.
-       First region contains the register location.
-       Regions 2 to 4 respectively contain the data, command,
-       and address space for CS0.
-       Regions 5 to 7 contain the same areas for CS1.
-- interrupts: The interrupt number
-- pinctrl-0: Standard Pinctrl phandle (see: pinctrl/pinctrl-bindings.txt)
-- clocks: The clock needed by the NAND flash controller
-
-Optional properties:
-- resets: Reference to a reset controller asserting the FMC controller
-- dmas: DMA specifiers (see: dma/stm32-mdma.txt)
-- dma-names: Must be "tx", "rx" and "ecc"
-
-* NAND device bindings:
-
-Required properties:
-- reg: describes the CS lines assigned to the NAND device.
-
-Optional properties:
-- nand-on-flash-bbt: see nand-controller.yaml
-- nand-ecc-strength: see nand-controller.yaml
-- nand-ecc-step-size: see nand-controller.yaml
-
-The following ECC strength and step size are currently supported:
- - nand-ecc-strength = <1>, nand-ecc-step-size = <512> (Hamming)
- - nand-ecc-strength = <4>, nand-ecc-step-size = <512> (BCH4)
- - nand-ecc-strength = <8>, nand-ecc-step-size = <512> (BCH8) (default)
-
-Example:
-
-	fmc: nand-controller@58002000 {
-		compatible = "st,stm32mp15-fmc2";
-		reg = <0x58002000 0x1000>,
-		      <0x80000000 0x1000>,
-		      <0x88010000 0x1000>,
-		      <0x88020000 0x1000>,
-		      <0x81000000 0x1000>,
-		      <0x89010000 0x1000>,
-		      <0x89020000 0x1000>;
-		interrupts = <GIC_SPI 48 IRQ_TYPE_LEVEL_HIGH>;
-		clocks = <&rcc FMC_K>;
-		resets = <&rcc FMC_R>;
-		pinctrl-names = "default";
-		pinctrl-0 = <&fmc_pins_a>;
-		#address-cells = <1>;
-		#size-cells = <0>;
-
-		nand@0 {
-			reg = <0>;
-			nand-on-flash-bbt;
-			#address-cells = <1>;
-			#size-cells = <1>;
-		};
-	};
-- 
2.15.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
