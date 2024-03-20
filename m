Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CDD29C54E58
	for <linux-mtd@archiver.kernel.org>; Wed, 20 Mar 2024 05:53:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References:Message-ID
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=T5LEsHbFSjjQe9mT3VPiZZ0ivYbNWsDV3TU5xo1tgZM=; b=n6n8eEN9NOxEfA
	NblkYPf48ciusDwDjXC/tXZQufHSFxv4mpvAAm/qT+7QWOCNx8LfAQh9tT33seLu1SwRRgULfrxTE
	nqsClvjPyChquQlotrIBUcjvJoVNCe5bvdt4EdH82FFpvhP87NXPKsOMGz6ZI2+8Xcssvdiv7/zOk
	zEULgf1SLRIS4n3CPyYfjb7Yv/ZBd1/lVXa+cm5R/Q0BlxfB/fkWFY6pNsHBGDqO5P+LYPneuuaeu
	4NLsTty1tVCU+uGo+c9Uk1pAvk04QsSB64Kuf/s32HkTorx4X2YI3SV0OqgK4+tMNj0u2ami7pviu
	UGVHgqv4XZgpSfZwPl1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rmot7-0000000FZ6T-3Cdo;
	Wed, 20 Mar 2024 05:53:21 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rmot3-0000000FZ3q-3SPr;
	Wed, 20 Mar 2024 05:53:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1710913998; x=1742449998;
  h=from:date:subject:mime-version:content-transfer-encoding:
   message-id:references:in-reply-to:to:cc;
  bh=++8vvQ5hirZaSfFCqLhFu4Spw6Ti2cR5DDvaSvz/peI=;
  b=E6SqaW6vOFWRC4WndKnUzgy38nWUmqCQbxxzUlomoxLbVYOD6rkBFvKK
   BgBka8eggDDWsja3Q5M2uVPWK6ocLvEgSnpdi91BfTT/DIK3rz9BthzCJ
   qWDvcRch5t2YyO5nfvsx5wnm++0KFKWc+YKyx+DG3Ux9N/jCPPzNegIFz
   MkAosqFs82M/vW3Mb/0T3JH48O6gltfsERrupuESiGGHW94232z4mak44
   rqA2eIp852jla3ZNwrF+c0fESwKYYI7tl/NsHWLymdGjBzybdhiruRaaB
   dzlHUSCv5Ibq5e5CaOPUlke5i/3+haU22eLZ5C+8DQcb5sVeN92UQV6sC
   A==;
X-CSE-ConnectionGUID: pwKNWpSMQSid8NZ/wklJJA==
X-CSE-MsgGUID: UF2ibNYSTCWylwLOawa1NQ==
X-IronPort-AV: E=Sophos;i="6.07,139,1708412400"; 
   d="scan'208";a="17887323"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa3.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 19 Mar 2024 22:53:15 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 19 Mar 2024 22:53:05 -0700
Received: from che-lt-i64410lx.microchip.com (10.10.85.11) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server id
 15.1.2507.35 via Frontend Transport; Tue, 19 Mar 2024 22:52:57 -0700
From: Balamanikandan Gunasundar <balamanikandan.gunasundar@microchip.com>
Date: Wed, 20 Mar 2024 11:22:08 +0530
Subject: [PATCH 2/3] dt-bindings: mtd: atmel-nand: add atmel pmecc
MIME-Version: 1.0
Message-ID: <20240320-linux-next-nand-yaml-v1-2-2d2495363e88@microchip.com>
References: <20240320-linux-next-nand-yaml-v1-0-2d2495363e88@microchip.com>
In-Reply-To: <20240320-linux-next-nand-yaml-v1-0-2d2495363e88@microchip.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger
	<richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, Rob Herring
	<robh@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>, Nicolas Ferre
	<nicolas.ferre@microchip.com>, Alexandre Belloni
	<alexandre.belloni@bootlin.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>
CC: <linux-mtd@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	Balamanikandan Gunasundar <balamanikandan.gunasundar@microchip.com>
X-Mailer: b4 0.13.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240319_225318_082809_CBF29440 
X-CRM114-Status: GOOD (  16.48  )
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

Add bindings for programmable multibit error correction code controller
(PMECC).

Signed-off-by: Balamanikandan Gunasundar <balamanikandan.gunasundar@microchip.com>
---
 .../devicetree/bindings/mtd/atmel-nand.txt         | 70 ----------------------
 .../devicetree/bindings/mtd/atmel-pmecc.yaml       | 58 ++++++++++++++++++
 2 files changed, 58 insertions(+), 70 deletions(-)

diff --git a/Documentation/devicetree/bindings/mtd/atmel-nand.txt b/Documentation/devicetree/bindings/mtd/atmel-nand.txt
index e332515c499a..1934614a9298 100644
--- a/Documentation/devicetree/bindings/mtd/atmel-nand.txt
+++ b/Documentation/devicetree/bindings/mtd/atmel-nand.txt
@@ -1,73 +1,3 @@
-* ECC engine (PMECC) bindings:
-
-Required properties:
-- compatible: should be one of the following
-	"atmel,at91sam9g45-pmecc"
-	"atmel,sama5d4-pmecc"
-	"atmel,sama5d2-pmecc"
-	"microchip,sam9x60-pmecc"
-	"microchip,sam9x7-pmecc", "atmel,at91sam9g45-pmecc"
-- reg: should contain 2 register ranges. The first one is pointing to the PMECC
-       block, and the second one to the PMECC_ERRLOC block.
-
-* SAMA5 NFC I/O bindings:
-
-SAMA5 SoCs embed an advanced NAND controller logic to automate READ/WRITE page
-operations. This interface to this logic is placed in a separate I/O range and
-should thus have its own DT node.
-
-- compatible: should be "atmel,sama5d3-nfc-io", "syscon".
-- reg: should contain the I/O range used to interact with the NFC logic.
-
-Example:
-
-	nfc_io: nfc-io@70000000 {
-		compatible = "atmel,sama5d3-nfc-io", "syscon";
-		reg = <0x70000000 0x8000000>;
-	};
-
-	pmecc: ecc-engine@ffffc070 {
-		compatible = "atmel,at91sam9g45-pmecc";
-                reg = <0xffffc070 0x490>,
-                      <0xffffc500 0x100>;
-	};
-
-	ebi: ebi@10000000 {
-		compatible = "atmel,sama5d3-ebi";
-		#address-cells = <2>;
-		#size-cells = <1>;
-		atmel,smc = <&hsmc>;
-		reg = <0x10000000 0x10000000
-		       0x40000000 0x30000000>;
-		ranges = <0x0 0x0 0x10000000 0x10000000
-			  0x1 0x0 0x40000000 0x10000000
-			  0x2 0x0 0x50000000 0x10000000
-			  0x3 0x0 0x60000000 0x10000000>;
-		clocks = <&mck>;
-
-                nand_controller: nand-controller {
-			compatible = "atmel,sama5d3-nand-controller";
-			atmel,nfc-sram = <&nfc_sram>;
-			atmel,nfc-io = <&nfc_io>;
-			ecc-engine = <&pmecc>;
-			#address-cells = <2>;
-			#size-cells = <1>;
-			ranges;
-
-			nand@3 {
-				reg = <0x3 0x0 0x800000>;
-				atmel,rb = <0>;
-
-				/*
-				 * Put generic NAND/MTD properties and
-				 * subnodes here.
-				 */
-			};
-		};
-	};
-
------------------------------------------------------------------------
-
 Deprecated bindings (should not be used in new device trees):
 
 Required properties:
diff --git a/Documentation/devicetree/bindings/mtd/atmel-pmecc.yaml b/Documentation/devicetree/bindings/mtd/atmel-pmecc.yaml
new file mode 100644
index 000000000000..872401e9dda3
--- /dev/null
+++ b/Documentation/devicetree/bindings/mtd/atmel-pmecc.yaml
@@ -0,0 +1,58 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/mtd/atmel-pmecc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Microchip pmecc controller
+
+maintainers:
+  - Balamanikandan Gunasundar <balamanikandan.gunasundar@microchip.com>
+
+description: |
+  Bindings for microchip Programmable Multibit Error Correction Code
+  Controller (PMECC). pmecc is a programmable BCH encoder/decoder. This
+  block is passed as the value to the "ecc-engine" property of microchip
+  nand flash controller node.
+
+properties:
+  compatible:
+    oneOf:
+      - enum:
+          - atmel,at91sam9g45-pmecc
+          - atmel,sama5d2-pmecc
+          - atmel,sama5d4-pmecc
+          - microchip,sam9x60-pmecc
+          - microchip,sam9x7-pmecc
+      - items:
+          - const: microchip,sam9x60-pmecc
+          - const: atmel,at91sam9g45-pmecc
+
+  reg:
+    description:
+      The first should point to the PMECC block. The second should point to the
+      PMECC_ERRLOC block.
+
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: microchip,sam9x7-pmecc
+    then:
+      properties:
+        clocks:
+          description:
+            The clock source for pmecc controller
+          maxItems: 1
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    pmecc: ecc-engine@ffffc070 {
+            compatible = "microchip,sam9x7-pmecc";
+            reg = <0xffffe000 0x300>,
+                  <0xffffe600 0x100>;
+            clocks = <&pmc 2 48>;
+    };

-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
