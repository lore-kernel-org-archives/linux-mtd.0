Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94270C35FF9
	for <linux-mtd@archiver.kernel.org>; Mon, 17 Mar 2025 13:45:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:CC:To:Message-ID:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=QnsKjDWhX+SrgP1iKeMr49iH360DAvNFab+L56hmLxI=; b=UYLpJm9PQb4XfB
	5+0u5PP57PyFjiRZoNTOqA2qlvJnmKsvax8OM/7jaWQtCR9kcORnZD1e5oJQxmFF6fr7ayezMcsXx
	dj4PiEBTHibOfJGnTnPZf3gCcf+3FcqRXb+VqDvMEBznaM6sK3SLelXaGkqaFMEPrIU91/oDKpTdp
	8jJqiVARJOP3/fHHpmGUwk1VZPc/wK56WGTOS5sSjS7l5y1XYSFT3ucDi0UHoRFG+fTD4qep0Untl
	7ExVnOt90UovQjRTvldHvIgUdwbKvRABfMCsnu2Talg3TbPQvn2n3WNtP+HDnE4cTiD9sMXQr8mE2
	0F3HaY4z2GU+cYeF1EWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tuAmm-00000002n6j-10fA;
	Mon, 17 Mar 2025 13:45:44 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tuAeG-00000002lNk-02lK;
	Mon, 17 Mar 2025 13:36:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1742218616; x=1773754616;
  h=from:date:subject:mime-version:content-transfer-encoding:
   message-id:to:cc;
  bh=uUzD2tKx/yOkzia97EwCKxdMZuH21Iwtc+D4U9gO9Ys=;
  b=ClHjXDJVZ0pgTetglU0ak9cdVicvRoa+CVPpW5fNCDasV+DbIOiUhyLn
   Uv4KXLOv1U2aLMjATwN+Gper1GSo4qKolZGzeqJq348e+7GBzQ6GOb4Kg
   yNb14MNZzi6+swcyVvJgNqMweoZPeWD86lb300O+WJTIAChtu21W633A/
   xEGczq1PkOZXJ/rwsxMJ0rC2vh80PY48N/EXy3Mi03KXbDQBXiyhlqqy3
   dWDL1mimWSFLMYNHZEZ8dSxV/NmDrAQGy1Isv+/Vyc1mSSwv3sZg7HW2Z
   ulMkpTikOIPGEkSo7YbNMDFtFAZ+POnEL2ODbSYJsIODDNgfRPn7RN5ot
   w==;
X-CSE-ConnectionGUID: wbEqb9OZQ2CrxMjUvyeqZg==
X-CSE-MsgGUID: vfBAesImS76EIy4wVtfOmw==
X-IronPort-AV: E=Sophos;i="6.14,254,1736838000"; 
   d="scan'208";a="39256375"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa3.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 17 Mar 2025 06:36:45 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Mon, 17 Mar 2025 06:36:24 -0700
Received: from [10.40.56.22] (10.10.85.11) by chn-vm-ex02.mchp-main.com
 (10.10.85.144) with Microsoft SMTP Server id 15.1.2507.44 via Frontend
 Transport; Mon, 17 Mar 2025 06:36:19 -0700
From: Nayab Sayed <nayabbasha.sayed@microchip.com>
Date: Mon, 17 Mar 2025 19:01:08 +0530
Subject: [PATCH RESEND] dt-bindings: mtd: atmel,dataflash: convert txt to
 yaml
MIME-Version: 1.0
Message-ID: <20250317-atmel-dataflash-v1-1-1a3247f40299@microchip.com>
X-B4-Tracking: v=1; b=H4sIABsk2GcC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDY0Nz3cSS3NQc3ZTEksS0nMTiDF1LE8Pk1KRkSxOjxFQloK6CotS0zAq
 widFKQa7Brn4uSrG1tQByJOstaQAAAA==
To: Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger
	<richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, Rob Herring
	<robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, Nicolas Ferre <nicolas.ferre@microchip.com>,
	"Alexandre Belloni" <alexandre.belloni@bootlin.com>, Claudiu Beznea
	<claudiu.beznea@tuxon.dev>
CC: <linux-mtd@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	"Nayab Sayed" <nayabbasha.sayed@microchip.com>
X-Mailer: b4 0.14.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250317_063656_231311_94B32A37 
X-CRM114-Status: GOOD (  10.96  )
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

Convert atmel-dataflash.txt into atmel,dataflash.yaml

Signed-off-by: Nayab Sayed <nayabbasha.sayed@microchip.com>
---
 .../devicetree/bindings/mtd/atmel,dataflash.yaml   | 55 ++++++++++++++++++++++
 .../devicetree/bindings/mtd/atmel-dataflash.txt    | 17 -------
 2 files changed, 55 insertions(+), 17 deletions(-)

diff --git a/Documentation/devicetree/bindings/mtd/atmel,dataflash.yaml b/Documentation/devicetree/bindings/mtd/atmel,dataflash.yaml
new file mode 100644
index 000000000000..8c72fa346e36
--- /dev/null
+++ b/Documentation/devicetree/bindings/mtd/atmel,dataflash.yaml
@@ -0,0 +1,55 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/mtd/atmel,dataflash.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Atmel DataFlash
+
+maintainers:
+  - Nayab Sayed <nayabbasha.sayed@microchip.com>
+
+description:
+  The Atmel DataFlash is a low pin-count serial interface sequential access
+  Flash memory, compatible with SPI standard. The device tree may optionally
+  contain sub-nodes describing partitions of the address space.
+
+properties:
+  compatible:
+    oneOf:
+      - items:
+          - enum:
+              - atmel,at45db321d
+              - atmel,at45db041e
+              - atmel,at45db642d
+              - atmel,at45db021d
+          - const: atmel,at45
+          - const: atmel,dataflash
+      - items:
+          - const: atmel,at45
+          - const: atmel,dataflash
+
+  reg:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+
+allOf:
+  - $ref: mtd.yaml#
+  - $ref: /schemas/spi/spi-peripheral-props.yaml#
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    spi {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        flash@1 {
+            compatible = "atmel,at45db321d", "atmel,at45", "atmel,dataflash";
+            reg = <1>;
+        };
+    };
diff --git a/Documentation/devicetree/bindings/mtd/atmel-dataflash.txt b/Documentation/devicetree/bindings/mtd/atmel-dataflash.txt
deleted file mode 100644
index 1889a4db5b7c..000000000000
--- a/Documentation/devicetree/bindings/mtd/atmel-dataflash.txt
+++ /dev/null
@@ -1,17 +0,0 @@
-* Atmel Data Flash
-
-Required properties:
-- compatible : "atmel,<model>", "atmel,<series>", "atmel,dataflash".
-
-The device tree may optionally contain sub-nodes describing partitions of the
-address space. See partition.txt for more detail.
-
-Example:
-
-flash@1 {
-	#address-cells = <1>;
-	#size-cells = <1>;
-	compatible = "atmel,at45db321d", "atmel,at45", "atmel,dataflash";
-	spi-max-frequency = <25000000>;
-	reg = <1>;
-};

---
base-commit: 4701f33a10702d5fc577c32434eb62adde0a1ae1
change-id: 20250317-atmel-dataflash-941cebc942ae

Best regards,
-- 
Nayab Sayed <nayabbasha.sayed@microchip.com>


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
