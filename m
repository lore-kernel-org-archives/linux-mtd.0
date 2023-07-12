Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20DA9EB64DD
	for <linux-mtd@archiver.kernel.org>; Wed, 12 Jul 2023 22:16:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=M5ZjNRmvqwP0RKko7XrKCHABREVS7dMT1/sXv5qCAx8=; b=3PqQ7eVzukXrWQ
	G7WAwco8z1JtMj7jaIrIv+wMn6yLbmOojaEdM5XyrwfO5DQlw1ZcXfKwsfC0Tm4KUdGN50KOKpZqb
	Rbl64SPTcW1Po3oa/8ct7011GoprKisuP/eUC4U0+TxG1WKnq7ysIdClAjnbLr5+6IlvBGJ3Bx1dc
	UgUp9Ph793gIrBW+EKhbO8NBhn0noQ8OSMWY0UIEpag1NXPkVqSJv36ww2i5MT6SjY0HpV3v1ahA1
	GwuCl7C8yd1en8/zXjlEOYMQVKXPdR/wL4JqrG36KLC3r2ni8GKdMtr1S5T1aoDHUvp2mPCY1L5WF
	I+6Qd865cUoNa+bXeoeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qJi8f-001NhN-2q;
	Wed, 12 Jul 2023 22:16:49 +0000
Received: from mail-lj1-x22f.google.com ([2a00:1450:4864:20::22f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qJi8b-001Nec-1a
	for linux-mtd@lists.infradead.org;
	Wed, 12 Jul 2023 22:16:47 +0000
Received: by mail-lj1-x22f.google.com with SMTP id 38308e7fff4ca-2b701e41cd3so124823441fa.3
        for <linux-mtd@lists.infradead.org>; Wed, 12 Jul 2023 15:16:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1689200203; x=1691792203;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=U6m3CTODGn0UWM9+Rqg0ugH9A7AU7fZ4SISWuI+6Sl4=;
        b=mkLczbqbzzrRQn2RyVkNaVNj3OI3BbGW5Le6Wh/rF5Ymm5H7qzgFdrilT9YUDZIp4u
         T7TEAhVgmdaqVGZlbZKsyOqvVW9sAe84fsVZ//6lH184KsXbGmB3vNpcIn1S5HD6JRSf
         yZk354Te+JdvgZSJa1vLDLoX0sZVpuizcj5EJXGM7f1LuBeyzZu6Yc3cqWnJ4FFCWTrS
         NUNRZuRF2zvMf8sax2QkC5d9foXld9dSIX6Bg5vdyTMjTMk6uFa5pltHcaqLM4nzrSOH
         O1jPX0Lx5/E024E1+KqKBHTlgqyuEgauk9nHCtDJh9PuNqyd2nZcdsG5jD/ZIMFxsRSF
         n34A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689200203; x=1691792203;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=U6m3CTODGn0UWM9+Rqg0ugH9A7AU7fZ4SISWuI+6Sl4=;
        b=RXioNKIQf8DeOuPM+13rvW5K9nPevRsJj9OUJ0W+JXNaYcuex6N8Eu9PG8sXRCywvy
         t4rMceE+cSn4LfKq2guXrB2zHfJNM/4NbjIANKgs/B7aba38J+fSx25UgGNu3jz3drLM
         UlETzqmANvZ8RtM4xVG+Tjs62HCsnfzFk+DHY+QBFCLQ4n8OjRKD9RUaUoXdhvf3rbDh
         I5PCT0abCvZSHvtpszsLEhxfSeMK7sWQI+xAp4W51fItMD7Uvks07pO5ZhLMzO8DYKvc
         kITMca2PS1DQVH/zX8qvCUpyCW3d3Gr6re/fRaXigP6wdEnw0R/iLIiN9aUYYkjRmszQ
         8HOQ==
X-Gm-Message-State: ABy/qLZr5DQ1hn2i0qHv9F4klpXZraG1rwayEDzjW8mlCJx8sKNZ/oHO
	Wn0LVGe800Lpj6qaPjZMynwDSKD6O82tXeHVakU=
X-Google-Smtp-Source: APBJJlFe+iB0Y2THx9p8X+1eWOfB5H55LoZR90PLwjI1D6WC7kB+FxTXJq3m7CAQ90tyxbcEeWPHSA==
X-Received: by 2002:a2e:2405:0:b0:2b6:e0d3:45b5 with SMTP id k5-20020a2e2405000000b002b6e0d345b5mr18223822ljk.3.1689200202746;
        Wed, 12 Jul 2023 15:16:42 -0700 (PDT)
Received: from [127.0.1.1] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id b19-20020a2e8953000000b002b6e00a3e19sm1177774ljk.132.2023.07.12.15.16.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Jul 2023 15:16:42 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 13 Jul 2023 00:16:41 +0200
Subject: [PATCH v4 1/2] dt-bindings: mtd: Add SEAMA partition bindings
MIME-Version: 1.0
Message-Id: <20230713-seama-partitions-v4-1-69e577453d40@linaro.org>
References: <20230713-seama-partitions-v4-0-69e577453d40@linaro.org>
In-Reply-To: <20230713-seama-partitions-v4-0-69e577453d40@linaro.org>
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
X-CRM114-CacheID: sfid-20230712_151645_530389_90CCC9D4 
X-CRM114-Status: GOOD (  14.73  )
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
ChangeLog v3->v4:
- Drop false flagged cells etc.
ChangeLog v2->v3:
- Drop reference from partitions.yaml again
- Drop select: false
- Use unevaluatedProperties
ChangeLog v1->v2:
- Fix up the binding to be childless
---
 .../devicetree/bindings/mtd/partitions/seama.yaml  | 44 ++++++++++++++++++++++
 1 file changed, 44 insertions(+)

diff --git a/Documentation/devicetree/bindings/mtd/partitions/seama.yaml b/Documentation/devicetree/bindings/mtd/partitions/seama.yaml
new file mode 100644
index 000000000000..4c1cbf43e81a
--- /dev/null
+++ b/Documentation/devicetree/bindings/mtd/partitions/seama.yaml
@@ -0,0 +1,44 @@
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
