Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F1DCCCD192
	for <linux-mtd@archiver.kernel.org>; Wed, 18 Sep 2024 09:05:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tFXS/bqFnAPAbLyY3V8nOmHDNy1NSiZO2uD9qH5TOag=; b=wIeUjpOJYTCwUK
	0E6p41Jj7wTT/qlYYl+EPgojP/XJ9lyMl4WXNghmeaUN3dnzKcJjxwMiVEFo0MwQOwifqlgTlREAM
	7hMNlylqZkIfPwpsf1tBc2IwKODmi387FKe7ciQontOXXdBqdIL6lYtIeyqIZgwsIWE/ZOtjSRW//
	RVi7ATVHkIOHSpzfjT7rnimWbxKbpobevW2zK7camTDsaYa/PHgOgcQutVoH/r3UCT02swBWfaeyr
	bU9QXBpXRUbyxfpXBjf2KWdfUmKon0j28Lrsv/UqQe/59/Uxu8nQshPUive7jGAEnyyC+Y4zBOK3j
	Cc1+W9ycznOYA2fd1KiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sqqcu-00000007tLQ-1TLQ;
	Wed, 18 Sep 2024 09:05:32 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sqqak-00000007srS-39aR;
	Wed, 18 Sep 2024 09:03:20 +0000
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-20543fdb7acso38443815ad.1;
        Wed, 18 Sep 2024 02:03:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726650197; x=1727254997; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AjX+GWxHlPwm32RdWG50sup+7/ylH4rWNpxlnfN528U=;
        b=NohUS2cLNM0Nug0CK4cU95xn7qp1UX3vmh4wqFkxGBFcRMxfRk/tAj/A26GMAqVLXD
         xZFkVlIJOcZdRxisy/i4HfUxLQukt+I7FRvjDfZomjNH+Mqrzh5idTW5YQJYZGTRGcaZ
         zPnpQS2DUj6XikoyjlT/W1lIaW/ZXKVYU6Pp8XLTkW2dhUnEFxuyotheDYPr3Xu88GlT
         0chqjjU9o2yaxpHwkYPze6PrbEIyBtYrnxhP/sIxrW2HSk5/iadRWO7EjjLrlYb5sW2n
         XQhjV4t91bcc7MZuEAEWnComrOYh8uklUeaazDXWy/jaLuT0hqgNF1VYa8heHads2c4m
         moDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726650197; x=1727254997;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AjX+GWxHlPwm32RdWG50sup+7/ylH4rWNpxlnfN528U=;
        b=G8ldxui093m2egwlAM0UtXvil+41AnGfzm4qzRbDMLuJV7/3W1OBAJwHMT8Lgz9tC4
         YB86ZcLc9im7l+bWqUpegLdf6rZUHjWMpAsETyOgAuzLI17qLRo5RFiOdIaynIjmyiuW
         1Ry4KAW3n/1zggvAhgaGJqFEki2x12lfe/PWSsrzA7jNp5wLB7IgAAbbSi53aUdWMqE6
         9tpqOrRwlJ4Hi3XQzxfayKFMmw8878+CCNu1fDG1C1lp0NKxrnMo1M1XnUGLQs608SWI
         MAQ+GI1Cdvd35HofYc3xBPwQ9hvOlMcHOieE5cZ/htEsgt/S0hp3OmFtg+D8ZmeGYZEg
         rODw==
X-Forwarded-Encrypted: i=1; AJvYcCWcqulJvb5OCSE9EwtYOVjLOOsPBb7adiYNWaR1Fyng1uT4083cfgyINr8cg4zRX2BSjFDoOq9cWVU=@lists.infradead.org
X-Gm-Message-State: AOJu0YzFQKgb+xs9iX9a7v2BLwzWUWc5AqzyTAH8dWsNs27XnhdDSyXQ
	TG+Ku9H8TRydRZMgAkgVqenGWavOzZeCQNKDRd9lVjSNwJcTa0my
X-Google-Smtp-Source: AGHT+IEu2ExwD56L0eMxFaxhnTGWr5C0LOkIV1Cbr4483wISjxblVpLqyl0/2mVScIM1AHAa8dS/2Q==
X-Received: by 2002:a17:902:e852:b0:203:a14d:ed0 with SMTP id d9443c01a7336-20781b42d61mr326944145ad.11.1726650196885;
        Wed, 18 Sep 2024 02:03:16 -0700 (PDT)
Received: from localhost.localdomain (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-207946010f9sm61021875ad.84.2024.09.18.02.03.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Sep 2024 02:03:16 -0700 (PDT)
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
Subject: [PATCH v4 1/2] dt-bindings: mtd: nuvoton,ma35d1-nand: add new bindings
Date: Wed, 18 Sep 2024 09:03:07 +0000
Message-Id: <20240918090308.292617-2-hpchen0nvt@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240918090308.292617-1-hpchen0nvt@gmail.com>
References: <20240918090308.292617-1-hpchen0nvt@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240918_020318_813557_2E7E4D67 
X-CRM114-Status: GOOD (  11.36  )
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
index 000000000000..a8a549644c98
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
+      - nuvoton,ma35d1-nand-controller
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
+            compatible = "nuvoton,ma35d1-nand-controller";
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
