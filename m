Return-Path: <SRS0=3VFJ=LW=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B2DE7C11F64
	for <linux-mtd@archiver.kernel.org>; Mon, 28 Jun 2021 19:15:46 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6682B6191B
	for <linux-mtd@archiver.kernel.org>; Mon, 28 Jun 2021 19:15:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6682B6191B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=l7E2c53R8RtR46lw8XTeVQMAkw3DKlwEPXzKM6fJHA4=; b=XqxOwSdTFxBSS+
	FTSjfzmLoQgdEisoNXKk6JOFrD5hCmEB8ofb9IHNh1zaqmJylgQYI1+VQt7XNGyWEm7S3iqQoSM1g
	y0PZN9jijUZj2Z5tpjcvbpv9ie9iNt4D0Vtr3JW25v42m3zokY/3NHe7oBPSfWkHUmUAQ2Y4/AUcA
	n4dqtPkXTn7OLXUz2NnAbQdZ4jX0033URVIjRjtAO29t3N38Kb2TH/xON8pVCjFpxZGxIRlCbu8rv
	AG1by1EnkkC3NvveBJEbePTzgzRmtzquFqxaOX5WQf5Lspb6+SCj3eru/4dk7weIOsH4xlZVoEGTZ
	+X/LGrZGiDcNCQ1AIAcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lxwii-008zwe-Ck; Mon, 28 Jun 2021 19:15:00 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lxwiY-008ztY-Du
 for linux-mtd@lists.infradead.org; Mon, 28 Jun 2021 19:14:52 +0000
Received: by mail-wm1-x32d.google.com with SMTP id
 l18-20020a1ced120000b029014c1adff1edso143960wmh.4
 for <linux-mtd@lists.infradead.org>; Mon, 28 Jun 2021 12:14:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=+htQTyEDF+CVc+mO+s5d9t8IztHN54DhG/4dMTnUuhs=;
 b=M84CXuxddhwuBiLOn5s5lrAZLL1SfDCezNR9CfNLJ0MCC4ycfVQw0oBLTYJwtJ0cYl
 TpQVpFZvX9c5NmVMSMBNb7p2IDcGKBUfnjWbISvK4cRF8wi0l3Jq0LB16GTBHxxxRr+z
 e+ddYYTYKEtUNC+jy004NKbP+3D4/GA46E4B9CNLPF9fEUhqHgOqEs3JHnX8VU53uvwk
 2595OdvZAb6Y6ZNNTx1YwvEaDi7AAl+K9dBaCesjWJ3OSrOxvQP0zm+n3V2Ey3hNx9lK
 lsj2rkbvgcNq5oFDqZmGQWrAC+yHhHZdPpf3pJeTfCjlHXxhMeccrO06AP72HycuZCcd
 qFHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=+htQTyEDF+CVc+mO+s5d9t8IztHN54DhG/4dMTnUuhs=;
 b=Jg6oYz8xd4AdSjBczRuQS7ahu40HjR/p2WerxqEcca23Ls9GckJ2AfLCLBTI7fpmEX
 3sCAoD5GjRZ5eoHFyxfNMarMsr0ggq3RVZPy97+cbkbQy0Qv3I+AEMgBZdINpwnQGnGe
 WE/EYMb5Yay3awJgHMnb76R6LLNmfpyBZehHFsIHVP6Bnq5sjj+DGQ3EUcoZg0OdgrF0
 moHrgC9S4YbGy257Z8DtniZoZNDI6MpLYW/cb1exw/EMhPU/XUG6HCCU0+GoZRcMbivE
 LyXsfiFqefIBpl9Kd0O+sNmZo1VyuKrvWDAeYUnimQ9RCkmEreuwLvtvJQYlO3t8+P+o
 qiLg==
X-Gm-Message-State: AOAM532MxnJD9FCpBk+fkC0zLKW+C7OxJbVAJRW4fceLRKa1/GuknaRy
 rDz7ghPwXvdmWC807Rwn5mCECw==
X-Google-Smtp-Source: ABdhPJyezEkTfArDKPV5DlchwZCsHL9GtWwN39ROTKBKy+ZAKVhOrjtAWdLO60RlnmSJF3S/SF58XA==
X-Received: by 2002:a1c:e907:: with SMTP id q7mr28391463wmc.1.1624907687817;
 Mon, 28 Jun 2021 12:14:47 -0700 (PDT)
Received: from localhost.localdomain
 (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.googlemail.com with ESMTPSA id n8sm15591229wrt.95.2021.06.28.12.14.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Jun 2021 12:14:47 -0700 (PDT)
From: Corentin Labbe <clabbe@baylibre.com>
To: miquel.raynal@bootlin.com, richard@nod.at, robh+dt@kernel.org,
 vigneshr@ti.com, linus.walleij@linaro.org
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mtd@lists.infradead.org, Corentin Labbe <clabbe@baylibre.com>
Subject: [PATCH v2] dt_bindings: mtd: partitions: redboot: convert to YAML
Date: Mon, 28 Jun 2021 19:14:40 +0000
Message-Id: <20210628191440.2823024-1-clabbe@baylibre.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210628_121450_567762_A9902385 
X-CRM114-Status: GOOD (  16.79  )
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

Converts mtd/partitions/redboot-fis.txt to YAML.

Signed-off-by: Corentin Labbe <clabbe@baylibre.com>
---
Changes since v1:
- fixed yamllint errors
- removed @0 from flash

 .../bindings/mtd/partitions/redboot-fis.txt   | 27 ------------
 .../bindings/mtd/partitions/redboot-fis.yaml  | 42 +++++++++++++++++++
 2 files changed, 42 insertions(+), 27 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/mtd/partitions/redboot-fis.txt
 create mode 100644 Documentation/devicetree/bindings/mtd/partitions/redboot-fis.yaml

diff --git a/Documentation/devicetree/bindings/mtd/partitions/redboot-fis.txt b/Documentation/devicetree/bindings/mtd/partitions/redboot-fis.txt
deleted file mode 100644
index fd0ebe4e3415..000000000000
--- a/Documentation/devicetree/bindings/mtd/partitions/redboot-fis.txt
+++ /dev/null
@@ -1,27 +0,0 @@
-RedBoot FLASH Image System (FIS) Partitions
-===========================================
-
-The FLASH Image System (FIS) directory is a flash description
-format closely associated with the RedBoot boot loader.
-
-It uses one single flash eraseblock in the flash to store an index of
-all images in the flash.
-
-This block size will vary depending on flash but is typically
-32 KB in size.
-
-Required properties:
-- compatible : (required) must be "redboot-fis"
-- fis-index-block : (required) a index to the eraseblock containing
-  the FIS directory on this device. On a flash memory with 32KB
-  eraseblocks, 0 means the first eraseblock at 0x00000000, 1 means the
-  second eraseblock at 0x00008000 and so on.
-
-Example:
-
-flash@0 {
-	partitions {
-		compatible = "redboot-fis";
-		fis-index-block = <0>;
-	};
-};
diff --git a/Documentation/devicetree/bindings/mtd/partitions/redboot-fis.yaml b/Documentation/devicetree/bindings/mtd/partitions/redboot-fis.yaml
new file mode 100644
index 000000000000..fee8d81b5276
--- /dev/null
+++ b/Documentation/devicetree/bindings/mtd/partitions/redboot-fis.yaml
@@ -0,0 +1,42 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/mtd/partitions/redboot-fis.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: RedBoot FLASH Image System (FIS) Partitions
+
+description: The FLASH Image System (FIS) directory is a flash description
+    format closely associated with the RedBoot boot loader.
+    It uses one single flash eraseblock in the flash to store an index of
+    all images in the flash.
+    This block size will vary depending on flash but is typically
+    32 KB in size.
+
+maintainers:
+  - Linus Walleij <linus.walleij@linaro.org>
+
+properties:
+  compatible:
+    const: redboot-fis
+
+  fis-index-block:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: a index to the eraseblock containing the FIS directory on this
+      device. On a flash memory with 32KB eraseblocks, 0 means the first
+      eraseblock at 0x00000000, 1 means the second eraseblock at 0x00008000 and so on.
+
+required:
+  - compatible
+  - fis-index-block
+
+additionalProperties: false
+
+examples:
+  - |
+    flash {
+      partitions {
+        compatible = "redboot-fis";
+        fis-index-block = <0>;
+      };
+    };
-- 
2.31.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
