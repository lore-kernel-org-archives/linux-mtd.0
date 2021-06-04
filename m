Return-Path: <SRS0=b8TW=K6=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1BDFEC07E94
	for <linux-mtd@archiver.kernel.org>; Fri,  4 Jun 2021 15:12:08 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CCE6C613BF
	for <linux-mtd@archiver.kernel.org>; Fri,  4 Jun 2021 15:12:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CCE6C613BF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BwCH/jYEq813rubPhSTyiF9EizTt8u1mV3Pt+i9yFIM=; b=awImPcFmBgBYK4
	c4Y0Y97qOt/CmD1V4PqaFMKnijH68opRwi3ko7T/fxkn02TcjjQmQNdEY2BL+lilzvt87eIp9iwcb
	KpW2pDN+S57gAJaNAR5Nb0Dl+UjUOY7r+xEEyN0cIw8ZX+k9VS/A4XYkYkYnuyxo8OhtUEfDwEwul
	pRgEsmW2ihZDuqFCGR/1OeTabT0kqcjwdWetsvrrueD2X+UOjwKqNZtAvomrc733Oa775GDFhcqho
	XyFNb52XsKSFtu9kllDuzKN0BTvwGnmmBvCkyaioJql9WmiNB/taPcl/SOkAfsWAYL2INSuWi+BgN
	MzebdK8uYgOxNPjvoQBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lpBTv-00E5GQ-J2; Fri, 04 Jun 2021 15:11:31 +0000
Received: from mail-oi1-x22a.google.com ([2607:f8b0:4864:20::22a])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lpBTb-00E5Bp-VV; Fri, 04 Jun 2021 15:11:16 +0000
Received: by mail-oi1-x22a.google.com with SMTP id w127so10033454oig.12;
 Fri, 04 Jun 2021 08:11:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=fyE+h/cPVeiDZzU3fvDlw6KyVLKd3NiXe8H5PkVg15I=;
 b=vKHxm3nDA3HVgshFrx1/hhHLEgSBLpZ/a8rMX8R/SMFZ/6mb4BWlAyLaPY+8x13FQH
 KZN0fJ54yVLWkLiLB279AhZbFpfqGJ3vsYZ6j21GkwcanpYszEy2S5P1cxzTbqad5uhf
 37BhcVPJg7h1Gi4kGzaUwGjrlG26Cnkls9QrXL3+8FmtxD7Qv14XtGVsx0ggW0ZEkwuk
 Mm1oOt+/BPOKPL23O3IPcenLud2AhUI0/ApeGumZx/AYS65p3b55Lzqi9hmkZ1HVqvl6
 mjuiUQSr1q1XyKNvaHQeoYYWXY3272HQzpb75zzmt/Og9aKpXsc3AbDz1mdDIY8ha/ap
 XpAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=fyE+h/cPVeiDZzU3fvDlw6KyVLKd3NiXe8H5PkVg15I=;
 b=nIDvzkzRs/MRY7618HNUiSffkKvdlMueFBJny1qTA4VmRI4EfJYRt/Zk5TAPg27cHt
 kLJ5lLWKa9G7GRwtH/G7a2doXLcHcRB9KipHc0nNghkx/a0WRVfYonxrs15gCWqupum2
 7isyF6cJALWyhgaiKV7LQrpE4ZftB8b+4W7SHD1C/i1oo0R0zx/OZPyOUpXgx11meN6R
 vITAl4b7qujRoWbNUjV4aHjtFzSNdmzpulZF+bD5gD37jasbgS9EwfON5ch3gy40u+ms
 qzvlJa74apw4KpUrk5XV7Vbys3IuIEYnhPubku7ecaUwTJAxKw5171zL/pYVQE6RGUsz
 JyTg==
X-Gm-Message-State: AOAM531G+UygFEiRSDE/0LRl+vZ2kdxBqU0xw0uVr7lE025ZTirVKCFi
 i/sYPWmnfYIZTVtQTEpsAmw=
X-Google-Smtp-Source: ABdhPJzZdxeEirRNyoyGsUZEOKwOCHATO6aDYXZqOvnkcmLmlkJEcZJvjrUuZqPb1nDaLCDEQViN5Q==
X-Received: by 2002:aca:b443:: with SMTP id d64mr3231279oif.68.1622819469820; 
 Fri, 04 Jun 2021 08:11:09 -0700 (PDT)
Received: from wintermute.localdomain (cpe-76-183-134-35.tx.res.rr.com.
 [76.183.134.35])
 by smtp.gmail.com with ESMTPSA id k16sm523440otp.19.2021.06.04.08.11.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Jun 2021 08:11:09 -0700 (PDT)
From: Chris Morgan <macroalpha82@gmail.com>
To: linux-spi@vger.kernel.org
Cc: jon.lin@rock-chips.com, broonie@kernel.org, robh+dt@kernel.org,
 heiko@sntech.de, jbx6244@gmail.com, hjc@rock-chips.com,
 yifeng.zhao@rock-chips.com, sugar.zhang@rock-chips.com,
 linux-rockchip@lists.infradead.org, linux-mtd@lists.infradead.org,
 p.yadav@ti.com, Chris Morgan <macromorgan@hotmail.com>
Subject: [RFC v4 1/8] dt-bindings: rockchip-sfc: Bindings for Rockchip serial
 flash controller
Date: Fri,  4 Jun 2021 10:10:48 -0500
Message-Id: <20210604151055.28636-2-macroalpha82@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210604151055.28636-1-macroalpha82@gmail.com>
References: <20210604151055.28636-1-macroalpha82@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210604_081112_041926_711BEE9C 
X-CRM114-Status: GOOD (  11.96  )
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

Add bindings for the Rockchip serial flash controller. New device
specific parameter of rockchip,sfc-no-dma included in documentation.

Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
---
 .../devicetree/bindings/spi/rockchip-sfc.yaml | 85 +++++++++++++++++++
 1 file changed, 85 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/spi/rockchip-sfc.yaml

diff --git a/Documentation/devicetree/bindings/spi/rockchip-sfc.yaml b/Documentation/devicetree/bindings/spi/rockchip-sfc.yaml
new file mode 100644
index 000000000000..05728de52921
--- /dev/null
+++ b/Documentation/devicetree/bindings/spi/rockchip-sfc.yaml
@@ -0,0 +1,85 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/spi/rockchip-sfc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Rockchip Serial Flash Controller (SFC)
+
+maintainers:
+  - Heiko Stuebner <heiko@sntech.de>
+  - Chris Morgan <macromorgan@hotmail.com>
+
+allOf:
+  - $ref: spi-controller.yaml#
+
+properties:
+  compatible:
+    oneOf:
+      - items:
+          - enum:
+              - rockchip,px30-sfc
+              - rockchip,rk3308-sfc
+              - rockchip,rv1108-sfc
+          - const: rockchip,rk3036-sfc
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: Bus Clock
+      - description: Module Clock
+
+  clock-names:
+    items:
+      - const: ahb
+      - const: sfc
+
+  power-domains:
+    maxItems: 1
+
+  rockchip,sfc-no-dma:
+    description: Disable DMA and utilize FIFO mode only
+    type: boolean
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
+    #include <dt-bindings/power/px30-power.h>
+
+    sfc: spi@ff3a0000 {
+        compatible = "rockchip,px30-sfc","rockchip,rk3036-sfc";
+        reg = <0xff3a0000 0x4000>;
+        interrupts = <GIC_SPI 56 IRQ_TYPE_LEVEL_HIGH>;
+        clocks = <&cru HCLK_SFC>, <&cru SCLK_SFC>;
+        clock-names = "ahb", "sfc";
+        pinctrl-0 = <&sfc_clk &sfc_cs &sfc_bus2>;
+        pinctrl-names = "default";
+        power-domains = <&power PX30_PD_MMC_NAND>;
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        flash@0 {
+            compatible = "jedec,spi-nor";
+            reg = <0>;
+            spi-max-frequency = <108000000>;
+            spi-rx-bus-width = <2>;
+            spi-tx-bus-width = <2>;
+        };
+    };
+
+...
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
