Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E0CBD3C543
	for <linux-mtd@archiver.kernel.org>; Fri, 18 Oct 2024 02:28:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5kQyQwRwkbyaDCTics3eJ7loKIE4Il9D15EzqOaIjzk=; b=oCBACdZaczLNLs
	LcUvz4lhw86+PMTII7q0BYOXOGwSj/j5JdpnN6oRhTyWGkTIlvSuSzs6Obdw4FnkTpA7QsizzAkEQ
	zh+r6mDG/Tt3dUVIG7l5iD3NpURxD1/9tuR4ZqtiXamIh17AWfo3VxZO2wB33OWtJFk0jU3sTHFOw
	tgwDveJJnvlr355E5sA6xe6QBikQlTFJ0VVEagQlFSbrVdhlgQw9xVYs/DeRwmdx6UKgF47Ha9y/Y
	/ai2V0TcsQQzmC/jh/XRXDIrDnRjTAPVJ+wn3CNhCOU2e8nQdtFmZm9AyV30HEURD3/3XIpOiAlJh
	rNNjh/bZy0Adlm4Fx+wA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t1cjD-0000000GgKV-3klW;
	Fri, 18 Oct 2024 02:28:35 +0000
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t1cgC-0000000GfWE-0szW;
	Fri, 18 Oct 2024 02:25:30 +0000
Received: by mail-pf1-x433.google.com with SMTP id d2e1a72fcca58-71e625b00bcso1249553b3a.3;
        Thu, 17 Oct 2024 19:25:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729218327; x=1729823127; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JuOQJ2SkMr9MVCpuQjB+HvX8BSfQHaT0CbF4h7Jt34Q=;
        b=Z67D2aoZdJ7cMWlkxl2sthPwJz9qWSV7ZGEdfMILYiPdqr//jfU9q3zlukcYn/H3vy
         FjbQ26VOPt4umM2yUQTWBqkDKEktsBA5t31dSFJCmk/0+1fFnv157zoOIth8NYrUqFZ3
         9+o2Aq21j/tV4AOy2hSJcHW/vSkwmsw3HemzxBH0QLCgjTh77jWUXeGciFQHouC+m/uw
         XR60E9iAn8f6iWY+/o/9S5ykmJeir0yRCSXkspdMyBNMMqgBwwUAqbrSfZ+o6/+RdCri
         YJK5CVi9TFMyM6+9pIzvfPDNhsoHNJ02HMdrtzJL2qXDNoOBYs+Vzrvyz2AirFMF62hJ
         IwaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729218327; x=1729823127;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JuOQJ2SkMr9MVCpuQjB+HvX8BSfQHaT0CbF4h7Jt34Q=;
        b=tgIanKi88MvoV7B4kzRyPICR4NTm2CKKfxw+RKyLMTQi9LagNPgQ4qJqqLB2EOgeuE
         qxcYvHs4xaDAH3lnN/MEtho1/oWp4OKqxuJ/ednfovzdcsNnWucxAvaRA1iEZ1fTtxS6
         /fWPzPWyyviQ2LI1eYwAF16MA9+UJvsgIIjn66uetAbyzhMann1O3whnGA01MU3y0sjF
         Bzt4Xl4+xCBIY2b/ZhaCMdwcT6gZaT9TKQYp9BmqUbDpgR/XyVRCgc9PgoMKyyqaProD
         90JfPktvGuD9rv1IjAO/hxcpAC077L+8ezD/Bt8zw0e8zM8qCM+G7zJV8AZtrLGGnq4u
         DLXQ==
X-Forwarded-Encrypted: i=1; AJvYcCVRcpdu70FU9tCTjFf+xP+eAsb6xwWJuVKiQkNQ7hQAN1D3Tib2aTeOWQog19Eqt4doc8y6WHrSDC4=@lists.infradead.org
X-Gm-Message-State: AOJu0YyuhcschizNaJj6KtNOSvdMnRWOMut/f2JVM4PKHyj1eJ0NmaVG
	ko1cGciv780KlcZrlBNV/2utA6QRFqNRLrZGqfexVY0977kon0nw
X-Google-Smtp-Source: AGHT+IHJ/MEvHRvbwVFB7ZjlGDhD0lvfpVU5XQbF0P3fVrtL1XV9YS+0WMgmmD95fpUGJgvodmYO8A==
X-Received: by 2002:a05:6a00:10c7:b0:71e:67e7:1a4c with SMTP id d2e1a72fcca58-71ea31fd4ebmr1327343b3a.12.1729218327275;
        Thu, 17 Oct 2024 19:25:27 -0700 (PDT)
Received: from localhost.localdomain (60-250-192-107.hinet-ip.hinet.net. [60.250.192.107])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71ea34ac42bsm361736b3a.197.2024.10.17.19.25.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Oct 2024 19:25:27 -0700 (PDT)
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
Subject: [PATCH v7 1/2] dt-bindings: mtd: nuvoton,ma35d1-nand: add new bindings
Date: Fri, 18 Oct 2024 02:25:18 +0000
Message-Id: <20241018022519.721914-2-hpchen0nvt@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241018022519.721914-1-hpchen0nvt@gmail.com>
References: <20241018022519.721914-1-hpchen0nvt@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241017_192528_271591_4C68944C 
X-CRM114-Status: GOOD (  11.00  )
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
