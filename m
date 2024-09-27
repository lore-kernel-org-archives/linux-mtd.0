Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6AF9ECEBF6B
	for <linux-mtd@archiver.kernel.org>; Fri, 27 Sep 2024 02:10:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tFXS/bqFnAPAbLyY3V8nOmHDNy1NSiZO2uD9qH5TOag=; b=PZnDR7OqK+kqGY
	NwFlyQFJ7l7CVx8kVjDQT+CbBWxddnCf/71olN/CreD3LODeh0Qo30j2ahRv0o56ctpYfKMQ9Wu72
	cQOmFnVRRIIJsPvoOIdOjUvtjrT9mgCOaIZcLDd1i06a5XuTp9p/i661WLrYea2afoyD5eZfZJEAQ
	nupp+BLHcTnGTgcA9O5+8/alebWTgW6DXeoTuIdU0h+Z0DaVmFbnMRKP2cuCjINA1mfuAsPIfAjgZ
	n9lzLdWEjMPpJxTVY8ExNbPAKG6T/858z7xrdbmpbLv210ZToUbeu4d+pGg1v/LRCUVYOTW7DWu1G
	NnkypV9NlDEsy54SOVuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1su0R3-00000009nUA-1Z3D;
	Fri, 27 Sep 2024 02:10:21 +0000
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1su0Ok-00000009n2B-0fbp;
	Fri, 27 Sep 2024 02:07:59 +0000
Received: by mail-pg1-x535.google.com with SMTP id 41be03b00d2f7-7ae3d7222d4so1329701a12.3;
        Thu, 26 Sep 2024 19:07:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727402877; x=1728007677; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AjX+GWxHlPwm32RdWG50sup+7/ylH4rWNpxlnfN528U=;
        b=kRPsLBm9Zi0buTSJUQ7I+n56n4e5qZ2Hb2uzyA7HNiz4BaXsTKWu6lSsvITZOv4bIW
         ZKEd3YUnyU/SwOSEdCCelru5cEdsfagNWEvNIUAwz9hnM3K2NrW3MKoJ7nZWIvQEZGYa
         P9oU3iGRusCuhrzuatq7xnTXR7rUp/xV0EHug9n18v+Gs+bWRLAELzsBjs2Ea/4mqwYp
         /F1C9dqJJKuexdoBnh+6MENyftgOaAfbrH63/inwb5L+9OljmDuOosI+yzWvbZRF8tzE
         kE/2KyWDnxVtlaTG1/KuhL2ZdfXv6GZ4UAlzfaDoe5cFubUKGaDIhWu4mVcRNv1jfGHD
         X/8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727402877; x=1728007677;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AjX+GWxHlPwm32RdWG50sup+7/ylH4rWNpxlnfN528U=;
        b=tnJJgiUQmkX28FvhVGUbrUV3ibBURHGVR1Ev5qAl4UKDhVj1yiF7ycMriQ8w/NWQpF
         UPIRyWAzRe3dSdv8cjU3HwfzxyCD7V17lz9bijWgSoWz9NWndH5YIWLuYAangX6aAHoQ
         bawonW8kiFvM2nQgjpbActMCEwvcH14L85p7pdVBFKGUKCpNRK0QeYL/cYTZ2P7vy8jF
         /PydnPDHoJLoHapl8H43q7iTWtilu4q71a4V78NIk8+0A4zy70BIy7sbYp2Jc/xrQBYa
         5xC98BrrvbLQ8mFgpvxkDe4Ga0L4VgkWDr4O2XG7pxcJtg6vM6jCcktFzXWFcoUaCQQq
         RA0g==
X-Forwarded-Encrypted: i=1; AJvYcCXYWT5VVUlZIb7DQvc8xa2y5kBOwtStnz98Molqar3/Qo9vUBSambE6CFZ2VMGFpKqaQ4fAvvkpCCU=@lists.infradead.org
X-Gm-Message-State: AOJu0YzUnSETBMnLdzN7EOcOQv5GJSy4UqJyodH941dseqq+GVhBhvle
	kvPSRDu1ZTnBm/pQLpy+6/c9zIgTVGJ0ie4oStK3+jEuLWCw7PnvyD+Tiw==
X-Google-Smtp-Source: AGHT+IGQrURPuLL03VlNzLabx+LnqYRpPBw4Qu3jlVnfp/LNqLQAD4n09C0GEYLf4ADpxipDIQ6Hsg==
X-Received: by 2002:a05:6a21:3514:b0:1d4:f9ee:652b with SMTP id adf61e73a8af0-1d4fa68e9camr2677265637.18.1727402877260;
        Thu, 26 Sep 2024 19:07:57 -0700 (PDT)
Received: from localhost.localdomain (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7e6db2c66e1sm561022a12.47.2024.09.26.19.07.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Sep 2024 19:07:57 -0700 (PDT)
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
Subject: [PATCH v6 1/2] dt-bindings: mtd: nuvoton,ma35d1-nand: add new bindings
Date: Fri, 27 Sep 2024 02:07:48 +0000
Message-Id: <20240927020749.46791-2-hpchen0nvt@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240927020749.46791-1-hpchen0nvt@gmail.com>
References: <20240927020749.46791-1-hpchen0nvt@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240926_190758_221002_F1A5AC7E 
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
