Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20BD6E81A60
	for <linux-mtd@archiver.kernel.org>; Fri, 22 Sep 2023 19:34:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=8EZyhuvj6t8/0iSDErf7JXCkd7pGHup+BXYRqh5yNZ8=; b=r5W3d6NybnX1or
	5mNZtsgCfjurYIj9IDvP9Z9UB5lCciBiTZxQqeY2bFAmQChu3v9uDImijxsydE/8Etmg1R+Xp2nKW
	Z+nZK9qMGgWP4/7uy3nbn4quxijt8TWSDb8RQRlSuI+znSJedZhu7fc1H/T2wAXtQVVXl6HoZJTZo
	/80Iezm5NiL0ES/PziBtpH3xfGXQU/sXkjmnc3Oj1YaLeSYTjOUMk9AF4oAGF0+bua2nToUHvzET2
	ID+OEhs5mfN9z1zJ3Di+wZePDuq6lTedLjt5cTpO1eam1TUg5fBmJ9jrBz5UqFuruKz0luyRitnbF
	k9tdCrxtT+cpBokhHA4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qjlv8-009igl-2N;
	Fri, 22 Sep 2023 19:34:34 +0000
Received: from mail-io1-xd36.google.com ([2607:f8b0:4864:20::d36])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qjlv4-009ifq-3D
	for linux-mtd@lists.infradead.org;
	Fri, 22 Sep 2023 19:34:33 +0000
Received: by mail-io1-xd36.google.com with SMTP id ca18e2360f4ac-792717ef3c9so103860539f.3
        for <linux-mtd@lists.infradead.org>; Fri, 22 Sep 2023 12:34:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1695411267; x=1696016067; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Ze0feaJyolx52nnGDHZNRW/aGemuWEpJCRuOORda2U0=;
        b=Xkt3brSh5//fptgCtlQjenXl8jYmvA/PB1pH3FckNz/+/vp7wX7+16o0XX7PQe2y2P
         L9YmODvnLTffr1P9PDOEWqvU0EANptSzjGwkx11TKwe3Kt7QeK2M9rPdRzsI+NOtO3Wi
         89IqPrWrD5Bb1L7XymkkUQaY6WAMD2DAzXcOU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695411267; x=1696016067;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ze0feaJyolx52nnGDHZNRW/aGemuWEpJCRuOORda2U0=;
        b=uuAXFulwOaGTTJePxXGhTo++NRANwwy+FqTZ935Y/1WXmTGhkWcvhFp8D0HYVVTw8x
         a4wagaef+L4n/u+Vgr88Uw2v1CJ7rwAfNkQZgDOqz9LPgQmupmXl/spS99iCqpzaGZeO
         5cO0Nl4zrEBRDPNBYihQt6GUMRUgP0t/kyhBW6eswp0VCcbgvb0gYE4UTdoGA6178KBh
         aIUG8G4k3tKtKovdsS0lecw2X4BlPaKrbPNe2WGUtSL+1LpC5Ouht6jcffxNNx2YZWLs
         tua5ad7eXr+MYTZgMQgulkW6hZkfOzDbkN5HHFVNGrVt1pW8l1tHm4EdqSrFi5tXnqX1
         AM2Q==
X-Gm-Message-State: AOJu0YxmbUPouBz1Gs2IUvaCNcXPjJaEY9BbeYyxZ3R+EMK/RWirj1lH
	wXQs3WtqqICag3Bs7V9lUxUgWg==
X-Google-Smtp-Source: AGHT+IGxZot43frUtwqoFHunoT9jM8YXOXehO/Ug9V1olGsIhmVx1qXPa4/rswQ+JFb2BcqsJkZNgQ==
X-Received: by 2002:a5d:930b:0:b0:790:f866:d717 with SMTP id l11-20020a5d930b000000b00790f866d717mr342505ion.10.1695411266990;
        Fri, 22 Sep 2023 12:34:26 -0700 (PDT)
Received: from kea.bld.corp.google.com ([2620:15c:183:200:9fd8:298f:4748:f9a])
        by smtp.gmail.com with ESMTPSA id b18-20020a029a12000000b0042b1297468esm1149594jal.51.2023.09.22.12.34.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Sep 2023 12:34:26 -0700 (PDT)
From: Simon Glass <sjg@chromium.org>
To: devicetree@vger.kernel.org
Cc: Tom Rini <trini@konsulko.com>,
	linux-mtd@lists.infradead.org,
	U-Boot Mailing List <u-boot@lists.denx.de>,
	Rob Herring <robh@kernel.org>,
	Simon Glass <sjg@chromium.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Dhruva Gole <d-gole@ti.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Nick Terrell <terrelln@fb.com>,
	Pratyush Yadav <ptyadav@amazon.de>,
	=?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>,
	Richard Weinberger <richard@nod.at>,
	Rob Herring <robh+dt@kernel.org>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] dt-bindings: mtd: Add a schema for binman
Date: Fri, 22 Sep 2023 13:34:15 -0600
Message-ID: <20230922193417.1697379-1-sjg@chromium.org>
X-Mailer: git-send-email 2.42.0.515.g380fc7ccd1-goog
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230922_123431_487209_412E1411 
X-CRM114-Status: GOOD (  21.56  )
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

Binman[1] is a tool for creating firmware images. It allows you to
combine various binaries and place them in an output file.

Binman uses a DT schema to describe an image, in enough detail that
it can be automatically built from component parts, disassembled,
replaced, listed, etc.

Images are typically stored in flash, which is why this binding is
targeted at mtd. Previous discussion is at [2] [3].

This is only a starting point, an attempt to align on the best way to
add this to the schema.

[1] https://u-boot.readthedocs.io/en/stable/develop/package/binman.html
[2] https://lore.kernel.org/u-boot/20230821180220.2724080-3-sjg@chromium.org/
[3] https://www.spinics.net/lists/devicetree/msg626149.html

Signed-off-by: Simon Glass <sjg@chromium.org>
---

Changes in v2:
- Use "binman" for compatible instead of "u-boot,binman"
- Significantly rework the patch
- Use make dt_binding_check DT_SCHEMA_FILES=Documentation/../partitions

 .../bindings/mtd/partitions/binman.yaml       | 59 ++++++++++++++++++
 .../mtd/partitions/binman/atf-bl31.yaml       | 43 +++++++++++++
 .../bindings/mtd/partitions/binman/entry.yaml | 62 +++++++++++++++++++
 .../mtd/partitions/binman/u-boot.yaml         | 43 +++++++++++++
 .../bindings/mtd/partitions/partitions.yaml   |  1 +
 MAINTAINERS                                   |  5 ++
 6 files changed, 213 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mtd/partitions/binman.yaml
 create mode 100644 Documentation/devicetree/bindings/mtd/partitions/binman/atf-bl31.yaml
 create mode 100644 Documentation/devicetree/bindings/mtd/partitions/binman/entry.yaml
 create mode 100644 Documentation/devicetree/bindings/mtd/partitions/binman/u-boot.yaml

diff --git a/Documentation/devicetree/bindings/mtd/partitions/binman.yaml b/Documentation/devicetree/bindings/mtd/partitions/binman.yaml
new file mode 100644
index 000000000000..31accab37055
--- /dev/null
+++ b/Documentation/devicetree/bindings/mtd/partitions/binman.yaml
@@ -0,0 +1,59 @@
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
+  from multiple projects. For now it just supports a very simple set of
+  features, as a starting point for discussion.
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
+  reg:
+    description: partition's offset and size within the flash
+    maxItems: 1
+
+  compatible:
+    const: binman
+
+  "#address-cells":
+    enum: [ 1, 2 ]
+
+  "#size-cells":
+    enum: [ 1, 2 ]
+
+required:
+  - compatible
+
+additionalProperties: false
+
+examples:
+  - |
+    binman {
+        compatible = "binman";
+        #address-cells = <1>;
+        #size-cells = <1>;
+
+        partition@100000 {
+            compatible = "brcm,bcm4908-firmware";
+            reg = <0x100000 0xf00000>;
+        };
+    };
diff --git a/Documentation/devicetree/bindings/mtd/partitions/binman/atf-bl31.yaml b/Documentation/devicetree/bindings/mtd/partitions/binman/atf-bl31.yaml
new file mode 100644
index 000000000000..7d28e7e1d01d
--- /dev/null
+++ b/Documentation/devicetree/bindings/mtd/partitions/binman/atf-bl31.yaml
@@ -0,0 +1,43 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+# Copyright 2023 Google LLC
+
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/mtd/partitions/binman/atf-bl31.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: ARM Trusted Firmware BL31
+
+maintainers:
+  - Simon Glass <sjg@chromium.org>
+
+description:
+  Holds a BL31 binary file from the ARM Trusted Firmware project.
+
+allOf:
+  - $ref: entry.yaml#
+
+properties:
+  compatible:
+    const: binman,atf-bl31
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    binman {
+        compatible = "binman";
+        #address-cells = <1>;
+        #size-cells = <1>;
+
+        partition@0 {
+            reg = <0x0 0xa0000>;
+            compatible = "binman,entry";
+        };
+
+        partition@100000 {
+            reg = <0x100000 0x200000>;
+            compatible = "binman,atf-bl31";
+            compression = "lz4";
+        };
+    };
diff --git a/Documentation/devicetree/bindings/mtd/partitions/binman/entry.yaml b/Documentation/devicetree/bindings/mtd/partitions/binman/entry.yaml
new file mode 100644
index 000000000000..9991c83aa0cf
--- /dev/null
+++ b/Documentation/devicetree/bindings/mtd/partitions/binman/entry.yaml
@@ -0,0 +1,62 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+# Copyright 2023 Google LLC
+
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/mtd/partitions/binman/entry.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Binman entry
+
+maintainers:
+  - Simon Glass <sjg@chromium.org>
+
+description: |
+  This node specifies a single, generic entry in the firmware.
+
+  Entries have a specific type, indicated by the compatible string.
+
+properties:
+  reg:
+    description: partition's offset and size within the flash
+    maxItems: 1
+
+  compression:
+    $ref: /schemas/types.yaml#/definitions/string
+    description:
+      Compression algorithm to use, chosen from a list of well-known algorithms.
+      The contents are compressed using this algorithm.
+
+    enum:
+      - none
+      - bzip2
+      - gzip
+      - lzop
+      - lz4
+      - lzma
+      - xz
+      - zstd
+
+required:
+  - compatible
+
+additionalProperties: true
+
+examples:
+  - |
+    binman {
+        compatible = "binman";
+        #address-cells = <1>;
+        #size-cells = <1>;
+
+        partition@0 {
+            reg = <0x0 0xa0000>;
+            compatible = "binman,entry";
+        };
+
+        partition@100000 {
+            reg = <0x100000 0x200000>;
+            compatible = "binman,entry";
+            compression = "lz4";
+        };
+    };
diff --git a/Documentation/devicetree/bindings/mtd/partitions/binman/u-boot.yaml b/Documentation/devicetree/bindings/mtd/partitions/binman/u-boot.yaml
new file mode 100644
index 000000000000..e5f3583f746c
--- /dev/null
+++ b/Documentation/devicetree/bindings/mtd/partitions/binman/u-boot.yaml
@@ -0,0 +1,43 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+# Copyright 2023 Google LLC
+
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/mtd/partitions/binman/u-boot.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: U-Boot
+
+maintainers:
+  - Simon Glass <sjg@chromium.org>
+
+description:
+  Holds a binary file (u-boot.bin) from the U-Boot project.
+
+allOf:
+  - $ref: entry.yaml#
+
+properties:
+  compatible:
+    const: binman,u-boot
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    binman {
+        compatible = "binman";
+        #address-cells = <1>;
+        #size-cells = <1>;
+
+        partition@0 {
+            reg = <0x0 0xa0000>;
+            compatible = "binman,u-boot";
+        };
+
+        partition@100000 {
+            reg = <0x100000 0x200000>;
+            compatible = "binman,atf-bl31";
+            compression = "lz4";
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
index a4c30221eb30..ebcbfb4292e8 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3505,6 +3505,11 @@ F:	Documentation/filesystems/bfs.rst
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
2.42.0.515.g380fc7ccd1-goog


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
