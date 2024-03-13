Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3274EC54E60
	for <linux-mtd@archiver.kernel.org>; Wed, 13 Mar 2024 18:43:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=6nrPU+Ez5JmtrY0Bocwvdmz7/XoF77WPit0DrtqARGM=; b=jvPuQqJhgPZc6J
	yJJoDgnpjUH6YXfg6PS/A0Ymw8ssMukpuJu207VC3cCxPh7HYjZ0piQ2cmtl+iSiP9C0ynP/l6450
	kj/fkABSrnJSmzmr+avO3S2UDfh5/MJ3Q2rH4NsqwpiFrqFIPLxiz3V7f2LOow4Af04Mtk/uqTBWt
	U1MbiBjRSmaKtbcd+T1tZtQcjj+ntWiI2/z8yE3sa6NZsxRjHRq7F4R7UHPOJDMrE2d1ExCBXkj3n
	GvJZdPh5HM2Fxt/efhuVF9eXm0mSlRQCgLhALnJRLCh+zeA0ZGRKHRpf7Uv3oPKyYhJOZZN5UN+GL
	0oxKT1vif/6UNX1WrMOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rkTZW-0000000BOqy-2CfM;
	Wed, 13 Mar 2024 18:43:26 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rkTZS-0000000BOok-46a7
	for linux-mtd@lists.infradead.org;
	Wed, 13 Mar 2024 18:43:24 +0000
Received: by mail-wr1-x434.google.com with SMTP id ffacd0b85a97d-33e7ae72312so86687f8f.1
        for <linux-mtd@lists.infradead.org>; Wed, 13 Mar 2024 11:43:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1710355401; x=1710960201; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=8n0lPlyrShI//8JiMT39EqPm72VEaGOIKCdfE8EEWSU=;
        b=MCph+4jx6umsIkY8WdZTYD+tEdJHRc0k0AdF7KLaPeRAYwWapvMnFwnUwdk3K8E6HG
         1ZlqBabKRDd/6YARgIlIKGyZBZWhqYJHC3n0GNAj5PYMMGd/rFT4nBGM+Slu2ZIs/ibp
         B8+Dc/+eM7+x7NYbCUQus9ry2l2rdQ6JG7MNcMSb4uNxSSCyTjXj39cDNOdu/KzgtEf/
         v9MIBkj+FrPwtK+TOBjoPt1sYAjlFiQlsPmLcaZFwOoEcm96AQLUgU0HgU+1hvIlE/r3
         dXZ/V1azS/bdVIVXzcN7ieB1hqNDUKBEtrD45384ASyxAvBDQkamMY2HQmGCRUf2edUa
         /EiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710355401; x=1710960201;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8n0lPlyrShI//8JiMT39EqPm72VEaGOIKCdfE8EEWSU=;
        b=BLW7W3M8Tfr2azb6ui67hUHLg0mqxdzzpqa42d0PueJB1ksdRfcE3lUy11DZBwNDDR
         6MG0c8L3cT/wqym6HI9FjUqWfUQevn12VIMX7cGfBch8jgRfA2/4boCXsmYoBCVdUqU6
         jPeKpw6YZQGEWVPvVG1mhdratfhajRECAJ30eUVP9zZ8KIzJzHRgLIYkzKuerZDZVKtO
         y6AkGn2sCJxDLvAqsrhuJUie7XyYJ6xH6RhigrJufsvvGNXuECdFAnK5qTclmWKIB/wh
         uVPuqjyrRq3jwDH5cUA1MrQHKmG+NJ0lF1ggBwjnu48adXGweLA03Rrw/lH5c+p5dywp
         naiw==
X-Forwarded-Encrypted: i=1; AJvYcCXNwSKIxtku3KZoclKHOxYm5vOKSdxkMvXMLHM3JdvqEq1Eeaubu1sFcXbB8e8XQvglKeFKwu/PhVdbuuBSCD7zazY4nsgU1Xu9YE1ZLQ==
X-Gm-Message-State: AOJu0YxvktW9WhGAt4oGAtL8F7AUCc6hN6TiiCL6Qzqgn9OMncKmh/jE
	n8ozZuBZPOcU245y/zpY+TWY/ySFUuoGfUU1NVd9WNClRaha524ktI1nFq1OrDo=
X-Google-Smtp-Source: AGHT+IFh6nC+wEZ5G7Ev14Omc+KYBIzxoV1gKK8YvRLpLLSqwI2dCtd02o4bOiCsIajL1CJFY0t74g==
X-Received: by 2002:a5d:40d0:0:b0:33e:7719:325d with SMTP id b16-20020a5d40d0000000b0033e7719325dmr2575350wrq.2.1710355400836;
        Wed, 13 Mar 2024 11:43:20 -0700 (PDT)
Received: from krzk-bin.. ([178.197.222.97])
        by smtp.gmail.com with ESMTPSA id l15-20020a05600012cf00b0033ce727e728sm12192423wrx.94.2024.03.13.11.43.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Mar 2024 11:43:20 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	linux-mtd@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH] dt-bindings: mtd: Add Samsung S5Pv210 OneNAND
Date: Wed, 13 Mar 2024 19:43:17 +0100
Message-Id: <20240313184317.18466-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240313_114323_040698_51E55C53 
X-CRM114-Status: GOOD (  12.00  )
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

Document binding for Samsung S5Pv210 SoC OneNAND controller used already
in S5Pv210 DTS.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../bindings/mtd/samsung,s5pv210-onenand.yaml | 65 +++++++++++++++++++
 1 file changed, 65 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mtd/samsung,s5pv210-onenand.yaml

diff --git a/Documentation/devicetree/bindings/mtd/samsung,s5pv210-onenand.yaml b/Documentation/devicetree/bindings/mtd/samsung,s5pv210-onenand.yaml
new file mode 100644
index 000000000000..e07941b69904
--- /dev/null
+++ b/Documentation/devicetree/bindings/mtd/samsung,s5pv210-onenand.yaml
@@ -0,0 +1,65 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/mtd/samsung,s5pv210-onenand.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Samsung S5Pv210 SoC OneNAND Controller
+
+maintainers:
+  - Krzysztof Kozlowski <krzk@kernel.org>
+
+properties:
+  compatible:
+    enum:
+      - samsung,s5pv210-onenand
+
+  reg:
+    items:
+      - description: Control registers
+      - description: OneNAND interface nCE[0]
+      - description: OneNAND interface nCE[1]
+
+  clocks:
+    maxItems: 2
+
+  clock-names:
+    items:
+      - const: bus
+      - const: onenand
+
+  interrupts:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - clock-names
+  - interrupts
+
+allOf:
+  - $ref: nand-controller.yaml
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/s5pv210.h>
+
+    nand-controller@b0600000 {
+        compatible = "samsung,s5pv210-onenand";
+        reg = <0xb0600000 0x2000>,
+              <0xb0000000 0x20000>,
+              <0xb0040000 0x20000>;
+        clocks = <&clocks CLK_NANDXL>, <&clocks DOUT_FLASH>;
+        clock-names = "bus", "onenand";
+        interrupt-parent = <&vic1>;
+        interrupts = <31>;
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        nand@0 {
+            reg = <0>;
+        };
+    };
-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
