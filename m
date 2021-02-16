Return-Path: <SRS0=UIyM=HS=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9B64C433DB
	for <linux-mtd@archiver.kernel.org>; Tue, 16 Feb 2021 19:57:43 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 95CF364E79
	for <linux-mtd@archiver.kernel.org>; Tue, 16 Feb 2021 19:57:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 95CF364E79
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=4qd/bueucKxX6b3NIcV8SvKfWRKIByPFiztH/uLa5gg=; b=g4D9A7ylBW0GTnrXEla86F1ap
	pD3QySQW9ZoqBzLYrTRsuv4HB1nsAhLFOpK72yJXzXor0/syqjUQDgSb3HmVMklnn6SKH2drVc2Ij
	KudxoIo5d2KxfSn0QmTSfsz+mfTFfFyd4vJuSQ58qDJmQBVJCQ8hvlONnfNQtJPzkPrGmakziQCp+
	K5Lxo06qm/4JQv75Bfo4jHwa+b+6L0zeJ5G9M2J7+aWLHZHeO9nBJvxIoKydxjKL3s6Rw2V+rthaw
	BJEWcOtodhprNqEFWvsgcV31ggKMzoHJikTqDojdRPWTBnRdCFfF+ettJVph0vaL7knj/7+PNrk2j
	fT3Ct39dA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1lC6Sq-0006Ym-A9; Tue, 16 Feb 2021 19:56:52 +0000
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1lC6Sl-0006Y0-Tw
 for linux-mtd@lists.infradead.org; Tue, 16 Feb 2021 19:56:49 +0000
Received: by mail-ed1-x52f.google.com with SMTP id v9so9408507edw.8
 for <linux-mtd@lists.infradead.org>; Tue, 16 Feb 2021 11:56:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=B+rzS0sRv0J3BMSreb/SAsip/5NpGgjcUC0WZfb9UMo=;
 b=P829sFMk/HWVFCWbkQIJU/89lQDZeC45HCHpcn9LsGhhvULh0Rc8y5ABYl2SNV1+c+
 v1DyM6QoHi4WKWeTdxZDhcipCVlUrUt5PLqwc9Iq/ZsWOTNLL3GuAdXw4Yxe/fiQIKZ5
 MpRAQpj66M2vXLc5FrNEYppq+8Pgdr+JtQsID7fVfQqTRDkAfOifeU5gH7ViTt5FRk3o
 PINFRppuVBcSVy6xTiTgfTESUakptpbgK4x+Fq/ggWFawDmpqkMQDohBfuGuPXtDhtxI
 t+g+HQwu0/F5odB0Mkj7T1abe8Go2xl+84IIRqtrOUzZ15YzlbB5kGvs9csejtNAx17r
 es9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=B+rzS0sRv0J3BMSreb/SAsip/5NpGgjcUC0WZfb9UMo=;
 b=tXCT1uorCl3scLRSq49T0n7en2GJQpfXGYr3Q2XEiHL6eACKOOKY4qz049OccoxutE
 MXwyYE2q87yOjpyI5bBF8FY6p0/Jhwhki8lcL5ynrJ17mkiadSB7fC8X3OaDcIAsKDVK
 TOby8o07Gtxevjf8GWV+8/u2hLWO6cMRWACoff3obDtT1MeHzxZmGkWRu80z0kGLFjD2
 DkX2Ye0fvgN2D5xlkqaW2pTxb/0ehjWOfQOnRUhagRxP6cl4YzrDnmumxTY/MWdBl6Oj
 8C3V8i7MWROapZsflupCyDpKH67pyxuebUcsxcaL/q4xySK9ZvAadD4jEZHitofzj+OZ
 HGbw==
X-Gm-Message-State: AOAM532cGTTwLvjAqPtZ7gu9bVljQ5crcP1UB/12Ml0SqML5aabfg+RS
 xT/ryoOPuAsYIAOt+caz6jM=
X-Google-Smtp-Source: ABdhPJxSU1ROjWCus6NqmtJLmIujUXHamSni+RhVcPcKr6gQPFjIzIAsjejgqQwMC97UpYq4eB/bwg==
X-Received: by 2002:a05:6402:3494:: with SMTP id
 v20mr23442045edc.146.1613505406562; 
 Tue, 16 Feb 2021 11:56:46 -0800 (PST)
Received: from Ansuel-xps.localdomain
 (host-87-6-252-11.retail.telecomitalia.it. [87.6.252.11])
 by smtp.googlemail.com with ESMTPSA id rh22sm963332ejb.105.2021.02.16.11.56.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Feb 2021 11:56:46 -0800 (PST)
From: Ansuel Smith <ansuelsmth@gmail.com>
To: Richard Weinberger <richard@nod.at>
Subject: [PATCH 3/3] dt-bindings: mtd: Document use of nvmem-partitions
 compatible
Date: Tue, 16 Feb 2021 20:56:11 +0100
Message-Id: <20210216195618.27959-4-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210216195618.27959-1-ansuelsmth@gmail.com>
References: <20210216195618.27959-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210216_145647_999455_A0F025EA 
X-CRM114-Status: GOOD (  15.35  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: devicetree@vger.kernel.org, Vignesh Raghavendra <vigneshr@ti.com>,
 Boris Brezillon <bbrezillon@kernel.org>, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, linux-mtd@lists.infradead.org,
 Miquel Raynal <miquel.raynal@bootlin.com>, Ansuel Smith <ansuelsmth@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Document nvmem-partitions compatible used to treat mtd partitions as a
nvmem provider.

Signed-off-by: Ansuel Smith <ansuelsmth@gmail.com>
---
 .../mtd/partitions/nvmem-partitions.yaml      | 105 ++++++++++++++++++
 1 file changed, 105 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mtd/partitions/nvmem-partitions.yaml

diff --git a/Documentation/devicetree/bindings/mtd/partitions/nvmem-partitions.yaml b/Documentation/devicetree/bindings/mtd/partitions/nvmem-partitions.yaml
new file mode 100644
index 000000000000..1ff283febcaa
--- /dev/null
+++ b/Documentation/devicetree/bindings/mtd/partitions/nvmem-partitions.yaml
@@ -0,0 +1,105 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/mtd/partitions/nvmem-partitions.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Nvmem partitions
+
+description: |
+  This binding can be used to treat the specific partition as a nvmem provider.
+  Each direct subnodes represents the nvmem cells and won't be parsed as fixed-partitions.
+  Fixed-partitions bindings described in fixed-partitions.yaml apply to the nvmem provider node.
+
+maintainers:
+  - Ansuel Smith <ansuelsmth@gmail.com>
+
+properties:
+  compatible:
+    const: nvmem-partitions
+
+  "#address-cells": true
+
+  "#size-cells": true
+
+  reg:
+    description: partition's offset and size within the flash
+    maxItems: 1
+
+required:
+  - compatible
+  - "#address-cells"
+  - "#size-cells"
+  - reg
+
+additionalProperties: true
+
+examples:
+  - |
+    partitions {
+      compatible = "fixed-partitions";
+      #address-cells = <1>;
+      #size-cells = <1>;
+
+      /* ... */
+
+      };
+      art: art@1200000 {
+        compatible = "nvmem-partitions";
+        reg = <0x1200000 0x0140000>;
+        label = "art";
+        read-only;
+        #address-cells = <1>;
+        #size-cells = <1>;
+
+        macaddr_gmac1: macaddr_gmac1@0 {
+          reg = <0x0 0x6>;
+        };
+
+        macaddr_gmac2: macaddr_gmac2@6 {
+          reg = <0x6 0x6>;
+        };
+
+        pre_cal_24g: pre_cal_24g@1000 {
+          reg = <0x1000 0x2f20>;
+        };
+
+        pre_cal_5g: pre_cal_5g@5000{
+          reg = <0x5000 0x2f20>;
+        };
+      };
+  - |
+    partitions {
+        compatible = "fixed-partitions";
+        #address-cells = <1>;
+        #size-cells = <1>;
+
+        partition@0 {
+            label = "bootloader";
+            reg = <0x000000 0x100000>;
+            read-only;
+        };
+
+        firmware@100000 {
+            compatible = "brcm,trx";
+            label = "firmware";
+            reg = <0x100000 0xe00000>;
+        };
+
+        calibration@f00000 {
+            compatible = "nvmem-partitions";
+            label = "calibration";
+            reg = <0xf00000 0x100000>;
+            ranges = <0 0xf00000 0x100000>;
+            #address-cells = <1>;
+            #size-cells = <1>;
+
+            wifi0@0 {
+                reg = <0x000000 0x080000>;
+            };
+
+            wifi1@80000 {
+                reg = <0x080000 0x080000>;
+            };
+        };
+    };
-- 
2.30.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
