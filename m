Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECAD1EB64DA
	for <linux-mtd@archiver.kernel.org>; Wed,  5 Jul 2023 10:18:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aiANEa9st4PwAPS0cSwf/Qxs9DL2MQv9XnGR+05zwtw=; b=F0mxVd7tIo1ksP
	ymG6pMnIy4bxBI7ZlDq26juGfzKZ8h3CLITLX6fHvzOt7sQFKSz7Y+QdiYkNUsMNZqwdPr86ycMq2
	kpjqpYk6689DnouV1PGfAXX3Lq4AHbNE6j9o6r93Lymqst2hOlpwDnDT0bd8cOI5oAJMLW3Q7OExJ
	ZDTQXw3G0EVMO6dSAXcVnezeo9olmwPVmjSBAosH5vkp7KJg3rG/QN+Zv2fKx7O8TAFd4uQMfINsq
	1Jo7fhN1rAyrb6jRwp22i/x3wTxEbep8GpkSnJxUFvGuEj9zWmDMUchdTyqU4TuqalrJ+YiWcVMDz
	APbkYaztQKy3NmSk3KAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qGzaK-00FTLc-1w;
	Wed, 05 Jul 2023 10:18:08 +0000
Received: from mail-lf1-x129.google.com ([2a00:1450:4864:20::129])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qGzaD-00FTFS-0K
	for linux-mtd@lists.infradead.org;
	Wed, 05 Jul 2023 10:18:02 +0000
Received: by mail-lf1-x129.google.com with SMTP id 2adb3069b0e04-4fb94b1423eso9916578e87.1
        for <linux-mtd@lists.infradead.org>; Wed, 05 Jul 2023 03:17:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1688552271; x=1691144271;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=a/PHi0Jgg0AWMsXAjQJ5U4jp3MPBa0UlRbW8srl3Ihw=;
        b=pdCch86LI+GK00eBaliFuGFYp11K2GD81RBf8d5o9ZzCK12suCVzqtuRI2yL5S02r2
         PbtRnHFsjp/9Z3lffbkIH28juVsneAPxbJkOLe1hGGRNbZFiYfkoYeVYivWDKgSjljYt
         o3PvWYI4s59dX6GJ9hkyfC+b/s09d13xS0V7amwq2lOhzegXQ9I9lG/NO0h9xMlhQL1y
         FDxx8ymDNHNAB+ZWaMFtV2RPpx6wiqdgTZr0yYwVNoVnrPWXIBHh9hOskAaN4v4FjCDG
         n0RoITMlReoUb2+ZT6eQcjgTn+NgJbkBrp9LpLr/dXMXyOhRzQeACCGjiok00r7DW+tv
         cMSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688552271; x=1691144271;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=a/PHi0Jgg0AWMsXAjQJ5U4jp3MPBa0UlRbW8srl3Ihw=;
        b=NSKSFsIyQenwcThuZK40V4w5VFRllTcSeXGD/BTc0MORDeCYEygaynELJkVO+sQATA
         rdf/tAPDWVxAb7xdI3OIZIh1HHL4TFlpNW5ttArlCc1b3/xulQEGs6sVGFsWPw2PCQO/
         Q6AuMYfR8XCshKkVl3Idg0Hq9+NZjYntImVWOzMRc6I/7QOyo8hIQU+CB04IrBdGMTcw
         wwfm6w7zKCOUxBHe7A39BD+mVWWRHQSXII/9x+MDGin1X6kmlvqC4nDqm6cMOkt7LpuG
         do1ZJXPdIznhU1YjytUaZT2orb6151GQE45JTul3tRtNoZBKtKhUcROKmXDOjI9LJWBJ
         IENw==
X-Gm-Message-State: ABy/qLZHnyh03Jy0zU9pI/7U6zwH7XCyWOlXLe9z906VJWuDB1tqsrhv
	64UATZbODvN0MUkXBQFAoxcXqQ==
X-Google-Smtp-Source: APBJJlF7C57LwITAQXZXCtktNHzoNkC3ObELjasgOsj39XLjJc4LgEDfuAoE0ecgCXsCwFR7Qpgi/Q==
X-Received: by 2002:a05:6512:3082:b0:4f8:6833:b13c with SMTP id z2-20020a056512308200b004f86833b13cmr12689324lfd.14.1688552271235;
        Wed, 05 Jul 2023 03:17:51 -0700 (PDT)
Received: from [127.0.1.1] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id l27-20020ac2555b000000b004fb75943ab3sm4774418lfk.258.2023.07.05.03.17.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Jul 2023 03:17:50 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 05 Jul 2023 12:17:46 +0200
Subject: [PATCH v2 1/2] dt-bindings: mtd: Add SEAMA partition bindings
MIME-Version: 1.0
Message-Id: <20230705-seama-partitions-v2-1-9d349f0d5ab7@linaro.org>
References: <20230705-seama-partitions-v2-0-9d349f0d5ab7@linaro.org>
In-Reply-To: <20230705-seama-partitions-v2-0-9d349f0d5ab7@linaro.org>
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
X-CRM114-CacheID: sfid-20230705_031801_152788_E75B152A 
X-CRM114-Status: GOOD (  15.61  )
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
ChangeLog v1->v2:
- Fix up the binding to be childless
---
 .../bindings/mtd/partitions/partitions.yaml        |  1 +
 .../devicetree/bindings/mtd/partitions/seama.yaml  | 50 ++++++++++++++++++++++
 2 files changed, 51 insertions(+)

diff --git a/Documentation/devicetree/bindings/mtd/partitions/partitions.yaml b/Documentation/devicetree/bindings/mtd/partitions/partitions.yaml
index 2edc65e0e361..9bd0a8d800da 100644
--- a/Documentation/devicetree/bindings/mtd/partitions/partitions.yaml
+++ b/Documentation/devicetree/bindings/mtd/partitions/partitions.yaml
@@ -21,6 +21,7 @@ oneOf:
   - $ref: linksys,ns-partitions.yaml
   - $ref: qcom,smem-part.yaml
   - $ref: redboot-fis.yaml
+  - $ref: seama.yaml
 
 properties:
   compatible: true
diff --git a/Documentation/devicetree/bindings/mtd/partitions/seama.yaml b/Documentation/devicetree/bindings/mtd/partitions/seama.yaml
new file mode 100644
index 000000000000..5ed7764bba69
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
+required:
+  - compatible
+
+additionalProperties: false
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
