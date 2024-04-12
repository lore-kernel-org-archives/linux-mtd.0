Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A349C04FF8
	for <linux-mtd@archiver.kernel.org>; Fri, 12 Apr 2024 15:33:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=izAx9y2eES8x9/nsILGc7qTfNN5rtr9TLm42eVmtFvE=; b=iMprgC/C64UjZt
	FhAfYkDkGGfW1sj+R6kJcqI5yrK4sLKQiOB5W3oyRVm+sNRq6qhjGcVCEnK0TL5Ah7OJbj2eE8ATz
	TjECa2tMmCLmnQRzIEfC8iKmnHIdcfRh/YVYzErRCXex26oEe/4qpTWAS06FwIEnKCmHlH8Hc3Vk/
	u8Ahleo0nb4ZJLCHttS1zVfvcRqO6dOWqd4hO3RqQ/rvkWbvpA27U1dbAvF6/EhMh0M+pzUY1isF0
	3OS13FJRZd+xptZ/Rk/PyRNJGcXxlBhwj+fkp6zkPODJZQNol8YFpgnxVFpoWv9CTvsBYHRLTOgb8
	CMhOhej45m5/KVZZ5+Xw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rvItk-00000000Fh4-0NhV;
	Fri, 12 Apr 2024 15:33:04 +0000
Received: from mail-io1-xd2a.google.com ([2607:f8b0:4864:20::d2a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rvItg-00000000Fdj-1fU8
	for linux-mtd@lists.infradead.org;
	Fri, 12 Apr 2024 15:33:02 +0000
Received: by mail-io1-xd2a.google.com with SMTP id ca18e2360f4ac-7d6c4c97875so12968939f.3
        for <linux-mtd@lists.infradead.org>; Fri, 12 Apr 2024 08:32:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1712935974; x=1713540774; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mVk91NoB1mb4Ya4VZgNI4Mqy/+sMIdBT8JrdncMceds=;
        b=m7kRFmqFqw+6kQUp7fbywIAOb+9MLe/RNqo5S+2H/yI+oUzoRTPSwc3DSXnJ9ZWmVN
         4cSNiD1/EzsFF0gKD3NdM+Od6qqHlq7qK/6CGPZ1qSg2nhaPLO+GOdZR8xuirkldME1x
         6WJIxKtsb/7aYnjLjesxVN88SH4QHIoy+P/Oc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712935974; x=1713540774;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mVk91NoB1mb4Ya4VZgNI4Mqy/+sMIdBT8JrdncMceds=;
        b=isSjVNezKETLgBXeSIsu37QCZ+xW1AG95vaHcLwWwxnUm2HcQU6KhiJBpKX+12RgaQ
         2wht15uZQSmkSNsnJbjgLUhWM+at/xoT/6iwLRW2aWjeYqBON/cJTZHjh35RAwzWKqUc
         do4soXFejexZAPPLpCQOlKnQTSjdArd0IhUxXQY1Gok0Ya9Z8JDkBPv55EcV3W6fZeFi
         hNNuEWpxZJw6Szrh5Nq6UrPpq4NkDx9APy6giV1CAPE+JE7rpuWeWDtaNSsghAdnjHdT
         s0R+8F6Sajjs42n0sFtzeohkp0F1L92AfJlIVHVe3dYUpMieGYNE+sDkZyytdBJU3gJb
         mW1w==
X-Forwarded-Encrypted: i=1; AJvYcCUd9g4FJK+Mq13xSOfCS942/1qFwI5D9KIXHSLCXr+HewzoJhTyxfWEZL2VqFQ4pnxeakulx+FTPlHwSf77AaYFiXpSuE3OTOsN96/KaQ==
X-Gm-Message-State: AOJu0YwpzpaerkTdcPGe+ZbeZL1xCfUuG9SNI64WluB4EKYxojrq2MKU
	6aUMSTLyl47D121ewLalNOAjey4Qy+jFS/Nxp1d56AibbLmc7HboTe1mdYXUuw==
X-Google-Smtp-Source: AGHT+IGkiz6PwnIU+zNzBRMsgrX6Di+Gl2zPGrx8z9DynYpgkn7YBpjO4V9dGup0bH7vtQLmpvwvBw==
X-Received: by 2002:a05:6602:3d6:b0:7d5:f3d4:201c with SMTP id g22-20020a05660203d600b007d5f3d4201cmr3209346iov.21.1712935973913;
        Fri, 12 Apr 2024 08:32:53 -0700 (PDT)
Received: from chromium.org (c-73-14-173-85.hsd1.co.comcast.net. [73.14.173.85])
        by smtp.gmail.com with ESMTPSA id ik14-20020a0566026c0e00b007d65a95d95csm1093828iob.42.2024.04.12.08.32.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Apr 2024 08:32:53 -0700 (PDT)
From: Simon Glass <sjg@chromium.org>
To: devicetree@vger.kernel.org
Cc: U-Boot Mailing List <u-boot@lists.denx.de>,
	Michael Walle <mwalle@kernel.org>,
	Tom Rini <trini@konsulko.com>,
	linux-mtd@lists.infradead.org,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Rob Herring <robh@kernel.org>,
	Simon Glass <sjg@chromium.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	=?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v11 2/2] dt-bindings: mtd: fixed-partition: Add binman compatibles
Date: Fri, 12 Apr 2024 09:32:49 -0600
Message-Id: <20240412153249.100787-2-sjg@chromium.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240412153249.100787-1-sjg@chromium.org>
References: <20240412153249.100787-1-sjg@chromium.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240412_083300_486325_2910D9C8 
X-CRM114-Status: GOOD (  22.45  )
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

Add two compatibles for binman entries, as a starting point for the
schema.

Note that, after discussion on v2, we decided to keep the existing
meaning of label so as not to require changes to existing userspace
software when moving to use binman nodes to specify the firmware
layout.

Note also that, after discussion on v6, we decided to use the same
'fixed-partition' schema for the binman features, so this version
adds a new 'binman.yaml' file providing the new compatibles to the
existing partition.yaml binding.

Signed-off-by: Simon Glass <sjg@chromium.org>
Reviewed-by: Rob Herring <robh@kernel.org>
---

(no changes since v10)

Changes in v10:
- Drop binman,entry since it is likely not necessary
- Put the description back

Changes in v8:
- Switch the patch ordering so the partition change comes first

Changes in v7:
- Adjust MAINTAINERS entry
- Put compatible strings into the 'fixed-partition' binding

Changes in v5:
- Add mention of why 'binman' is the vendor
- Drop  'select: false'
- Tidy up the compatible setings
- Use 'tfa-bl31' instead of 'atf-bl31'

Changes in v4:
- Correct selection of multiple compatible strings

Changes in v3:
- Drop fixed-partitions from the example
- Use compatible instead of label

Changes in v2:
- Use plain partition@xxx for the node name

 .../bindings/mtd/partitions/binman.yaml       | 53 +++++++++++++++++++
 .../bindings/mtd/partitions/partition.yaml    | 21 ++++++++
 MAINTAINERS                                   |  5 ++
 3 files changed, 79 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mtd/partitions/binman.yaml

diff --git a/Documentation/devicetree/bindings/mtd/partitions/binman.yaml b/Documentation/devicetree/bindings/mtd/partitions/binman.yaml
new file mode 100644
index 000000000000..bb4b08546184
--- /dev/null
+++ b/Documentation/devicetree/bindings/mtd/partitions/binman.yaml
@@ -0,0 +1,53 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/mtd/partitions/binman.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Binman entries
+
+description: |
+  This corresponds to a binman 'entry'. It is a single partition which holds
+  data of a defined type.
+
+  Binman uses the type to indicate what data file / type to place in the
+  partition. There are quite a number of binman-specific entry types, such as
+  section, fill and files, to be added later.
+
+maintainers:
+  - Simon Glass <sjg@chromium.org>
+
+allOf:
+  - $ref: /schemas/mtd/partitions/partition.yaml#
+
+properties:
+  compatible:
+    enum:
+      - u-boot       # u-boot.bin from U-Boot project
+      - tfa-bl31     # bl31.bin or bl31.elf from TF-A project
+
+required:
+  - compatible
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    partitions {
+        compatible = "fixed-partitions";
+        #address-cells = <1>;
+        #size-cells = <1>;
+
+        partition@100000 {
+            compatible = "u-boot";
+            reg = <0x100000 0xf00000>;
+            align-size = <0x1000>;
+            align-end = <0x10000>;
+        };
+
+        partition@200000 {
+            compatible = "tfa-bl31";
+            reg = <0x200000 0x100000>;
+            align = <0x4000>;
+        };
+    };
diff --git a/Documentation/devicetree/bindings/mtd/partitions/partition.yaml b/Documentation/devicetree/bindings/mtd/partitions/partition.yaml
index 31bbeb161396..80d0452a2a33 100644
--- a/Documentation/devicetree/bindings/mtd/partitions/partition.yaml
+++ b/Documentation/devicetree/bindings/mtd/partitions/partition.yaml
@@ -118,3 +118,24 @@ then:
 
 # This is a generic file other binding inherit from and extend
 additionalProperties: true
+
+examples:
+  - |
+    partitions {
+        compatible = "fixed-partitions";
+        #address-cells = <1>;
+        #size-cells = <1>;
+
+        partition@100000 {
+            compatible = "u-boot";
+            reg = <0x100000 0xf00000>;
+            align-size = <0x1000>;
+            align-end = <0x10000>;
+        };
+
+        partition@200000 {
+            compatible = "tfa-bl31";
+            reg = <0x200000 0x100000>;
+            align = <0x4000>;
+        };
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index b1b074ce2cf3..b1a4ca692578 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3684,6 +3684,11 @@ F:	Documentation/filesystems/bfs.rst
 F:	fs/bfs/
 F:	include/uapi/linux/bfs_fs.h
 
+BINMAN
+M:	Simon Glass <sjg@chromium.org>
+S:	Supported
+F:	Documentation/devicetree/bindings/mtd/partitions/binman*
+
 BITMAP API
 M:	Yury Norov <yury.norov@gmail.com>
 R:	Rasmus Villemoes <linux@rasmusvillemoes.dk>
-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
