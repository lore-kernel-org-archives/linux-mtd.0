Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27357E7716C
	for <linux-mtd@archiver.kernel.org>; Wed,  4 Dec 2024 02:53:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5kQyQwRwkbyaDCTics3eJ7loKIE4Il9D15EzqOaIjzk=; b=ujyIXJoGICq5xO
	whRsoB2Z4IcuDRz+cL1xfKXHb/ihyg+oHWaPZkJAhDfx2uBwKooA7nxkUeK1ZYepNfU/N24e5ZiCg
	4dfXAiw64vpD8VOqwV1e0WmynXLmid/OpAjp0kJvfPZcOoSFpDmL6YKoua1TUW59CmE/P0k6I3NmV
	U/6gb2ApPdOk9hKtwnC0Td/3YmDQvSBCSXyHyTtm42XIfVqicD9VcUiUrUOjaq95x43+Dge6xNpRu
	7zyhZf42xY8QeVrkk+UeqdbUrlUIcDksS0QCrf4Bhew6yG3AlSNYozLVA8EQc2zTEPZoMSoaYs05l
	0SS5bf87HL7lPS791lxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tIfWG-0000000BKGz-0P4L;
	Wed, 04 Dec 2024 02:53:40 +0000
Received: from mail-oi1-x233.google.com ([2607:f8b0:4864:20::233])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tIfUJ-0000000BJwA-2JhU;
	Wed, 04 Dec 2024 02:51:40 +0000
Received: by mail-oi1-x233.google.com with SMTP id 5614622812f47-3ea3cc9a5ddso3134651b6e.3;
        Tue, 03 Dec 2024 18:51:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733280698; x=1733885498; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JuOQJ2SkMr9MVCpuQjB+HvX8BSfQHaT0CbF4h7Jt34Q=;
        b=hl4Yr2DsSF4b2PJUhx4O1gk+FjBdYXs0zxhc1MZmKov3waeNOloOVBiwyVJTlw0jYS
         uSsXuHsjsBBHjKWAh4CoaZhcCbOoKEoYL5Gt+T8pYJVQDQtWoXvvLsRqa6BAj1saoKvd
         VnxbiO3zjacgItT81DxcFVWKmC14FNqzOtHxCUGvhEDdk6qBgd8kRjXK/CfQ11nMR8Xx
         eHZc8vJhaYrTdrntdLMEA3H/y42Sq1jtOmX2WbjquXaGmgqofNplap5ga8MBZfnIgBSE
         S9d9+AmYVuVxqbV4mpwIcSz55L8cR2xVMpTWvZX+gPvWZ6TMC/SQf3L5f6XL9Tu4Obip
         HmaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733280698; x=1733885498;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JuOQJ2SkMr9MVCpuQjB+HvX8BSfQHaT0CbF4h7Jt34Q=;
        b=gmAJbKtT46EZQvN8qaAWFF84NC64s+Gr/0bkXQlLPneC541EJp7r4c3VssQLE33Ujo
         hwuT9ymf1iAp3M42l7imxPSEZKRU3A8p5CnXBiz5Vc42SVRyV/ruaUnb0UfM9T3S5CFj
         HjKUBdsdJYbAKQoxrsKTiLtlgUpgGZAJLKGrMpF7OQiUU4lp0hUuJdjt/+WBEieVGYjg
         TYQwyo5hrPJoIEkc4kAHADcWu3U8e01+xG6kFOj6ADbxNoTZfRsLaK4GOvk7hEYzh/A4
         +XrrA/Z97PeAtRv8ASWAQKYOihFO7wDtb/DCvqekOt6lA8+1pxDhWGWfjXGFWr5h3bXV
         nDUA==
X-Forwarded-Encrypted: i=1; AJvYcCUwN5hBGftpWsUD5TnEI0rQpOtGZsdxxLmcg98hhuGLg7EAkRDEB6ut/dDd6iX0F+aLkfoirQVekWg=@lists.infradead.org
X-Gm-Message-State: AOJu0YyDOKsCCJwyH23swyts7wHW+hbZKgvo+rWM+rkGBR/gEsp6Coz8
	kkLAxAWJJoHigpC0G+tVDQWHqNgH44EhyW1cyhVhQeWArIktgXbE8hsgYw==
X-Gm-Gg: ASbGncvVUryu6zZ2ICyZOsfQB4XhNKBYDwrB+a5OH725DTFSiwj0j9skVNDZSYZofDN
	LWDaNQbCK2ThebXmjkn8FZ0IxKqVNAZ3ouOBCAERXCUBfQMZVedew4pD5jl50UleezUfW27rfl7
	V1ggfQUrLJoCORrqQ+HAmojFtCIB8hx0qdpykbiRJxSZif4Meb58yuUcevxyAV3eWTeWOoaibDk
	5KFyFe3d/ZVZo2NV1/HvsPG9rxCZ539hIo2GWGtDLe9V1qYiHZU6rVc7Q2N5J7t7dxR7aTA1KIH
	QYHoulRSO+xzyE62fcyJDV5aBkyDY+8e78k=
X-Google-Smtp-Source: AGHT+IGdgZmYcROU3GLrE/Lnsq8td5WaI19cpYlW7mWHLWAFkUTuxlmQVvL03z//4tMMMev1am4TmQ==
X-Received: by 2002:a05:6808:198f:b0:3e6:3860:596b with SMTP id 5614622812f47-3eae4edaddfmr5302776b6e.8.1733280698297;
        Tue, 03 Dec 2024 18:51:38 -0800 (PST)
Received: from localhost.localdomain (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7259114ec35sm74543b3a.126.2024.12.03.18.51.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Dec 2024 18:51:38 -0800 (PST)
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
Subject: [PATCH v10 1/2] dt-bindings: mtd: nuvoton,ma35d1-nand: add new bindings
Date: Wed,  4 Dec 2024 02:51:28 +0000
Message-Id: <20241204025129.150525-2-hpchen0nvt@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241204025129.150525-1-hpchen0nvt@gmail.com>
References: <20241204025129.150525-1-hpchen0nvt@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241203_185139_589860_17D120E9 
X-CRM114-Status: GOOD (  11.44  )
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
