Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 735C5C54E60
	for <linux-mtd@archiver.kernel.org>; Tue, 19 Mar 2024 09:36:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=S6oOc67XyJBf+Z5/VVr9YPso2ej/XCqsRVOmX2yfOno=; b=pEbzfMF3Lv/otw
	8vqbB8j+BnoR8hqmfQxTC4qB6PrAfZyuV4NRUnrpxaRrJv7qnxaLppHHazTGIzSPjCpzjUYoqM6jQ
	4bwMwYAl1OHT4D4dFpTI5hs5jCsLTcVWATnma5LjamzgocfpNK5IDd+TPErI48rN7Wh/PPEAkWa3a
	V3lEbSsspRtb+LWqjRX+bsn4IPg39kbmV9XLqAaAlQxeIjQVQ6jSHUTiEzAiA8/8UsllCHfXuTylS
	J4Ly+RXT8aCuLYHiQ1DAJaYo3Fy9z4Seo+1BlxiQ4YUaXS/LD0j9bKcm0VS1AHjUldatY16c+1FAu
	eHarYrXe3ZayFT6GgtGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rmVtG-0000000C7K1-3GqU;
	Tue, 19 Mar 2024 09:36:14 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rmVsn-0000000C6z4-0wpd;
	Tue, 19 Mar 2024 09:35:48 +0000
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-1dee5daa236so35447415ad.0;
        Tue, 19 Mar 2024 02:35:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710840943; x=1711445743; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HpO3XyTMYrNp26rIW9VgOyOw5H/JJ52pteRLCcl6qlU=;
        b=mWPKKi+gp73Wv7Cm7krkhRCMCeQNSuI58xcemVWtmPOv7E8EweS1V3VsJNRx+hnING
         foN3NIkMLVpeGn4R2xycr7b4ILojcWfM5lNLoNP//ne+yvjDkVOO65c5rsndBgP2i80g
         CUGrEMCREPVfbAzYyRa+tk5UnK3PgL15ynRvjsui/4cZuAAOpXww4mhs7Fx12vUFGugU
         C6OEgV8OF5QVA2+Br6hKKRHRTKhhFvtu8kzJm1cxnUPWWZXg4tGSkyfAogA/0vS3008t
         94+y1z8M9ab+2/JyKOHWLnsKPhI6X5dPvkW3SRAMZqNfazTuteYyFII4AG7HDGbGrxS1
         gXGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710840943; x=1711445743;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HpO3XyTMYrNp26rIW9VgOyOw5H/JJ52pteRLCcl6qlU=;
        b=VxshWIMqbZcpB9qc44j7tTqca81vcAyAiKjyZLIEyNP5bWgukuIcNvmYtTFUXY56Re
         s16bfxBCHOSSqNJM6prPP6a387VPGttNJmG9JD6tbbramZ9mXK8BCANslzyfmZLt2ZsK
         IEk9qnIK88yzALpwU+Gdzew4eq9PKu0jeb8s2wffuOumdSuW2OYoS/fshyAHbvJYHCj+
         WDc9XgvzNg1sTkrF1rQmH+BWTnbP9lF+EMS1bvckr04CmaLORY8aseVww3++DAJw3fgU
         iFfiIFXKbBV4nwNAtaL7FHBtCeBLQ+LDVN+1tQWRMo811qMjsVtPUzJ1scjimg7kzKvk
         h1MQ==
X-Forwarded-Encrypted: i=1; AJvYcCXrpYG561oXo/qlPNfXRVnUcU5uqv907pgW5kN/ZnJqqzg1pWtDIjjoFBakuuNEaIiULaDBAD67g/WlaU+L8wwwx2HPdiKiLvrXVJyVDZSFttCgRWbY4Nr0+nTRpkPWMV2/Iaw0ZfALxx9iy4PEcp/OL8oF
X-Gm-Message-State: AOJu0Yy+CrdCEZz5g4XtDHvWmk8XasiHuQLsDyDo3qbUAx2KgEccA7rB
	+OB6aYfDvs0tJ+eCDuE1pami6WDBy6rnj3ASGq5gaEKq/GPdxg9Z
X-Google-Smtp-Source: AGHT+IHryBKHJ+MSwjp/1byfMt0hDod5YQF/OmkAgxcU2UHV4h3fLG6PWHn1lTiV9EhL0mWJM96Kow==
X-Received: by 2002:a17:902:e88a:b0:1e0:2c80:2aaf with SMTP id w10-20020a170902e88a00b001e02c802aafmr5518425plg.44.1710840942841;
        Tue, 19 Mar 2024 02:35:42 -0700 (PDT)
Received: from localhost.localdomain ([129.41.58.3])
        by smtp.gmail.com with ESMTPSA id n5-20020a170903110500b001ddc0bc5934sm10942432plh.249.2024.03.19.02.35.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Mar 2024 02:35:42 -0700 (PDT)
From: Manojkiran Eda <manojkiran.eda@gmail.com>
To: patrick.rudolph@9elements.com,
	chiawei_wang@aspeedtech.com,
	ryan_chen@aspeedtech.com,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	linux-mtd@lists.infradead.org
Cc: robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org,
	joel@jms.id.au,
	andrew@codeconstruct.com.au,
	miquel.raynal@bootlin.com,
	richard@nod.at,
	vigneshr@ti.com,
	manojkiran.eda@gmail.com,
	jk@codeconstruct.com.au,
	openbmc@lists.ozlabs.org
Subject: [PATCH v2 4/4] dt-bindings: aspeed: Add eSPI controller
Date: Tue, 19 Mar 2024 15:04:05 +0530
Message-Id: <20240319093405.39833-5-manojkiran.eda@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240319093405.39833-1-manojkiran.eda@gmail.com>
References: <20240319093405.39833-1-manojkiran.eda@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240319_023545_483088_C6660E49 
X-CRM114-Status: GOOD (  13.99  )
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

This commit adds the device tree bindings for aspeed eSPI
controller.

Although aspeed eSPI hardware supports 4 different channels,
this commit only adds the support for flash channel, the
bindings for other channels could be upstreamed when the driver
support for those are added.

Signed-off-by: Manojkiran Eda <manojkiran.eda@gmail.com>
---
 .../bindings/soc/aspeed/aspeed,espi.yaml      | 94 +++++++++++++++++++
 1 file changed, 94 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/soc/aspeed/aspeed,espi.yaml

diff --git a/Documentation/devicetree/bindings/soc/aspeed/aspeed,espi.yaml b/Documentation/devicetree/bindings/soc/aspeed/aspeed,espi.yaml
new file mode 100644
index 000000000000..3d3ad528e3b3
--- /dev/null
+++ b/Documentation/devicetree/bindings/soc/aspeed/aspeed,espi.yaml
@@ -0,0 +1,94 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+# # Copyright (c) 2024 IBM Corporation.
+# # Copyright (c) 2021 Aspeed Technology Inc.
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/soc/aspeed/aspeed,espi.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Aspeed eSPI Controller
+
+maintainers:
+  - Manojkiran Eda <manojkiran.eda@gmail.com>
+  - Patrick Rudolph <patrick.rudolph@9elements.com>
+  - Chia-Wei Wang <chiawei_wang@aspeedtech.com>
+  - Ryan Chen <ryan_chen@aspeedtech.com>
+
+description:
+  Aspeed eSPI controller implements a device side eSPI endpoint device
+  supporting the flash channel.
+
+properties:
+  compatible:
+    items:
+      - enum:
+          - aspeed,ast2500-espi
+          - aspeed,ast2600-espi
+      - const: simple-mfd
+      - const: syscon
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
+  ranges: true
+
+patternProperties:
+  "^espi-ctrl@[0-9a-f]+$":
+    type: object
+
+    description: Controls the flash channel of eSPI hardware
+
+    properties:
+      compatible:
+        items:
+          - enum:
+              - aspeed,ast2500-espi-ctrl
+              - aspeed,ast2600-espi-ctrl
+
+      interrupts:
+        maxItems: 1
+
+      clocks:
+        maxItems: 1
+
+    required:
+      - compatible
+      - interrupts
+      - clocks
+
+required:
+  - compatible
+  - reg
+  - "#address-cells"
+  - "#size-cells"
+  - ranges
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/clock/ast2600-clock.h>
+
+    espi: espi@1e6ee000 {
+        compatible = "aspeed,ast2600-espi", "simple-mfd", "syscon";
+        reg = <0x1e6ee000 0x1000>;
+
+        #address-cells = <1>;
+        #size-cells = <1>;
+        ranges = <0x0 0x1e6ee000 0x1000>;
+
+        espi_ctrl: espi-ctrl@0 {
+            compatible = "aspeed,ast2600-espi-ctrl";
+            reg = <0x0 0x800>,<0x0 0x4000000>;
+            reg-names = "espi_ctrl","espi_flash";
+            interrupts = <GIC_SPI 42 IRQ_TYPE_LEVEL_HIGH>;
+            clocks = <&syscon ASPEED_CLK_GATE_ESPICLK>;
+        };
+    };
-- 
2.40.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
