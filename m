Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26C89C54E66
	for <linux-mtd@archiver.kernel.org>; Thu, 14 Mar 2024 02:18:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=0tedYH8f9a3QJ1nlBoJxcE+oAZfjT26fOV4ExHMkkZI=; b=RHEkZv3jcTnCbA
	Fl95tZYCSEgW0ZTdGxR5RxBVGicAU21TP5pmSadcRiAOHa0dznds+cgJcCegSwTBMS5jryvUl+Ifu
	L/4Coh7of45+At/BlELwy3b274VXx0INb+Mqcn5GxrAQbRoFBfGOMhbKfObAT9qkgQi6WDNYFRjf3
	QvxR1saXfD4lzqi9pJvy8P1Jnobo7dAQiUf+I5VYc/QWu7apu7znnJIcuT6P2Q4IYT9ljbBQb98rI
	ite63ehObLB9viTjOXv7ZCC8mslcnbENS9JgnVct5zYZzpWHHkcx9GFxn4iagbH8CgjW/cWLQRYSR
	J4O7KEbQ7nsrSt1FNdmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rkafd-0000000Cf5F-26YP;
	Thu, 14 Mar 2024 02:18:13 +0000
Received: from mail-pg1-x534.google.com ([2607:f8b0:4864:20::534])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rkafa-0000000Cf4f-0Usb
	for linux-mtd@lists.infradead.org;
	Thu, 14 Mar 2024 02:18:11 +0000
Received: by mail-pg1-x534.google.com with SMTP id 41be03b00d2f7-5dbcfa0eb5dso365619a12.3
        for <linux-mtd@lists.infradead.org>; Wed, 13 Mar 2024 19:18:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1710382688; x=1710987488; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=bw/+Z7r/txSTQl3/VBt2dWxefijuFQx/eWY4cCx1Vxc=;
        b=Qs2TetS5SL7xIg13mwE3hkVtDAVz5wbUsqTSlxbDvu/GnjPfEtJm8PB983ZVgLrhsZ
         48rRz0Rt1YbJPkeuFpjSVyxIKqW9MDzk5pkEwtCQZuM5AG6W4YFYAIClWFKdG2Zmiex2
         4qWK+OLIEoi3bMIlYcHxjvhw++X80a5DuE8wY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710382688; x=1710987488;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bw/+Z7r/txSTQl3/VBt2dWxefijuFQx/eWY4cCx1Vxc=;
        b=MfvdAGHlzivOSjVf3WWOjq5dc0e7Vk3s/ybd41mKT8aArIQMGTShTESlai/gxDgdan
         kN5+/GGF9m9PM9cLSAz1cRK7TzS+y3EfC5B5Nc11QT+l6241wgyY8ciEtLvLEzEKNsva
         PtYVsAN8lztKRotzlKcoq0coAIoQcPIBcoNsWsITyM+CQxHYHLD3zFiZiGGJjalL7hOh
         tPfbWLqdVaMjAscmRKwLc2Wn1FmOBvrAG8a0CT9LOwj0GWRPwY8lbXiKu/MIUIdmHeb6
         bXkPODTRDcU4tjjcuw9m6MnIWEGVXcPDrTvFWnlDXNSYGXxxvid0o4lOjoeeSj6R+ipP
         ph1w==
X-Forwarded-Encrypted: i=1; AJvYcCW0C3kf36MTiTYUPGzNqDLoNlhkshpE0k0t2yVXbvOE807g979rGirmIl8WBpAREMXiik4zuQNfLLaVJiULMu/KxiEFfm2a6ku3NfNqLw==
X-Gm-Message-State: AOJu0Yy/YrWpj2V/KKgFbM1gCvx/QLOeGzyHfi9C7H+/UmVm7QeeOgqD
	pMEz2Ak9Smi8c41P03k81DcCq3Az285tBlXqLi59Iq+iG8CDNrFf0lCZCU8TqQ==
X-Google-Smtp-Source: AGHT+IEGCQ0dir7xQW4xKnBdRv5fD3d9jdrPjgJZwAI2oEu7UpTxG2WSBqCuGmEu9uHnxxEjUnqRMw==
X-Received: by 2002:a17:90a:d18e:b0:29c:289b:1eb3 with SMTP id fu14-20020a17090ad18e00b0029c289b1eb3mr452033pjb.6.1710382688593;
        Wed, 13 Mar 2024 19:18:08 -0700 (PDT)
Received: from chromium.org ([118.149.82.233])
        by smtp.gmail.com with ESMTPSA id o1-20020a17090aac0100b0029bc25f7181sm1993937pjq.54.2024.03.13.19.18.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Mar 2024 19:18:08 -0700 (PDT)
From: Simon Glass <sjg@chromium.org>
To: devicetree@vger.kernel.org
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
	Michael Walle <mwalle@kernel.org>,
	Rob Herring <robh@kernel.org>,
	linux-mtd@lists.infradead.org,
	Simon Glass <sjg@chromium.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Richard Weinberger <richard@nod.at>,
	Rob Herring <robh+dt@kernel.org>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v7 1/2] dt-bindings: mtd: fixed-partition: Add binman compatibles
Date: Thu, 14 Mar 2024 15:17:53 +1300
Message-Id: <20240314021754.84557-1-sjg@chromium.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240313_191810_241034_4606E71F 
X-CRM114-Status: GOOD (  17.60  )
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
 MAINTAINERS                                   |  5 ++
 2 files changed, 54 insertions(+)
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
diff --git a/MAINTAINERS b/MAINTAINERS
index 1aabf1c15bb3..66f5e09e2d70 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3576,6 +3576,11 @@ F:	Documentation/filesystems/bfs.rst
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
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
