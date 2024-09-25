Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED7A1CCFA02
	for <linux-mtd@archiver.kernel.org>; Wed, 25 Sep 2024 21:46:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RLsA4RI8gtLqXS4doptBIFdZRhtZyvYw4zh2wnP4wFc=; b=zTtIM4sfcSwIma
	Xxh8gGXY2GXKMc9wL8K6zodVo6dzoeHepdB6cVWyHi0h9dXiQDxIfwdpN8C/5ASuuYjVRildvDMPT
	hHjJtq/LqNSGkNkZRKlExb3Z2U4Hp1N6BwQjBYr+PxSae/94gJJndjDuk6Rfg3XFZmc7xwF2PU8oy
	xnxy/+l3dD1Zk3ZkLlnz+SxJLRx8wT/Osg+RNUOik9l9FhTOOthdcDpEiRhAsRWivTyFTL4ptGgXy
	LPtTYJezNAsZXY7Rtb6C1/Ok5ARZbp78Xpif2Jl+2v8G+Z61UXsPUsgUURJBvy7xjOMmngs2PUWCs
	i6+IEcIuCmF6B3LX9Bkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1stZqX-00000006bFy-2KfG;
	Wed, 25 Sep 2024 21:46:53 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1stZqU-00000006bDh-2K0i
	for linux-mtd@lists.infradead.org;
	Wed, 25 Sep 2024 21:46:52 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-42cd46f3a26so2340925e9.2
        for <linux-mtd@lists.infradead.org>; Wed, 25 Sep 2024 14:46:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727300809; x=1727905609; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mPfCoOMxsJjIr/wXEPPqXPDSbCfoVOLl/AUDyDHyFMM=;
        b=lBSlOJPM7fj/UP/Siu2mW0/d30orqy0Y0DfJAxKqwmZE1YZscWOLysRgHNPTCiXcII
         UTAstSnD0jwHb0pmEwHSu+/ptHGpBCEyD1FogWOPsKlKuUcxjO344sPz0+ucMRoxOyp9
         RU5GWyMdwncb/uLgzc9HIs2kQjdaF4H8EWTg/VA6Jxah/hMgcbwSLX050ilfuCFtpsam
         nHuOGGInR+4LQJ0OgFqDSXXTgg0M/pbieHC7NfiJHOYnxLVh0IFzo8QsmxcmXFYuK8LR
         AEMNKxy71yvGcOaKFOdmj0VqrtQTb69+I95NBNfsjC8ZQsqhN4xIixdR/ue3/HfltFAU
         CMmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727300809; x=1727905609;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mPfCoOMxsJjIr/wXEPPqXPDSbCfoVOLl/AUDyDHyFMM=;
        b=LU3DVzurrwVLLxBjnrr6lfqdniqKZg1ob6X2eUI0Gm4lol9XKgKxhyQe8P9KNqeQJX
         4CpxNAjAaMRhN5vtGlo/2NP4MYWSvnslCL3eXlkGfADjDVlFJjEJoo/eNNhLpv4K5XcF
         45zcHIghjSi2LhUXw4+LyCypYzo3f6HEswMao6J0/wYGzU8QVFO6ncfzHWtO5SAEuPB7
         x0mSLbxD8Mdsg6rW6cTx6MeMIyf31lCAblT5WwZU5B9+b2VaRkoK1cmZ/nGKjTHAyyhH
         vwWkPD0I2QXm2IEPxtPwYO+Yk92mT4zHYjC7Gi7Q17CzsAbZLdj+GXgxvT55UW4I/22L
         P0mQ==
X-Forwarded-Encrypted: i=1; AJvYcCV4FamAIIMpjygt8+O/tdG5cnGgStBORJuAAUa3D1nCZG82eaTgJW5m13W+40HpRTWgm87LadrdAZU=@lists.infradead.org
X-Gm-Message-State: AOJu0YzMMNv8WK7W9c3yEc7K+52r3W/xYjP/MAoWL+Febo1iHPgiceQN
	q7hwYad/Q451oHHYEHYVpNpikAHB0k8iJkvtywuOeVDQH+zk30Ar
X-Google-Smtp-Source: AGHT+IGTce5mi+zGP1nqXGGDPQZkUaai36raLWa1UNPSL60TCBSVV7e7UIdYpJYbrhcAnUbxRz9g7A==
X-Received: by 2002:a05:600c:1910:b0:42c:b9b1:8342 with SMTP id 5b1f17b1804b1-42e96119514mr26588975e9.19.1727300808654;
        Wed, 25 Sep 2024 14:46:48 -0700 (PDT)
Received: from localhost.localdomain (93-34-90-105.ip49.fastwebnet.it. [93.34.90.105])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-42e96a1f2aasm28802565e9.45.2024.09.25.14.46.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Sep 2024 14:46:47 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Jens Axboe <axboe@kernel.dk>,
	Jonathan Corbet <corbet@lwn.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Christian Marangi <ansuelsmth@gmail.com>,
	Simon Glass <sjg@chromium.org>,
	INAGAKI Hiroshi <musashino.open@gmail.com>,
	Daniel Golle <daniel@makrotopia.org>,
	Al Viro <viro@zeniv.linux.org.uk>,
	Christian Brauner <brauner@kernel.org>,
	Li Lingfeng <lilingfeng3@huawei.com>,
	Christian Heusel <christian@heusel.eu>,
	=?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>,
	linux-block@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-mmc@vger.kernel.org,
	linux-mtd@lists.infradead.org,
	Lorenzo Bianconi <lorenzo@kernel.org>
Subject: [RFC PATCH v2 4/5] dt-bindings: block: Generalize and introduce property for partitions
Date: Wed, 25 Sep 2024 23:45:24 +0200
Message-ID: <20240925214544.6114-5-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240925214544.6114-1-ansuelsmth@gmail.com>
References: <20240925214544.6114-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240925_144650_705532_42DF6DA6 
X-CRM114-Status: GOOD (  20.62  )
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

Generalize property from MTD partitions schema and introduce property for
block partitions defined in OF.

Partition schema for block devices is a reduced schema of the MTD as
only a few property are supported for it. (reg, label and read-only)

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 .../bindings/block/partitions/partition.yaml  | 33 +++++++++++++++++++
 .../bindings/block/partitions/partitions.yaml | 27 +++++++++++++++
 .../bindings/mtd/partitions/partition.yaml    | 10 ++----
 3 files changed, 62 insertions(+), 8 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/block/partitions/partition.yaml
 create mode 100644 Documentation/devicetree/bindings/block/partitions/partitions.yaml

diff --git a/Documentation/devicetree/bindings/block/partitions/partition.yaml b/Documentation/devicetree/bindings/block/partitions/partition.yaml
new file mode 100644
index 000000000000..b9b1d8139e56
--- /dev/null
+++ b/Documentation/devicetree/bindings/block/partitions/partition.yaml
@@ -0,0 +1,33 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/block/partitions/partition.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Partition
+
+description: |
+  This binding describes a single flash partition. Each partition must have its
+  relative offset and size specified. Depending on partition function extra
+  properties can be used.
+
+maintainers:
+  - Christian Marangi <ansuelsmth@gmail.com>
+
+properties:
+  reg:
+    description: partition's offset and size within the flash (in sector
+      block, 512byte)
+    maxItems: 1
+
+  label:
+    description: The label / name for this partition.
+
+  read-only:
+    description: This parameter, if present, is a hint that this partition
+      should only be mounted read-only. This is usually used for flash
+      partitions containing early-boot firmware images or data which should
+      not be clobbered.
+    type: boolean
+
+additionalProperties: true
diff --git a/Documentation/devicetree/bindings/block/partitions/partitions.yaml b/Documentation/devicetree/bindings/block/partitions/partitions.yaml
new file mode 100644
index 000000000000..9c161aac364d
--- /dev/null
+++ b/Documentation/devicetree/bindings/block/partitions/partitions.yaml
@@ -0,0 +1,27 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/block/partitions/partitions.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Partitions
+
+description: |
+  This binding is generic and describes the content of the partitions container
+  node.
+
+maintainers:
+  - Christian Marangi <ansuelsmth@gmail.com>
+
+properties:
+  '#address-cells':
+    enum: [1, 2]
+
+  '#size-cells':
+    enum: [1, 2]
+
+patternProperties:
+  "^partition@[0-9a-f]+$":
+    $ref: partition.yaml
+
+unevaluatedProperties: false
diff --git a/Documentation/devicetree/bindings/mtd/partitions/partition.yaml b/Documentation/devicetree/bindings/mtd/partitions/partition.yaml
index 80d0452a2a33..e822d3219b68 100644
--- a/Documentation/devicetree/bindings/mtd/partitions/partition.yaml
+++ b/Documentation/devicetree/bindings/mtd/partitions/partition.yaml
@@ -6,6 +6,8 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
 
 title: Partition
 
+$ref: /schemas/block/partitions/partition.yaml
+
 description: |
   This binding describes a single flash partition. Each partition must have its
   relative offset and size specified. Depending on partition function extra
@@ -28,19 +30,11 @@ maintainers:
 properties:
   reg:
     description: partition's offset and size within the flash
-    maxItems: 1
 
   label:
     description: The label / name for this partition. If omitted, the label
       is taken from the node name (excluding the unit address).
 
-  read-only:
-    description: This parameter, if present, is a hint that this partition
-      should only be mounted read-only. This is usually used for flash
-      partitions containing early-boot firmware images or data which should
-      not be clobbered.
-    type: boolean
-
   lock:
     description: Do not unlock the partition at initialization time (not
       supported on all devices)
-- 
2.45.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
