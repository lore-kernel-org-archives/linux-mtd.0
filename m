Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3B90C2A06C
	for <linux-mtd@archiver.kernel.org>; Sun,  4 Jan 2026 11:23:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=cfiDeIrrwyV0WHDILVp3LPStIiBrJMYZOfw+tSoLXCc=; b=UPnIhKTbbk/dAb
	W5B94lrcsIb7ZbxQe0S5fxrTbbKdH4wSBSDa09P6qWNVEfn8fQnay/ovbeRA1JNAaFsDLN2H3ch99
	ug2qszFMDiLsF+thNJYPwc9xJJYosTSQYO+xv4X0ff/7R/7Siy0Xhs0R4h5BjaCrdq3wiVs62DO69
	+ssvQWuqV6YLpwdE4MPMMDuKOKkaMzeP4Z6sBgh+HFibGvM2fcmH4oUzQbIma8DZ1jY5SEQQy0pJ7
	o6sZR7FfLETuAOLrYZBZJlotryY9pkX5O+zvqt6PntdYlEgo9srtfCUB0vhg90LmXeMgEhAehNfGU
	1UlLO8yghwUl8zF1loww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcMCZ-0000000ABTP-3rnG;
	Sun, 04 Jan 2026 11:23:15 +0000
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcMCW-0000000ABT4-3x0o
	for linux-mtd@lists.infradead.org;
	Sun, 04 Jan 2026 11:23:14 +0000
Received: by mail-pj1-x1031.google.com with SMTP id 98e67ed59e1d1-34f0bc64a27so4494802a91.1
        for <linux-mtd@lists.infradead.org>; Sun, 04 Jan 2026 03:23:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767525791; x=1768130591; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=G96jDgA1E2l3Yn0qNuopB/AyEGtTf6lIYwJ3Mkdboew=;
        b=Rn3zuU4EBre7VUHGsryyJXwCwxOqir4O/EEstTrRp3MYX7kxRgWp+NptoYSjKFeq6Z
         hldmD1r2laShAna9oBgNVEeqUnoSZDYEjStHSmJsXAv6z83f3ebjs2tjTn7wN8VIYgDL
         SmtK69oWboBC4vdkVL8FKiO4Gx4Bnclzb6nfM1ghSYU9Bxq+wQHNywg/drcuESFeEIwE
         em2Bd0ep852ldEfUAgdkPO9GPI9xgkjK+Fy0gT+yeiZguhFrtuqTD5xiZboxrYdojCh2
         9KfqaqadVB4iVd/DQs6eAIYolXroGrPoJQaS/13ezw7esnwihfOgIz1P09rNqbDb/+J6
         iYHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767525791; x=1768130591;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=G96jDgA1E2l3Yn0qNuopB/AyEGtTf6lIYwJ3Mkdboew=;
        b=DssQvo9rQ4TZUwxJFxlurVhPWkh7PUukblGfQzkJ7T/WZZN5kBN8IzSn/cmXHtDkNk
         NokWBn46yjdbEkpvzIMX1EN4apdDozYX8lc4uxZhFx7F8dmCWirDgrkitM4wWU9ruX4v
         RnBrFeyQgttv2szFbiRp+Oxi/XMQ0ktr3gEtiH2kt7seoa6K7WHiBMXbZFMzxqqb61+l
         iYkThcrdC3lRskN7q4ddkXpnrLw1OylxuE4Uk6WagOPHF0+0hPFjcRU8KplI8jnsnsNg
         o3TWjujBhTxrRdMyWLUsCWpeqayyIn3xBlggcZ7nKowofJl0SKaPUND/jhZE/w91ddjX
         WGaw==
X-Gm-Message-State: AOJu0YxakrUkvQc6oAf/Fs7ABCPXR24myvP6LhBUfZdTL7m4UDznVGoW
	JxFF2RVn8KpVS7IIz/lMmmqHWzTjw6PKU3VEsEJoNUn8NqhPV6ucEksj
X-Gm-Gg: AY/fxX4m/TJVc+Eo5kMiadFbRHVO5rEAwby3BdwZAufplDnZrsAVzf/7v1PK8QTU9EM
	LcvtU7tQdTkD9K7gX1soLWbp1r7nBaDDBfSapI7l93XhfKjOxBXBLPcmmUyie5yq4vkUE3LdWeq
	ekHf5cSRS6shdnrkEsEDS9YJAC21RIBYhkGdr3kJl/CQZHVMq+O1pgdO2fTa5B9SWcRt0kfHI7g
	HJIvEU5C5HYfdK4RfWq0RINYxIwERVYn89QA3nxrqczumPM5/5mRY9VHTRDfR08RLbtjOBYPjT7
	IhXxpQws54t4etb8cX3UBbZcmo/mn3dp93wMl6DbtChXikgyrj0Z12mKpVR4nWeqBfeOmqAoSQF
	13KEy2iM478Jac/Knwt4zt7y4qTbpERLoDiAp4yokezaVLKNANKdL4/+Su1QR/k/RZ3KeyQwmnc
	7+W+ZM0El+MJnZ9+sAKL3CjdiQDoiqZTrIjw==
X-Google-Smtp-Source: AGHT+IEPGCXrVIijArtHz2L+XXcTUNqsrO8wR5x/CMAdqzled4QYnZbK0goA5DKpZXsrONGlwN9SJA==
X-Received: by 2002:a17:90b:4d87:b0:340:e521:bc73 with SMTP id 98e67ed59e1d1-34e921371c5mr38458142a91.5.1767525791257;
        Sun, 04 Jan 2026 03:23:11 -0800 (PST)
Received: from Black-Pearl.localdomain ([115.99.253.182])
        by smtp.googlemail.com with ESMTPSA id 98e67ed59e1d1-34f45cf5ff9sm2072867a91.6.2026.01.04.03.23.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Jan 2026 03:23:10 -0800 (PST)
From: Charan Pedumuru <charan.pedumuru@gmail.com>
Date: Sun, 04 Jan 2026 11:23:04 +0000
Subject: [PATCH v5] dt-bindings: mtd: nvidia,tegra20-nand: convert to DT
 schema
MIME-Version: 1.0
Message-Id: <20260104-nvidia-nand-v5-1-0e147e416b4b@gmail.com>
X-B4-Tracking: v=1; b=H4sIAJdNWmkC/13OwW7CMAzG8VdBOS8odlyHcuI9ph3SxgVLI0XtF
 G1CffcFtAnK8bP0+8tXM8ukMpv95momKTrrmOto3jamP8V8FKupboMOG3AANhdNGm2OOVmH1Pc
 hyq5z0VRxmWTQ73vt/aPuk85f4/Rzjxe4Xf863q06BSzYwEAChDts8XA8R/3c9uPZ3DoFHxaxX
 VustuM2pDYgda57tf7J+vX/xVeLwoGZkudAr5b+Lbv69NpStR4aHogHHxt5tsuy/AKR9TQOWgE
 AAA==
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
X-CRM114-CacheID: sfid-20260104_032313_013005_DFFA4C2F 
X-CRM114-Status: GOOD (  22.65  )
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
- Modify MAINTAINERS references to point the created YAML file.

Signed-off-by: Charan Pedumuru <charan.pedumuru@gmail.com>
---
Changes in v5:
- Modify MAINTAINERS references to point YAML instead of TEXT file.
- Link to v4: https://lore.kernel.org/r/20260103-nvidia-nand-v4-1-3156f46f3a5e@gmail.com

Changes in v4:
- Changed the the reg property for nand child node.
- Link to v3: https://lore.kernel.org/r/20251231-nvidia-nand-v3-1-2e67664d3674@gmail.com

Changes in v3:
- Removed pattern properties for partition.
- Used single quotes for nand string in pattern properties.
- Modified maxItems value and added minItems to reg property under nand child node.
- Link to v2: https://lore.kernel.org/r/20251229-nvidia-nand-v2-1-b697d9724b0b@gmail.com

Changes in v2:
- Edited the commit description to match the updated changes.
- Modified the description for the YAML.
- Removed all the duplicated properties, defined a proper ref for both parent
  and child nodes.
- Removed unnecessary properties from the required following the old
  text binding.
- Link to v1: https://lore.kernel.org/r/20251030-nvidia-nand-v1-1-7614e1428292@gmail.com
---
 .../bindings/mtd/nvidia,tegra20-nand.yaml          | 102 +++++++++++++++++++++
 .../bindings/mtd/nvidia-tegra20-nand.txt           |  64 -------------
 MAINTAINERS                                        |   2 +-
 3 files changed, 103 insertions(+), 65 deletions(-)

diff --git a/Documentation/devicetree/bindings/mtd/nvidia,tegra20-nand.yaml b/Documentation/devicetree/bindings/mtd/nvidia,tegra20-nand.yaml
new file mode 100644
index 000000000000..b417d72fa0de
--- /dev/null
+++ b/Documentation/devicetree/bindings/mtd/nvidia,tegra20-nand.yaml
@@ -0,0 +1,102 @@
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
+  '^nand@':
+    type: object
+    description: Individual NAND chip connected to the NAND controller
+    $ref: raw-nand-chip.yaml#
+
+    properties:
+      reg:
+        maximum: 5
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
diff --git a/MAINTAINERS b/MAINTAINERS
index e791f18b61d8..519dac4cc9c9 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -24829,7 +24829,7 @@ TEGRA NAND DRIVER
 M:	Stefan Agner <stefan@agner.ch>
 M:	Lucas Stach <dev@lynxeye.de>
 S:	Maintained
-F:	Documentation/devicetree/bindings/mtd/nvidia-tegra20-nand.txt
+F:	Documentation/devicetree/bindings/mtd/nvidia,tegra20-nand.yaml
 F:	drivers/mtd/nand/raw/tegra_nand.c
 
 TEGRA PWM DRIVER

---
base-commit: 43edce71d70c603d3f3f1b1c886f65cd02d80c24
change-id: 20251011-nvidia-nand-024cc7ae8b0a

Best regards,
-- 
Charan Pedumuru <charan.pedumuru@gmail.com>


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
