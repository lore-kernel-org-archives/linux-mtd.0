Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38BB7C433EF
	for <linux-mtd@archiver.kernel.org>; Wed, 29 Jun 2022 18:51:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=C/+5naaz1Ln2YbGmXEHeCsYe/IVSKbHkQvdMOVbGTEo=; b=CvH0AkKtyjC2AC
	4TGz6+yraB2ktE7pD8z7D/OXhCxFhxUF7LYJW8tl+C8U3s31lExebBZeh3LtMNLEvCGWLldaMsk4u
	MM2ieJnmWkCk+M7CY/R/DRrOKb2n/JfPl8rUk8vRpRTFpLRRM67DpahFb3MkRsLhYnRG0rorfLHw6
	dhu51o+TlLDj8wJfLLZQXrHRNbGZizS1XzS9A8W2ze+8ukptGbq/J9Qd3AfOkAR8w9+4cHEINmShZ
	ZV/HevU9+1soQ/nmnbymSgS0D80nsZer4O/hE/bfkFMvdtwRvhc8+S2G4cXsv6hRJrYeZjjdoZIlP
	Z9B7nucKGhKNiotUWv5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o6cm1-00DdaE-7a; Wed, 29 Jun 2022 18:50:49 +0000
Received: from mail-io1-f48.google.com ([209.85.166.48])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o6clw-00DdYF-RV
	for linux-mtd@lists.infradead.org; Wed, 29 Jun 2022 18:50:48 +0000
Received: by mail-io1-f48.google.com with SMTP id v185so10230996ioe.11
        for <linux-mtd@lists.infradead.org>; Wed, 29 Jun 2022 11:50:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=lC0FS/YwnawDE3dIPNG4OuxNJ6LL8yKImCI5KP81WTo=;
        b=axNxPjcdx+MYCI6I022XG97o/U+CuMY2VrhAYBOH7JBWTLC18tun/iTaHtVtGy+Vad
         DcZsvJvbMrF5fBevQKcMjjw5kqvRky5Q7BDLexYQtTU6rgZY2QaJy9dThe5JkTkjTBV7
         bigXsK7ZCY0rIqXZDEuA1YQoeaYyYtsqjzwRxRwXffQp+0PRajJmHBL4JQ07msPot+iv
         2XjPE8ScjyJ/9pG8SCoLzGvpLcnvNCG7brO2EQMZa/DMTf8PWdZL5XKlTDrjwsfHdWil
         9GRMyHi8n6y7fxXgFz8ljscfcTavcdgqqLHt65ltpNgQMhU1WKAqnFTyNHWLkLhPcbvt
         gRcA==
X-Gm-Message-State: AJIora/VWaAlgc8QIFX0bcastxPBgchULAEIWhNGmKqP57f/mHvWZKlL
	q3qxuTeU8E4G9S8TriHDCA==
X-Google-Smtp-Source: AGRyM1s9g2WdbEij2eOEMPLKdKNm0dwWC39LBthQsHU267ZmYwdIO2ymTwvBSF9TitvUxDyFhC6YIA==
X-Received: by 2002:a02:c057:0:b0:339:e390:c94a with SMTP id u23-20020a02c057000000b00339e390c94amr2813647jam.20.1656528641021;
        Wed, 29 Jun 2022 11:50:41 -0700 (PDT)
Received: from xps15.herring.priv ([64.188.179.253])
        by smtp.googlemail.com with ESMTPSA id w3-20020a02b0c3000000b00339d4037e7csm7617381jah.44.2022.06.29.11.50.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jun 2022 11:50:40 -0700 (PDT)
From: Rob Herring <robh@kernel.org>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Linus Walleij <linus.walleij@linaro.org>
Cc: linux-mtd@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] dt-bindings: mtd/partitions: Convert arm-firmware-suite to DT schema
Date: Wed, 29 Jun 2022 12:50:30 -0600
Message-Id: <20220629185031.23826-1-robh@kernel.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220629_115044_923569_AD121411 
X-CRM114-Status: GOOD (  14.68  )
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

Convert the arm,arm-firmware-suite partition binding to DT schema
format. Simple conversion as there's only a compatible property.

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
Signed-off-by: Rob Herring <robh@kernel.org>
---
v2:
 - Fix example dtc warning
---
 .../mtd/partitions/arm,arm-firmware-suite.txt | 17 -----------
 .../partitions/arm,arm-firmware-suite.yaml    | 28 +++++++++++++++++++
 2 files changed, 28 insertions(+), 17 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/mtd/partitions/arm,arm-firmware-suite.txt
 create mode 100644 Documentation/devicetree/bindings/mtd/partitions/arm,arm-firmware-suite.yaml

diff --git a/Documentation/devicetree/bindings/mtd/partitions/arm,arm-firmware-suite.txt b/Documentation/devicetree/bindings/mtd/partitions/arm,arm-firmware-suite.txt
deleted file mode 100644
index d5c5616f6db5..000000000000
--- a/Documentation/devicetree/bindings/mtd/partitions/arm,arm-firmware-suite.txt
+++ /dev/null
@@ -1,17 +0,0 @@
-ARM AFS - ARM Firmware Suite Partitions
-=======================================
-
-The ARM Firmware Suite is a flash partitioning system found on the
-ARM reference designs: Integrator AP, Integrator CP, Versatile AB,
-Versatile PB, the RealView family, Versatile Express and Juno.
-
-Required properties:
-- compatible : (required) must be "arm,arm-firmware-suite"
-
-Example:
-
-flash@0 {
-	partitions {
-		compatible = "arm,arm-firmware-suite";
-	};
-};
diff --git a/Documentation/devicetree/bindings/mtd/partitions/arm,arm-firmware-suite.yaml b/Documentation/devicetree/bindings/mtd/partitions/arm,arm-firmware-suite.yaml
new file mode 100644
index 000000000000..76c88027b6d2
--- /dev/null
+++ b/Documentation/devicetree/bindings/mtd/partitions/arm,arm-firmware-suite.yaml
@@ -0,0 +1,28 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/mtd/partitions/arm,arm-firmware-suite.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: ARM Firmware Suite (AFS) Partitions
+
+maintainers:
+  - Linus Walleij <linus.walleij@linaro.org>
+
+description: |
+  The ARM Firmware Suite is a flash partitioning system found on the
+  ARM reference designs: Integrator AP, Integrator CP, Versatile AB,
+  Versatile PB, the RealView family, Versatile Express and Juno.
+
+properties:
+  compatible:
+    const: arm,arm-firmware-suite
+
+additionalProperties: false
+
+examples:
+  - |
+    partitions {
+        compatible = "arm,arm-firmware-suite";
+    };
+...
-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
