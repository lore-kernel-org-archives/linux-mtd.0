Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0F44C5B549
	for <linux-mtd@archiver.kernel.org>; Mon,  2 Jun 2025 05:40:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+TZsOJzCMg4CHWAN45sEmDqvwpou8JkXGPlFIoZPF3M=; b=gYCNTCFScXC4l/
	oakI3ch6S4lvXuApKaDx5eIH1REnEQYh6llQU1kh/d9ieowI1VFo6hGKW0oRVNkwajKNMELiKrjaX
	qXFJrZnfhs4unhCHf1CMyS0bysanskx/NxdNh3LOmQdCsH+biNULK5p6daPcLq/F0JN6f/q10Jg4V
	0OktJLSicUb1edgqn1xE3nZ6qqI2vSaAqd1ktuykZ+QZbY96Q9ba5sjnyYlIscIo3s+jpZ5mI08uP
	dZ0LlYeXtddGMWZ0S3Fi9MHB/2+mwIvdqLjsE0Ont5xNPe7ozmk5WkR8eiU3viKyEk4BUXGHSm8cT
	tuMSL+ysJG5RFugqwjrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uLxuG-00000006lns-3kRq;
	Mon, 02 Jun 2025 05:40:20 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uLxpu-00000006l31-2rXw;
	Mon, 02 Jun 2025 05:35:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1748842550; x=1780378550;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=zfXAqBTrTB87RFz2hSScGbQmoo9mMpeMvJVYOho6stI=;
  b=m90Um6oG8Pt8uftQchHRMyjKloY0z72B6GMpYSMpEx4TGseJ6m7aNq9J
   DWcNPfHUalrkzRhYsXjMdc8Gt6kNtgbGwtrG1niglNtq/qO908YiX1ecE
   LkaxnG0NX09Xa53nBfHzMN+pHClcKWnJ10sg3dGwPlFg1BnPjr0QQX63G
   7ObfGe/nF5o9RVPKTyAJ3IjJzM8m8WcuuLkiQzBs6E173RmNqtM0mYZee
   7nZSE34ecxqNlEtpdYoqS2EmjCCaGz91zYWnZ11kGIEmqpltxzTe7yvxp
   vAI5F70WDVB8httegSb+T8zMR4GDpZazjfgpgtsBIlcWiV960nnDMGnJz
   g==;
X-CSE-ConnectionGUID: 8pkaetzaTf2iFp4Ql+AwUg==
X-CSE-MsgGUID: NuzFr63zRbW0y6GbopYTbQ==
X-IronPort-AV: E=Sophos;i="6.16,202,1744095600"; 
   d="scan'208";a="42865333"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa2.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 01 Jun 2025 22:35:46 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Sun, 1 Jun 2025 22:35:39 -0700
Received: from che-lt-i64410lx.microchip.com (10.10.85.11) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server id
 15.1.2507.44 via Frontend Transport; Sun, 1 Jun 2025 22:35:33 -0700
From: Balamanikandan Gunasundar <balamanikandan.gunasundar@microchip.com>
To: <miquel.raynal@bootlin.com>, <richard@nod.at>, <vigneshr@ti.com>,
	<robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
	<nicolas.ferre@microchip.com>, <alexandre.belloni@bootlin.com>,
	<claudiu.beznea@tuxon.dev>, <krzysztof.kozlowski+dt@linaro.org>
CC: <linux-mtd@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	Balamanikandan Gunasundar <balamanikandan.gunasundar@microchip.com>
Subject: [PATCH v3 2/4] dt-bindings: mtd: microchip-nand: add atmel pmecc
Date: Mon, 2 Jun 2025 11:05:05 +0530
Message-ID: <20250602053507.25864-3-balamanikandan.gunasundar@microchip.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250602053507.25864-1-balamanikandan.gunasundar@microchip.com>
References: <20250602053507.25864-1-balamanikandan.gunasundar@microchip.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250601_223550_789104_96B5CE4E 
X-CRM114-Status: GOOD (  15.34  )
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
 .../devicetree/bindings/mtd/atmel-nand.txt    | 61 ------------------
 .../bindings/mtd/microchip,pmecc.yaml         | 62 +++++++++++++++++++
 2 files changed, 62 insertions(+), 61 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/mtd/microchip,pmecc.yaml

diff --git a/Documentation/devicetree/bindings/mtd/atmel-nand.txt b/Documentation/devicetree/bindings/mtd/atmel-nand.txt
index dbbc17a866f2..1934614a9298 100644
--- a/Documentation/devicetree/bindings/mtd/atmel-nand.txt
+++ b/Documentation/devicetree/bindings/mtd/atmel-nand.txt
@@ -1,64 +1,3 @@
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
diff --git a/Documentation/devicetree/bindings/mtd/microchip,pmecc.yaml b/Documentation/devicetree/bindings/mtd/microchip,pmecc.yaml
new file mode 100644
index 000000000000..89680a051981
--- /dev/null
+++ b/Documentation/devicetree/bindings/mtd/microchip,pmecc.yaml
@@ -0,0 +1,62 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/mtd/microchip,pmecc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Microchip pmecc controller
+
+maintainers:
+  - Balamanikandan Gunasundar <balamanikandan.gunasundar@microchip.com>
+
+description:
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
+      - items:
+          - enum:
+              - microchip,sam9x7-pmecc
+              - microchip,sam9x60-pmecc
+          - const: atmel,at91sam9g45-pmecc
+
+  reg:
+    items:
+      - description: PMECC controller registers
+      - description: PMECC_ERRLOC controller
+
+  clocks:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: microchip,sam9x7-pmecc
+    then:
+      required:
+        - clocks
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    ecc-engine@ffffc070 {
+        compatible = "microchip,sam9x7-pmecc", "atmel,at91sam9g45-pmecc";
+        reg = <0xffffe000 0x300>,
+              <0xffffe600 0x100>;
+        clocks = <&pmc 2 48>;
+    };
-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
