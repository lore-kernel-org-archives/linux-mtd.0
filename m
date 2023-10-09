Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 827FCC2BA1B
	for <linux-mtd@archiver.kernel.org>; Mon,  9 Oct 2023 22:04:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=1XQ67HWgyFqnXw3DoBkSKFXOJFbZVTTg7YVSfhS2zpI=; b=KFmHrwyA6QkUy4
	Nvun/AXoXBkiQ1iBm4VuwXPC8GgP6MSZZBzxtKrlGW/VK9RqIg7RsAZCLJIGmu+rxT8xgwiZ+MigE
	s6UzszLrZPTkyN5WijDo30TJgdsT/lWlZhj4jyOxWW+rHWwbN+10iFlmvhbJNAyRmZkaxV9VzR9n1
	5gSgzPJwNX+ZXkgAQoCNerUfk86v8q41O+vqCbbhei72bicqXKFjMJ/4r8CkFuiC47qNjT8y4aZyb
	t5as0SYmt1AtRloB+XEjd5OZwC8nnCQPFpCRONJVL/JljXTgZkmG4TqF2j74fpIfeyl68UO1Mjx99
	3H5jbWuwYm3kvTUXzn/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qpyMn-00BiPH-1o;
	Mon, 09 Oct 2023 22:04:45 +0000
Received: from mail-il1-x136.google.com ([2607:f8b0:4864:20::136])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qpyMj-00BiN6-2d
	for linux-mtd@lists.infradead.org;
	Mon, 09 Oct 2023 22:04:43 +0000
Received: by mail-il1-x136.google.com with SMTP id e9e14a558f8ab-351574aca7bso16847375ab.3
        for <linux-mtd@lists.infradead.org>; Mon, 09 Oct 2023 15:04:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1696889080; x=1697493880; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Y9yY9Pt5Z+lcy2ZFBIazS1/xG4eT3Pf+M3kQNkzl3b8=;
        b=UW0FGc+4ZuEjxiSsPLCSpF0qk0CLvaBpbFNTAU3/NejULw4PHXRGjfwyTILooaN5S0
         xT0v5T76rXCAZXFKWxJP3h5Ex8EqWiHUdM7WPd+1yi8jcNMe2xvUwNGZeIt/QSMNOohJ
         zYnTGQTdGGnb5ECfK9ZDWyxZ03WTU9oeJtIfY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696889080; x=1697493880;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Y9yY9Pt5Z+lcy2ZFBIazS1/xG4eT3Pf+M3kQNkzl3b8=;
        b=ADHxPrlIXULYPw2GUvcTzKymcHMxsxTeRYjPWD/mWrX8BjALN8xLFzu+HK0JtQBNYL
         fMdi2A8f61YYNakEMaoOS+6bDPEqMYtTKkJSZ+XKlnouqHx1edNVIfE/p3s9MqLRL1zH
         egB4ICSMVdOdzHyiMo2lAf/4nbenB7opNLkznn1KiidcWQotAXSxkIpLIt7Bv78b4vEk
         GbJcC1lyOeeuuYVfvoE65k/22S/HfUUOqP+GwttfXddZrLHh56t+T6BK6Jm2IM64ggHN
         kNkSzBR13yp5/zg8SSXAaGalOpXPsDLDN5ueqF4O/IG/sbKn/Kne4KOQCp2FDrxTx/cW
         reGw==
X-Gm-Message-State: AOJu0YyJp2gaFcBU+dD0zPoVgTWY2lC+MRYJzm/PbFTHg4ensr+5gjKD
	oWTphaJ9PbMyOuXq/7dYt+2Dhw==
X-Google-Smtp-Source: AGHT+IHMwP21W95ioWGQ6VOzQP6LMsWXCq8+TyNwoBR7DWbu8eIaeSo0UsHUkY1Q1hFP6Dc4enAPYw==
X-Received: by 2002:a05:6e02:1a2e:b0:351:4f0c:b95d with SMTP id g14-20020a056e021a2e00b003514f0cb95dmr20621874ile.22.1696889079842;
        Mon, 09 Oct 2023 15:04:39 -0700 (PDT)
Received: from kea.bld.corp.google.com ([2620:15c:183:200:138c:cf57:c18d:20f5])
        by smtp.gmail.com with ESMTPSA id o3-20020a92d4c3000000b0034cd2c0afe8sm3164063ilm.56.2023.10.09.15.04.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Oct 2023 15:04:39 -0700 (PDT)
From: Simon Glass <sjg@chromium.org>
To: devicetree@vger.kernel.org
Cc: linux-mtd@lists.infradead.org,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Michael Walle <mwalle@kernel.org>,
	Rob Herring <robh@kernel.org>,
	U-Boot Mailing List <u-boot@lists.denx.de>,
	Tom Rini <trini@konsulko.com>,
	Simon Glass <sjg@chromium.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Dhruva Gole <d-gole@ti.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	=?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>,
	Richard Weinberger <richard@nod.at>,
	Rob Herring <robh+dt@kernel.org>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 1/3] dt-bindings: mtd: partitions: Add binman compatible
Date: Mon,  9 Oct 2023 16:04:13 -0600
Message-ID: <20231009220436.2164245-1-sjg@chromium.org>
X-Mailer: git-send-email 2.42.0.609.gbb76f46606-goog
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231009_150441_868759_C97EE82F 
X-CRM114-Status: GOOD (  19.20  )
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
