Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E85E0CD6136
	for <linux-mtd@archiver.kernel.org>; Mon,  9 Oct 2023 20:10:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=vqG4HYRbPmGa/lWVg8Uvi0MGEl8RAIlmYiDhhmjIa4M=; b=TcHTsiBMFqrowI
	1LbJtnAmneynU1COkvvD0Uh6RkTW/TokkwFZFMi2rHmgOAnjcXrdRlpBWGVTnlUD0qrsAEMyy8VTI
	uahXcvc8RxNAE4rxz49qJKKP5RBcHAKrtMqnfjHVv8UnlyuLBcftvz9Ml9dXEn6MjyvpNpBUwUGfO
	9vbem2kF8u9i13L2J1WQ33SuLVoGscr2UstTeXlD8fhj5CpSN+N2m5OvQDbHRoqmHoQJOne6Yx0kf
	4Zy8BnzgV7mRoJR+VIzh79isPwsZL0PSK/W/Tzb3W/7v8v76F0w6Q5yDEXAIGOg0vZPsXeK5MoT+S
	mJ+ELdVlt9kRyz+m1K3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qpwa2-00BY6R-2y;
	Mon, 09 Oct 2023 20:10:18 +0000
Received: from mail-io1-xd2f.google.com ([2607:f8b0:4864:20::d2f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qpwa0-00BY4q-02
	for linux-mtd@lists.infradead.org;
	Mon, 09 Oct 2023 20:10:17 +0000
Received: by mail-io1-xd2f.google.com with SMTP id ca18e2360f4ac-79fa2dbd793so227491039f.2
        for <linux-mtd@lists.infradead.org>; Mon, 09 Oct 2023 13:10:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1696882214; x=1697487014; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=lAmVpfxtEjWeqhBym/9INAYp/SD9oxrd9k5tq3qUHeQ=;
        b=FXdzHOREneiLeWoqbL8LW9BCBzN2a+yoCulKQkw9JxcC01ijW3jupZs0E8n8HGYoYh
         vLaPSxhEyqarYG1njKePkwioX4FFl4R65bMWQfPeHv4U6tq+/ldIysBG1upvB38a3mSN
         9j9YsPEWALDrDsY6QiIJvaVmod7c0bJ7vMhqg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696882214; x=1697487014;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lAmVpfxtEjWeqhBym/9INAYp/SD9oxrd9k5tq3qUHeQ=;
        b=tv+YlgohkgZyZ70770i6+fxa3rDoc6+JNhfjVBYYMs6Uckvvx0wumgmlN1LCY3bH+/
         9PfPphRz2gJ7AgZYAOl5HReLQYEF+TvNHak5YdOJj89BvYDl8jp1rimVKeVNTqSQkYfh
         yLTQguHkN30WveJ2Bi7WDn1r+IZU6In/NdxlF+a8QQTv88o+uV+dY8sAL5rXHZVwbWsd
         8S4tk1uli0UKJU9KlXaFEdwRLjpuylbduKX+uL8r1w/d/y31m/hD6JLxuSshuPlV9Jdd
         1eLdM+1ofVGoG4jGlvUZKxznUvxHgO2xqiYFyQGikc5o0Xg/H/vcu/xBnUNrFuYFHVIY
         pzsg==
X-Gm-Message-State: AOJu0YwzKfRT6UItlJVrQDe6yi3mgQz+hHS2DJSiLU1QgZJ+laRmfjsU
	LFH4R+rVwp/ufp19RM0ugCeIxTh27h+GFqexQ/c=
X-Google-Smtp-Source: AGHT+IEc78qKmsK3z3pBpfOOUCuOy8RtzjBD6hP1npQ7FM26pD8BJKzMdWruP1pUj+ATY1tOV0y9WQ==
X-Received: by 2002:a6b:f209:0:b0:79f:9574:b93c with SMTP id q9-20020a6bf209000000b0079f9574b93cmr16364103ioh.0.1696882214221;
        Mon, 09 Oct 2023 13:10:14 -0700 (PDT)
Received: from kea.bld.corp.google.com ([2620:15c:183:200:138c:cf57:c18d:20f5])
        by smtp.gmail.com with ESMTPSA id q21-20020a02a315000000b0042b2df337ccsm2215294jai.76.2023.10.09.13.10.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Oct 2023 13:10:13 -0700 (PDT)
From: Simon Glass <sjg@chromium.org>
To: devicetree@vger.kernel.org
Cc: U-Boot Mailing List <u-boot@lists.denx.de>,
	linux-mtd@lists.infradead.org,
	Michael Walle <mwalle@kernel.org>,
	Tom Rini <trini@konsulko.com>,
	Rob Herring <robh@kernel.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Simon Glass <sjg@chromium.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Dhruva Gole <d-gole@ti.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	=?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>,
	Richard Weinberger <richard@nod.at>,
	Rob Herring <robh+dt@kernel.org>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 1/3] dt-bindings: mtd: fixed-partitions: Add binman compatible
Date: Mon,  9 Oct 2023 14:09:59 -0600
Message-ID: <20231009201005.1964794-1-sjg@chromium.org>
X-Mailer: git-send-email 2.42.0.609.gbb76f46606-goog
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231009_131016_050875_DC3FA8D9 
X-CRM114-Status: GOOD (  19.44  )
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

Changes in v3:
- Drop fixed-partition additional compatible string
- Drop fixed-partitions from the example
- Mention use of compatible instead of label

Changes in v2:
- Drop mention of 'enhanced features' in fixed-partitions.yaml
- Mention Binman input and output properties
- Use plain partition@xxx for the node name

 .../bindings/mtd/partitions/binman.yaml       | 63 +++++++++++++++++++
 .../bindings/mtd/partitions/partitions.yaml   |  1 +
 MAINTAINERS                                   |  5 ++
 3 files changed, 69 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mtd/partitions/binman.yaml

diff --git a/Documentation/devicetree/bindings/mtd/partitions/binman.yaml b/Documentation/devicetree/bindings/mtd/partitions/binman.yaml
new file mode 100644
index 000000000000..7d6c8bd738f5
--- /dev/null
+++ b/Documentation/devicetree/bindings/mtd/partitions/binman.yaml
@@ -0,0 +1,63 @@
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
index c934244acc31..ebc8158fe67d 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3536,6 +3536,11 @@ F:	Documentation/filesystems/bfs.rst
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
2.42.0.609.gbb76f46606-goog


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
