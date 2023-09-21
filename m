Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 900EDE7D0A2
	for <linux-mtd@archiver.kernel.org>; Thu, 21 Sep 2023 18:45:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=GPI2R+2UiihWAan7MICAlnFIpKQuOMhcTOVt1lGuV1U=; b=iWF7HnNnnMJ4RT
	SUiYC3VhQo+TIAaR8IVWoy7yqMHcggrKkHEFxBei5Z+AvbsESHsBTwq0DGlBJgmfnAcl6mc7pf0i3
	TqoT3YOXbiRDj4usaFvmNBahJqVMoT/YEx9DLx1+xaxR6vUMHjLrjmh/Dby/jAUip8OrUgZHBLVXZ
	O/zwskP+B2aoeJKUxgQPZke+HPlLKOyUO+0Hp2xnd14njERIFiGFMbmECQfSnm6vRUCzOlE48dKta
	stfQU9XnX3vZCcwHoLVAqd4TE7iyWc8ySgCvUVRM7d+Rl1DAx2jul9Asuq0vDQcG6tIHGLnVLTSvw
	BelWDto1d6mUTMaZSQtg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qjOg5-006qwV-2d;
	Thu, 21 Sep 2023 18:45:29 +0000
Received: from mail-io1-xd34.google.com ([2607:f8b0:4864:20::d34])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qjOg2-006qvT-1R
	for linux-mtd@lists.infradead.org;
	Thu, 21 Sep 2023 18:45:28 +0000
Received: by mail-io1-xd34.google.com with SMTP id ca18e2360f4ac-792979d4cb5so52561339f.2
        for <linux-mtd@lists.infradead.org>; Thu, 21 Sep 2023 11:45:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1695321925; x=1695926725; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=DnKiy3ihwgd/VOoqSanohGN5ffhK+cZ/VpjdYKJUjf8=;
        b=YaVAkSt9NDht5icfgsSkb7PmBx+a3IxuEBvYlt0ryJ+vB5I4PHNTj9zOmhDZgYbPet
         q6VCXwiA0Q57Pm6lzdJgtKLCVtIWY5aZwjm4hnvAJW1Ir593K8haFZr8iZzuatDUJ9nN
         /dgTTOp/d0qvMKMh6g9QR9EUI9i7Oa9+uI9Lo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695321925; x=1695926725;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DnKiy3ihwgd/VOoqSanohGN5ffhK+cZ/VpjdYKJUjf8=;
        b=tWRCcxGnmXUYDMsx/Q0K+jir6TMC7Z3KsdVs1OEGiwhQvkGwTPAcwAPIKO0L7ZGbut
         PY0FzHiczTQlxtHdOGTIC96lFsWDUoEhwDG9liqpSypIlSa7iLLHJVXUJHWn/lbKSQ0X
         fZcok4SRSxfvrOytL4DjWgglHgnwHSU0AtbvY4ZpmL0goxeHw4EPQhVXnWMac/hHhI+m
         AJTFbMjFVfc6hGxWmZPUGcPdnxwCF9yVDbQ1Gs3I7IEp03g9OMWWnYGU9pgKT1+JH7nt
         DuPCd5D2oZBQEcesLfksd0MHFkMsvBGE0qefJ4bUca0/kUMxDpRD6YLxOKdgkhfdV2oG
         eIGA==
X-Gm-Message-State: AOJu0YyufsXfP8Ir2l3N51BQsC9wc+004zZxVnsTQts4eNxHWBI7x4sG
	0btR4SvDeJEE7dKWxqyQY9mlyg==
X-Google-Smtp-Source: AGHT+IFLx+QxNqVoEsIFpwCXXYW/u8hYUS5LzSu0VrhuBFkVi/scOpz5E7kCyC+9y88eBDeWXVQ/9A==
X-Received: by 2002:a6b:7303:0:b0:787:34d:f223 with SMTP id e3-20020a6b7303000000b00787034df223mr7074088ioh.11.1695321924839;
        Thu, 21 Sep 2023 11:45:24 -0700 (PDT)
Received: from kea.bld.corp.google.com ([2620:15c:183:200:a636:e615:ea83:bc42])
        by smtp.gmail.com with ESMTPSA id d26-20020a02a49a000000b004290fd3a68dsm511017jam.1.2023.09.21.11.45.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Sep 2023 11:45:24 -0700 (PDT)
From: Simon Glass <sjg@chromium.org>
To: devicetree@vger.kernel.org
Cc: U-Boot Mailing List <u-boot@lists.denx.de>,
	linux-mtd@lists.infradead.org,
	Tom Rini <trini@konsulko.com>,
	Rob Herring <robh@kernel.org>,
	Simon Glass <sjg@chromium.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Dhruva Gole <d-gole@ti.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	=?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>,
	Richard Weinberger <richard@nod.at>,
	Rob Herring <robh+dt@kernel.org>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH] dt-bindings: mtd: Add a schema for binman
Date: Thu, 21 Sep 2023 12:45:14 -0600
Message-ID: <20230921124459.1.I91ddcfacf9b234af5cc3eabea4b62edb31153317@changeid>
X-Mailer: git-send-email 2.42.0.515.g380fc7ccd1-goog
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230921_114526_519408_9BADE06A 
X-CRM114-Status: GOOD (  23.89  )
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

[1] https://u-boot.readthedocs.io/en/stable/develop/package/binman.html
[2] https://lore.kernel.org/u-boot/20230821180220.2724080-3-sjg@chromium.org/
[3] https://www.spinics.net/lists/devicetree/msg626149.html

Signed-off-by: Simon Glass <sjg@chromium.org>
---

 .../bindings/mtd/partitions/binman.yaml       | 50 +++++++++++++++
 .../bindings/mtd/partitions/binman/entry.yaml | 61 +++++++++++++++++++
 .../bindings/mtd/partitions/partitions.yaml   |  1 +
 MAINTAINERS                                   |  5 ++
 4 files changed, 117 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mtd/partitions/binman.yaml
 create mode 100644 Documentation/devicetree/bindings/mtd/partitions/binman/entry.yaml

diff --git a/Documentation/devicetree/bindings/mtd/partitions/binman.yaml b/Documentation/devicetree/bindings/mtd/partitions/binman.yaml
new file mode 100644
index 00000000000000..c792d5a37b700a
--- /dev/null
+++ b/Documentation/devicetree/bindings/mtd/partitions/binman.yaml
@@ -0,0 +1,50 @@
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
+  compatible:
+    const: u-boot,binman
+
+required:
+  - compatible
+
+additionalProperties: false
+
+examples:
+  - |
+    firmware {
+      binman {
+        compatible = "u-boot,binman";
+
+        u-boot {
+          size = <0xa0000>;
+        };
+
+        atf-bl31 {
+          offset = <0x100000>;
+        };
+      };
+    };
diff --git a/Documentation/devicetree/bindings/mtd/partitions/binman/entry.yaml b/Documentation/devicetree/bindings/mtd/partitions/binman/entry.yaml
new file mode 100644
index 00000000000000..8003eb4f1a994f
--- /dev/null
+++ b/Documentation/devicetree/bindings/mtd/partitions/binman/entry.yaml
@@ -0,0 +1,61 @@
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
+  The entry node specifies a single entry in the firmware.
+
+  Entries have a specific type, such as "u-boot" or "atf-bl31". If the type
+  is missing, the name is used as the type.
+
+  Note: This definition is intended to be hierarchical, so that entries can
+  appear in other entries. Schema for that is TBD.
+
+properties:
+  $nodename:
+    pattern: "^[-a-z]+(-[0-9]+)?$"
+
+  type:
+    $ref: /schemas/types.yaml#/definitions/string
+
+  offset:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: |
+      Provides the offset of this entry from the start of its parent section.
+      If this is omitted, Binman will determine this by packing the enclosing
+      section according to alignment rules, etc.
+
+  size:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: |
+      Provides the size of this entry in bytes. If this is omitted, Binman will
+      use the content size, along with any alignment information, to determine
+      the size of the entry.
+
+additionalProperties: false
+
+examples:
+  - |
+    firmware {
+      binman {
+        compatible = "u-boot,binman";
+
+        u-boot {
+          size = <0xa0000>;
+        };
+
+        second-area {
+          type = "atf-bl31";
+          offset = <0x100000>;
+        };
+      };
+    };
diff --git a/Documentation/devicetree/bindings/mtd/partitions/partitions.yaml b/Documentation/devicetree/bindings/mtd/partitions/partitions.yaml
index 1dda2c80747bd7..849fd15d085ccc 100644
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
index a4c30221eb305d..ebcbfb4292e8dc 100644
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
