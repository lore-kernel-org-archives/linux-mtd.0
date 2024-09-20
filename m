Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C4BFCF58D5
	for <linux-mtd@archiver.kernel.org>; Fri, 20 Sep 2024 06:40:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tFXS/bqFnAPAbLyY3V8nOmHDNy1NSiZO2uD9qH5TOag=; b=e7joFqezSLu0BI
	JvjlGegDSBzpj4/UgWEi0Y71qrKE5D/dvRrxC4XtLX7D3Q7klA9BK7/wXw2krEbaY6qWDJUwCdpnZ
	hGoNUMxU4oLRYWdRYCq15oOWTFQmGTGt1HVrfX/LxFpRZd8d4qfXISBmnfqnHYCAbd7U6gwT/5VLC
	AxIBSWnk5aqcvG7HoujNZhdh/BfqnZlbIbRKk7y7V38/VooKpycpQd/c5CuljBTcb4v96liopbpv0
	p8OnD3XiuewiAdsLz/kQ8MZNkAwg6volz00xELUvIA+hiby1DYLSI/qp4xx6d54RhwyIZ6nCZkeqc
	Yq4soXPEEJBqjlY98ULw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1srXJO-0000000BYPi-22wg;
	Fri, 20 Sep 2024 06:40:14 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1srXHB-0000000BY0q-3orq;
	Fri, 20 Sep 2024 06:37:59 +0000
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-20536dcc6e9so12850585ad.2;
        Thu, 19 Sep 2024 23:37:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726814277; x=1727419077; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AjX+GWxHlPwm32RdWG50sup+7/ylH4rWNpxlnfN528U=;
        b=UyVg1a9/39+EMO4Bg/sEEOoGIgOvvcfCpMo7VdNEPEgngNf7g35IpPLx9Xhugztx1c
         aYL8Xz/MQn89d8WD/EYzjlgkFU/fMFgtSTiBXPRtF5LbIKkFD3+Tcs0rDDW7kLcXYKKm
         uSNbYaRNG2TVBezvHSW+2Eq4FBdgJjwEFmOH2etgDRPmB70iB8lJ23mtWntZufPizyox
         Dz2SYu7pfPfJ5fdUI7UzcGAjz/y6gChZsq/g6L/eNiSglHWTAY8sOCDk5jUPz4eUXMsV
         EovE97c4zpphF8rrqsRbbWFyyBNSxjJ1WE0JQe1PLsc9xfRtbAJuNHRr/FqX3sDFNBBV
         kFdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726814277; x=1727419077;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AjX+GWxHlPwm32RdWG50sup+7/ylH4rWNpxlnfN528U=;
        b=IUgDQhq1K2gd1+FbOtc6+0OY0dZEJU9lg1RFNi7+7QMcxE0VsWEEC0BWBFqJmYtmHh
         RZ4YG88vT03dxDDdu3x1I1vCtUozHOQsuklN7geKNbcid7iQqUytM1kQOY4DROKnaAfD
         rH7gIstU1CLvK4KI6QJOPvvzAT6azLKkAaD8PwALktquTWxWJjrCpL/1KcjEDen4vAXx
         j26I0m/44biwZeConw7UNFvvGyoFZXpaN0DteLh1bqyzTwmpfa210EP6ePViRRvHeeEh
         97C+molIJcagaOX7pi5jOmgXm2Hognk5PCpAfGycmtxepUJj8uUth+S+iEIFSQKIYSr+
         EXmg==
X-Forwarded-Encrypted: i=1; AJvYcCX9silkFNfP6CDiYBW+QDKUgUI1q8rR1J674hFg02eYXGGOLERnr5BmEd+eMvIp6jafjPnhBfEe5t0=@lists.infradead.org
X-Gm-Message-State: AOJu0YwZYV/XRpRvhJUo7fwUEPvsmmwCFMSnG2Jlx6znUsnEsY0RoOja
	fp38JoGVbeaRFO1TJqj95nPWCeU3tIhxQn/pBiaAJMgtrL7VKOkL
X-Google-Smtp-Source: AGHT+IFlqeN8lVR0+I9q/5UTEOoO9h5fv4UAcAT8UAAD76MlwNpn3rhH3qdokI5WDFY925BMoNGCtw==
X-Received: by 2002:a17:903:1cd:b0:205:5dfe:7cc with SMTP id d9443c01a7336-208d838f244mr27652045ad.20.1726814276941;
        Thu, 19 Sep 2024 23:37:56 -0700 (PDT)
Received: from localhost.localdomain (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-207946d64dfsm89106425ad.134.2024.09.19.23.37.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Sep 2024 23:37:56 -0700 (PDT)
From: Hui-Ping Chen <hpchen0nvt@gmail.com>
To: miquel.raynal@bootlin.com,
	richard@nod.at,
	vigneshr@ti.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	esben@geanix.com
Cc: linux-arm-kernel@lists.infradead.org,
	linux-mtd@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Hui-Ping Chen <hpchen0nvt@gmail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v5 1/2] dt-bindings: mtd: nuvoton,ma35d1-nand: add new bindings
Date: Fri, 20 Sep 2024 06:37:48 +0000
Message-Id: <20240920063749.475604-2-hpchen0nvt@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240920063749.475604-1-hpchen0nvt@gmail.com>
References: <20240920063749.475604-1-hpchen0nvt@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240919_233757_957150_7F67AFEC 
X-CRM114-Status: GOOD (  11.07  )
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
