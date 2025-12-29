Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8E09D3B7E5
	for <linux-mtd@archiver.kernel.org>; Mon, 29 Dec 2025 14:55:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=OFfJqWUhke9W6S+fU87mPtyzwuJE2jQ4BEflpiZ26bo=; b=R0BXTzkR0gfeFr
	Z8Tz9xDzNH1Ut+P2aQLjzydVJVtedy21bhEkhICaHOsbvuvXP13oUBTQ+acXyiZjfE/X4hPsBRsDD
	vt9IJoWyN9ejEeIta6jF39wenLcrO2i5QrF+b+iAEp6Ji1JrmZLJ2KnE7LiQzFEhb//dJT4E/K7cm
	UqjxFN3o0alZjnmHkGyTexFYR86ieDfKF/YHVKOMiGm2ARNPJGhesshHkwBx3KzvFC//vl2eUPwsS
	WkMp+p3eYIfIK5aGbklzCq2c/a1u14fEZWeY/yU2JFz0bg6Z5asIiCkD1XQTJpJOEKok2Mq02SyHs
	2z+ZMIqR9UCSnafdKZLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vaEen-00000003o56-0cUa;
	Mon, 29 Dec 2025 14:55:37 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vaEel-00000003o4h-1DJB
	for linux-mtd@lists.infradead.org;
	Mon, 29 Dec 2025 14:55:36 +0000
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-2a0b4320665so139227795ad.1
        for <linux-mtd@lists.infradead.org>; Mon, 29 Dec 2025 06:55:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767020134; x=1767624934; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=c3Rvbx0SUF5LIMmW++u/8q0FjAyi1zNAmH9287WODhQ=;
        b=AMNt486NHgVsH3a7saC2f9pyzUGLNhWKT/HHXId+OhOhC75UgHJDeHq0JlKHCyfoLL
         24J4m+ZdB0xk5cuqb5qcCr4vcbzlYmJFw82IbM0t8ZdhwbkkKTzsfiswW+x7UGLJ317U
         r7lw5t1YeecMAflcSqAo8Zk+yXixgDaoneC7m7Me5kZGdFZnYQYIOBF94TXOQDdYM3v4
         vAgCrygaqK6kOYc5eJ0Stf/hukzCNa9Ih856hi9I8h9MGsVpfBfRCdGawNH3fYBrdx2u
         S1wk5PwukhVA5gtDH/A206K2tvtsq3jRjwbR9xgoOFOO/r7tj7LYdy7inOKEzESEOk+J
         udRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767020134; x=1767624934;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=c3Rvbx0SUF5LIMmW++u/8q0FjAyi1zNAmH9287WODhQ=;
        b=EilaJEFyidLvNPhTMF/NMXhwKOWxQlWwhyH28Tl32+IgVlfttep10+5Fkc+MbubKsH
         shFM3iDF7zZ8F4rtqhTVlCfQ6KmKhXE1A/e+ZIl4l+pzf6U+ZjHofN6VIWVwp2OttKU7
         86hfm7ZrD14eTZlxnHEwSgPq1zFJ+xkmA0rmTX62cCSxoAy+fb8JvvmMv8//kbJv5XEx
         uv7wFuebJxX4UMuysZ9l0Gj4wtYdfAMADJQHWhNcNk3ROOV/lz7XwXq0cD5nDipM9fB7
         0X5gmNW2NHe83hEsvuTTcUf6keWNIldbvN+0SPeEJqbF1C4d5aqMfcD8nTFMLlYq/ACK
         /Sjg==
X-Gm-Message-State: AOJu0Yzgxb+J7oa6Pdu8+rrAYqhKD2jg1jBKFeN2KVu9YBuALJq6gHvw
	6kwJIwq6TgEiWFrPpCuuYwkHBYjBQUeQivVnw5YQXoMQXpPDg5pnV5EQARp15A==
X-Gm-Gg: AY/fxX5MqMYW3o+KtWTqGlmTpK744NThOI9hAnEjkYv76qZ3InMhCEp/vNp/vsdTeza
	hWCPbcqTyC1HXyWp+hDzci5ztrnLh77B8t+CO3+PVn+6yoSvjRwNA3NiqWnk1Kxy90T1t4EWz3O
	QzadctgEFgSMoky4F/FKTMjUH7JE7XcSYmtFivBf2npuMB1VjVXWvJ1qoAKGRqTVxqyEmyKwIRI
	Uedg9y3pBgy1/gg6rxq2x5rbp069wsVCYCIqzvOfut79otkiJMZmRaOdLEBFG+dMhtOVqLW6ynI
	52osuXOejWiNl2OgUk5bui9apJsZGGef2oYct+eLyfxYKxjoqdhnyQO6U3BDJOcSs7J0pUKGIeh
	lcHdmYfbPEdJUU/LHmhpcrtMw8rLQcz2A54nfDXAnvDqfK+OYtuBvldDzL73N8mFkrMnxO48zhY
	0pR6u5QOhNfgJcA1FHyKb3hYXb1fQC1aD4
X-Google-Smtp-Source: AGHT+IHCF/iIi9x1kfokHvV7XRjScNJIW1j4ikCcQAyZ1AHZ+5mJnfca+Vk/PMrdq42tlxFbIXPYAg==
X-Received: by 2002:a17:903:ac4:b0:2a0:d5bf:b27c with SMTP id d9443c01a7336-2a2f2a4f768mr268011635ad.45.1767020133688;
        Mon, 29 Dec 2025 06:55:33 -0800 (PST)
Received: from Black-Pearl.localdomain ([122.164.226.1])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-2a2f3d76ceesm279217045ad.91.2025.12.29.06.55.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Dec 2025 06:55:33 -0800 (PST)
From: Charan Pedumuru <charan.pedumuru@gmail.com>
Date: Mon, 29 Dec 2025 14:31:12 +0000
Subject: [PATCH v2] dt-bindings: mtd: nvidia,tegra20-nand: convert to DT
 schema
MIME-Version: 1.0
Message-Id: <20251229-nvidia-nand-v2-1-b697d9724b0b@gmail.com>
X-B4-Tracking: v=1; b=H4sIAK+QUmkC/1XMQQrCMBCF4auUWRvJjNFWV95DuojJ2A7YVBIJS
 sndjcWNy//B+xZIHIUTnJoFImdJMocatGnAjTYMrMTXBtK0R42oQhYvVgUbvNJknGstd1dtoT4
 ekW/yWrVLX3uU9Jzje8Uzftefs9N/TkaFqj2gYTTU0ZHOw2TlvnXzBH0p5QNygrCHpgAAAA==
X-Change-ID: 20251011-nvidia-nand-024cc7ae8b0a
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Thierry Reding <thierry.reding@gmail.com>, 
 Jonathan Hunter <jonathanh@nvidia.com>, Stefan Agner <stefan@agner.ch>, 
 Lucas Stach <dev@lynxeye.de>
Cc: linux-mtd@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Charan Pedumuru <charan.pedumuru@gmail.com>
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251229_065535_367253_DB53F418 
X-CRM114-Status: GOOD (  20.35  )
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

Convert NVIDIA Tegra NAND Flash Controller binding to YAML format.
Changes during Conversion:
- Define new properties `power-domains` and `operating-points-v2`
  because the existing in tree DTS uses them.

Signed-off-by: Charan Pedumuru <charan.pedumuru@gmail.com>
---
Changes in v2:
- Edited the commit description to match the updated changes.
- Modified the description for the YAML.
- Removed all the duplicated properties, defined a proper ref for both parent
  and child nodes.
- Removed unnecessary properties from the required following the old
  text binding.
- Link to v1: https://lore.kernel.org/r/20251030-nvidia-nand-v1-1-7614e1428292@gmail.com
---
 .../bindings/mtd/nvidia,tegra20-nand.yaml          | 107 +++++++++++++++++++++
 .../bindings/mtd/nvidia-tegra20-nand.txt           |  64 ------------
 2 files changed, 107 insertions(+), 64 deletions(-)

diff --git a/Documentation/devicetree/bindings/mtd/nvidia,tegra20-nand.yaml b/Documentation/devicetree/bindings/mtd/nvidia,tegra20-nand.yaml
new file mode 100644
index 000000000000..f34eaad67e11
--- /dev/null
+++ b/Documentation/devicetree/bindings/mtd/nvidia,tegra20-nand.yaml
@@ -0,0 +1,107 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/mtd/nvidia,tegra20-nand.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: NVIDIA Tegra NAND Flash Controller
+
+maintainers:
+  - Jonathan Hunter <jonathanh@nvidia.com>
+
+allOf:
+  - $ref: nand-controller.yaml
+
+description:
+  The NVIDIA NAND controller provides an interface between NVIDIA SoCs
+  and raw NAND flash devices. It supports standard NAND operations,
+  hardware-assisted ECC, OOB data access, and DMA transfers, and
+  integrates with the Linux MTD NAND subsystem for reliable flash management.
+
+properties:
+  compatible:
+    const: nvidia,tegra20-nand
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+  clock-names:
+    items:
+      - const: nand
+
+  resets:
+    maxItems: 1
+
+  reset-names:
+    items:
+      - const: nand
+
+  power-domains:
+    maxItems: 1
+
+  operating-points-v2:
+    maxItems: 1
+
+patternProperties:
+  "^nand@[0-5]$":
+    type: object
+    description: Individual NAND chip connected to the NAND controller
+    $ref: raw-nand-chip.yaml#
+
+    patternProperties:
+      "^partition@[0-9a-f]+$":
+        description:
+          Optional MTD partitions for the NAND chip, as defined in mtd.yaml
+        $ref: mtd.yaml#
+
+    required:
+      - reg
+
+    unevaluatedProperties: false
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - clocks
+  - clock-names
+  - resets
+  - reset-names
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/clock/tegra20-car.h>
+    #include <dt-bindings/gpio/tegra-gpio.h>
+
+    nand-controller@70008000 {
+        compatible = "nvidia,tegra20-nand";
+        reg = <0x70008000 0x100>;
+        interrupts = <GIC_SPI 24 IRQ_TYPE_LEVEL_HIGH>;
+        clocks = <&tegra_car TEGRA20_CLK_NDFLASH>;
+        clock-names = "nand";
+        resets = <&tegra_car 13>;
+        reset-names = "nand";
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        nand@0 {
+            reg = <0>;
+            #address-cells = <1>;
+            #size-cells = <1>;
+            nand-bus-width = <8>;
+            nand-on-flash-bbt;
+            nand-ecc-algo = "bch";
+            nand-ecc-strength = <8>;
+            wp-gpios = <&gpio TEGRA_GPIO(S, 0) GPIO_ACTIVE_LOW>;
+        };
+    };
+...
diff --git a/Documentation/devicetree/bindings/mtd/nvidia-tegra20-nand.txt b/Documentation/devicetree/bindings/mtd/nvidia-tegra20-nand.txt
deleted file mode 100644
index 4a00ec2b2540..000000000000
--- a/Documentation/devicetree/bindings/mtd/nvidia-tegra20-nand.txt
+++ /dev/null
@@ -1,64 +0,0 @@
-NVIDIA Tegra NAND Flash controller
-
-Required properties:
-- compatible: Must be one of:
-  - "nvidia,tegra20-nand"
-- reg: MMIO address range
-- interrupts: interrupt output of the NFC controller
-- clocks: Must contain an entry for each entry in clock-names.
-  See ../clocks/clock-bindings.txt for details.
-- clock-names: Must include the following entries:
-  - nand
-- resets: Must contain an entry for each entry in reset-names.
-  See ../reset/reset.txt for details.
-- reset-names: Must include the following entries:
-  - nand
-
-Optional children nodes:
-Individual NAND chips are children of the NAND controller node. Currently
-only one NAND chip supported.
-
-Required children node properties:
-- reg: An integer ranging from 1 to 6 representing the CS line to use.
-
-Optional children node properties:
-- nand-ecc-mode: String, operation mode of the NAND ecc mode. Currently only
-		 "hw" is supported.
-- nand-ecc-algo: string, algorithm of NAND ECC.
-		 Supported values with "hw" ECC mode are: "rs", "bch".
-- nand-bus-width : See nand-controller.yaml
-- nand-on-flash-bbt: See nand-controller.yaml
-- nand-ecc-strength: integer representing the number of bits to correct
-		     per ECC step (always 512). Supported strength using HW ECC
-		     modes are:
-		     - RS: 4, 6, 8
-		     - BCH: 4, 8, 14, 16
-- nand-ecc-maximize: See nand-controller.yaml
-- nand-is-boot-medium: Makes sure only ECC strengths supported by the boot ROM
-		       are chosen.
-- wp-gpios: GPIO specifier for the write protect pin.
-
-Optional child node of NAND chip nodes:
-Partitions: see mtd.yaml
-
-  Example:
-	nand-controller@70008000 {
-		compatible = "nvidia,tegra20-nand";
-		reg = <0x70008000 0x100>;
-		interrupts = <GIC_SPI 24 IRQ_TYPE_LEVEL_HIGH>;
-		clocks = <&tegra_car TEGRA20_CLK_NDFLASH>;
-		clock-names = "nand";
-		resets = <&tegra_car 13>;
-		reset-names = "nand";
-
-		nand@0 {
-			reg = <0>;
-			#address-cells = <1>;
-			#size-cells = <1>;
-			nand-bus-width = <8>;
-			nand-on-flash-bbt;
-			nand-ecc-algo = "bch";
-			nand-ecc-strength = <8>;
-			wp-gpios = <&gpio TEGRA_GPIO(S, 0) GPIO_ACTIVE_LOW>;
-		};
-	};

---
base-commit: 43edce71d70c603d3f3f1b1c886f65cd02d80c24
change-id: 20251011-nvidia-nand-024cc7ae8b0a

Best regards,
-- 
Charan Pedumuru <charan.pedumuru@gmail.com>


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
