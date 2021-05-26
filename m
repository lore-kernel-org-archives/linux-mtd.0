Return-Path: <SRS0=Fb5G=KV=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA4CFC47088
	for <linux-mtd@archiver.kernel.org>; Wed, 26 May 2021 19:20:17 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7A18560FE9
	for <linux-mtd@archiver.kernel.org>; Wed, 26 May 2021 19:20:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7A18560FE9
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZOAXPGcyACADt7wI624DPUS2id2sQ4h2i+HrfUrqnEw=; b=0INlFPSAiLSqXV
	wtUT9gb55H1znNRiEJlQQ654Y7+k7Z68KdD80aShGMtXDxeWUNdMpCbGvbBZ7HwS7BNTeKfJpyJva
	cupQYTtGhKB+fHzwKHzy3lLfzjxckLrxra+pvCSZm5OOzWuFrwMcNEc4QSHhR2HDBFpjISLdAk1lN
	b35COcEFmNjzK71Dw9Vsx/faxj6adqx6zZVzOSOWM2HlhJoSKGdiM9OOqJB3DdG9m1byNAfO65H9Z
	rmpqziyC/MGVIta8GaRZme9zuUVCsaOCqiJ8amxFP1pLcP+C8Ikb1Rd4ny4rQIvl0hN0XqyRCfLdY
	wyLZPWFVuoq3ZVuQt4AA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1llz45-00Gtrc-EY; Wed, 26 May 2021 19:19:37 +0000
Received: from mail-ot1-x32a.google.com ([2607:f8b0:4864:20::32a])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lly5N-00GRLA-3W; Wed, 26 May 2021 18:16:54 +0000
Received: by mail-ot1-x32a.google.com with SMTP id
 n3-20020a9d74030000b029035e65d0a0b8so1867508otk.9; 
 Wed, 26 May 2021 11:16:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=wt0MOEaMR7bABN5nYdWHk5FlluoucbtbX4jlOgD7TtE=;
 b=kIqyfUfsLLseH640v2Dl5w6Aceqi0/Z9XGmYFGCyyI88sESMIgqkNiPhq7FQhzFuN+
 XCdVo0fJRVw4jjY0hOPrZFo8hPSkocjZT4XDKrkFabsovlhqw2GDg0jLZ/Dkpw2HmTok
 rltWDaL6AGoxo+7mft/Lo3JJrg4dmyjxYnHWNNdHh1ug0SPRRuFq98oUJ9PhSlIVe08n
 5tyud7P5AReuwa0tN0Fbwqakj52dmbGus7Qg2wOnFHCJQnR9Vdf5ChOc/NEc5OH7SCfv
 By0Sb/jLZ5zd5veNchoTYahpEAcbRTX+EGbuOdDXd2fFg/N14PwfsoWoq51WWKIxRbbo
 anCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=wt0MOEaMR7bABN5nYdWHk5FlluoucbtbX4jlOgD7TtE=;
 b=dvmIuAGIg2vTnNIS2m3DRBHKa4kbxkk99SYTY5KDKgMDhMZx1RA59EgtIdW+DwkOPn
 Tcv8TK2hEHJ/STs8XVR8JJLSTBwoC53KwLmm1sJ9y7yiVAHZRpfrzGJS+pLsr2p6Ilu4
 ARiER37SaA2l/SkvDHDConMt1b9S9LumYRbg8ri27iUcWY9DNP7u8yHog7pJuz7XC3OC
 /pkGYPYGrDlPcLd1o51RQ4x/5d+Np70CbzyTMd+KDoCewrA+bPiz5tM73tLy9hjlEbMX
 wvQGjKfIWGK5rdZu9VB3XiZ1dkRuLSEK2UAxg+WHaFOBbTyuqkbGSfGcuGHR+5nD8fOC
 OjIg==
X-Gm-Message-State: AOAM531gv7V6VsSCsb6N3pA9SBpkmFIwG66gLyZiKPT3dud4ikfkdewz
 oDU8meK2K0ZHcIpfrLOy0m+F1x3gXPw=
X-Google-Smtp-Source: ABdhPJwCZw21+BiyqopVePlpEu2Chtr06FyNbYLpzXaFv3nNxkuE3cEJjw4rIR8KpHXzlH11y5PgWg==
X-Received: by 2002:a05:6830:1386:: with SMTP id
 d6mr3553213otq.122.1622053010429; 
 Wed, 26 May 2021 11:16:50 -0700 (PDT)
Received: from wintermute.localdomain (cpe-76-183-134-35.tx.res.rr.com.
 [76.183.134.35])
 by smtp.gmail.com with ESMTPSA id j20sm4148311oot.29.2021.05.26.11.16.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 May 2021 11:16:49 -0700 (PDT)
From: Chris Morgan <macroalpha82@gmail.com>
To: linux-mtd@lists.infradead.org
Cc: linux-rockchip@lists.infradead.org, andy.yan@rock-chips.com,
 yifeng.zhao@rock-chips.com, sugar.zhang@rock-chips.com,
 tudor.ambarus@microchip.com, michael@walle.cc, p.yadav@ti.com,
 heiko@sntech.de, robh+dt@kernel.org, vigneshr@ti.com, richard@nod.at,
 miquel.raynal@bootlin.com, Chris Morgan <macromorgan@hotmail.com>
Subject: [PATCH 2/3] mtd: spi-nor: Bindings for Rockchip serial flash
 controller
Date: Wed, 26 May 2021 13:16:35 -0500
Message-Id: <20210526181636.1130-3-macroalpha82@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210526181636.1130-1-macroalpha82@gmail.com>
References: <20210526181636.1130-1-macroalpha82@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210526_111653_203496_0DA914B5 
X-CRM114-Status: GOOD (  13.21  )
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

Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
---
 .../mtd/rockchip,serialflash-controller.yaml  | 100 ++++++++++++++++++
 1 file changed, 100 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mtd/rockchip,serialflash-controller.yaml

diff --git a/Documentation/devicetree/bindings/mtd/rockchip,serialflash-controller.yaml b/Documentation/devicetree/bindings/mtd/rockchip,serialflash-controller.yaml
new file mode 100644
index 000000000000..97ea89fde3fb
--- /dev/null
+++ b/Documentation/devicetree/bindings/mtd/rockchip,serialflash-controller.yaml
@@ -0,0 +1,100 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/mtd/rockchip,serialflash-controller.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Rockchip SoCs Serial FLASH Controller (SFC)
+
+maintainers:
+  - Andy Yan <andy.yan@rock-chips.com>
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
+      - const: sfc
+      - const: hsfc
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
