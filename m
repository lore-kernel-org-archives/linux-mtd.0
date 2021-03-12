Return-Path: <SRS0=p7xI=IK=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.2 required=3.0 tests=BAYES_00,DATE_IN_PAST_06_12,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA4A5C433E0
	for <linux-mtd@archiver.kernel.org>; Fri, 12 Mar 2021 12:47:39 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9905D64F09
	for <linux-mtd@archiver.kernel.org>; Fri, 12 Mar 2021 12:47:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9905D64F09
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=wmx69nvy6ctVsvONppwHIo9hL+flQ4dO4UpkF5vvCiw=; b=OYuAxPU8jeBogYDTSvZiKhfNf
	50wzVj3FuLz7MyviZD0Tg0BVYe7AN4TpZCcs37TKdJriij030xW6M9MaqJZa7U+EAl9iXlxO4Nu7+
	9lm7cwcXxH43P3sqN+1zO/4zZHaYZz3Iyve4Tcn8QzazCz6GVDB2yxmAbDKdEtaXNf4Kp39uLQnar
	oxo6Hk2xUwyvFMWBbKY2ljK1wjSg515UDu13O95neJRwk+JATNewY8NLpJMhm12kiJNF4yToGLL/k
	iG4madztEkcNr5tMZIYtvgWc+HJdneUzDL+Zp0ZUxU1wgJClPtR1Ht6WEq0bx/owJp2svXKsC1K+V
	bbvDyV3RQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lKhBz-00BSCB-Cx; Fri, 12 Mar 2021 12:46:59 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lKh9m-00BS6x-6j
 for linux-mtd@lists.infradead.org; Fri, 12 Mar 2021 12:46:44 +0000
Received: by mail-wm1-x331.google.com with SMTP id
 t5-20020a1c77050000b029010e62cea9deso15090113wmi.0
 for <linux-mtd@lists.infradead.org>; Fri, 12 Mar 2021 04:44:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=lt9EofWzR4AT3/m5U04YrfxspMsTFMGL5r495U/zvWo=;
 b=QsaojiQnEaE9aLtszKXhSlDlbLDBDh9mM5uHsF8HNhqyYZrJIdLPfxAph5ggB1NkGe
 x1i6gCcwFt93mZAkjIlDfNc83M/BkMuE+KnYjDxpv5B0yd+YSTVA1R+NGYvAO0r09DyN
 OC3nYBqNP8JfWL3qJJaaMGduVGi4jGj2tgMdcyHS48xR7s6hR/tuaQRGZa+DHcHfLb83
 ori6W4T1gYN92WUl2O9u3v1/MsG+ia1uQ5COx7VLC3860v/pP55YIQw85Fx3EiMV6CLo
 LjwRGdCIXTBUnMuNFfYExBmvOLAbnz9Jw8eEtD2CVsgI1UQQsgpfYwZqgkvNzrXROhhA
 5CGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=lt9EofWzR4AT3/m5U04YrfxspMsTFMGL5r495U/zvWo=;
 b=SFh0Wu1bY1WdUXVP+RufogCoFnPXoXKWZgij34PBRY52Rdhy2rWHWyB5s50KXQ1gXH
 jH03V3TFQ3t9NpuyKgKqwomRKySoaLKw1BhS6Ob/tprgEOjunmIe6jDmGn9ssWQn+HY5
 fuekr8GRDCteEhMD3b4egFYUUpTgmwynjyiz9q5QWMtpycPkLkqxgFhqwjIr2AjIlLaR
 epyPpE+sap2USo1BMaHIJqpeSkU3E+iF/XuMk/Y3MIGjeMwCHIYOMqQDsaw1MJrfj6Pp
 sWEQrv5aRvipnKkbNhiU5J2G5PaRvAgGVQSTAYPRaFZvA2BQENSXdhNf/F2FjEitF+Xi
 1ZZA==
X-Gm-Message-State: AOAM532ABK507vH9eaCb2ATJc4TeeK8INRo+pEwB+iyHG2aNoQGcrpH1
 rGrJFbKA/xlV3So6uDRaxIE=
X-Google-Smtp-Source: ABdhPJwnt/w6O4Lr7dx7pjO+Q4z860JrbZ6+yPyLgp/QKamiikbunTensI3OL2gShE0DznO65X8rMg==
X-Received: by 2002:a7b:c209:: with SMTP id x9mr12916923wmi.92.1615553080415; 
 Fri, 12 Mar 2021 04:44:40 -0800 (PST)
Received: from Ansuel-xps.localdomain (93-35-189-2.ip56.fastwebnet.it.
 [93.35.189.2])
 by smtp.googlemail.com with ESMTPSA id 36sm8213414wrh.94.2021.03.12.04.44.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Mar 2021 04:44:40 -0800 (PST)
From: Ansuel Smith <ansuelsmth@gmail.com>
To: =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>
Cc: Ansuel Smith <ansuelsmth@gmail.com>, Rob Herring <robh@kernel.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Rob Herring <robh+dt@kernel.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 linux-mtd@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v7 3/3] dt-bindings: mtd: Document use of nvmem-cells
 compatible
Date: Fri, 12 Mar 2021 07:28:21 +0100
Message-Id: <20210312062830.20548-3-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210312062830.20548-1-ansuelsmth@gmail.com>
References: <20210312062830.20548-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210312_124642_547451_928D368E 
X-CRM114-Status: GOOD (  13.00  )
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
Reviewed-by: Rob Herring <robh@kernel.org>
---
 .../bindings/mtd/partitions/nvmem-cells.yaml  | 99 +++++++++++++++++++
 1 file changed, 99 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mtd/partitions/nvmem-cells.yaml

diff --git a/Documentation/devicetree/bindings/mtd/partitions/nvmem-cells.yaml b/Documentation/devicetree/bindings/mtd/partitions/nvmem-cells.yaml
new file mode 100644
index 000000000000..5cdd2efa9132
--- /dev/null
+++ b/Documentation/devicetree/bindings/mtd/partitions/nvmem-cells.yaml
@@ -0,0 +1,99 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/mtd/partitions/nvmem-cells.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Nvmem cells
+
+description: |
+  Any partition containing the compatible "nvmem-cells" will register as a
+  nvmem provider.
+  Each direct subnodes represents a nvmem cell following the nvmem binding.
+  Nvmem binding to declare nvmem-cells can be found in:
+  Documentation/devicetree/bindings/nvmem/nvmem.yaml
+
+maintainers:
+  - Ansuel Smith <ansuelsmth@gmail.com>
+
+allOf:
+  - $ref: /schemas/nvmem/nvmem.yaml#
+
+properties:
+  compatible:
+    const: nvmem-cells
+
+required:
+  - compatible
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
