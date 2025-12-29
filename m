Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3828E8FDB1
	for <linux-mtd@archiver.kernel.org>; Mon, 29 Dec 2025 12:49:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=2vO/FmPhzoKqWZ7o+th//TTezyzof+NqqrCWcm/7nFQ=; b=tO75zePqZ0jJ08
	Dx/0Y3ZfJyu6jiWQxuctCsq9aJqkXnovPdyc4hvnbmQnNhwmUjEWG3Cx4NhosD1N6J3uDT653Kv4q
	UZEghNe6eIhgTj2cEbkEwq5POyfDLkhWxHUCSuhZ5engbXHN1JMtKNYYe5V3croo2GvwAfJzZnY4N
	THrcb80ksSrSEHiA001Dk95rfTrv7VEr8NXDWwSarORegB83s1XwHcjoZRtbfdqLXfaMB+2ciBHqq
	LchbpipFaotNXtT4/5vncOS8ZZez6gFhsPg1O4WUZCs1x7N7cQ0Vszc4PFiODvMlVblm6aBMNgmpx
	omhdgH6qUiy02w9QFEEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vaCgT-00000003iBL-0AoM;
	Mon, 29 Dec 2025 12:49:13 +0000
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vaCgQ-00000003iAb-3thT
	for linux-mtd@lists.infradead.org;
	Mon, 29 Dec 2025 12:49:12 +0000
Received: by mail-pj1-x1035.google.com with SMTP id 98e67ed59e1d1-34c84ec3b6eso11519327a91.3
        for <linux-mtd@lists.infradead.org>; Mon, 29 Dec 2025 04:49:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767012550; x=1767617350; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ZDNcQKpuNu2CJESbGOB2OET7RtpFrckSmp3dxE/JfZU=;
        b=ThpDe9cWcxr8GIV4kUhKeplCVvRAQ9UnyBfJT21utRIzHN5gq9NAnKM3xIumLAgoqF
         iI+aYlt3FczGTGYdXtiI8hHsQ4mou7+QUx88XmO9DA9tyuS757rPF7i/ohLiHqJGdqN9
         r7mH+UYuHWhyed+gJc4uj9DEQc4V9k5/06adk4bmk2rEfKKEkCjE+UuNFEnxYtVxPUU2
         ndFp/Q+oNmE9CkRKKVguyeTKFwN8J73svu9MkcGMG7fxBwCRKn+m36Gq1jYFXjyGxrNt
         6fY/jKD5meVHkrG1kubwuCJumT7aE3oKuGCSdtpD7R0tPC/B3Jn2dvq5XLwmK85yv4kN
         9bqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767012550; x=1767617350;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZDNcQKpuNu2CJESbGOB2OET7RtpFrckSmp3dxE/JfZU=;
        b=cKEFYDtBVCSFS/q9/kCBOs/Z109izvlfAtkjvN0kpjvhlJ3Xx1xcwRzI+EcGf9ooYP
         G+g2zDakwOpIWY32whbu1vsC9fiE9V2R+NfGiJhUSE7Djd3q7UsB5ILtbpBFRB7vprJ/
         iQ/u53NekyBjL1Owb7yjsVZgDVrm8yHPNQjiv9JTpiPFwPzK3s0oHuXHkNGkb4jbhSX9
         JBGu6HFav8M9XkknHXGfWITWc5DnFaWiLAVvXwDhTjvGwlLqbpQeOsze9Lud23MMLc8q
         y0jnPQN/m1CfJvsnoyZhF/G531iMmRsGkv9//rGbLKrIFxPNnei440LpJhwijy+AtBds
         vl3Q==
X-Gm-Message-State: AOJu0YxFSkosGgcBgPxt0g4d0Mv20xZPKm2SuAK6N9D3/4nE76UL9Tvl
	K8zKI6OZuhQ3/KV91HIROU1Fn8r1CWjzwfyzPfkC58XN/jhpCFPqJS72
X-Gm-Gg: AY/fxX61wQYB1xtYUhyvRTuQ0gFZ4nTnAxZ+ooyZnAHCTGl0xF7ZfzR3o0nFLV50lpj
	kgwmwgxmPyx/XCh38TJxjP7mlZKmrXiY1p6ePRIhM6OtOtlYJF+KoqdKLeGS/27o/9z3+V0D0cJ
	XaocFQ7j3gkS9V9PYOpDj8YzVIQiZeMqwztUnOU4NiblbflIL5wdlP9EQ8qO/Xkafleb3HYB49d
	Zx2LXmPsSKwsG6ppxSIs/fcw2kXKiCskOISwHVlznNeMSiYjPCSI+5ZwiaWHvDfNWrq8U4ueoHO
	mSCo0HWKavp2fxgNOYlzfQVDe8jxd1j/aNvcWK2LN3WkxOpPmkPyb8/BHSkXtlqFJK4RSK6ZJQY
	pa3OP6jxPmhH60Vhlgff8oqTPfPFSvpAqo9hiSK3JhQpxnFXyrn6GSx15Namg8gu7N1sOtQrCfp
	ycvg9rD2M4GCxsiEP2YpWl7vBjNMCEGoe3eQRT
X-Google-Smtp-Source: AGHT+IH1of5JCJj7WeoYn4m6vcb17J0Q8rgcFaFKIrQN+s0d8RVVl49J3p38r8K1iq7Ch0YroXdoDw==
X-Received: by 2002:a17:90b:5804:b0:34a:48ff:694 with SMTP id 98e67ed59e1d1-34e921cd498mr24171654a91.31.1767012549679;
        Mon, 29 Dec 2025 04:49:09 -0800 (PST)
Received: from LAPTOP-872M7T80.localdomain ([223.185.128.90])
        by smtp.googlemail.com with ESMTPSA id 98e67ed59e1d1-34e70d4f7e2sm30323942a91.2.2025.12.29.04.49.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Dec 2025 04:49:09 -0800 (PST)
From: Akhila YS <akhilayalmati@gmail.com>
Date: Mon, 29 Dec 2025 12:49:00 +0000
Subject: [PATCH] dt-bindings: mtd: microchip,mchp23k256: convert to DT
 schema
MIME-Version: 1.0
Message-Id: <20251229-nxp-v1-1-a415fe0080a8@gmail.com>
X-B4-Tracking: v=1; b=H4sIALt4UmkC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1NDIyNL3byKAl1TI7NUI8uURMs0I0sloMqCotS0zAqwKdGxtbUAs5OiLFU
 AAAA=
X-Change-ID: 20251229-nxp-526e29da9f29
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-mtd@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Akhila YS <akhilayalmati@gmail.com>
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251229_044910_994073_FF2452A1 
X-CRM114-Status: GOOD (  14.23  )
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

Convert Microchip 23K256 SPI SRAM MTD driver binding to YAML format.

Signed-off-by: Akhila YS <akhilayalmati@gmail.com>
---
 .../bindings/mtd/microchip,mchp23k256.txt          | 18 -------
 .../bindings/mtd/microchip,mchp23k256.yaml         | 58 ++++++++++++++++++++++
 2 files changed, 58 insertions(+), 18 deletions(-)

diff --git a/Documentation/devicetree/bindings/mtd/microchip,mchp23k256.txt b/Documentation/devicetree/bindings/mtd/microchip,mchp23k256.txt
deleted file mode 100644
index 7328eb92a03c..000000000000
--- a/Documentation/devicetree/bindings/mtd/microchip,mchp23k256.txt
+++ /dev/null
@@ -1,18 +0,0 @@
-* MTD SPI driver for Microchip 23K256 (and similar) serial SRAM
-
-Required properties:
-- #address-cells, #size-cells : Must be present if the device has sub-nodes
-  representing partitions.
-- compatible : Must be one of "microchip,mchp23k256" or "microchip,mchp23lcv1024"
-- reg : Chip-Select number
-- spi-max-frequency : Maximum frequency of the SPI bus the chip can operate at
-
-Example:
-
-	spi-sram@0 {
-		#address-cells = <1>;
-		#size-cells = <1>;
-		compatible = "microchip,mchp23k256";
-		reg = <0>;
-		spi-max-frequency = <20000000>;
-	};
diff --git a/Documentation/devicetree/bindings/mtd/microchip,mchp23k256.yaml b/Documentation/devicetree/bindings/mtd/microchip,mchp23k256.yaml
new file mode 100644
index 000000000000..e6cdfa5f0808
--- /dev/null
+++ b/Documentation/devicetree/bindings/mtd/microchip,mchp23k256.yaml
@@ -0,0 +1,58 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/mtd/microchip,mchp23k256.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Microchip 23K256 (and similar) SPI SRAM MTD driver
+
+maintainers:
+  - Richard Weinberger <richard@nod.at>
+
+description: |
+  Driver for Microchip 23K256 and compatible (e.g. 23LCV1024) serial SRAM devices
+  accessed via SPI. The device exposes the SRAM as an MTD device and supports
+  optional partitioning via child nodes.
+
+allOf:
+  - $ref: /schemas/spi/spi-peripheral-props.yaml#
+
+properties:
+  compatible:
+    enum:
+      - microchip,mchp23k256
+      - microchip,mchp23lcv1024
+
+  reg:
+    maxItems: 1
+
+  "#address-cells":
+    const: 1
+
+  "#size-cells":
+    const: 1
+
+required:
+  - reg
+  - compatible
+  - "#address-cells"
+  - "#size-cells"
+  - spi-max-frequency
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    spi {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        sram@0 {
+            #address-cells = <1>;
+            #size-cells = <1>;
+            compatible = "microchip,mchp23k256";
+            reg = <0>;
+            spi-max-frequency = <20000000>;
+        };
+    };
+...

---
base-commit: cc3aa43b44bdb43dfbac0fcb51c56594a11338a8
change-id: 20251229-nxp-526e29da9f29

Best regards,
-- 
Akhila YS <akhilayalmati@gmail.com>


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
