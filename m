Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B8D7C433EF
	for <linux-mtd@archiver.kernel.org>; Fri, 10 Jun 2022 20:38:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=VsmcZK+Qf1p3Mm3ArTAo1/YwsyH8N78HcOTJ1j10yLQ=; b=3ATg+kHLcX0hz0
	VbmRYVK2dd6IwC+wilL7iri6cb+TXG9A7ujyK+He0AGcj7d+dlEygCv+IAF7E2RyNyWFyyF4Fg6l3
	jBO2TSfkofQHAUInC948ZcvTAEhLHhQSUIZYGKRCg53rCqMlQ0o4w2ZgPvOeUEKihM20NaIMD46iz
	ANFqZTrI9MaaBTBUD4tlz0D1MOxyoVDiFlQQX31nVwL091+74Z0ihm9FiKWCfRqvOVQ/Ta+0kJ80K
	uAv+YgISS/OtS9/tJ+UsxyNZXCqDUWD5UfdPOw2JwH25UFA6DLrZDIqTqU2O93freGPyMizcROvcE
	XglSfRkcuJgPuhWP4LFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nzlOb-009nYJ-Gu; Fri, 10 Jun 2022 20:38:17 +0000
Received: from mail-il1-f178.google.com ([209.85.166.178])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nzlOY-009nXN-S6
	for linux-mtd@lists.infradead.org; Fri, 10 Jun 2022 20:38:16 +0000
Received: by mail-il1-f178.google.com with SMTP id h7so164922ila.10
        for <linux-mtd@lists.infradead.org>; Fri, 10 Jun 2022 13:38:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=4m3Bo0gVkhfyIGU9xra6MloozgwWOG3t7N6ZclZnQ/I=;
        b=SO4IRZk1Lbd657+nB7hdNMeHFeULFZM46SSABiYbEbg9pjKOGj6FfchXsQQMUR52MY
         H2JdTkyuDj/WfZd3C0MtC/N3GE256yf3yY9Gt1ySyezrRNjCBrSTBnkMn7ahvOQuFYKx
         TPP6L77h34TCDJ3vxnodZlKqA1RJeNWj8qEmGND94Fwcks0xekIN7+3NQTzGVfkCEHsQ
         DQhsCqpx8AAkFjsSf4t0Q9xQhEKjw1dmpiLDcKol/oExJEecg+Dw1Hs1nDyZsijteAbi
         2JH7eVknBDs6g2Zn0P1wkFT8QSXDvAZajmyilEkvaAX/OZ3ufn6I9kgMvXWhKDf1XJS4
         gIzA==
X-Gm-Message-State: AOAM5312/qES2qToLTdcBc84YQQVpcMujSeKx6mkDQNUWc6dzy5nNCSL
	jwoMp6m9NdbiRVvXdrdDWAjuiXhoGQ==
X-Google-Smtp-Source: ABdhPJyVB3wPO8qibfrXXcaLUISXcn2Swhm7rrrKY18ybttaAXPFa7pxNWCllTPtZVYk3Nc3HqhWMw==
X-Received: by 2002:a92:cbcd:0:b0:2d1:ba4f:2f4f with SMTP id s13-20020a92cbcd000000b002d1ba4f2f4fmr25692107ilq.181.1654893492813;
        Fri, 10 Jun 2022 13:38:12 -0700 (PDT)
Received: from xps15.herring.priv ([64.188.179.251])
        by smtp.googlemail.com with ESMTPSA id z20-20020a056638001400b003316f4b9b26sm16014jao.131.2022.06.10.13.38.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jun 2022 13:38:12 -0700 (PDT)
From: Rob Herring <robh@kernel.org>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Linus Walleij <linus.walleij@linaro.org>
Cc: linux-mtd@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] dt-bindings: mtd/partitions: Convert arm-firmware-suite to DT schema
Date: Fri, 10 Jun 2022 14:37:44 -0600
Message-Id: <20220610203746.2191518-1-robh@kernel.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220610_133814_950422_082F8226 
X-CRM114-Status: GOOD (  13.32  )
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

Signed-off-by: Rob Herring <robh@kernel.org>
---
 .../mtd/partitions/arm,arm-firmware-suite.txt | 17 -----------
 .../partitions/arm,arm-firmware-suite.yaml    | 30 +++++++++++++++++++
 2 files changed, 30 insertions(+), 17 deletions(-)
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
index 000000000000..baf19ac0ea1f
--- /dev/null
+++ b/Documentation/devicetree/bindings/mtd/partitions/arm,arm-firmware-suite.yaml
@@ -0,0 +1,30 @@
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
+    flash@0 {
+        partitions {
+            compatible = "arm,arm-firmware-suite";
+        };
+    };
+...
-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
