Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40691E74902
	for <linux-mtd@archiver.kernel.org>; Mon,  2 Oct 2023 17:50:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=HR/0IUBtLhbZqP/JA7JVvkKYXSzwQcK7wxehO9RcOHI=; b=NQOQAitzQg4znQ
	pVDaVcx6Kgmr4a0+7BzjWDl5ByNb/0/jqaodisHy+5HDnU/dyz3t57wl3wTG2hcKi9gV35z29GcZY
	9mJqw6evvwemg8rOgvC28g1lfsWkCjjb5ZNVjUKh3n3Wn8Pwh6+jA+ZZ0LmpVdPFxsmk7Obg9Fk89
	UE4sjtK16OLUTNJBuf1Sgm0xw2iN5yOAyRNcMlcebd2zVTkiO4dTvhohTilLsZWcmp4V1NKAdCv8b
	149wfg4Wmd8WOob2pnw7h3albVLcaJLwOpLNDPXCH0CO7gdlxQYQXaPrCtqqavzu8MLRO6kt9oVFF
	dbmDtipOT7J2KO8pv7/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qnN3t-00DASR-0x;
	Mon, 02 Oct 2023 17:50:29 +0000
Received: from mail-io1-xd2e.google.com ([2607:f8b0:4864:20::d2e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qnN3o-00DARs-1x
	for linux-mtd@lists.infradead.org;
	Mon, 02 Oct 2023 17:50:26 +0000
Received: by mail-io1-xd2e.google.com with SMTP id ca18e2360f4ac-79f95cd15dfso745939f.0
        for <linux-mtd@lists.infradead.org>; Mon, 02 Oct 2023 10:50:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1696269022; x=1696873822; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=k71/w5tQzn4vicDbb9dqcU9SEKAhIvW7cb6nA8shinc=;
        b=RzeZSgfPukKhx5tOmYANod8akYvAtZPgN1jGw79DyBdTZgZfsT5RSq+EKFHWcSL9mT
         VHQEyqHXb6gG2vJejjrlrD6V0UPlWwrJTWh2VLrETtlvQPFs0+FzNDTJk17jJ3eG5Lmt
         pDPOOp7nUrYxDj4a4oezk5sd1ggaRzV6asjc4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696269022; x=1696873822;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=k71/w5tQzn4vicDbb9dqcU9SEKAhIvW7cb6nA8shinc=;
        b=sS/s99P3OgKIeh3fqJG8vPuukaOEszjaXDJ31dqHI3WsFupgqLIuQEJMwx2Af3+arj
         OxyA2vLw3ueb2Z1jFIYv7drjEOwtdmo3Yo5beipL7e61X6qRb9sV3hLpvrM8gazT2vvW
         3huH8ei6sc7lthltGJO/mKyoTj0UzyqsWjOG+iPAzJa7cPSIwOejCck4Hj1tUqseHWvL
         P/d2o+PPu5pWhh7wE0Tgd970TD0ijyvyTAq8j64RG+hrtQt0prCtNAHJV4s96CkqE3EQ
         A6foXn6Mm/OZXPsdSAZQWpYlE/xZStLQRm+4oOZRMcZ+lZXDgRXe01e3Kc1Mf5KmnGFJ
         CXsA==
X-Gm-Message-State: AOJu0YwDBsW9HjVHYq9L2Gr3O7bhBtdqgTcVO2okxelsORY7Sk8gMh63
	xMq1zepydhCWPKi2CM+sIQYsTQ==
X-Google-Smtp-Source: AGHT+IEyXhGigDBdCKAGT+/IMaNGbS+k8t3ALkt9DIMUsltzdGeZnx6gsOo2/2x7u2YGnPQKl0q5+w==
X-Received: by 2002:a5d:9cd5:0:b0:794:cdd8:db3c with SMTP id w21-20020a5d9cd5000000b00794cdd8db3cmr14699347iow.17.1696269022549;
        Mon, 02 Oct 2023 10:50:22 -0700 (PDT)
Received: from kea.bld.corp.google.com ([2620:15c:183:200:63cd:2673:520:2e9])
        by smtp.gmail.com with ESMTPSA id s23-20020a02c517000000b0042b2e309f97sm6919562jam.177.2023.10.02.10.50.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Oct 2023 10:50:22 -0700 (PDT)
From: Simon Glass <sjg@chromium.org>
To: devicetree@vger.kernel.org
Cc: Rob Herring <robh@kernel.org>,
	Tom Rini <trini@konsulko.com>,
	U-Boot Mailing List <u-boot@lists.denx.de>,
	linux-mtd@lists.infradead.org,
	Simon Glass <sjg@chromium.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Pratyush Yadav <ptyadav@amazon.de>,
	=?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>,
	Richard Weinberger <richard@nod.at>,
	Rob Herring <robh+dt@kernel.org>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/3] dt-bindings: mtd: fixed-partitions: Add binman compatible
Date: Mon,  2 Oct 2023 11:49:40 -0600
Message-ID: <20231002174948.1015223-1-sjg@chromium.org>
X-Mailer: git-send-email 2.42.0.582.g8ccd20d70d-goog
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231002_105024_650942_E750266F 
X-CRM114-Status: GOOD (  18.03  )
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

Add a compatible string for binman, so we can extend fixed-partitions
in various ways.

Signed-off-by: Simon Glass <sjg@chromium.org>
---

Changes in v2:
- Drop mention of 'enhanced features' in fixed-partitions.yaml
- Mention Binman input and output properties
- Use plain partition@xxx for the node name

 .../bindings/mtd/partitions/binman.yaml       | 61 +++++++++++++++++++
 .../mtd/partitions/fixed-partitions.yaml      |  3 +
 .../bindings/mtd/partitions/partitions.yaml   |  1 +
 MAINTAINERS                                   |  5 ++
 4 files changed, 70 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mtd/partitions/binman.yaml

diff --git a/Documentation/devicetree/bindings/mtd/partitions/binman.yaml b/Documentation/devicetree/bindings/mtd/partitions/binman.yaml
new file mode 100644
index 000000000000..844f241feebf
--- /dev/null
+++ b/Documentation/devicetree/bindings/mtd/partitions/binman.yaml
@@ -0,0 +1,61 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+# Copyright 2023 Google LLC
+
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/mtd/partitions/binman.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Binman firmware layout
+
+maintainers:
+  - Simon Glass <sjg@chromium.org>
+
+select: false
+
+description: |
+  The binman node provides a layout for firmware, used when packaging firmware
+  from multiple projects. It is based on fixed-partitions, with some
+  extensions.
+
+  Binman supports properties used as inputs to the firmware-packaging process,
+  such as those which control alignment of partitions. This binding addresses
+  these 'input' properties. For example, it is common for the 'reg' property
+  (an 'output' property) to be set by Binman, based on the alignment requested
+  in the input.
+
+  Once processing is complete, input properties have mostly served their
+  purpose, at least until the firmware is repacked later, e.g. due to a
+  firmware update. The base 'fixed-partitions' binding should provide enough
+  information to read the firmware at runtime, including decompression if
+  needed.
+
+  Documentation for Binman is available at:
+
+  https://u-boot.readthedocs.io/en/latest/develop/package/binman.html
+
+  with the current image-description format at:
+
+  https://u-boot.readthedocs.io/en/latest/develop/package/binman.html#image-description-format
+
+allOf:
+  - $ref: /schemas/mtd/partitions/fixed-partitions.yaml#
+
+properties:
+  compatible:
+    const: binman
+
+additionalProperties: false
+
+examples:
+  - |
+    partitions {
+        compatible = "binman", "fixed-partitions";
+        #address-cells = <1>;
+        #size-cells = <1>;
+
+        partition@100000 {
+            label = "u-boot";
+            reg = <0x100000 0xf00000>;
+        };
+    };
diff --git a/Documentation/devicetree/bindings/mtd/partitions/fixed-partitions.yaml b/Documentation/devicetree/bindings/mtd/partitions/fixed-partitions.yaml
index 331e564f29dc..85aef1572967 100644
--- a/Documentation/devicetree/bindings/mtd/partitions/fixed-partitions.yaml
+++ b/Documentation/devicetree/bindings/mtd/partitions/fixed-partitions.yaml
@@ -24,6 +24,9 @@ properties:
       - items:
           - const: sercomm,sc-partitions
           - const: fixed-partitions
+      - items:
+          - const: binman
+          - const: fixed-partitions
 
   "#address-cells": true
 
diff --git a/Documentation/devicetree/bindings/mtd/partitions/partitions.yaml b/Documentation/devicetree/bindings/mtd/partitions/partitions.yaml
index 1dda2c80747b..849fd15d085c 100644
--- a/Documentation/devicetree/bindings/mtd/partitions/partitions.yaml
+++ b/Documentation/devicetree/bindings/mtd/partitions/partitions.yaml
@@ -15,6 +15,7 @@ maintainers:
 
 oneOf:
   - $ref: arm,arm-firmware-suite.yaml
+  - $ref: binman.yaml
   - $ref: brcm,bcm4908-partitions.yaml
   - $ref: brcm,bcm947xx-cfe-partitions.yaml
   - $ref: fixed-partitions.yaml
diff --git a/MAINTAINERS b/MAINTAINERS
index 5f18c6ba3c3c..367c843ec348 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3517,6 +3517,11 @@ F:	Documentation/filesystems/bfs.rst
 F:	fs/bfs/
 F:	include/uapi/linux/bfs_fs.h
 
+BINMAN
+M:	Simon Glass <sjg@chromium.org>
+S:	Supported
+F:	Documentation/devicetree/bindings/mtd/partitions/binman*
+
 BITMAP API
 M:	Yury Norov <yury.norov@gmail.com>
 R:	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
-- 
2.42.0.582.g8ccd20d70d-goog


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
