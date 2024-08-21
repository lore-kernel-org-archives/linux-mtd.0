Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63432C52D6F
	for <linux-mtd@archiver.kernel.org>; Wed, 21 Aug 2024 07:13:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fT4yJm7gAB1Ipi5ayupbXiRr+HCCIlLh0zOl8ghJHDA=; b=H6nH5e7rPAjo/J
	g9XK+LDO+rvGEB1nC34RYPoH65Py0w6F+0pFTk8ze6VFD5MhE5PMLzXOHoQWZP4b54+gj8ApIfrAq
	3nV/tHtr+FV6qqDH/MCz0MfMs4HNnUSoHyNtQC5KOsNBMVyVXdRdeqa4gx0Ur4AlKi/xzZZtIGfQU
	YbLNW7VoPnUL/2iYOCYH9dZ+/tNhXbQSxolFxIjpYuWkVGko+twj7OXs6z2F6/hl8ilnT5fS0pSSv
	lqqbrS2NXHEUCYhlxOFusJgBeGRYXarcyAT6WfB7cSJ5Hc3taFL6hGdOxmlkdR6rdbB22so4kFUMT
	Yr3FHLaTqhAtOdxA2tgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sgfWs-00000007qhN-2S27;
	Wed, 21 Aug 2024 07:13:14 +0000
Received: from mail-oi1-x231.google.com ([2607:f8b0:4864:20::231])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sgfVQ-00000007qDQ-0U0k;
	Wed, 21 Aug 2024 07:11:45 +0000
Received: by mail-oi1-x231.google.com with SMTP id 5614622812f47-3db130a872fso3938222b6e.2;
        Wed, 21 Aug 2024 00:11:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724224303; x=1724829103; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qGa62lm+NpvJha+MuMU8KQrhYDpQR6aMS0ytEgFfvvk=;
        b=ZwAiUUvHeExpwc+qcjLiYTCFdNvABE8QhTzFPScn2uKwen9vDVnBK9SFLZeMrcbhRr
         DRPD3dzCfR4hB70mj0LPMB/XNWtomxvi/eQd2oH7fTSJkPOljfdB143S0mg2cIJD8Vs6
         WLjCPaxg6aFpviZav83s05ze5cdn5f9qs8fsFDofhUFz/GFpiMNTh76AohGzFpotBXRx
         KoTQn21FAADnDwZnKwkKaczOddNtqrYGMzEB56ryMaU96XPOmh1spI88UahiyuwHTgbq
         htFBSPMr5SjHN4vWdWd+gYTiJ+of2G/J0TDUVUsR9KEGTzGDS+HGWg/US7u+8bVd6WHw
         iDJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724224303; x=1724829103;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qGa62lm+NpvJha+MuMU8KQrhYDpQR6aMS0ytEgFfvvk=;
        b=Fefrux6JDpVNGoeM6KamEjk/g/cN4OalHTUwBoaFv0fPMLm65Tw07/z9OK2Ri2uHhN
         R/VmPeZviTgGsUvBQp8UQGZP3XHOQfVMZHPRj7DmIE7OyfHSvoaeLoqzH4oLF9QH1b7o
         cXzLkvA4UP0npj25+lXKNRJWHNSk3Xt00ZIdsjrKzvHQ0bSyvhSggOBGMzUsd1sXaHWz
         GILhDVDe3qBtiGILKxMjiSRRQ9/sB1XoTHEG66Cxiyy8RwCwnnW3lpO5/Uu+ptm8BCZv
         XVFLqj1oOif4pp8CzngQb2j78Afx/2sPGi+E8uMwVyKYccBdRm7OHtKIPUJTq845WcGQ
         n24Q==
X-Forwarded-Encrypted: i=1; AJvYcCWlieXtZXS/OgBnbSF3ea6oqYKg/wRQbwSyD3vm8QAev/D2f5IYFB/1C3sv7CYs8rypb6nCVVQRhR8=@lists.infradead.org
X-Gm-Message-State: AOJu0YwiwFQVQQuZK7F0NfBBlwQewHf9QECjSS6b859jIyGw+DIxhI0U
	bA04YoGTk4S5ve0txxPRq8k3eMD8d4fvC8TjjULngaynOnuOgXCf6HgWhw==
X-Google-Smtp-Source: AGHT+IGo/iprfd3p83aO0Byo3qtSiIKa8o6rPt/g/EWYB/UqHNXIFdHP7tmeIc36eJgXrcnmuZxPFA==
X-Received: by 2002:a05:6808:2022:b0:3d5:64be:890c with SMTP id 5614622812f47-3de194fd581mr1593407b6e.17.1724224302958;
        Wed, 21 Aug 2024 00:11:42 -0700 (PDT)
Received: from localhost.localdomain (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7cd8b631303sm526667a12.9.2024.08.21.00.11.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Aug 2024 00:11:42 -0700 (PDT)
From: Hui-Ping Chen <hpchen0nvt@gmail.com>
To: miquel.raynal@bootlin.com,
	richard@nod.at,
	vigneshr@ti.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	sumit.semwal@linaro.org,
	christian.koenig@amd.com,
	esben@geanix.com
Cc: linux-arm-kernel@lists.infradead.org,
	linux-mtd@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linaro-mm-sig@lists.linaro.org,
	Hui-Ping Chen <hpchen0nvt@gmail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v3 1/2] dt-bindings: mtd: nuvoton,ma35d1-nand: add new bindings
Date: Wed, 21 Aug 2024 07:11:31 +0000
Message-Id: <20240821071132.281018-2-hpchen0nvt@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240821071132.281018-1-hpchen0nvt@gmail.com>
References: <20240821071132.281018-1-hpchen0nvt@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240821_001144_175306_000D977F 
X-CRM114-Status: GOOD (  11.41  )
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

Add dt-bindings for the Nuvoton MA35 SoC NAND Controller.

Signed-off-by: Hui-Ping Chen <hpchen0nvt@gmail.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../bindings/mtd/nuvoton,ma35d1-nand.yaml     | 93 +++++++++++++++++++
 1 file changed, 93 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mtd/nuvoton,ma35d1-nand.yaml

diff --git a/Documentation/devicetree/bindings/mtd/nuvoton,ma35d1-nand.yaml b/Documentation/devicetree/bindings/mtd/nuvoton,ma35d1-nand.yaml
new file mode 100644
index 000000000000..152784e73263
--- /dev/null
+++ b/Documentation/devicetree/bindings/mtd/nuvoton,ma35d1-nand.yaml
@@ -0,0 +1,93 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/mtd/nuvoton,ma35d1-nand.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Nuvoton MA35D1 NAND Flash Interface (NFI) Controller
+
+maintainers:
+  - Hui-Ping Chen <hpchen0nvt@gmail.com>
+
+allOf:
+  - $ref: nand-controller.yaml#
+
+properties:
+  compatible:
+    enum:
+      - nuvoton,ma35d1-nand
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
+patternProperties:
+  "^nand@[a-f0-9]$":
+    type: object
+    $ref: raw-nand-chip.yaml
+    properties:
+      nand-ecc-step-size:
+        enum: [512, 1024]
+
+      nand-ecc-strength:
+        enum: [8, 12, 24]
+
+    required:
+      - nand-ecc-step-size
+      - nand-ecc-strength
+
+    unevaluatedProperties: false
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - clocks
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/clock/nuvoton,ma35d1-clk.h>
+
+    soc {
+        #address-cells = <2>;
+        #size-cells = <2>;
+
+        nand-controller@401A0000 {
+            compatible = "nuvoton,ma35d1-nand";
+            reg = <0x0 0x401A0000 0x0 0x1000>;
+            interrupts = <GIC_SPI 38 IRQ_TYPE_LEVEL_HIGH>;
+            clocks = <&clk NAND_GATE>;
+            #address-cells = <1>;
+            #size-cells = <0>;
+
+            nand@0 {
+                reg = <0>;
+
+                nand-on-flash-bbt;
+                nand-ecc-step-size = <512>;
+                nand-ecc-strength = <8>;
+
+                partitions {
+                    compatible = "fixed-partitions";
+                    #address-cells = <1>;
+                    #size-cells = <1>;
+
+                    uboot@0 {
+                        label = "nand-uboot";
+                        read-only;
+                        reg = <0x0 0x300000>;
+                    };
+                };
+            };
+        };
+    };
+
+...
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
