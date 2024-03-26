Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CFF4CD1283
	for <linux-mtd@archiver.kernel.org>; Tue, 26 Mar 2024 20:07:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VbdHaLMQBcZATT//Rdx7HLNT2jPvzUjtwR6YFxyI7Cs=; b=dbgZZZbpEQz2OK
	Hm21sQ9qZfyAFzXgFSqyO74wFK/jy7rEsPU7fmobelxDAt3a8WRsPOj33MovUm+zQL6mFzYPCA12U
	UhgjI4VVlycAhob63esHo3l/qkrSa6ZOypsNaaeZUUlOq1xivXP2QwCSTwNGStFddEcfoFVnOEUrD
	QUHR5460g3qh2Iibp0F/rbFrTYM2zQqlGUjezIvA3UjC06l8DG2rXyxeSzXvPxqWxoqy50G6Y7jcg
	9U/4/zPCjp8BmhYPvbYqOxIVeT2jQza0G6HCCYgwHCnYyz/InnWC0A1eo2yBnqJ2pYzz4eAABLRCJ
	EzEn/7qaUC9lH5MfPu1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpD4U-00000006G5y-2rKJ;
	Tue, 26 Mar 2024 20:06:58 +0000
Received: from mail-il1-x134.google.com ([2607:f8b0:4864:20::134])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpD4Q-00000006G4s-2NRf
	for linux-mtd@lists.infradead.org;
	Tue, 26 Mar 2024 20:06:56 +0000
Received: by mail-il1-x134.google.com with SMTP id e9e14a558f8ab-366a4bcb2a8so27881495ab.3
        for <linux-mtd@lists.infradead.org>; Tue, 26 Mar 2024 13:06:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1711483614; x=1712088414; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=t8EEc3adyFE7Wxfe+nLm4ZchWJV+nLrr+8hBvhQE2L0=;
        b=U80b4lXFEX2u7q7NGwLjTnkn7J3vz9t07xcSlYtSnYXR4xWnVP/IUkwWjyAyRjYNbN
         PYGgCI+lRUSR73Bt+KHPi++dKzSpTji0+E+edRPihsHrZwJzt/GUKCnEEew1a4v0u2dp
         +mVYXQ4gbh+GReNPKjD+Md+OWzZAJzL9zx+44=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711483614; x=1712088414;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=t8EEc3adyFE7Wxfe+nLm4ZchWJV+nLrr+8hBvhQE2L0=;
        b=pzFn0f2P8j+VsbEe/98VBadovIVeJ3IEQ+G1n+WFghzXtcjQUjHrvnHSKwnd+PmzI9
         c1HuKLYZ0iuHWNN2A55oqH23dBCwgcxvJx4wJOng3fxwOPAkwKi/635/GQcis/WBNG6c
         q/8ItwmaBKvUa/YATMWyJyJsC0ZjpMym4kTwsXf7P45poeBD9aBCmoYiJqlLVQNOktPP
         wMptQRLgzVVJsXC55E3ohCazfBWSeWZtwyHom6egVGtZC2Tl2ShvIYUjT8f3ONzvEMOO
         NGJLc9aaYNj2wb5fJIE6Oa/weVGgKaDJylaKGGyyUlGIxsyEe7z00KDkC/M214a7yIxn
         qKbg==
X-Forwarded-Encrypted: i=1; AJvYcCVOXiKeNyFe+KlzzuOCLlHQlwS0p5zRGMoRUQ5IPmwtfF0cGQRsdiKHFUkSvLezzVAunoDG2vSWrSkwf9sxEPCT6LGkcl3YvVjTMkgmdA==
X-Gm-Message-State: AOJu0Yw8FvKTgfAq2B4jSBNGIrFt+n8XZSnzDC7o3kLsgxTLCMb8YSg5
	ziUJ8driD24QJysj+KvSy0EvNpbFbNHQABP3VJX6OrLDWWvGozfEFJKwscVdzA==
X-Google-Smtp-Source: AGHT+IEEDeZcsz5sXCNnD2ZC6a2Wo23FMused7zzkcdVuJSmg7qZ+plRlZe/HcCYGC8F13GS4tmU/w==
X-Received: by 2002:a05:6e02:1a8f:b0:368:8d20:b18a with SMTP id k15-20020a056e021a8f00b003688d20b18amr10568423ilv.29.1711483613849;
        Tue, 26 Mar 2024 13:06:53 -0700 (PDT)
Received: from chromium.org (c-73-14-173-85.hsd1.co.comcast.net. [73.14.173.85])
        by smtp.gmail.com with ESMTPSA id f4-20020a92cb44000000b0036896f76593sm1002343ilq.85.2024.03.26.13.06.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Mar 2024 13:06:53 -0700 (PDT)
From: Simon Glass <sjg@chromium.org>
To: devicetree@vger.kernel.org
Cc: Michael Walle <mwalle@kernel.org>,
	U-Boot Mailing List <u-boot@lists.denx.de>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Tom Rini <trini@konsulko.com>,
	Rob Herring <robh@kernel.org>,
	linux-mtd@lists.infradead.org,
	Simon Glass <sjg@chromium.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	=?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v10 2/2] dt-bindings: mtd: fixed-partition: Add binman compatibles
Date: Tue, 26 Mar 2024 14:06:45 -0600
Message-Id: <20240326200645.1182803-2-sjg@chromium.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240326200645.1182803-1-sjg@chromium.org>
References: <20240326200645.1182803-1-sjg@chromium.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240326_130654_690924_C6A1E0D1 
X-CRM114-Status: GOOD (  23.22  )
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
index 656ca3db1762..bb3c326c6588 100644
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
index a848d6ca67e4..1eeb6ebde21f 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3639,6 +3639,11 @@ F:	Documentation/filesystems/bfs.rst
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
