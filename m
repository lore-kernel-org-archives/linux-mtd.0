Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24BA0D3B7DB
	for <linux-mtd@archiver.kernel.org>; Mon, 25 Nov 2024 05:27:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5kQyQwRwkbyaDCTics3eJ7loKIE4Il9D15EzqOaIjzk=; b=rqbdWoeILxxAXH
	WrF34z/ZUrAkhV4oq0k8uldgJVxYtIPU+2zLnJ29Q6x0L32FziCgWJmEkmcYsO3hj1d8b/wfbT5Qf
	C1GUMRxhCtgrLl5L1rWMjfK/Go8R6Vdp8VMWGCkw8t1sFZOswrdTyRn6If+OGqyA9ssN0Pgkk+CFx
	oLsk+SUJjUg68lIDYniRnTfw0VTQUYQJ4R4Aisu4KzU3UU2YIzQWCEBwU/iB0zzps0cz81Lm1dNlG
	ZIP+PCdg8bJLoKg5GNDavR7/5H98YiCgLdVOIeaVo9LeyE+w0irtgm9bHQiTxOEE3ZidxvwnNSh51
	GHYLBmvU/Y86iIgT+2Tg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tFRdB-000000075tp-2Wl0;
	Mon, 25 Nov 2024 05:27:29 +0000
Received: from mail-ot1-x336.google.com ([2607:f8b0:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tFRbJ-000000075V4-3TC0;
	Mon, 25 Nov 2024 05:25:35 +0000
Received: by mail-ot1-x336.google.com with SMTP id 46e09a7af769-71d54fc1944so14164a34.1;
        Sun, 24 Nov 2024 21:25:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732512333; x=1733117133; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JuOQJ2SkMr9MVCpuQjB+HvX8BSfQHaT0CbF4h7Jt34Q=;
        b=O94fG62lwTSTtNxGVSQi2dx4XBPMEVaWrh4u/GSyMvaATIJjTFgjQYPsiyOkW1UQD6
         FR+F5Erp60UtllcU7xTRpQqJ9HcDIXGy7LZgoKb1GFiNLQtfj0dFuo8wu4Lf2sMfMC74
         IwFuebMvoF/YQK0YK3LHgDMjAk0fgvtyOSaPPNvpmODbmqgg6bJoMxD0foKfoF06biJI
         97YT8zxzXPMAdRQCX3tSwSiuGbjNCYsZXvmwiG1ayeqOTKtEhQYahbwzspWnZ66HJMst
         /Hyk0B0YI3RQyWIYDODDlUy8Cy3XtghoJIaOdhx0HayQfZBj3+JvW5Zp7pcx6IeGdnaH
         xYnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732512333; x=1733117133;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JuOQJ2SkMr9MVCpuQjB+HvX8BSfQHaT0CbF4h7Jt34Q=;
        b=SZBViqcvYpaHdbogX6eOopKDRtgEWlX4qxiHOa1FL0GzrQ7JdVg0Z2mbGelC7LFE/U
         Xs+ts6VXTVZkMq25rzyfB0t6o+gMwv6hmCTDNmrT1jh+XF8Prv0O9MfMJd74CJi87Inr
         +8h7LNQS0C4fP2uBHnl+c6i4d5FQpcGLjnYz3UdtU+fIZZjwKNO9a55RYh0s11zROYnJ
         Dl6O0wrqq7Ewr1O2ZtXCaQNKsZE/meEi8KxVGYcGfZ6obufpWaKmZ8oQRggpYOj6nCMe
         dHeERx4piCsEU1K3Gc95cdD+3AopdPp5AeKBr4lwKNo0GhBPXVDqKcYcUWmAzzlvF7I9
         eblg==
X-Forwarded-Encrypted: i=1; AJvYcCXlRKJ0Fr1MyEBaHhwTzlituNYmdhJRCVhY4pCtXk+mSNTRWcXROHrYczDewzKkJN3lXkap9OQJd0M=@lists.infradead.org
X-Gm-Message-State: AOJu0Ywlqad6gDKZ7zHwE7vlfhbA05Iki2tYqtGDfLSDF6AQXQPbmQ8h
	Fvf5Ug4MStY79pBoXwJzxYQ7o2I0rtkwetVA9OhYnT1r1Bcr9xAI
X-Gm-Gg: ASbGnctn+U3mxRiXwtv45ks28bfm2ifO8MUeQTR2Nssb/AFTMYZAA9WPvRj/NWH2WnC
	VxTAVSNhoByPQ/bpXLn/y8I/MZCAItPHz5JRp6ZZsPaQzbHQBDi51bRNnJ2naVLRN2Scv8n6grW
	/kAq6nq+jJ6lblCnSZPrJQ7SuU/+bemB8Kjw3wlH9ry0e+GhKViXyJR1FC5RpRbi0Bh48moBU2Y
	R1uTSXft48mHxA4nTCAsLGVAteeWRGxw8uQI+JwQBFjzSnKC5NOkGWScr2+mLCpnOpnVVA7USkP
	ioSei/irZ3u3qJmMfjwRSP4gjw2Eu7oJiyo=
X-Google-Smtp-Source: AGHT+IHtfvucq6U9mAu5ufGyGi1M4cqxlrC0u6NIo6vYE0Nh2x0INqalF/owdWqB41+rN6DU0Hl1Yw==
X-Received: by 2002:a05:6830:6e0c:b0:71d:4660:de72 with SMTP id 46e09a7af769-71d4660e45dmr3046828a34.27.1732512332791;
        Sun, 24 Nov 2024 21:25:32 -0800 (PST)
Received: from localhost.localdomain (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7fbcc1e2490sm5698557a12.31.2024.11.24.21.25.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 Nov 2024 21:25:32 -0800 (PST)
From: Hui-Ping Chen <hpchen0nvt@gmail.com>
To: miquel.raynal@bootlin.com,
	richard@nod.at,
	vigneshr@ti.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	nikita.shubin@maquefel.me,
	arnd@arndb.de,
	vkoul@kernel.org,
	esben@geanix.com
Cc: linux-arm-kernel@lists.infradead.org,
	linux-mtd@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Hui-Ping Chen <hpchen0nvt@gmail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v9 1/2] dt-bindings: mtd: nuvoton,ma35d1-nand: add new bindings
Date: Mon, 25 Nov 2024 05:25:23 +0000
Message-Id: <20241125052524.135362-2-hpchen0nvt@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241125052524.135362-1-hpchen0nvt@gmail.com>
References: <20241125052524.135362-1-hpchen0nvt@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241124_212534_402486_310B73F6 
X-CRM114-Status: GOOD (  10.92  )
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
 .../bindings/mtd/nuvoton,ma35d1-nand.yaml     | 95 +++++++++++++++++++
 1 file changed, 95 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mtd/nuvoton,ma35d1-nand.yaml

diff --git a/Documentation/devicetree/bindings/mtd/nuvoton,ma35d1-nand.yaml b/Documentation/devicetree/bindings/mtd/nuvoton,ma35d1-nand.yaml
new file mode 100644
index 000000000000..0b651450a8f1
--- /dev/null
+++ b/Documentation/devicetree/bindings/mtd/nuvoton,ma35d1-nand.yaml
@@ -0,0 +1,95 @@
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
+      reg:
+        minimum: 0
+        maximum: 1
+
+      nand-ecc-step-size:
+        enum: [512, 1024]
+
+      nand-ecc-strength:
+        enum: [8, 12, 24]
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
