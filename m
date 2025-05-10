Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 229EEC3ABC3
	for <linux-mtd@archiver.kernel.org>; Sat, 10 May 2025 19:47:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=G0YuESFS2P8qHlAQte0aBUnvCd9zL0oyEtak1321ArU=; b=nE7h8fp2ZHx+tU
	Zn4FYKFuoUuxAukfNrLM5RRekH74VN7Q5JDnQA0FUVjTliuXCkRHvcKbuSSVs3SZie3Qm8hAEpQTO
	IiM/1YHqpQWg03SFnKloAiH3A4ys3USaLf85Rx8gpfg2xr7WuR34PMq+U2EbPE7QwfD9olSGspmCm
	DiLtmg0TjPrR3lDu0PvEEQzwWBk+wYCYexMQcJu9/Uz5CcISWhh2PNnasH2wkJFcwLnZsq95GVAbw
	8mLQsJW6M72jT7YIG8V4jKXDJP2PNTn3BNo6NkCzaxAyyqs/STOyC0NTfX/0lWrQs3nQLmq9eMMaE
	NrxgCqDbXnqWwqrbs08Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDqA4-00000006JvR-1WIf;
	Sat, 10 May 2025 19:47:04 +0000
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDq62-00000006JBB-25EB;
	Sat, 10 May 2025 19:42:55 +0000
Received: by mail-pj1-x1031.google.com with SMTP id 98e67ed59e1d1-30c1c4a8224so2225673a91.0;
        Sat, 10 May 2025 12:42:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746906173; x=1747510973; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ajRywws6lD8KHlYjxWd9Od+zJbHSPGQcC6B7Bpdbzrc=;
        b=NdTiLn13MKjdpIG71LiS+cEki3DfT2YLVZlYcg0tkwN5GyYlabTTk0kDmjhgbuJsi1
         Wf0C6hqfHJA0til7v3krg0CGYG5jCfIVDAtAwzXwVX3yGmUWz0toXGY3rkvrhd6DxTaJ
         IEST6HRdJsC4jcsv8LP8k2ie6NXvXSZiYQeHo5KqJKJhZ/IlB5UBtHMu/dLlNThQ8xzK
         25JVIOcK9/eITq5ZAvYSqYcGPYOfmfIB3TVoVf5Ntv+myyhoLX2ME1i7AMYcdlwm6Nkl
         fgNCcYPYWmM5Kyy7Y/+sSz0iKxaR/1xiNW+fnFQg3Qd/8QZ4RsdxTh/L/PQwh080A7Ah
         WYgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746906173; x=1747510973;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ajRywws6lD8KHlYjxWd9Od+zJbHSPGQcC6B7Bpdbzrc=;
        b=h9Jf8wAyibtMDkmshrSdro078jtOTcxjjnOSn2m8jdyem1sOkWV/BbNGxjAza1sfKo
         DjiZS/tt3flNAPvAvSKHeX0lFWhqPhGSyBmLPIvAFESRPX46yigb7v3V/72rO2KUTmkc
         uUGx+YJfgy+Sa4OlhAvgjXVsGhxCga/OeesqiaPYu8C8YBd6CtyIbHZE8YlwPVaC9gtu
         4Hd2u3oplxN6o8WpqUZCjIePHKZFq5gZYiIEC8cPb+0y/G5jFZKsISIG9yRE56G7yIxx
         VZ/j3NGKrgWi81wjtTZjWwSe0x90oLnu5fCqh4dOpOKmnTWrmKsHpSQOk5VphEB3XZJg
         gptg==
X-Forwarded-Encrypted: i=1; AJvYcCWppsMoHxCiu3YpKViM331UOGd6N+7xDShJBcyIpC1VPMlFlA+l6jsqs6MjN+SRUdP+8r6UxYZf36ga@lists.infradead.org, AJvYcCXs1Pr4DZ5SLhJ6dKgCmFEf2ncrbHxIr4lBlrmGTs6E5jjD8iK/nBB8fySXF8l/TV0+JUNqqBQe40b7Ve5zaTgR@lists.infradead.org
X-Gm-Message-State: AOJu0YwKSkX5n+L0iirc+1bXC04NZGY3pVNWAlURCSpnJqURSWmvzPvL
	t+vvicS7KtTLOVcoLP5kEpJRFfmlsXzdEQCBBzs7S2a4LHCDl5ZpmYKZ4Sps
X-Gm-Gg: ASbGncsvMObN8WYeGlFRkEb/MVyvuIqC/2PkQT/VI4+DXcslkwuuFXiMbCnlMuqb5w9
	F7cQcV04WhITp4amoQ4hb10+XTlUsPH4iwhWqifIdkGK7o+kf/w4B93YjbYc43M7ww0fOhOkTS/
	ah63jT+wliMl6eqpxoEEOkdQZ/ipZIphIdZUDsZ/ozTia0+Kiavo4sjgG7UU+P9EdER72fheKZ2
	9eCVieHsDQqScI7wlOvrA9miYqJqncYQopX4vAgARFjS+uZStradgT6LF2Slpw1bANwHVoorMuF
	a7pqVlAaLe54RkLdo7T0pLUjlETaCkKXUwyGG7dn3Al1rRWPKDN+gxkgsv8Z0I8=
X-Google-Smtp-Source: AGHT+IHF/6vAuUa2FDr0Jh21aQSSYaG/h9piroxVtpPE5qcBaQXlPgMlxHqaDut6EeR4ncYQAZR0jQ==
X-Received: by 2002:a17:90b:390f:b0:2ee:ee5e:42fb with SMTP id 98e67ed59e1d1-30c3cff29ddmr12950783a91.13.1746906173489;
        Sat, 10 May 2025 12:42:53 -0700 (PDT)
Received: from NB-GIGA003.letovo.school ([5.194.95.139])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b2523e67d53sm2223670a12.19.2025.05.10.12.42.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 May 2025 12:42:53 -0700 (PDT)
From: Alexey Charkov <alchark@gmail.com>
Date: Sat, 10 May 2025 23:42:21 +0400
Subject: [PATCH 1/3] dt-bindings: spi: Add VIA/WonderMedia serial flash
 controller
MIME-Version: 1.0
Message-Id: <20250510-wmt-sflash-v1-1-02a1ac6adf12@gmail.com>
References: <20250510-wmt-sflash-v1-0-02a1ac6adf12@gmail.com>
In-Reply-To: <20250510-wmt-sflash-v1-0-02a1ac6adf12@gmail.com>
To: Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Pratyush Yadav <pratyush@kernel.org>, Michael Walle <mwalle@kernel.org>, 
 Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-spi@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, Alexey Charkov <alchark@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1746906149; l=4940;
 i=alchark@gmail.com; s=20250416; h=from:subject:message-id;
 bh=mMLcIpsEhoq8UdQQpLuognQnHIyH8ycLrQgiuLuYhxs=;
 b=qVbf4RLXYHvpthPaLv01NOrHydUepNylWyn5bR8XeTaRW3QuUOwUcom2Wc7juU8PLY+eUEjZ3
 AzqsQn1ud4KD1jQxQL29PwhpRzDUazDtepjXqcyy8fbVOkMuAmp9j/c
X-Developer-Key: i=alchark@gmail.com; a=ed25519;
 pk=ltKbQzKLTJPiDgPtcHxdo+dzFthCCMtC3V9qf7+0rkc=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250510_124254_544048_B0EECC0F 
X-CRM114-Status: GOOD (  19.13  )
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

Add a binding for the serial flash controller found on VIA/WonderMedia
SoCs, which provides semi-transparent access to SPI NOR chips by
mapping their contents to the physical CPU address space.

Signed-off-by: Alexey Charkov <alchark@gmail.com>
---
 .../devicetree/bindings/spi/via,vt8500-sflash.yaml | 122 +++++++++++++++++++++
 MAINTAINERS                                        |   1 +
 2 files changed, 123 insertions(+)

diff --git a/Documentation/devicetree/bindings/spi/via,vt8500-sflash.yaml b/Documentation/devicetree/bindings/spi/via,vt8500-sflash.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..d2ea0dacdd56118c0cb5a1cb510ceb7591e1e5ca
--- /dev/null
+++ b/Documentation/devicetree/bindings/spi/via,vt8500-sflash.yaml
@@ -0,0 +1,122 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/spi/via,vt8500-sflash.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: VIA/WonderMedia serial flash controller
+
+description:
+  This controller is used on VIA/WonderMedia SoCs such as VIA VT8500,
+  WonderMedia WM8850 and similar. It provides a semi-transparent interface
+  for reading and writing SPI NOR chip contents via a physical memory map,
+  abstracting away all SPI communication, while also providing a direct
+  mechanism for issuing "programmable commands" to the underlying SPI chip
+
+maintainers:
+  - Alexey Charkov <alchark@gmail.com>
+
+properties:
+  compatible:
+    enum:
+      - via,vt8500-sflash
+      - wm,wm8505-sflash
+      - wm,wm8650-sflash
+      - wm,wm8750-sflash
+      - wm,wm8850-sflash
+
+  reg:
+    items:
+      - description: MMIO registers region of the controller
+      - description:
+          Physical memory region within which the controller will map the
+          flash contents of chip 0 for reading and writing. If the flash
+          size is smaller than this region, it will be mapped at its end.
+          Note that if this chip is used as the boot device (as is most
+          often the case), the boot ROM maps it at the very end of the
+          CPU address space (i.e. ending at 0xffffffff)
+      - description:
+          Physical memory region within which the controller will map the
+          flash contents of chip 1 for reading and writing. If the flash
+          size is smaller than this region, it will be mapped at its end
+
+  reg-names:
+    items:
+      - const: io
+      - const: chip0-mmap
+      - const: chip1-mmap
+
+  clocks:
+    maxItems: 1
+
+  "#address-cells":
+    const: 1
+
+  "#size-cells":
+    const: 0
+
+patternProperties:
+  "^flash@[0-1]$":
+    type: object
+    additionalProperties: true
+
+    properties:
+      reg:
+        minimum: 0
+        maximum: 1
+
+required:
+  - compatible
+  - reg
+  - reg-names
+  - clocks
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    sflash: spi-nor-controller@d8002000 {
+        compatible = "wm,wm8850-sflash";
+        reg = <0xd8002000 0x400>,
+              <0xff800000 0x800000>,
+              <0xef800000 0x800000>;
+        reg-names = "io", "chip0-mmap", "chip1-mmap";
+        clocks = <&clksf>;
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        flash@0 {
+            compatible = "jedec,spi-nor";
+            reg = <0>;
+
+            partitions {
+                compatible = "fixed-partitions";
+                #address-cells = <1>;
+                #size-cells = <1>;
+
+                partition@0 {
+                    label = "U-boot";
+                    reg = <0 0x50000>;
+                    read-only;
+                };
+
+                partition@1 {
+                    label = "U-boot environment 1";
+                    reg = <0x50000 0x10000>;
+                };
+
+                partition@2 {
+                    label = "U-boot environment 2";
+                    reg = <0x60000 0x10000>;
+                };
+
+                partition@3 {
+                    label = "W-load";
+                    reg = <0x70000 0x10000>;
+                    read-only;
+                };
+            };
+        };
+    };
+
+...
diff --git a/MAINTAINERS b/MAINTAINERS
index 6dbdf02d6b0c9357ad1da520a0f6c16b7f38f879..f09c457bbfc5ef71a3f8379c111bac52b767cbbc 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3475,6 +3475,7 @@ F:	Documentation/devicetree/bindings/hwinfo/via,vt8500-scc-id.yaml
 F:	Documentation/devicetree/bindings/i2c/wm,wm8505-i2c.yaml
 F:	Documentation/devicetree/bindings/interrupt-controller/via,vt8500-intc.yaml
 F:	Documentation/devicetree/bindings/pwm/via,vt8500-pwm.yaml
+F:	Documentation/devicetree/bindings/spi/via,vt8500-sflash.yaml
 F:	arch/arm/boot/dts/vt8500/
 F:	arch/arm/mach-vt8500/
 F:	drivers/clocksource/timer-vt8500.c

-- 
2.49.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
