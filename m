Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B914C5ACB3
	for <linux-mtd@archiver.kernel.org>; Thu, 16 Nov 2023 17:29:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QB6fIql0e1sQzMuG/Pb8ANiDVVg/yCsRP4DJXuYKtyE=; b=ebDCrd15TnBfOf
	GYyZZkIILIQeOngteJHQ8yiZ/lJbrgQw15vcXehBaQh6b/+GqZA0MkA1Gc50Rn7wJuTs0u6Bf9XDz
	XLrf5GQcASRURDTQXgYVdaqxaIwFtre760ifKRyA4sJ0UZRJWqUZ3uN0lPXs3QF6dNF2b1wv1zi4e
	ayzndiPYzj4sm71XU6bp+9PdqQSMspMcnv4lShX3Gu3LCff3SONvDO+0NP3bJQFib5fLi+BpN77wV
	9fABVpLBKtzeLU0pmzHcXs3xGyJ2SW+w4C2WL22VXETLDaV1DaswyfRruKPHytb4JB+XaHkIvo2kQ
	F6J7KfEiaFE/DL67r/6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r3gAx-0048Fb-2i;
	Thu, 16 Nov 2023 17:29:11 +0000
Received: from mail-il1-x136.google.com ([2607:f8b0:4864:20::136])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r3gAt-0048D6-1E
	for linux-mtd@lists.infradead.org;
	Thu, 16 Nov 2023 17:29:10 +0000
Received: by mail-il1-x136.google.com with SMTP id e9e14a558f8ab-35aa6107e9fso4086145ab.0
        for <linux-mtd@lists.infradead.org>; Thu, 16 Nov 2023 09:29:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1700155745; x=1700760545; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5SiGKNWTogg5s8I4hI4hsWN1in2XeMZfNUWjSe8vt1c=;
        b=cDUZB1Z+HpMm8wobqjoHgxODqvWPGkRpO0qEMhIe7KkmyOT+yegMma2TWdjE/EmXdX
         qB234/WQNYC9oApRr8P5iOGLeBqRQQR9nqB5Q2etVb4NvHuW21JYCWJhNJiKz8JLwKT1
         TKCvsVrF4K+VNZFmEWxkc6y2+xFxDlUCJ4dbM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700155745; x=1700760545;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5SiGKNWTogg5s8I4hI4hsWN1in2XeMZfNUWjSe8vt1c=;
        b=DZ8ma7CAwyjkikMlfGaJ8trTL0GUEgsiJDzqg6i40PLxZwqUy4Oh8DGqxpNzU0bhir
         azmzA9DH3/9j7qTe/pfc5nMtfjgD6IspAw2rqaxARclji+IR22rKAtYDWZLgspmTWXPk
         lu/3wmwx7TuTyHNAAGGziWbwnTW87bgyjRGmPxTzs1SCwywqro7/zwtFw+Uce0DxCkpZ
         1ZUmvNQvdnzadFdNJcZmunLZbiWD9qMUxim2HTfKV62LqGfqAO7DdA407XlNkUWg9444
         CMRzoRnNsVGUY+uobS/IASes+eRNh05t+F2ZDmas7k8MGz6pGTX4T9ds5wLBvFOBSWpW
         hejQ==
X-Gm-Message-State: AOJu0YwYrDn4B+d02j1iPQmtdi7ORkj694Yt/gl1dvPPJxys+c1IIh8x
	FkOXhQyTdMV/2QuoIkjBCLqT8A==
X-Google-Smtp-Source: AGHT+IGaQokizqpcI2eRtxwCmzms3L1z6RJ8KYtnH3CEjTb902LoLcNtEnVdFaWX+2iO6b6M/mjAaA==
X-Received: by 2002:a05:6e02:1c07:b0:359:5b5c:9ce4 with SMTP id l7-20020a056e021c0700b003595b5c9ce4mr22860439ilh.19.1700155745274;
        Thu, 16 Nov 2023 09:29:05 -0800 (PST)
Received: from sjg1.lan (c-73-14-173-85.hsd1.co.comcast.net. [73.14.173.85])
        by smtp.gmail.com with ESMTPSA id o8-20020a056e02092800b0035ab8cc4a4bsm1914348ilt.17.2023.11.16.09.29.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Nov 2023 09:29:05 -0800 (PST)
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
	Richard Weinberger <richard@nod.at>,
	Rob Herring <robh+dt@kernel.org>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v6 2/3] dt-bindings: mtd: binman-partition: Add binman compatibles
Date: Thu, 16 Nov 2023 10:28:51 -0700
Message-ID: <20231116172859.393744-2-sjg@chromium.org>
X-Mailer: git-send-email 2.43.0.rc0.421.g78406f8d94-goog
In-Reply-To: <20231116172859.393744-1-sjg@chromium.org>
References: <20231116172859.393744-1-sjg@chromium.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231116_092907_413567_77BE65B1 
X-CRM114-Status: GOOD (  17.41  )
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
2.43.0.rc0.421.g78406f8d94-goog


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
