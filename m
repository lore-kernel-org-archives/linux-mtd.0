Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91180C7EE24
	for <linux-mtd@archiver.kernel.org>; Sat,  6 May 2023 15:30:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BkGZu8h3Uue/PyuQPEpovrKIV47HkBoALBmvUis4MN0=; b=VETN+1QtPMSok1
	jOFveoKKl7H5vsCc8/4gner8Lspwpq0bUEEM1ZrjsuqRupc07/8NKnaPjzD7S3lnmO/r9Tiwf6rXL
	VZJjT7a7UqzL3duYwv6Zb//+ByNjEuuHcWfnwb7jJzx2/zEj3J9JYWKDdZQ5ccSz79KVtG13ZUWjp
	5AiTSCLkk/IbkIJET9OfBfivM1vFKz4ardWzFn2j4eUZEJFibnxdV0KTe0DH8KurWbhrBwKmY2TAT
	gZvIKngZTPf20b4LZI9AlSCmwX5p9tpYmK79ng5xY7iL/gL5WXt6MSO0f3f315y2B6mdYHpZTI7c/
	/1aMQomzrQSS0FBsp2zg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pvJrB-00DuKC-2S;
	Sat, 06 May 2023 15:29:57 +0000
Received: from mail-lf1-x129.google.com ([2a00:1450:4864:20::129])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pvJr3-00DuFJ-0w
	for linux-mtd@lists.infradead.org;
	Sat, 06 May 2023 15:29:52 +0000
Received: by mail-lf1-x129.google.com with SMTP id 2adb3069b0e04-4f22908a082so225710e87.1
        for <linux-mtd@lists.infradead.org>; Sat, 06 May 2023 08:29:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683386986; x=1685978986;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kcFNxwZJjHoZpWKSHiKHs54BtGGOGq9ohvpv73Bd18I=;
        b=dJfpUgM6CZ/H3KrBlF220za0DUnhwRNDMlR/kzl8wWqnFA4DgVnHkZwAbpOTDjAlkM
         HigvIxMZShpDWvvX39CH3UhnaeyrkxB9KMsZSBuS9zMYMSri9QYJLfsZfG07MKxcBqRu
         tk88mzSsbBDhFlIpKo2IjpWAhyk77MIJAg5fs9YHM82CPN9tqmHCpdEO8MiqUgsNI0wK
         pxwqh9XbuJTIjHYJy4VLvBM29R+nBacy4GS1BojXQVGDimfGGYFPEmUNffHI2/inLPsJ
         NskppM6iNqwJxHyq8qsokTsLy2oRx0n0nupYHkH2e2sT3MIqdlqufomzjIFmGczYU8XY
         G53Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683386986; x=1685978986;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kcFNxwZJjHoZpWKSHiKHs54BtGGOGq9ohvpv73Bd18I=;
        b=ib5lxtLcQMYuIuT2icsBBKJHI/0nn2TTu5rSarmvHTObwzBJRWxd4hiIO4mpQaLZAl
         903s07G+bRn2gR3bNiZtj+IfNNhQzK3jwd5aV71f3T56SL8Ya4RCibB7UBHXSb/BNYLh
         mbFYqXb9PVOcVtSIICm+CHCwacF2NE9gn1Q4UZxoBjzihd5ey+yxhCAU3ollB4qsKDYr
         aBookr8/TOC8CSzR+k+WsxlFwvXzKbuyVCwE5yrbRGsPHtFNH6pyD3IhdxNG6CLnWzR3
         XPodJ3NQhBUusybKGOd9YdaUZM0oJs8VtfYfHf4YhGCRNYPliAd+qL3zjfOkl8Ez6eCm
         D8xQ==
X-Gm-Message-State: AC+VfDxmCoAYptkviGAuLWo/TF9rpquRyjkku8Dh0waQWYhLZTVsrG4e
	5neHCJioHhH8lGng3dvyNRsFZw==
X-Google-Smtp-Source: ACHHUZ6GtyMk+NQ6GhlKalLwusNPGRbxL5sJNgSk9QivSz+TC736wa6j9aBzMTZaA949wCMGrPiWQg==
X-Received: by 2002:ac2:5298:0:b0:4ef:ec6a:198c with SMTP id q24-20020ac25298000000b004efec6a198cmr1448431lfm.26.1683386986519;
        Sat, 06 May 2023 08:29:46 -0700 (PDT)
Received: from [127.0.1.1] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id v5-20020a197405000000b004eff32d6a21sm680814lfe.121.2023.05.06.08.29.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 06 May 2023 08:29:46 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Sat, 06 May 2023 17:29:44 +0200
Subject: [PATCH 1/2] dt-bindings: mtd: Add SEAMA partition bindings
MIME-Version: 1.0
Message-Id: <20230506-seama-partitions-v1-1-5806af1e4ac7@linaro.org>
References: <20230506-seama-partitions-v1-0-5806af1e4ac7@linaro.org>
In-Reply-To: <20230506-seama-partitions-v1-0-5806af1e4ac7@linaro.org>
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
X-Mailer: b4 0.12.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230506_082949_391027_B5116FE5 
X-CRM114-Status: GOOD (  13.18  )
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
 .../devicetree/bindings/mtd/partitions/seama.yaml  | 50 ++++++++++++++++++++++
 1 file changed, 50 insertions(+)

diff --git a/Documentation/devicetree/bindings/mtd/partitions/seama.yaml b/Documentation/devicetree/bindings/mtd/partitions/seama.yaml
new file mode 100644
index 000000000000..352f008ffdb1
--- /dev/null
+++ b/Documentation/devicetree/bindings/mtd/partitions/seama.yaml
@@ -0,0 +1,50 @@
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
+  (MIPS), Broadcom BCM53xx, and RAMIPS platforms.
+
+maintainers:
+  - Linus Walleij <linus.walleij@linaro.org>
+
+select: false
+
+properties:
+  compatible:
+    const: seama
+
+  '#address-cells': false
+
+  '#size-cells': false
+
+patternProperties:
+  "@[0-9a-f]+$":
+    $ref: partition.yaml#
+
+required:
+  - compatible
+
+additionalProperties: false
+
+examples:
+  - |
+    flash {
+      partitions {
+        compatible = "fixed-partitions";
+        #address-cells = <1>;
+        #size-cells = <1>;
+        firmware@0 {
+          compatible = "seama";
+          label = "firmware";
+          reg = <0x00000000 0x08000000>;
+        };
+      };
+    };

-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
