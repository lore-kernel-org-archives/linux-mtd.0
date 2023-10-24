Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FFE1C07545
	for <linux-mtd@archiver.kernel.org>; Tue, 24 Oct 2023 21:41:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ufx+AaIo2oLXYBHuh2DDGin12Z4LPADak90jVINbgGk=; b=fhThF2QgXcsY0P
	1Snlpex8l+ABGs8y1D6f+jEaOI0oqTOE1udDduP0r3qEhzou78aOWcV0yWtFkKO3kVjGOz6ZyeSjm
	2bRTMtYR5Sxw9eHIV4aX/AncUOYqeDrM09egNVE58qGiRUa7VjfBBIvDz1SBFwwg5YGoSqllIRq/B
	FLylnIwSqPIgITCEsSEduAplPIwYtkYbw+TMjyeOq3l3Wie13bufcY59AzhotdIdaCvmSEw0j4wyq
	jie6gYUJ6kGj6h47daSrggxZR4eXzN7Qx29+iU/tXvEM9/NV3AEe2AeSy66Y2lD2TtBqwT2G/S9kg
	PV9Q094vnf5XtWN+/WHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qvP9M-00Att0-26;
	Tue, 24 Oct 2023 21:41:20 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qvP9J-00Ats2-2d
	for linux-mtd@lists.infradead.org;
	Tue, 24 Oct 2023 21:41:19 +0000
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-1cace3e142eso31597815ad.3
        for <linux-mtd@lists.infradead.org>; Tue, 24 Oct 2023 14:41:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1698183677; x=1698788477; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Qlj3Zfises7r0D8qFU0FTbLuXsSPwTC7ghoEI6cXzzE=;
        b=Lib/9N4kqJ06tQz9lidvoV7nb8b25ierYTnAvhYIwiRzPGslxU5Van6tt4N92m9fmQ
         Xmg1/l4NKRdfzw4YhuaeC4B6jniIEbuqnT0Y6Ji7tMfZkffYpqKm3Y49ncjeFfzGYu/I
         f+xCZSd+9WXU9kAIjSGyVCiUae2fzEMtv6RpQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698183677; x=1698788477;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Qlj3Zfises7r0D8qFU0FTbLuXsSPwTC7ghoEI6cXzzE=;
        b=EVk4LOnUws13YWZkMXGcZwzl+fFxdVyHnMKzk0bVOdu104NGdalR/pGR+TkYqv+5r2
         iybb+i1fB3sjbonBcCwStihbyIPwF9gNwGmFFKiOp+nIPJhozE5aVsD3VVsAk/0THMB+
         7rMpG2eQaTljBtlDuyrVprpBCryw+wTl2ge2xkPASLmI+jSZqRH94P3K3lHYVgUKQstM
         xRPvA9StmsjxeQowHkr7pf8JugN6kNIVyjxjgvbNpKKnVSm1M1Pw2VC9Rkzf9lJg6TRT
         0B5SHA0P4lh7Hnqgmqlz8dnJLJt3fc/ERLbUkxluCux6lOq9Pi+Ne71BDpk+78Yuj5cD
         2H9g==
X-Gm-Message-State: AOJu0YwCUDySpHq+zwTQhkHRxZqq3lY7zN85I+xyo4IvSxswuAZN+PMC
	+31pu4b8sIjvoeTLIKb1k++oNg==
X-Google-Smtp-Source: AGHT+IGxvWj9Xsu3pRzsZTnMyZCtBlY1xbUa07gBVG2GR0HjQ/NJi+InpJB7d3yeYs2gM51dcxBfDg==
X-Received: by 2002:a17:902:c215:b0:1c7:3558:721a with SMTP id 21-20020a170902c21500b001c73558721amr10294915pll.58.1698183677103;
        Tue, 24 Oct 2023 14:41:17 -0700 (PDT)
Received: from sjg1.roam.corp.google.com ([202.144.206.130])
        by smtp.gmail.com with ESMTPSA id 18-20020a170902c21200b001c5f7e06256sm7861055pll.152.2023.10.24.14.41.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Oct 2023 14:41:16 -0700 (PDT)
From: Simon Glass <sjg@chromium.org>
To: devicetree@vger.kernel.org
Cc: linux-mtd@lists.infradead.org,
	U-Boot Mailing List <u-boot@lists.denx.de>,
	Michael Walle <mwalle@kernel.org>,
	Tom Rini <trini@konsulko.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Rob Herring <robh@kernel.org>,
	Simon Glass <sjg@chromium.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Richard Weinberger <richard@nod.at>,
	Rob Herring <robh+dt@kernel.org>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v5 2/3] dt-bindings: mtd: binman-partition: Add binman compatibles
Date: Wed, 25 Oct 2023 10:39:17 +1300
Message-ID: <20231024213940.3590507-2-sjg@chromium.org>
X-Mailer: git-send-email 2.42.0.758.gaed0368e0e-goog
In-Reply-To: <20231024213940.3590507-1-sjg@chromium.org>
References: <20231024213940.3590507-1-sjg@chromium.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231024_144117_854977_8975FB44 
X-CRM114-Status: GOOD (  17.43  )
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

 .../mtd/partitions/binman-partition.yaml      | 50 +++++++++++++++++++
 1 file changed, 50 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mtd/partitions/binman-partition.yaml

diff --git a/Documentation/devicetree/bindings/mtd/partitions/binman-partition.yaml b/Documentation/devicetree/bindings/mtd/partitions/binman-partition.yaml
new file mode 100644
index 00000000000000..37a413464b0ce5
--- /dev/null
+++ b/Documentation/devicetree/bindings/mtd/partitions/binman-partition.yaml
@@ -0,0 +1,50 @@
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
+    - enum:
+        - binman,entry # generic binman entry
+        - u-boot       # u-boot.bin from U-Boot project
+        - tfa-bl31     # bl31.bin or bl31.elf from TF-A project
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
