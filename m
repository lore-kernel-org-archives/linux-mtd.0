Return-Path: <SRS0=UlXy=KX=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86302C47087
	for <linux-mtd@archiver.kernel.org>; Fri, 28 May 2021 17:01:36 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 46A8C6117A
	for <linux-mtd@archiver.kernel.org>; Fri, 28 May 2021 17:01:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 46A8C6117A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=d6Af7nxEC1bEkYBoffy2GpMB0EtBnHG0q3XwjvumIFM=; b=dKxp9ApuNsodYF
	vrFCg96fCccN84Cck3NyefyszjOnihrz+rehFzkM3U/OwAq1IZzmEmhJgLh3cWBS3syFHvEwWQyEZ
	e1xRJEfz3tXECHX/3obWnfhPlhHYCywDAi4yBpE6Xk7bJzk7j0OSJ8r52Va95ohFpYr+rmjhHGOdm
	HBV8TKj8M03tOkVxNl8VOCs1ZJNVKLYOjGB/mi1U/P5BsJzlYwBbjKQDUGR/8djp7GGXyO29V976m
	XohBRG84fJ7dkuyXPF7CML6ZZ//r929suFLNtWE3rAVd5VucXqdmLq234XkmL3iMbfZVbalyeGx5n
	eToio5tTndcML0cH/Omg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lmfr0-00HEyO-Lk; Fri, 28 May 2021 17:00:58 +0000
Received: from mail-ot1-x32f.google.com ([2607:f8b0:4864:20::32f])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lmfqa-00HEmH-CS; Fri, 28 May 2021 17:00:34 +0000
Received: by mail-ot1-x32f.google.com with SMTP id
 80-20020a9d08560000b0290333e9d2b247so4083889oty.7; 
 Fri, 28 May 2021 10:00:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=3nMVI5Y69EcmK0LI72hJ/BBAtaO979N8B0RdSo6Pvyk=;
 b=kjZHfTkfICRcLQBVk9cecErbnSVKP25ZQ+smIyWcsU3tFlGz1S1zaYYonpL79EjU3C
 EI8dDHC54+NpqDZiWic05h5uRbcO25p/MpKa4AcxmGhRXu+62VaUcdlJsejU8uuOd4G5
 S7hWMXjYW2v1fIzTAWQc17nwZ3q/8JA5fHPTAF7OAwGpPwtQJjLIoW3FfiQIU3zminQr
 FvNWKJMD0cppk/W/xDxPnFn2jNdmiTA9dMk14cTM/4hhuxdsCZRpzwehU1HV1F75HH2O
 yqbLjg8dws7U0uo9tJOly7SxaVYMHfNW8ewOagriROpmtx1/fUvq/tQev7wCBpwHwaEn
 Nt2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=3nMVI5Y69EcmK0LI72hJ/BBAtaO979N8B0RdSo6Pvyk=;
 b=H7u+Vcx0AFBoJbS9JPEbxAev36WgtYfe/RgqVj3lLEB+xq+xuEYp4n/h7FZ/Bknxyh
 bIT8kTVi7yD8gOU/UjqppxfNWad6iwQciiSwmY64LOe1dExFPjk+RdD5y2jbjbDe2cCW
 nYgfl1zncThpmt1vBgDPMWF2QM0aqr3cXm6gA0u+Evyt9zHEgZABeL5rQhXGpkrx8cg8
 3/4+Taq8v5GfV4qOlvOx+8CiGcFQuej/T6BE7RlGXs57hEJAnA6Jsyk2aduXmIsJmeCp
 HMnvEX/ZJQjtkP+TxG7tl7VoD0xD/P/eVm9w8FYm3Ft4ZNK99UJDv4IKfjDyeBAotwWI
 lTSQ==
X-Gm-Message-State: AOAM5320u7k16/iXKhz+E7pD7+rcZhQV7B3KD/CTZSm+J730HPYO8oAl
 leRIvPDF7WYGrnKlnpywOqaIZuFqUTE=
X-Google-Smtp-Source: ABdhPJwOA9kKYaSlfOXzhJpHiPsQaRY44y5Lrk25RROkiHhJj1rFlZtQN/3V03HLrAnAgKNNxscwWw==
X-Received: by 2002:a05:6830:1c31:: with SMTP id
 f17mr7935920ote.332.1622221231190; 
 Fri, 28 May 2021 10:00:31 -0700 (PDT)
Received: from wintermute.localdomain (cpe-76-183-134-35.tx.res.rr.com.
 [76.183.134.35])
 by smtp.gmail.com with ESMTPSA id r7sm1219084oom.46.2021.05.28.10.00.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 May 2021 10:00:30 -0700 (PDT)
From: Chris Morgan <macroalpha82@gmail.com>
To: linux-mtd@lists.infradead.org
Cc: linux-rockchip@lists.infradead.org, andy.yan@rock-chips.com,
 yifeng.zhao@rock-chips.com, sugar.zhang@rock-chips.com,
 tudor.ambarus@microchip.com, michael@walle.cc, p.yadav@ti.com,
 heiko@sntech.de, robh+dt@kernel.org, vigneshr@ti.com, richard@nod.at,
 miquel.raynal@bootlin.com, Chris Morgan <macromorgan@hotmail.com>
Subject: [PATCH v2 2/4] spi: rockchip-sfc: Bindings for Rockchip serial flash
 controller
Date: Fri, 28 May 2021 12:00:18 -0500
Message-Id: <20210528170020.26219-3-macroalpha82@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210528170020.26219-1-macroalpha82@gmail.com>
References: <20210528170020.26219-1-macroalpha82@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210528_100032_482461_2E480B72 
X-CRM114-Status: GOOD (  12.69  )
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

From: Chris Morgan <macromorgan@hotmail.com>

Add binding document for the Rockchip serial flash controller.
New device specific parameter of rockchip,sfc-no-dma included in
documentation.

Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
---
 .../spi/rockchip,serialflash-controller.yaml  | 107 ++++++++++++++++++
 1 file changed, 107 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/spi/rockchip,serialflash-controller.yaml

diff --git a/Documentation/devicetree/bindings/spi/rockchip,serialflash-controller.yaml b/Documentation/devicetree/bindings/spi/rockchip,serialflash-controller.yaml
new file mode 100644
index 000000000000..eb073130e82a
--- /dev/null
+++ b/Documentation/devicetree/bindings/spi/rockchip,serialflash-controller.yaml
@@ -0,0 +1,107 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/spi/rockchip,serialflash-controller.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Rockchip SoCs Serial FLASH Controller (SFC)
+
+maintainers:
+  - Andy Yan <andy.yan@rock-chips.com>
+
+allOf:
+  - $ref: spi-controller.yaml#
+
+properties:
+  compatible:
+    oneOf:
+      - const: rockchip,px30-sfc
+      - const: rockchip,rv1108-sfc
+      - items:
+        - const: rockchip,sfc
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    minItems: 2
+    items:
+      - description: Module Clock
+      - description: Bus Clock
+
+  clock-names:
+    minItems: 2
+    items:
+      - const: clk-sfc
+      - const: clk-hsfc
+
+  power-domains:
+    maxItems: 1
+
+  rockchip,sfc-no-dma:
+    - descrption: Boolean value for disabling DMA
+
+patternProperties:
+  "^spi-nor@[0-3]$":
+    type: object
+    properties:
+      reg:
+        minimum: 0
+        maximum: 3
+
+      spi-max-frequency:
+        maxItems: 1
+	  - description: Maximum frequency for SPI Flash
+
+      compatible:
+        oneOf:
+          - const: jedec,spi-nor
+
+      spi-rx-bus-width:
+        maxItems: 1
+          - description: RX Bus Width (1x, 2x, or 4x mode)
+
+      spi-tx-bus-width:
+        maxItems: 1
+          - description: TX Bus Width (1x, 2x, or 4x mode)
+
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - clocks
+  - clock-names
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/px30-cru.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+sfc: spi@ff3a0000 {
+	compatible = "rockchip,px30-sfc","rockchip,sfc";
+	#address-cells = <1>;
+	#size-cells = <0>;
+	reg = <0x0 0xff3a0000 0x0 0x4000>;
+	interrupts = <GIC_SPI 56 IRQ_TYPE_LEVEL_HIGH>;
+	clocks = <&cru SCLK_SFC>, <&cru HCLK_SFC>;
+	clock-names = "sfc", "hsfc";
+	pinctrl-names = "default";
+	pinctrl-0 = <&sfc_clk &sfc_cs &sfc_bus2>;
+	power-domains = <&power PX30_PD_MMC_NAND>;
+
+	nor_flash: spi-nor@0 {
+		reg = <0>;
+		compatible = "xtx,xt25f128b","jedec,spi-nor";
+		spi-rx-bus-width = <2>;
+		spi-tx-bus-width = <2>;
+		spi-max-frequency = <108000000>;
+	};
+};
+
+...
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
