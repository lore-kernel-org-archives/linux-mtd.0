Return-Path: <SRS0=TxUZ=KP=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3CB00C433B4
	for <linux-mtd@archiver.kernel.org>; Thu, 20 May 2021 11:58:30 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AEE6061006
	for <linux-mtd@archiver.kernel.org>; Thu, 20 May 2021 11:58:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AEE6061006
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=cyaiuAtocWkCKRl0sUGcmzJGG3/XVJVvP6AkH6V9Twg=; b=ZNbh5Lz4o1q/onGyWxR21e4IaS
	YXLHAfskiTG0z1c+4b8IW5NI0la640Gasv0JGudsIET6UsMTeObR84QlCs0ndvePhvlOqGQd0i4Kg
	n+26Nk3JXEhW4bmuKM/3hRvuNIpkFa/DX2m+/6dt685ubP0vzpMGnXFqGMquVl6l/CH9gOxuaFt1k
	eoZbph7hOD/S6c1YsnE7A5IK3METni/ViKrcY26gJxlUSVafPaguJBTHFwV30YixxD6a15wOGAMx8
	oMiaFgEqWdaJydiTB+pt9sF/QnNGo5pxfkyslqSMCuD/nWI+oxL9RDVPqt7ZJxOem6uLNdJuADHCJ
	2ec7t2+w==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ljhJE-000fN3-Ul; Thu, 20 May 2021 11:57:49 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ljhJA-000fLd-J1
 for linux-mtd@desiato.infradead.org; Thu, 20 May 2021 11:57:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:In-Reply-To:References;
 bh=CRX2JtlP6roZDHRvtYOLEAQ/K5VUocF6cJ1EiMMZE2U=; b=PVKccSU40oEsyr5pqW4DoXXS5V
 5LBP9gbw3OnSKsizVfaBt8eNVH+xjKfRw2/99lVhFTgSGLjjwyP1nY9z5TzvDvflYG8Ldmbqx0om9
 9Ah4J/UXiLVmE9jDCBAth5pC/UVFr2vfdCS4ZQWdEQWFYdGzkeyv7opLGFWTsgqBnzcbsxieA0FZ9
 msEywRZ3HzGN4/rGWY6VNkrfIAuJ3YsbVWyIVv+lVEoTIvVhGMfPRMSccH1C+6mYvwHGZKJJ+7w4j
 0nh/h7LkGC+xH4MMR2PdDXz6xdHCg3ZOZxzfxRyVTlF3mCpo8nh6fNPq+fTUVpgkmH5167kyqJR9n
 amI49Q6Q==;
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1ljhJ7-00GHTP-31
 for linux-mtd@lists.infradead.org; Thu, 20 May 2021 11:57:43 +0000
Received: by mail-wm1-x32d.google.com with SMTP id
 s5-20020a7bc0c50000b0290147d0c21c51so5052598wmh.4
 for <linux-mtd@lists.infradead.org>; Thu, 20 May 2021 04:57:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=CRX2JtlP6roZDHRvtYOLEAQ/K5VUocF6cJ1EiMMZE2U=;
 b=cYQfOTbe1R2YmUfbEIaXJO8PkRspZ9kSS+W9Meup0D9UVVDtZ6bGiv0OXWB5dkarTv
 kVZMww/qtdQ4hu/w+bNmO6Cn8IcFtFUSORexjjuuNP58NT6IVsgCWWpMC3imbC9SXm0x
 rW74+V4mmk4hAOP1f9J90lI1ab7VCcfWQ26HWYat2ijJvHRn5tjNVqB2t8BtZaJGRTte
 HqyTus9JJr5+lV4APOF32ptIdSw5NKYJLcmDSqcn38Tne2nZmPDYh+VwvmSMFLE9mlyh
 kt8UTYgnrx1znWStbWzE2+9NMAYweDwA0nIXoYctl1Has6yCZ2AgZRJj1B0o75eJ1J+G
 AGiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=CRX2JtlP6roZDHRvtYOLEAQ/K5VUocF6cJ1EiMMZE2U=;
 b=ATq/ltZcoGS0vD2a6SISULtj492Zd9QfM1MX9CHaKCqc/89UG+YL5BQeThRj1zEDmk
 WCP1lWQwZfjJc8B/wCWX6iDHN7fzVruqlJexk4cEydAQKBhFd2zjDCR0bgUFiNaoneZl
 OSVZJ61P5Tcx7OIyRQQVn3l4VVK42BGXDG1ljLyVgF1rHq/RhzEg7Lra4/s5aOa67GpO
 qinZnLpR6VWc/sPO5qTioFXjq+CtW4I7eublGTOqhiCc9hyjJ1cVPgTPAzJZMlUtIz0X
 JjqsNTqwlVmsqvbXUKmVKWB/mtUbcjMf1KSZqVBtP263gUQoGmY1AfdKSAp6e08Yut3R
 QoPg==
X-Gm-Message-State: AOAM530+ruaVem7PqwEBr7hzPrhWkE96HsTV2j/uxJ4VV2JHoATZhrqm
 ZN/Pc8WeWzvOOp1z0s9Ul/H/at++xjfiag==
X-Google-Smtp-Source: ABdhPJwg7SvNLg4qlgXj4qZQTDO7gV78Dm+ivYeKMl+4ggpfyfpwNFiEnX0P3s8pNwRORC7FVUwz8Q==
X-Received: by 2002:a1c:1dcf:: with SMTP id d198mr3223262wmd.40.1621511859655; 
 Thu, 20 May 2021 04:57:39 -0700 (PDT)
Received: from localhost.localdomain
 (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.googlemail.com with ESMTPSA id z12sm3179803wmc.5.2021.05.20.04.57.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 May 2021 04:57:39 -0700 (PDT)
From: Corentin Labbe <clabbe@baylibre.com>
To: miquel.raynal@bootlin.com, richard@nod.at, robh+dt@kernel.org,
 vigneshr@ti.com, linus.walleij@linaro.org
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mtd@lists.infradead.org, Corentin Labbe <clabbe@baylibre.com>
Subject: [PATCH] dt_bindings: mtd: partitions: redboot: convert to YAML
Date: Thu, 20 May 2021 11:57:32 +0000
Message-Id: <20210520115732.1276569-1-clabbe@baylibre.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210520_045741_152218_E87DBF7C 
X-CRM114-Status: GOOD (  16.93  )
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
index 000000000000..61e08be984b0
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
+    flash@0 {
+      partitions {
+        compatible = "redboot-fis";
+        fis-index-block = <0>;
+      };
+    };
-- 
2.26.3


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
