Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37E0AC54E76
	for <linux-mtd@archiver.kernel.org>; Thu, 16 Nov 2023 17:29:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=x2fwr8EmVj67QiH9R9HwaCZNNNLpyURO6SvsnWzVcQk=; b=0FAhfo7QRJEC5E
	ft4XmRlfyrPGZHNxQ/NUgM/2fFswRdwL8kOllOheoSdRFnmdjwqQrVACb5zvBZFcS06A50IK18n5D
	RtbXv6Cy8jpHmAs915CpmdsWYcQ5rZ9fUqb1kOIF9l1Ee/zTT9nFlIfEcagoE2s3zTfGP5vSZ6TUD
	0+r0LNOjBG07nfNKoUOW+YIX/ZKzO3aU3H1PYjV3r+mHOJ1rrLKU32chLfihE9f4gng4S5RgaLCC0
	S6oFbRQpcR5/BRSJSHcWVS38woNNqNfVzu9FZIH6s9IeOQVBq37L3HRYASR/rkmJrApSOnJZx8EVf
	oXDcXR9rJD7rmaY2xykA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r3gAv-0048Em-0d;
	Thu, 16 Nov 2023 17:29:09 +0000
Received: from mail-io1-xd32.google.com ([2607:f8b0:4864:20::d32])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r3gAs-0048D1-3C
	for linux-mtd@lists.infradead.org;
	Thu, 16 Nov 2023 17:29:08 +0000
Received: by mail-io1-xd32.google.com with SMTP id ca18e2360f4ac-7a69a1b51baso56272339f.1
        for <linux-mtd@lists.infradead.org>; Thu, 16 Nov 2023 09:29:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1700155744; x=1700760544; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=zObDJyyApj+o5rWei7TBUNVUgsvLA6WxzS7aiu366ig=;
        b=KlL8GqUb3LpapzbTslsTxZ932lVmxM3P+W4UQemG/N0dSrxpSSPhDgdCPzpHipGYSY
         DeIQ2dKpdfcDEOCN6d2TBd8to56rYGQYdTh551qG3BtYvKNAwSV3fEkfDn6aOVmyNg4b
         Hrx7pJeuXyd3+BTUx5F1UeIUDuQe8urM+OmRs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700155744; x=1700760544;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zObDJyyApj+o5rWei7TBUNVUgsvLA6WxzS7aiu366ig=;
        b=UQgOqHj81IOmlRDMkO9PqtjW482r650I6NCL8+XDg1ArB8E7pOE/9kzE8Xc1B+A176
         FRGvL4jRbWsMaDWI9Xa/eV4O8WiUzRSCk94LuMAbyQuHTYv4rZPR+jZGCD2unCACHnol
         +7TLJj0WCtLF6CawRnxZLctv8rdnuy142ebhbWGk7SQ3i2sFlGafcoD8n8yxqXh7qHsR
         VDhwAsEel41lRU381Nm379+qtVHhHgTW9CZhZFcX0b0Bk3lKPdqVbqpfco/dzGEOfMPI
         3rFGiPZ8ZbyGVHsaY2aib4YsCXGMhd3I6Dlz6whWPBDMUuTZJjKash54NclLtQ6iX9y/
         fItw==
X-Gm-Message-State: AOJu0Ywz8RteYlYSypovvf01mbhsiCsdONgJ2cSTT/VcBpBiNL1PkjhO
	fK/k10rOoOD8WJMnqwRWLX+OYA==
X-Google-Smtp-Source: AGHT+IFKMAplsaghNOXgzwni6uGRMOHHyXUUMlwafzZxgoUtmTxDO5K7s6Rv6XR8ipAkr/swrYO73A==
X-Received: by 2002:a05:6e02:1a0b:b0:359:3294:91a9 with SMTP id s11-20020a056e021a0b00b00359329491a9mr2835390ild.14.1700155744300;
        Thu, 16 Nov 2023 09:29:04 -0800 (PST)
Received: from sjg1.lan (c-73-14-173-85.hsd1.co.comcast.net. [73.14.173.85])
        by smtp.gmail.com with ESMTPSA id o8-20020a056e02092800b0035ab8cc4a4bsm1914348ilt.17.2023.11.16.09.29.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Nov 2023 09:29:04 -0800 (PST)
From: Simon Glass <sjg@chromium.org>
To: devicetree@vger.kernel.org
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
	linux-mtd@lists.infradead.org,
	Tom Rini <trini@konsulko.com>,
	Rob Herring <robh@kernel.org>,
	Michael Walle <mwalle@kernel.org>,
	U-Boot Mailing List <u-boot@lists.denx.de>,
	Simon Glass <sjg@chromium.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Pratyush Yadav <ptyadav@amazon.de>,
	=?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>,
	Richard Weinberger <richard@nod.at>,
	Rob Herring <robh+dt@kernel.org>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v6 1/3] dt-bindings: mtd: partitions: Add binman compatible
Date: Thu, 16 Nov 2023 10:28:50 -0700
Message-ID: <20231116172859.393744-1-sjg@chromium.org>
X-Mailer: git-send-email 2.43.0.rc0.421.g78406f8d94-goog
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231116_092907_056882_70BF12C1 
X-CRM114-Status: GOOD (  19.04  )
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

(no changes since v5)

Changes in v5:
- Add #address/size-cells and parternProperties
- Drop $ref to fixed-partitions.yaml
- Drop 'select: false'

Changes in v4:
- Change subject line

Changes in v3:
- Drop fixed-partition additional compatible string
- Drop fixed-partitions from the example
- Mention use of compatible instead of label

Changes in v2:
- Drop mention of 'enhanced features' in fixed-partitions.yaml
- Mention Binman input and output properties
- Use plain partition@xxx for the node name

 .../bindings/mtd/partitions/binman.yaml       | 68 +++++++++++++++++++
 .../bindings/mtd/partitions/partitions.yaml   |  1 +
 MAINTAINERS                                   |  5 ++
 3 files changed, 74 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mtd/partitions/binman.yaml

diff --git a/Documentation/devicetree/bindings/mtd/partitions/binman.yaml b/Documentation/devicetree/bindings/mtd/partitions/binman.yaml
new file mode 100644
index 000000000000..329217550a98
--- /dev/null
+++ b/Documentation/devicetree/bindings/mtd/partitions/binman.yaml
@@ -0,0 +1,68 @@
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
+description: |
+  The binman node provides a layout for firmware, used when packaging firmware
+  from multiple projects. It is based on fixed-partitions, with some
+  extensions, but uses 'compatible' to indicate the contents of the node, to
+  avoid perturbing or confusing existing installations which use 'label' for a
+  particular purpose.
+
+  Binman supports properties used as inputs to the firmware-packaging process,
+  such as those which control alignment of partitions. This binding addresses
+  these 'input' properties. For example, it is common for the 'reg' property
+  (an 'output' property) to be set by Binman, based on the alignment requested
+  in the input.
+
+  Once processing is complete, input properties have mostly served their
+  purpose, at least until the firmware is repacked later, e.g. due to a
+  firmware update. The 'fixed-partitions' binding should provide enough
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
+properties:
+  compatible:
+    const: binman
+
+  "#address-cells":
+    const: 1
+
+  "#size-cells":
+    const: 1
+
+patternProperties:
+  "^partition(-.+|@[0-9a-f]+)$":
+    $ref: partition.yaml
+
+additionalProperties: false
+
+examples:
+  - |
+    partitions {
+        compatible = "binman";
+        #address-cells = <1>;
+        #size-cells = <1>;
+
+        partition@100000 {
+            label = "u-boot";
+            reg = <0x100000 0xf00000>;
+        };
+    };
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
index b294edaf5698..8704eefe6e2a 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3550,6 +3550,11 @@ F:	Documentation/filesystems/bfs.rst
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
2.43.0.rc0.421.g78406f8d94-goog


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
