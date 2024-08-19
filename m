Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4BBEC3DA4A
	for <linux-mtd@archiver.kernel.org>; Mon, 19 Aug 2024 09:22:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OHkxXALSUYFTeQ6jxCE/B6CRpNUx+81R7TPaOdbFzCA=; b=Nc2XQsNa2vFXIW
	KUWa//3BUa7qECqepgDkQvWL0hU7C0kKaxIx0dzjXIYncb5d6hZWiQqo0lc+mg6WvhyGoPLdjHicz
	rEWL9+j9qD3BrgpPJnOfWcPz8c42J1wE75jdCDgYhmoDxRsVt8vM7LA4Ei5LgL+IiqN1oAb+VHJOk
	b3Vjm29gkshH2cSjcs7oFM30wM3KGjKvn5Px8gsnHm/k+F5L6/9/E6igmyiRLZLlbNBW2q7wHY0QK
	Jx2VGhLUUuUqYvhzYFxPF48gYW18HEEbPtwerHOwlYO3N8j2fbuQV5GRRslyVgyPhR238c7oBSVLk
	r7Vx6Ez+W3ze83PoyXxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sfyaY-00000000wQC-3YAO;
	Mon, 19 Aug 2024 09:22:10 +0000
Received: from mail-pg1-x533.google.com ([2607:f8b0:4864:20::533])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sfyZC-00000000w2D-2saP;
	Mon, 19 Aug 2024 09:20:48 +0000
Received: by mail-pg1-x533.google.com with SMTP id 41be03b00d2f7-7a263f6439eso2611153a12.3;
        Mon, 19 Aug 2024 02:20:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724059245; x=1724664045; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AaBJp5+G6SXtcyzXFl/UAnZKiPS+vvZQ0BE0rakJE8I=;
        b=KBNcD2s/llTc/77aJRAUhKb/QPGnH7jKev3HM4NSQ/lUtzLnAGPU8riH/ETKPTX2N0
         ZCoVEjLic4K0cP3HKmry1PJPKAhg9v+pvKHYrhgO9wiXv5hc8oymYdnrwM2NQ/o1SIyK
         irfWIZDF1SZEg3/CeAEnpDv7dDPfGQ+IUBpFyiOQrEfyFNfJWQahYsA0bwNO1wm5A8O4
         7VzbcuxTsD/uW1OUhDLoiimYUtpUjxQK190M1tRVynZv68wRR97EhCimZfu6r525aS7Y
         4s6xHpcckyRtnmS5SsMJo74vwa63xi2g42TftXOd9QKQCaU7jzVozLSlA8+14ysWmt37
         AFsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724059245; x=1724664045;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AaBJp5+G6SXtcyzXFl/UAnZKiPS+vvZQ0BE0rakJE8I=;
        b=E6RZCiRdzrT2V2f+ZY7ghWcwnBpkLrdCyinu64U/+Uz6XlVIptaND2VATINwHpqlKj
         gaJuXLaYwPRr+l2FGwortacrZ+LetyHz7X3rTC25T/bMbBvsNchmJxgHrdCZHE4NuXK/
         a0Hc7b+AXEeqvQ+u1v2n9ltEljDXX31Ekv9bo5+0vCzlDRlVAplpolusjC4m6fAO0vST
         E+ORmnCbVWSsIm0TMn8UtGpDCQhahkI8k4owl4GjpThTzwoW7AewxtueJK0gXOevbXz7
         AGdxF8YWF681pbSA0YbniZYReDEyEe68Utc9YuW5tIQLxsjRoVuzi69nB4fO2tXVKwVx
         7G7w==
X-Forwarded-Encrypted: i=1; AJvYcCVsKH0pReTxL4vFi7AlAJ0vtih8wHdpFkM7GHgebJp/rO/X0jJU1SNrD0OksmnS2BGnI6Mse6Urt/pf/MyqTD8p9US+jilzHtNbdNzN1w==
X-Gm-Message-State: AOJu0YzntM2xh2jhsKhTdyiZ+vB2LoDTrQOTX0aElpQ+ysjQbCMBiFRQ
	GiROVaap1t/DBuzWcs2jMllbdwf5ZdmyOlX4dZh/LaNd7rurnlou
X-Google-Smtp-Source: AGHT+IHESEJRgz5RoQr1+r21WRfRS+k4DQCryYbOXrq0aw27QQIg2rn+BwxFAbdSNek3DCdLjPOUiQ==
X-Received: by 2002:a17:90a:9a92:b0:2c9:3370:56e3 with SMTP id 98e67ed59e1d1-2d3e00f10dcmr9119583a91.34.1724059245460;
        Mon, 19 Aug 2024 02:20:45 -0700 (PDT)
Received: from localhost.localdomain (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2d3e3d97f2asm6750538a91.53.2024.08.19.02.20.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Aug 2024 02:20:45 -0700 (PDT)
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
Subject: [PATCH v2 1/2] dt-bindings: mtd: nuvoton,ma35d1-nand: add new bindings
Date: Mon, 19 Aug 2024 09:20:36 +0000
Message-Id: <20240819092037.110260-2-hpchen0nvt@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240819092037.110260-1-hpchen0nvt@gmail.com>
References: <20240819092037.110260-1-hpchen0nvt@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240819_022046_746748_1DFB9D97 
X-CRM114-Status: GOOD (  11.31  )
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
 .../bindings/mtd/nuvoton,ma35d1-nand.yaml     | 93 +++++++++++++++++++
 1 file changed, 93 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mtd/nuvoton,ma35d1-nand.yaml

diff --git a/Documentation/devicetree/bindings/mtd/nuvoton,ma35d1-nand.yaml b/Documentation/devicetree/bindings/mtd/nuvoton,ma35d1-nand.yaml
new file mode 100644
index 000000000000..152784e73263
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
+      - nuvoton,ma35d1-nand
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
