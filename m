Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD769C3DA4A
	for <linux-mtd@archiver.kernel.org>; Mon, 12 Aug 2024 03:02:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ztPE5IglKR5gkOFOd7vM2WIneWNuMApj1ukTg/KjXu8=; b=QMiCv/LVgpxB+6
	0tGgZlCPCZbIn7Q+QRbCQdmeqG8YKMGGjz3Q4AXbqjzt4OakeA97PrFNadJEHmNaTlI/X/2ofhlw+
	umOR3MwGQ35slyHVXDbTfqPx5/vquYmzG9sToGs7+Eq3K/rkqZQvTE/ILrTNZjifmovcwyYEPXzfe
	FivndLwBx7Mh0Q6cb5/eBET2FZMlr28ZhQ5vb+H4T8lFPdlsdqS0EJKHJmSeUY4uAsx6kdSXJUhql
	JvC5dmToRmvr5cNFc+BXjCank5sVmrN/0xbGabowvmq2lLjymvlEsk8lJfbsPpsSFCF0tK7EmQk36
	6DwEYr6dw6LAl/tRDnbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sdLJq-0000000GlLQ-0Apu;
	Mon, 12 Aug 2024 03:02:02 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sdLIk-0000000GlDe-2U5b;
	Mon, 12 Aug 2024 03:00:56 +0000
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-1fc491f9b55so25554725ad.3;
        Sun, 11 Aug 2024 20:00:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723431654; x=1724036454; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IopTiHG0CBw96zUreHMxRe7sxGZ9Qm/2aKgJL9eEcvc=;
        b=NZVKPg8M+uxYt0mcJFJt9JDaZgpi2TrIkWCOX2IJBbbiVKz6sLlQJWKwvzBWZMnR4E
         Cvei/0ZY0c2f0BbhXN6+AQtFTrMcwvq9w0ybOMjal8nzRfwYyzWXa2h4vhnHkfrC8IqC
         7CCGWkvapcR+MgwyVd9TmzO7Xj+M/yu1YXP98O0TreZjuT+3EsqsDBtSPVGtRV5ylau1
         hECSVO5yaWhoNP7wpzuk5m001nTP4oyH+izOd15f8RdOOKgh8ZY1yfGzgke/4ebyfbKE
         ZvRCRgEfP2gKxPSb4/AsgQPD8ZC04nNq4EaVztLu2xxAG/M3biuYo+Ss1t6SsYDvK1mS
         I/7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723431654; x=1724036454;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IopTiHG0CBw96zUreHMxRe7sxGZ9Qm/2aKgJL9eEcvc=;
        b=R2KVRZamEHW2Rr9/8PC2wvAfCH5TMBc9yRcCAqRSdEvwoYDjLTQ+WzvMbvYf1FAasM
         DeOi8QlfQ1/t6GgCg48dB+TLSeB9eVZofhhbbJq7C0QG5zvolMXzHQDOoK0R+n5lJzwt
         OV1KTrA7V5hY8RRE3Lx84cyXf8x3zyZZg4+NhOWT6BWsKT573SyR5KH2D8QAVSjjxW4R
         OZEpAROomX2dLwJRzX2BREG+TqMoJA3HdO1FBHCvfblft+ina7CycdnUN7PrC725l98u
         jutt+BU6x469jk+kQ4apsQjLjst+0rkoq9Lu1UTNY9IUiBrRLThJ4AiWzbHI9nmMYthT
         yU2A==
X-Forwarded-Encrypted: i=1; AJvYcCUBLOH3P5fm9gAYZKuIRnXvKOcEvx/okRGc8AAh0T6//9fkWeMOSfk1tgG971JntT/MG1fNsaYuhhwheeBPD+1+fWo2f1M3dn8G5yzYHA==
X-Gm-Message-State: AOJu0YxWBrcRwWOpVX2qikEQnY9abcD9lM1zF7HmcNtofu+1OygoR1ID
	pUH7dU0mcIezMJOqgOL5iKubEUvTFb8P+A0EhDLlmR9mN1b+Hqqm
X-Google-Smtp-Source: AGHT+IHJXWDmzGqQsCRWNZAXXOnmTHQ9pzhPsPckKmhtROKYEm/n1QxQPzP20fncSjqFX5lD8dFJDA==
X-Received: by 2002:a17:902:ec91:b0:1fb:7b96:8467 with SMTP id d9443c01a7336-200ae624582mr56725935ad.63.1723431653571;
        Sun, 11 Aug 2024 20:00:53 -0700 (PDT)
Received: from localhost.localdomain (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-200bba00f73sm28047105ad.201.2024.08.11.20.00.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Aug 2024 20:00:53 -0700 (PDT)
From: Hui-Ping Chen <hpchen0nvt@gmail.com>
To: miquel.raynal@bootlin.com,
	richard@nod.at,
	vigneshr@ti.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	sumit.semwal@linaro.org,
	christian.koenig@amd.com,
	esben@geanix.com
Cc: linux-arm-kernel@lists.infradead.org,
	linux-mtd@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linaro-mm-sig@lists.linaro.org,
	Hui-Ping Chen <hpchen0nvt@gmail.com>
Subject: [PATCH 1/2] dt-bindings: mtd: nuvoton,ma35d1-nand: add new bindings
Date: Mon, 12 Aug 2024 03:00:44 +0000
Message-Id: <20240812030045.20831-2-hpchen0nvt@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240812030045.20831-1-hpchen0nvt@gmail.com>
References: <20240812030045.20831-1-hpchen0nvt@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240811_200054_654892_1C3F5723 
X-CRM114-Status: GOOD (  11.48  )
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
---
 .../bindings/mtd/nuvoton,ma35d1-nand.yaml     | 97 +++++++++++++++++++
 1 file changed, 97 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mtd/nuvoton,ma35d1-nand.yaml

diff --git a/Documentation/devicetree/bindings/mtd/nuvoton,ma35d1-nand.yaml b/Documentation/devicetree/bindings/mtd/nuvoton,ma35d1-nand.yaml
new file mode 100644
index 000000000000..988c43bc6e99
--- /dev/null
+++ b/Documentation/devicetree/bindings/mtd/nuvoton,ma35d1-nand.yaml
@@ -0,0 +1,97 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/mtd/nuvoton,ma35d1-nand.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Nuvoton MA35D1 NAND Flash Interface (NFI) Controller
+
+allOf:
+  - $ref: nand-controller.yaml#
+
+maintainers:
+  - Hui-Ping Chen <hpchen0nvt@gmail.com>
+
+properties:
+  compatible:
+    enum:
+      - nuvoton,ma35d1-nand
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    minItems: 1
+
+patternProperties:
+  "^nand@[a-f0-9]$":
+    type: object
+    $ref: raw-nand-chip.yaml
+    properties:
+      nand-ecc-mode:
+        const: hw
+
+      nand-ecc-step-size:
+        enum: [512, 1024]
+
+      nand-ecc-strength:
+        enum: [8, 12, 24]
+
+      nand-bus-width:
+        const: 8
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
+            compatible = "nuvoton,ma35d1-nand";
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
+                nand-ecc-mode = "hw";
+                nand-ecc-step-size = <512>;
+                nand-ecc-strength = <8>;
+                nand-bus-width = <8>;
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
