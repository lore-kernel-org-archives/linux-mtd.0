Return-Path: <SRS0=qOpI=IG=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,DATE_IN_PAST_12_24,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA45CC433DB
	for <linux-mtd@archiver.kernel.org>; Mon,  8 Mar 2021 20:29:31 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 93C9365272
	for <linux-mtd@archiver.kernel.org>; Mon,  8 Mar 2021 20:29:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 93C9365272
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=D7xBjMARVldfq+S3PRcy6qEwnNJ1LbvY5jY1Ndk/Dlw=; b=k1y4uKOl7a1962Hr8VPWvcEDj
	WqyEztY04oo5iVEL3Dnv1DGkO0ODrsQFoBzd4UjHDx+9Q94GLSYDryTWnAc0VHasmKbffx+6GUovh
	Tfc2TsFwNVl3B+CitPXzA9Gawc8SpKlh7oPXaKkcmT+ts5uEPcGwbZEYCzvLJM1QukKUYtc2Ij6Ft
	M+QaUUgs/9klxg0Cay7EUQvSXJ6oTVu4h6Zrv+waVxKsH4tuTknEa9l8Y9Yt6FWIq7T/iQzuUXEuw
	Slvyeexr7ej8t/345jto+rT/lum0YZcpmOoc3mi3kJov1sKQnnaWt/8X8+0PIDlCZAE40fINtDnnz
	AJfjREIjw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lJMUh-002d6K-VQ; Mon, 08 Mar 2021 20:28:48 +0000
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lJMUH-002cps-Go
 for linux-mtd@lists.infradead.org; Mon, 08 Mar 2021 20:28:26 +0000
Received: by mail-ed1-x535.google.com with SMTP id l12so16711061edt.3
 for <linux-mtd@lists.infradead.org>; Mon, 08 Mar 2021 12:28:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=4Kh1Yf0VUjHQBBvxfg+IVIKi9UzkPdTDrtNGt4KOZsA=;
 b=pX/jKQXq2KdZr6MxLZFdppzNbSjSWsDyKMqTg8/TTNtvdfg7uqVolMffJkFaM7vcCR
 RL23RdyFQDJ5DJ1r/83TjYlZRTXhdKnhl+RMJ0j93RqhkoSM9akBU4AUwkzD806pHcI8
 aMirWvpLhYkClsn90LJNelZ4PO4Y8t9NvDmE1VVAjUTZ1uKy0NTs2VKpM/mE6hOzOHwi
 g/koRMh/Scml/NgKEGnw0ML2Mf2Dof1acym4qpNYXlG7xNHI2LlsJGw+z7KMkT4E2C/T
 n+QIYIHCw29M961Nqd2Q07oCOunN5pme+KbTtePzc+9aPTEQzHqZ/ztq3VB83qgPD/Ux
 HQ9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=4Kh1Yf0VUjHQBBvxfg+IVIKi9UzkPdTDrtNGt4KOZsA=;
 b=ULdcoxfxUwR9OKHMbxhrapX3seaBW7B6u2e4YvT4ngrXSk09ZI/QXDNLrILRzKjoyn
 Z9Gza2rZG/s7Bvo27bVPCdGP7ovl7dHDWXJsHJetpahI7CYze94yrj3WB1q4AhdvTvlX
 RgZuvqh/iGNFTOfyqtan9vVX4kcQkXdlwatxf28kFeyx4NmYSQOivjdX5TnyWvH8mra9
 UwMieasSr1aoYzpEwo/SlnbjAxBOs+HKJJSRDUU6br/5xeu0dvkKR0a1TNsfkIq0gnDk
 jdMgKXzEZ28zVdP8tza5TDpEYVtMXn8NR7ec58zsuUpgGiWASr76H9ob3KYB43wioq+V
 AZNg==
X-Gm-Message-State: AOAM532U3aZ6j7izS1VE92uNEJ/o4CHW+QLp4MNypVKFmcF8vx3qr8TX
 31Pu2zq3KdlMERIy23H0P+k=
X-Google-Smtp-Source: ABdhPJxxBg+X+ceW5D5Oo+KaGTqXQGnXUZJV6FOhnhF3Zo9R6+859iebxZ4ynklhihJlq8vTXn5DaA==
X-Received: by 2002:a50:e14d:: with SMTP id i13mr388479edl.106.1615235300732; 
 Mon, 08 Mar 2021 12:28:20 -0800 (PST)
Received: from Ansuel-xps.localdomain
 (host-95-247-48-130.retail.telecomitalia.it. [95.247.48.130])
 by smtp.googlemail.com with ESMTPSA id c18sm7624483edu.20.2021.03.08.12.28.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Mar 2021 12:28:20 -0800 (PST)
From: Ansuel Smith <ansuelsmth@gmail.com>
To: Vignesh Raghavendra <vigneshr@ti.com>
Cc: Ansuel Smith <ansuelsmth@gmail.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Rob Herring <robh+dt@kernel.org>,
 linux-mtd@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v3 2/2] dt-bindings: mtd: Document use of nvmem-cells
 compatible
Date: Mon,  8 Mar 2021 02:18:45 +0100
Message-Id: <20210308011853.19360-2-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210308011853.19360-1-ansuelsmth@gmail.com>
References: <20210308011853.19360-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210308_202821_925259_6AF78B73 
X-CRM114-Status: GOOD (  14.98  )
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

Document nvmem-cells compatible used to treat mtd partitions as a
nvmem provider.

Signed-off-by: Ansuel Smith <ansuelsmth@gmail.com>
---
 .../bindings/mtd/partitions/nvmem-cells.yaml  | 105 ++++++++++++++++++
 1 file changed, 105 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mtd/partitions/nvmem-cells.yaml

diff --git a/Documentation/devicetree/bindings/mtd/partitions/nvmem-cells.yaml b/Documentation/devicetree/bindings/mtd/partitions/nvmem-cells.yaml
new file mode 100644
index 000000000000..4ed246b27985
--- /dev/null
+++ b/Documentation/devicetree/bindings/mtd/partitions/nvmem-cells.yaml
@@ -0,0 +1,105 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/mtd/partitions/nvmem-cells.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Nvmem cells
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
+    const: nvmem-cells
+
+  "#address-cells": true
+
+  "#size-cells": true
+
+  reg:
+    description: partition offset and size within the flash
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
+        compatible = "nvmem-cells";
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
+            compatible = "nvmem-cells";
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
