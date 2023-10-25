Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3DF5C0032E
	for <linux-mtd@archiver.kernel.org>; Wed, 25 Oct 2023 21:07:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=N5h0Q8/eKBQpgwx3CdnucgNdCcuf7z1LfP3qeCKlXto=; b=UbQ5aqM3ArqkJ3
	Anx72llW8sfEzVgXsf2dxM4hNXR3QOqGWiRmpoOH2BdgJbzTUAmofXYwG24ZNi/moChMQDI1Ymha9
	jbFusgi9Xz9nySFvE0/4QCdeQIf+ZU3R4uPeIXJyCRmnRo6RRZS8Hgbm1Zg+wjuW/AuluKwgUVydA
	IK9Ahzbk/RRvKQfuJM5nf2/8t7ll/qETKY098gR0L3+LxsiC42AQABP0Nil7DynS3hO4jzkN/PK73
	5FJmf9sR0arBHQv2Izb8qao8cUwGJxpWvGFMCgXUYwIaEQ3tTlxNiLzXzBkAeA1cd5+wp+lMBMN5Q
	S2lrK8UsP8FNPIcjtiwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qvl5f-00D8yj-2A;
	Wed, 25 Oct 2023 21:06:59 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qvl5c-00D8wh-3D
	for linux-mtd@lists.infradead.org;
	Wed, 25 Oct 2023 21:06:58 +0000
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-1ca816f868fso1037985ad.1
        for <linux-mtd@lists.infradead.org>; Wed, 25 Oct 2023 14:06:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1698268013; x=1698872813; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pF/ordmyMYgWe1Uu/l3iCAlozeYeU+RXukpZaUtD30Y=;
        b=jK6e/QEPtaqfX+fdmbQeZV9VKUXf866P5DfyXgkxZPeWn4gHNoN6CfT3cBCoduiWMJ
         KykluDShgLzFSvpn2vWiq6ezUuhAqegcAKhPy31F7KgB/2C75vg+oEquiLekYhb1W7SW
         j0/vaYgtN/8L1JMHB87vL2fNE41lNQk/QXFnQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698268013; x=1698872813;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pF/ordmyMYgWe1Uu/l3iCAlozeYeU+RXukpZaUtD30Y=;
        b=m5UW0lnJNpKkYu9NDESGbdHT5qT7B8b7+3/eaFpSRZymN3upg22Gm9JNzOls0SL1WW
         TNGWgLflUotFw1od7Elzsex+joETboLkGiSGkZs7g7Jwt3edKGjPwZnOrX5+bWi19xsi
         rhbEr0hFjYQAaphpE6HT4h6Z4/BPiGNjQSeZioVqYqsn64STk4x778/NKdugyWx+vxtG
         Ak2lAUGiypDa0pq7dr8rHoJZpXJOkVvEHp9ys712kABhAIa6cLB/FYJcWUydLZVSlecQ
         5JAMl3RGRLxyt2Bs59EpfP4tTCJvnltc7v9N5gZqZ3vMk5CiJA2z6AGr7NO1Djw719k3
         xlTQ==
X-Gm-Message-State: AOJu0Yx/K8IhvdBY0p4j/wyPEy0lO+f+FWoQwhSUnmFb7Zn7gMO+5wNN
	A/jKbEeQClRfZBLMNOdiplOFhQ==
X-Google-Smtp-Source: AGHT+IEYJE06QosRYGT0A1ENbZcTTEfgZ/obEURE1Bi+knZeZm3lfZ+35MZQ58edxdw31TbPoPLpDg==
X-Received: by 2002:a17:903:2342:b0:1c9:dff6:58f2 with SMTP id c2-20020a170903234200b001c9dff658f2mr16108624plh.59.1698268013528;
        Wed, 25 Oct 2023 14:06:53 -0700 (PDT)
Received: from sjg1.roam.corp.google.com ([202.144.206.130])
        by smtp.gmail.com with ESMTPSA id ix4-20020a170902f80400b001bc5dc0cd75sm9689447plb.180.2023.10.25.14.06.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Oct 2023 14:06:53 -0700 (PDT)
From: Simon Glass <sjg@chromium.org>
To: devicetree@vger.kernel.org
Cc: Michael Walle <mwalle@kernel.org>,
	U-Boot Mailing List <u-boot@lists.denx.de>,
	Tom Rini <trini@konsulko.com>,
	Rob Herring <robh@kernel.org>,
	linux-mtd@lists.infradead.org,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Simon Glass <sjg@chromium.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Richard Weinberger <richard@nod.at>,
	Rob Herring <robh+dt@kernel.org>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v6 2/3] dt-bindings: mtd: binman-partition: Add binman compatibles
Date: Thu, 26 Oct 2023 10:06:11 +1300
Message-ID: <20231025210616.3201502-2-sjg@chromium.org>
X-Mailer: git-send-email 2.42.0.758.gaed0368e0e-goog
In-Reply-To: <20231025210616.3201502-1-sjg@chromium.org>
References: <20231025210616.3201502-1-sjg@chromium.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231025_140657_031971_6529BB3F 
X-CRM114-Status: GOOD (  18.14  )
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

Add two compatible for binman entries, as a starting point for the
schema.

Note that, after discussion on v2, we decided to keep the existing
meaning of label so as not to require changes to existing userspace
software when moving to use binman nodes to specify the firmware
layout.

Signed-off-by: Simon Glass <sjg@chromium.org>
---

(no changes since v5)

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

 .../mtd/partitions/binman-partition.yaml      | 54 +++++++++++++++++++
 1 file changed, 54 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mtd/partitions/binman-partition.yaml

diff --git a/Documentation/devicetree/bindings/mtd/partitions/binman-partition.yaml b/Documentation/devicetree/bindings/mtd/partitions/binman-partition.yaml
new file mode 100644
index 000000000000..83222ac9aa78
--- /dev/null
+++ b/Documentation/devicetree/bindings/mtd/partitions/binman-partition.yaml
@@ -0,0 +1,54 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+# Copyright 2023 Google LLC
+
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/mtd/partitions/binman-partition.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Binman partition
+
+maintainers:
+  - Simon Glass <sjg@chromium.org>
+
+description: |
+  This corresponds to a binman 'entry'. It is a single partition which holds
+  data of a defined type.
+
+  The vendor is specified as binman since there are quite a number
+  of binman-specific entry types, such as section, fill and files,
+  to be added later.
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
+  reg:
+    minItems: 1
+    maxItems: 2
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
+            compatible = "u-boot";
+            reg = <0x100000 0xf00000>;
+        };
+
+        partition@200000 {
+            compatible = "tfa-bl31";
+            reg = <0x200000 0x100000>;
+        };
+    };
-- 
2.42.0.758.gaed0368e0e-goog


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
