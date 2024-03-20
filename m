Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACFC8C54E67
	for <linux-mtd@archiver.kernel.org>; Wed, 20 Mar 2024 05:25:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PeE4IpFP/LxiFAl2DHLhbkN+K5uuJ10SJAIuZKukc4c=; b=G2rE9jkFyHKXn4
	P0ApOw8HVTU1RLsOmWUZMYy/rI0td2KN+ArIoVmVeoC3vooimCiCAJq6pr1BFgOaev4D3eLvzDk/+
	O7k/50MnWDQQHr0c5dBK0KcXXJWoFuwVHjdXFbr6Vw3OIxVnNc+zmK1gheEWvVNy9gQrJ/1wTPO+8
	ZPeoumGZDUuVu24iPCCa/gWxCOBMCaxxNrnkAKDjFUDAC3Lg8tCflcsFcRYVI60f1WP2Ak3tPdqUc
	Kd4vrbTCZYeDce5bOA5conOHpvm3ugbb5oulELm3fQCAxq4368DN4/Bkbeos6fGCDbiYtpKOnl9hq
	+HHBp2cpezBrOkwrf+JQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rmoRs-0000000FUzX-1kLd;
	Wed, 20 Mar 2024 05:25:12 +0000
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rmoRo-0000000FUwl-2XWe
	for linux-mtd@lists.infradead.org;
	Wed, 20 Mar 2024 05:25:10 +0000
Received: by mail-pf1-x42b.google.com with SMTP id d2e1a72fcca58-6e6aa5c5a6fso6024491b3a.0
        for <linux-mtd@lists.infradead.org>; Tue, 19 Mar 2024 22:25:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1710912306; x=1711517106; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QcuWLpfpwEQlI3/YVSySFA4Fv1Tx8PQOGU1A54pTOVc=;
        b=mr5Tl43Wuv/ORhXsvC/RSYSJgaCNgwhCLmH1OiSr14rkp9J2ONUCGYMcS2m4GLCVy8
         CF8ij1pScqZbkvZNWntBxTQwZKsnvlR1xavGBHfqNipPIjyuitt1s3gAgrTDf5Esy+Wn
         8NCkeT2+bGSProGt6mAr7sOFAPwzdtpUJ3JSE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710912306; x=1711517106;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QcuWLpfpwEQlI3/YVSySFA4Fv1Tx8PQOGU1A54pTOVc=;
        b=wZq+Ena5raRRReFn1zuvfCcgqd9YuIWAQHyynJKH6FQ5Q24l6kRapWONf529DqG56k
         C+EEjrsMJBncaHrS/7Z1kiHSAYq+EdZOTVYiolvKbfswUeVHfTho+UnMtD4+l4iMSoPN
         GzK/rq8Zki3tb0tGLVqujLDFVT4soUWNuTRbKuADaf3DQCw7rwFpuOYsSKxzQMcRPYWi
         cA5w3LFKX7jocsbPItJ/bJkBiPugDlrQAm6zP658ZBclmZ2XSVtynrQoEeKwQ2RTAIAc
         JAmHaF0SjP/WE08nmpcHSaOk3OfL3c53+JK3EkV1Q4zlp1kh4PDQegXK3V8dpAF/kVqB
         QEHQ==
X-Gm-Message-State: AOJu0YyjEVxMXlThEqSnXtGl7yXmC/l5ovWLYBVZwvzQwL7yE0Dy2GKB
	YkgrQrjGyuisVwiiM5X5N77HtJp6n0x3pm8sjj7J5TuiDbrhpU1428wQIUGF+w==
X-Google-Smtp-Source: AGHT+IEExdv2ILwyCgyYcA4XcseoU8HlmCfQWxTr6g04DTIjaLHXQo6TTQWZ0bxCnwHWDSnJWZ6SoA==
X-Received: by 2002:a05:6a21:999a:b0:1a3:55d2:1483 with SMTP id ve26-20020a056a21999a00b001a355d21483mr10628115pzb.5.1710912306340;
        Tue, 19 Mar 2024 22:25:06 -0700 (PDT)
Received: from chromium.org ([202.144.206.254])
        by smtp.gmail.com with ESMTPSA id sb14-20020a17090b50ce00b0029ffba4bf0esm572355pjb.19.2024.03.19.22.25.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Mar 2024 22:25:05 -0700 (PDT)
From: Simon Glass <sjg@chromium.org>
To: devicetree@vger.kernel.org
Cc: linux-mtd@lists.infradead.org,
	Rob Herring <robh@kernel.org>,
	Michael Walle <mwalle@kernel.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Simon Glass <sjg@chromium.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	=?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v9 2/2] dt-bindings: mtd: fixed-partition: Add binman compatibles
Date: Wed, 20 Mar 2024 18:24:49 +1300
Message-Id: <20240320052449.175786-2-sjg@chromium.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240320052449.175786-1-sjg@chromium.org>
References: <20240320052449.175786-1-sjg@chromium.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240319_222508_667622_7FD8FD1A 
X-CRM114-Status: GOOD (  20.06  )
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
---

(no changes since v8)

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

 .../bindings/mtd/partitions/binman.yaml       | 49 +++++++++++++++++++
 .../bindings/mtd/partitions/partition.yaml    | 21 ++++++++
 MAINTAINERS                                   |  5 ++
 3 files changed, 75 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mtd/partitions/binman.yaml

diff --git a/Documentation/devicetree/bindings/mtd/partitions/binman.yaml b/Documentation/devicetree/bindings/mtd/partitions/binman.yaml
new file mode 100644
index 000000000000..83417ad5cee9
--- /dev/null
+++ b/Documentation/devicetree/bindings/mtd/partitions/binman.yaml
@@ -0,0 +1,49 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/mtd/partitions/binman.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Binman entries
+
+description: |
+  TBD
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
+      - binman,entry # generic binman entry
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
index 39c7d7672783..3df12df06116 100644
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
index b43102ca365d..5b08ee363140 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3610,6 +3610,11 @@ F:	Documentation/filesystems/bfs.rst
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
