Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE33FE7716E
	for <linux-mtd@archiver.kernel.org>; Fri,  6 Dec 2024 03:15:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5kQyQwRwkbyaDCTics3eJ7loKIE4Il9D15EzqOaIjzk=; b=Q8aZx4Xtm7sqCB
	hISNtDbQ6LBPa4IbOBVPpRAtQTgIelcvoOfnBtVzo+krZqsjSA6zfkwBvA8VNETStfk/be12Ccl26
	e+t2l+svjBJbnOE7VTegjlXJkGt2I/HY3v69RHz/M1WjXMIa+ufA6Xc3kZlox0Erv/wCjcu1ATJtG
	E+aNyRCec11cHsaTlzrrbldoRmUXgHG2cbVTtcvX+gDTMyi466HOrS0iE8YvsH1DQkQ5eH9z264Dk
	NmnZqhCOwdVIYiO1MrUgUsz3UQY4Z6cXVTOYvAjpHVhZiz+b61PKjLvJRXwNc+bC65zIUkuGp5zw3
	yLCGQgYqXgwuEnzaee/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJOoV-00000000PCd-1LLq;
	Fri, 06 Dec 2024 03:15:31 +0000
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJOmV-00000000OnS-3tQ0;
	Fri, 06 Dec 2024 03:13:29 +0000
Received: by mail-pf1-x42e.google.com with SMTP id d2e1a72fcca58-7250c199602so1727693b3a.1;
        Thu, 05 Dec 2024 19:13:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733454807; x=1734059607; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JuOQJ2SkMr9MVCpuQjB+HvX8BSfQHaT0CbF4h7Jt34Q=;
        b=HPysVS6XiWYu8G0ArzLYvOGUQNUGZbYE4m7HtSFOZWl5Te0Loez96iToVsoXGfs9/Z
         C8npAOlMxoV4oTjBI6i6MLXw3jWhheINKjVNTwPsH8H76FijmkVd8nGnGpwrg+/02nxv
         jqAIvhfgAeYxc1w03uBx1lLp2ArKyarn2F7qpT2ioNwrXen4Y3Ytpy1qzy30vRyYhrpT
         ygaPiWsncdYRBzx5/mnGg7TRj9NG+S5NriHaxJp6cMFZeszszFd/mTalqsINW6vxjMlx
         pUWvv30Czxy1PR+mFps4HZpnCLk4s/PnYuv/9v94vZQNu6WZD8SkOk0kjB52gi1Rbbhl
         XrVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733454807; x=1734059607;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JuOQJ2SkMr9MVCpuQjB+HvX8BSfQHaT0CbF4h7Jt34Q=;
        b=Jd0gniqwiEezjulZnZEPwZgqKEJCltWfZ+IH8x11Smt8GatRWg+XCRPVcR3cz+O41i
         oaawgnPBvDAXWyF9OOxsxcJASAnNU4wLMfzYysIHcH0439SH289h+f0vK7ysd3e+aOL6
         MYV1ai+dz+GRUKRBQzMNzrs4zVWRcDsPPxhRUZi7pjv6CQN0Upf6dcVGclGdP7EmAK5U
         m/YQrZ6Bu/gCPAq/29vN96iH9XhN3SEF328qzhyXghJgwzYvCuU+I7eS2SLedlGoMtUz
         TqC8qfse4GWzkKlcDTEYVSRV4FpBIPoO5eLWgG72O1/7vRckiVjd2pgvinn90TSR2Fe1
         Hbuw==
X-Forwarded-Encrypted: i=1; AJvYcCXVrAVM3oh17a46SPLccEkZHRKVJWd3RjP+5RhUSJ2GgfpFD5equUm10WElMoGjthlRkOnBZsiZH/k=@lists.infradead.org
X-Gm-Message-State: AOJu0YwaJmhAyYShC/NJyyzvXlC2OEkUku0dSRugHzM/heMAPJz8z6rt
	vZNEc4xgjaM4y/QXJJcjsR1WQijkf8CfMS4KRxfizLNhq2wxLB4T
X-Gm-Gg: ASbGncuIisxOy6XcO5sNC/8GW33Gp8nluuRVNOKH/ulHWC8tYtkHyrcTdcFXag6RDA3
	XcX1vmgVPhTXpKWP/uXmUIqLidvcwFeWuJHI8JKO0PM0p2igiZo5EZ0zvPLnIaFtcfGkQyU1GC6
	mbI/ReMHHGvHCEKQYAl0hG+nnwUJG9F3j/CYMOJyu3yjo4I40K2xsn4O0VjPqYYh95iBW8e199O
	4z1Je4VlGH6bF22/Zl69xw6FAH2D9Q7XKV2zB3YrpBxYJ2xtOk30uSSLERbH47i5B20g46ieCUA
	VOq9vuxOoctdy3Dqgz69UbenBdc+YViSYsM=
X-Google-Smtp-Source: AGHT+IFG79erwAcKYIbcdG6HiYsY6FuhsdbcOyL2J1Yhh14Eott+QLsa1nKgm+/WkfeveOKenOMEkg==
X-Received: by 2002:a05:6a00:894:b0:71e:5b92:b036 with SMTP id d2e1a72fcca58-725b81be43bmr2345419b3a.22.1733454806821;
        Thu, 05 Dec 2024 19:13:26 -0800 (PST)
Received: from localhost.localdomain (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-725a29e9003sm1966791b3a.44.2024.12.05.19.13.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Dec 2024 19:13:26 -0800 (PST)
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
Subject: [PATCH v11 1/2] dt-bindings: mtd: nuvoton,ma35d1-nand: add new bindings
Date: Fri,  6 Dec 2024 03:13:17 +0000
Message-Id: <20241206031318.156152-2-hpchen0nvt@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241206031318.156152-1-hpchen0nvt@gmail.com>
References: <20241206031318.156152-1-hpchen0nvt@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241205_191327_988031_50CA9474 
X-CRM114-Status: GOOD (  10.17  )
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
