Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30236F55101
	for <linux-mtd@archiver.kernel.org>; Sat,  7 Mar 2026 16:44:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=BgIFb+giqeR3rbRpKGVzRyeT5k2z2hV560y/6mLLwG4=; b=IDF1Rx9pY1Q35K
	0HHo4Q+K9NGtMKOWt47XO0dX5KNRgyGwck0SW8UmnF+FxJiXe4IP73k+WluNlh0JUIXG7rL6Kr2M8
	XVjl8VPQY3XCAnw5ovZlagkklMRWqzJ/UiIjBWMuG09qcaoMX/57rNQlOJaeFysM632SY66TL5zTS
	sYHoVgzBlJHk0/cSxBkTbLjxy1xczn1LIFJmLIFHKAxZRWtNwssXjmNPa6czYnEJ/jOotOoGthjNA
	ayC0DHyPYWCQvKZ2mxMkpoouGxNlns4NUY5weVq7ra+8zjsecKHlPXii/yizlcFb2qkTe0XHtsdKw
	dTu3RePlOzT8/PMOl/EQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyul6-00000005MqB-1fLY;
	Sat, 07 Mar 2026 16:44:08 +0000
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyul3-00000005Mpg-2PP0
	for linux-mtd@lists.infradead.org;
	Sat, 07 Mar 2026 16:44:06 +0000
Received: by mail-pj1-x102f.google.com with SMTP id 98e67ed59e1d1-3597b474cbdso4111507a91.1
        for <linux-mtd@lists.infradead.org>; Sat, 07 Mar 2026 08:44:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772901844; x=1773506644; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=exLZd+GeOjjoDlmDFTtKZ0DsTRh93LFRdOVuSHV1/eE=;
        b=CNLxbza9OgVNiI1qt3E4Anls82smjZN4WzeBqc+56K+lFs5V2oQzmxe6f4m5FZfT4U
         RqMXowjJ/yP+z32lYmOoF7p8TblwDDUymAHuGmghJ8P5uU4kzUMndcMO2L1RJ6gz593I
         S65M5Qi8AX2qnHZ2wx3clxHh9MQyQEy4F0UDhKA9gkcDS2fzgTbb1KdAz6xs2mzSgbdU
         j9TgYB+9YvpJGpk6z4788wr1RgonYk7vQu669kqZdO4Zw+DkAz7bWl2Yr4MnoEOz8IfB
         WISCObIYGq+6fkNhnlaD+jpMi4C1wR6mV7XICLICHFtnA626I8eMCquOE7ob7mlWggNU
         34OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772901844; x=1773506644;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=exLZd+GeOjjoDlmDFTtKZ0DsTRh93LFRdOVuSHV1/eE=;
        b=kwjuXZbAuc9eA89Vu3+XAO79n+1T8pJr88BDRe/abTFDl4s+i1Z292FB2Fm+JnKmQL
         TAtcjdfmqs7OvgdT3LnFMTAcABbQXOCI5i2vjYr66aHHITaqi0ZiJ3XRe7zRC+8Rfjhg
         hy4D6WWktylAi89d/wdBiLrayZS6eqbtBZKSYtGdcE9qtOzcLymlRaBDEBf8s9olphZ9
         WZs0HHVqcaMigKUmKQu8BX7P3L4gMK/hJrqXLl/H7fvMzdbkzXFBRUetoKmpV01EdCg8
         NLbuwMTHGIrK7lca876iqC8CGR2rxyYkX+jqJImAreRsXW+wr5mWU8BMAHQ/lnZtBUel
         i7rQ==
X-Gm-Message-State: AOJu0YywuUxaOIZM59kt8W7+5E0M165IRnuMPtZbN0KKf4Sv+TDSL0F3
	DMlbgZllz6KpWcNp7I3ARnR9Xts2y1nfMPnSdGO62xdMCap96TcnJquE
X-Gm-Gg: ATEYQzyKI9VV6WNaNZKK9S+s1RbZ2kLbZnBu7KR1Go1WVcX7WfKXI0y4+wOGhm5ROQn
	Tme6bKEWObx2NZ7kN+VJUvflSb7/GQCA+zERFdqBi/OGafn07pnLXF5xW2tihtXwqIbUx3STs44
	caNlT6hRsxXlSMyRlEUL7TrPw+IFe07QZmNS+xhILJiC7GdSCjcPYoZfmbuqGctAy9EvCrXLm6Q
	UQReA7RltY43p23NMaweLwoX8p2oMbjvsSeb2tDaCHYBxt0S76CyMp/xGXzNz3QlUKuMQrcDCVK
	twbMdXiIae+ZfLAo4thUDGkmmnQJq8Rp94qMYtZ89trW3w5a2PzLeuNhNhyjKdOWInRzpDvil39
	P5zbEVmqZ3j6WlQZ0Rn28ryBqZyiJitu+6NTbBP6sF2yCoPrdmf9KThKtshf0pk6nWSoKTJSJyi
	zCFNKbmH5EgbhYYXbIuPnVSsWboxId8cd0HLv9Uc2eEjEmmo9cR9CK
X-Received: by 2002:a17:90b:3cc3:b0:359:8c21:ef46 with SMTP id 98e67ed59e1d1-359be2cbeb0mr5198014a91.13.1772901844258;
        Sat, 07 Mar 2026 08:44:04 -0800 (PST)
Received: from LAPTOP-872M7T80.localdomain ([157.50.205.238])
        by smtp.googlemail.com with ESMTPSA id 98e67ed59e1d1-359c003bd46sm5434460a91.4.2026.03.07.08.43.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Mar 2026 08:44:03 -0800 (PST)
From: Akhila YS <akhilayalmati@gmail.com>
Date: Sat, 07 Mar 2026 16:43:56 +0000
Subject: [PATCH] dt-bindings: mtd: hisilicon,504-nfc: convert to DT schema
MIME-Version: 1.0
Message-Id: <20260307-hisi504-1-v1-1-8bf9a186faf2@gmail.com>
X-B4-Tracking: v=1; b=H4sIAMtVrGkC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDYwMz3QygElMDE11D3RTzxEQDy2RzgxRLYyWg+oKi1LTMCrBZ0bG1tQC
 YED75WwAAAA==
X-Change-ID: 20260306-hisi504-1-d7aa09c70d93
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-mtd@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Akhila YS <akhilayalmati@gmail.com>
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260307_084405_623620_9C4A0656 
X-CRM114-Status: GOOD (  12.97  )
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

Convert Hisilicon Hip04 Soc NAND controller DT binding to YAML format.

Signed-off-by: Akhila YS <akhilayalmati@gmail.com>
---
 .../devicetree/bindings/mtd/hisilicon,504-nfc.yaml | 90 ++++++++++++++++++++++
 1 file changed, 90 insertions(+)

diff --git a/Documentation/devicetree/bindings/mtd/hisilicon,504-nfc.yaml b/Documentation/devicetree/bindings/mtd/hisilicon,504-nfc.yaml
new file mode 100644
index 000000000000..805ef0af0e04
--- /dev/null
+++ b/Documentation/devicetree/bindings/mtd/hisilicon,504-nfc.yaml
@@ -0,0 +1,90 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/mtd/hisilicon,504-nfc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: HiSilicon Hip04 NAND Flash Controller
+
+maintainers:
+  - Miquel Raynal <miquel.raynal@bootlin.com>
+  - Richard Weinberger <richard@nod.at>
+
+description:
+  The HiSilicon 504 NFC is a NAND flash memory controller used in the
+  Hip04 SoC. It supports hardware ECC for NAND devices and provides
+  register and buffer regions for NAND operations.
+
+allOf:
+  - $ref: nand-controller.yaml#
+
+properties:
+  compatible:
+    const: hisilicon,504-nfc
+
+  reg:
+    minItems: 2
+    maxItems: 2
+
+  interrupts:
+    maxItems: 1
+
+  nand-bus-width:
+    enum: [8, 16]
+
+  nand-ecc-mode:
+    enum:
+      - none
+      - hw
+
+  nand-ecc-strength:
+    const: 16
+
+  nand-ecc-step-size:
+    const: 1024
+
+  "#address-cells":
+    const: 1
+
+  "#size-cells":
+    const: 0
+
+  partitions:
+    $ref: /schemas/mtd/partitions/fixed-partitions.yaml#
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - nand-bus-width
+  - nand-ecc-mode
+  - "#address-cells"
+  - "#size-cells"
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    nand-controller@4020000 {
+        compatible = "hisilicon,504-nfc";
+        reg = <0x04020000 0x10000>, <0x05000000 0x1000>;
+        interrupts = <0 379 4>;
+        nand-bus-width = <8>;
+        nand-ecc-mode = "hw";
+        nand-ecc-strength = <16>;
+        nand-ecc-step-size = <1024>;
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        partitions {
+             compatible = "fixed-partitions";
+             #address-cells = <1>;
+             #size-cells = <1>;
+
+             partition@0 {
+                 label = "nand_text";
+                 reg = <0x0 0x400000>;
+            };
+        };
+    };
+...

---
base-commit: d4906ae14a5f136ceb671bb14cedbf13fa560da6
change-id: 20260306-hisi504-1-d7aa09c70d93

Best regards,
-- 
Akhila YS <akhilayalmati@gmail.com>


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
