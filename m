Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B03B2EB64D9
	for <linux-mtd@archiver.kernel.org>; Fri,  7 Jul 2023 17:43:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Y9IfsIX4CMjGv8AKH0VpizYhIYXwbM8pZ4ySi4XxssE=; b=vf26TR7Ok7U+vb
	AeSRM9NONc03i65UMhMUxwz8Um6+oXOknf+p0l5Q6wQK0ZI2FzvSYgtpGeixntMdyM+RAb4c9lw8K
	cjt+k2jQwDofoGnvxVQiUPdAIAXrvDX9DJicZCtg+GkYIiEXUzaz3NfqWJ9iyWqYxGBkPaXzE383J
	6Kbtry7WKqjEwC7HBX21xl4i9p8F472oTRG8ojh7lpJNzXo05HWJhCgIfKdfww8j3Ju8gDoL01RD0
	BQqOE61x6inYYCe7fYp8CokQ9ZsVedU6UPLnSEmBXZGbzZMVrJZo8zeHFEkw1/+A51sayw5OdbVtJ
	iDgJvM4ZtW1JPzXjTBCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qHpTx-005KuT-2m;
	Fri, 07 Jul 2023 17:43:01 +0000
Received: from mail-lj1-x230.google.com ([2a00:1450:4864:20::230])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qHpTq-005KpQ-0U
	for linux-mtd@lists.infradead.org;
	Fri, 07 Jul 2023 17:42:56 +0000
Received: by mail-lj1-x230.google.com with SMTP id 38308e7fff4ca-2b6afc1ceffso35367781fa.0
        for <linux-mtd@lists.infradead.org>; Fri, 07 Jul 2023 10:42:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1688751765; x=1691343765;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=z54mN4aXgEPP2Sykw+F798h+c0t4S78JPX3MGMsme3I=;
        b=rIzCoFGVdB20065N6xObn1OAjce3QC+vblox21S292YFPbGSC8GmNcyLlTbmxOMbka
         nh0jcmrEHghm6ttvbMpGaHqPCWAbDJglM++j+wdjf2cbA3K7Y76UjHnVfN0jGH5Md4XQ
         R0VOqhSVQfcGQCxVEKWXzhwqjs9MF33o1KXzayjKXcZRDk/vCZ4jovPJ3259yAlgk5vM
         J6kfIZ9r3ALocXSnq/1HpYFJTCAlXNbaXhlBvat29F4mo70NEIE8X7g50JtQJX2uXuXv
         WJ/e0SkTbCJEY7Xnn0Kqil8sQAAO138kSLl+RGgXn4mkzBKWMwcWjd/G/8I46h/sq4h9
         Dp/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688751765; x=1691343765;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=z54mN4aXgEPP2Sykw+F798h+c0t4S78JPX3MGMsme3I=;
        b=UjaoUORLyhPjNcpgoO3gP+uEg5d9fXqi/G+K9L/c3VqNhfg3/YIfoq3opMP3dbyCnm
         p935Ihi2LMCa6eRiyc/Gqc0LjzgOuvCnomfKUTLmL7U1cV5I1+nW60izQJbEc0CQTTsx
         zARCbClLjGR/FFU9psaKtMUdoDtFx4uWlwJmdYLkqR5VABFSN/4Xsx0YoDhEwXgLQqys
         GXhyBbCUVuuKCFSQCDUUc2Im+TGLuKRAS6Q45/quP9xysW+KB9wUCXlcwOpOx/Tsaeyd
         4SCZDvmegMDX0Q2LG/IbGlEQpvXgYr/RgshAjEtf3V5MatdTVF+eksVmp8ng25tOfqLT
         3h6Q==
X-Gm-Message-State: ABy/qLZdialHTZ+wW1D0H4C7IEOQEsRrf6ZHXakiqmYzK75og/7WdZXt
	+7aFwVMwTa/G7hB6AxqfCYPyt//OqQEiGwNuHIU=
X-Google-Smtp-Source: APBJJlESL/zsHSjP3+q2nsmJZ+A1izmLVc3oqEgoRN5frb7ijEt1grFOcZvBOmMuoUFDfp7LKLIxrw==
X-Received: by 2002:a2e:988c:0:b0:2b6:fa54:cec1 with SMTP id b12-20020a2e988c000000b002b6fa54cec1mr321999ljj.48.1688751765529;
        Fri, 07 Jul 2023 10:42:45 -0700 (PDT)
Received: from [127.0.1.1] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id 7-20020a05651c008700b002b6ece2456csm859163ljq.121.2023.07.07.10.42.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Jul 2023 10:42:45 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 07 Jul 2023 19:42:40 +0200
Subject: [PATCH v3 1/2] dt-bindings: mtd: Add SEAMA partition bindings
MIME-Version: 1.0
Message-Id: <20230707-seama-partitions-v3-1-6aa9391b46bb@linaro.org>
References: <20230707-seama-partitions-v3-0-6aa9391b46bb@linaro.org>
In-Reply-To: <20230707-seama-partitions-v3-0-6aa9391b46bb@linaro.org>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Florian Fainelli <f.fainelli@gmail.com>, Hauke Mehrtens <hauke@hauke-m.de>, 
 =?utf-8?q?Rafa=C5=82_Mi=C5=82ecki?= <zajec5@gmail.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
Cc: linux-mtd@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 Linus Walleij <linus.walleij@linaro.org>
X-Mailer: b4 0.12.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230707_104254_191352_DBD774EE 
X-CRM114-Status: GOOD (  14.93  )
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

This types of NAND partitions appear in OpenWrt and
U-Boot.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
ChangeLog v2->v3:
- Drop reference from partitions.yaml again
- Drop select: false
- Use unevaluatedProperties
ChangeLog v1->v2:
- Fix up the binding to be childless
---
 .../devicetree/bindings/mtd/partitions/seama.yaml  | 48 ++++++++++++++++++++++
 1 file changed, 48 insertions(+)

diff --git a/Documentation/devicetree/bindings/mtd/partitions/seama.yaml b/Documentation/devicetree/bindings/mtd/partitions/seama.yaml
new file mode 100644
index 000000000000..5105d1a6a44c
--- /dev/null
+++ b/Documentation/devicetree/bindings/mtd/partitions/seama.yaml
@@ -0,0 +1,48 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/mtd/partitions/seama.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Seattle Image Partitions
+
+description: The SEAttle iMAge (SEAMA) partition is a type of partition
+  used for NAND flash devices. This type of flash image is found in some
+  D-Link routers such as DIR-645, DIR-842, DIR-859, DIR-860L, DIR-885L,
+  DIR890L and DCH-M225, as well as in WD and NEC routers on the ath79
+  (MIPS), Broadcom BCM53xx, and RAMIPS platforms. This partition type
+  does not have children defined in the device tree, they need to be
+  detected by software.
+
+allOf:
+  - $ref: partition.yaml#
+
+maintainers:
+  - Linus Walleij <linus.walleij@linaro.org>
+
+properties:
+  compatible:
+    const: seama
+
+  '#address-cells': false
+
+  '#size-cells': false
+
+required:
+  - compatible
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    partitions {
+        compatible = "fixed-partitions";
+        #address-cells = <1>;
+        #size-cells = <1>;
+
+        partition@0 {
+            compatible = "seama";
+            reg = <0x0 0x800000>;
+            label = "firmware";
+        };
+    };

-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
