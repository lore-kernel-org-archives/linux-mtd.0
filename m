Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BCA6C54E58
	for <linux-mtd@archiver.kernel.org>; Fri, 15 Mar 2024 20:45:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hUoUOlQwTGrpXR3BjfNKuHgA8N61TW8N4hIb2EmBAMM=; b=0FWQZiud20CAJ1
	hT0LKp6PwCzLWkaWdYzEc/xGwIrVvrUVFLyXf5rT+wlXZX1PBxAt7O/58lF4z2YMwB6N6hXa8VFkg
	lxYh+Hhp14MOdt67JFyxP3q6W6pAyMNxv9nbiH5cxlbS4RumvJxzlX0bAO7ajEYuVPmosYBGEeR1P
	zJpPSqAY/lPbGNcBbJ/j0GygzSR3Rsg1bjAdJMdmSQEjLliUe56EyNg5YvCLIp2OlTOz+rDAOGoTf
	TFQ/TsKd74767stVEHdmot3b0K9pf3e11tC3N52BBZUFDZpzfhyXKOLouXcpeOXE5QcUvcY66bG0Q
	OweRtyCu3V12zEGx+JnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rlER2-00000001Wf9-1PHX;
	Fri, 15 Mar 2024 20:45:48 +0000
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rlEQw-00000001Wbc-2ID6
	for linux-mtd@lists.infradead.org;
	Fri, 15 Mar 2024 20:45:46 +0000
Received: by mail-pj1-x1035.google.com with SMTP id 98e67ed59e1d1-29e0a1fd9a7so348520a91.2
        for <linux-mtd@lists.infradead.org>; Fri, 15 Mar 2024 13:45:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1710535537; x=1711140337; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5f3g6jt+SPPkTn9q3kiXsClKs8YsDQB9FBPsmFWqzL8=;
        b=CesvNCn9PGzZvSTC6PlikAsAO8s0NeDFgCWC/QgclMp1XtQluqTRz+mNgR/M/AZizg
         dWfTMDosIvY2JDyOfpTjhqoTLweX0cEMHTGOUtKGnDKswLrbxmUPtLIvlPu419rDal+Z
         UYVZqASyaZsaXRYLKzpCLd92rVvSKslPlSAA8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710535537; x=1711140337;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5f3g6jt+SPPkTn9q3kiXsClKs8YsDQB9FBPsmFWqzL8=;
        b=cKQgelOla2clWb5PC59GUNKn620SEOtFMl8+D0c9Zko+nA5q/BN0slbzKVjKfSLbgK
         9q6CTwVWU8d1pn5rQ3FMNmUk8lgKuJLqJEgP0urbVUirQIulwkgN/caolrA3zi6Tx0yF
         89w2XE+0VKZXYdYKEPydPVdr+gswuCwxJpHEiRI6gebX+5az+6fFqesvWjWdE9kO+iha
         j2/zBUjNkA8tDTDeqISKYVpKmB6db6Jzj0u3GVXdAAz9DlAul+/+azBEPGqOQs5oJcNv
         sOP6LJRVQYFHyTnge3TmW7ZsLWgRc99yOl3feAaPttJhh0nnfhu+tHKEWJckY1/KzrTV
         JwPA==
X-Gm-Message-State: AOJu0YxQS+jIBlVKTx1OFqnWaN5lvHZMESRYgQj1Z0mgV74BgiSIVT2b
	No+iOWm1ZeuzNOzMT5Tx2pp5elwwFpcZrSmVJ8Zl33oR5/kEjT5E/CLozjMZhA==
X-Google-Smtp-Source: AGHT+IG/MP/COIzylJY9BIgpwRYj+RjYQJGtY4FHk+hzIe5y+OmnhKRTDa2xdvlEOYm87TA6ZLifnw==
X-Received: by 2002:a17:90b:215:b0:29b:347f:23ea with SMTP id fy21-20020a17090b021500b0029b347f23eamr5423371pjb.3.1710535537628;
        Fri, 15 Mar 2024 13:45:37 -0700 (PDT)
Received: from chromium.org ([202.144.206.254])
        by smtp.gmail.com with ESMTPSA id iq3-20020a17090afb4300b0029bb8ebdc23sm3400516pjb.37.2024.03.15.13.45.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Mar 2024 13:45:37 -0700 (PDT)
From: Simon Glass <sjg@chromium.org>
To: devicetree@vger.kernel.org
Cc: linux-mtd@lists.infradead.org,
	Michael Walle <mwalle@kernel.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Rob Herring <robh@kernel.org>,
	Simon Glass <sjg@chromium.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v8 2/2] dt-bindings: mtd: fixed-partition: Add binman compatibles
Date: Sat, 16 Mar 2024 09:45:21 +1300
Message-Id: <20240315204521.28613-2-sjg@chromium.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240315204521.28613-1-sjg@chromium.org>
References: <20240315204521.28613-1-sjg@chromium.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240315_134542_616571_0DC80767 
X-CRM114-Status: GOOD (  18.84  )
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
