Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6E30D2E03B
	for <linux-mtd@archiver.kernel.org>; Wed, 23 Oct 2024 09:55:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5kQyQwRwkbyaDCTics3eJ7loKIE4Il9D15EzqOaIjzk=; b=3K5bP6uJn3MXT0
	Ej+gSTk4TXwekaEjI9An+D6Cx/biQTJdzkpja8JZY706BtIF5rtqp7+XapMiCDP/KMrcD357Rs1Lp
	iFbBdZiQcD2cdNr4GqLKp3UH/Huq/jsxA8XZjfDzfrlLuIdS1c2ngFbYaJ0IFb0tD9a+gT6L44rgE
	lwABIY4pt4Ojt6U+x0jCf233C4DkyG2zUmydP84cupdsgG04wku/7nzn52C9SFoiP/K6zmUpJ4nY5
	9r6TVCxTgzuFOl7ggrS2xE0+9L7pZqtsy6nEtG+j4WtI2Kj77FyCsZ6Z/NMdNsRaa23D0f6sthK9T
	aROqqoPbysSvFSt1g07w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3Y52-0000000DshW-0HaF;
	Wed, 23 Oct 2024 09:55:04 +0000
Received: from mail-pg1-x52e.google.com ([2607:f8b0:4864:20::52e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3XdK-0000000Dmq4-2TGc;
	Wed, 23 Oct 2024 09:26:28 +0000
Received: by mail-pg1-x52e.google.com with SMTP id 41be03b00d2f7-7ea76a12c32so5309404a12.1;
        Wed, 23 Oct 2024 02:26:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729675585; x=1730280385; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JuOQJ2SkMr9MVCpuQjB+HvX8BSfQHaT0CbF4h7Jt34Q=;
        b=C3ENBcR1yyD+RKwrJEJGYR7F0WJpQt73kgBtWlyUHaxze5PHqB7VS91BvXMgaCVe6M
         3V4nl9C1/ab1UQ6Gg+7dZ5GsiXU69xrShsy/U41e5bPthEBQJQs7j0zv9gVcWeSrUZqL
         Xwl+89LVgeknO2wyhnP+6+pAQ9pdqyiQl/5NNvAbBykVB6IxU5N2V9F95OI7dOonS7zw
         HiZGf+wENx3yyGls7/7wQdGUYO1Nk1G6BtJcVqe48GVNypFTburV1/V0WHa8bEUzMsGK
         EpmVq7bWuQ0eot+p5VUO4g0rbev6tKC4w8g2cFOGUug+0wFnRl4kxz5bIUSy8GV6dVwQ
         GC+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729675585; x=1730280385;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JuOQJ2SkMr9MVCpuQjB+HvX8BSfQHaT0CbF4h7Jt34Q=;
        b=YdL5HUr0lduibs7gBL+Fl4cFZwW77gNSQix9k/ECWZyGmZuF++Lga3K30c7bXHUwcx
         FYdumVre+fXdlOGj34S9JqDR2eXLZAPK0fwXTsP15WPpx5JxG9GSnx0ej9yvy5LomAap
         GGQLtFQ8CpIC2H51NbA2YbyYLa9aIR2HSMKnET4RurGR37zRUO0yvLYvErBBU5Y9aAsF
         RMR20jphYwoF5KXX0HEhRck9qPP4z1FQlV1ios6YaANNtDDRZmrkU1G+rB/0F84S7XCM
         jTdyIRul3VwafC70wk602p7NNfSnb806I9cGQv354w/hFk5oWXdXIpG6aeK8odW0fAdK
         Lb+A==
X-Forwarded-Encrypted: i=1; AJvYcCXflQf3cBOUMg+hJfgB59r9kK9YhzrfsYyvgd5+YMROBUxQYy1BflW+X3sWmlGG0mL0GHy/E7lZ8J4=@lists.infradead.org
X-Gm-Message-State: AOJu0YwvdlguRaXJMUz66sZK59jNk9BSwtXBDUrIEF9/BSsQs7Ta80cK
	JpcG8xozaROdFZ6WojSVS2TxOr8eNLWfoDYmIA6vlSYoSbTWEKS4
X-Google-Smtp-Source: AGHT+IFgSuaonEQKbpOdhU0C+5es5y80LkBF8oAhpgGB8tbojbboRAl1ZErgSSK1qa/OIURV/s+OfQ==
X-Received: by 2002:a05:6a20:d49b:b0:1d9:215c:c63a with SMTP id adf61e73a8af0-1d978bb324bmr2151475637.47.1729675585407;
        Wed, 23 Oct 2024 02:26:25 -0700 (PDT)
Received: from localhost.localdomain (60-250-192-107.hinet-ip.hinet.net. [60.250.192.107])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20e7f0bd376sm54041635ad.132.2024.10.23.02.26.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Oct 2024 02:26:25 -0700 (PDT)
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
Subject: [PATCH v8 1/2] dt-bindings: mtd: nuvoton,ma35d1-nand: add new bindings
Date: Wed, 23 Oct 2024 09:26:16 +0000
Message-Id: <20241023092617.108021-2-hpchen0nvt@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241023092617.108021-1-hpchen0nvt@gmail.com>
References: <20241023092617.108021-1-hpchen0nvt@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241023_022626_650979_590E4492 
X-CRM114-Status: GOOD (  11.08  )
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
