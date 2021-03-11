Return-Path: <SRS0=XuJY=IJ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.2 required=3.0 tests=BAYES_00,DATE_IN_PAST_06_12,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33278C433E0
	for <linux-mtd@archiver.kernel.org>; Thu, 11 Mar 2021 12:20:31 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A61DA64FD9
	for <linux-mtd@archiver.kernel.org>; Thu, 11 Mar 2021 12:20:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A61DA64FD9
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=PUGK27pkSRZltUTjkZlrcny6qjN+osWIzQzKsuCnkWY=; b=Q+Po7xdbK05V393evAKSoG/ky
	ibXwEZ9QhE/QrLKrmdoFQFn5+r5angWJDvcClvb4aSofyOKfTDjdqSjiI6hxUPTqsbIdT0ccPNTih
	jNoGLR1HRO/rsZsIFcZYY4tU09545cFE68ghRx9y23h8nSyU+sXyH+iFGUvP1lnNLw4FykD/l86LD
	J/T2TeVTRqDGuwz52yjnC5BUtUTgoCtDlGAzkLy3l2Zh/f18s9OYYyum7dUDSXWAJfMl5QH33tEJW
	8XvI+wlfvOvPcbgmcLeTnXRKC93xjWXnRsslueLZgOcbBz30pxSLugWF0zGReDW6AtrhZiZ8Qdr+k
	JWYezSRbA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lKKIL-0094PD-Km; Thu, 11 Mar 2021 12:20:01 +0000
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lKKIC-0094Nr-SX
 for linux-mtd@lists.infradead.org; Thu, 11 Mar 2021 12:19:57 +0000
Received: by mail-ej1-x634.google.com with SMTP id r17so45752033ejy.13
 for <linux-mtd@lists.infradead.org>; Thu, 11 Mar 2021 04:19:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=n5Nl3CoPrKUbvXcQoRdyX4Oe5Nctcc661QmqCsoFZxk=;
 b=W9/2O2W2Nzf/YibnD9+XfwhqgdaREhr9zRG72Y3zAUhUEh6lP1D9U+PYb8DNmuS0G3
 MYopY8QagwqMioK+oK3KXWjQnkY1q88kifVpq8RiM3t2gMI4JpeP/tAnybHUrrl8sspq
 Q5kUNkJhzMl4ZNPXwBTm42CRxUnhQGG+gEGeInvNNgw1Ic4zF+YGM4IY2OwlPyzYPmhi
 I+SIEQ84HvuaPJgcIHq1Dt9d6WIam0X3OG0HjRVMLb0JXbVFgwOn6TNYf2RwnoOWYwHZ
 +/tgI9g/BIU2JT4bBzrsvzbf3FSOwEF/dY2MN32hwPRW1pZK/WBYYYg5rCRkjN6ix0uu
 rfnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=n5Nl3CoPrKUbvXcQoRdyX4Oe5Nctcc661QmqCsoFZxk=;
 b=JQ3yal1hiyY12hAM0WAKjm0mIPP70W+Hi2bnBa3knjQvR+me+oYAIo/4zs8Zaqo4Pz
 DWDgwAwZ1W77AaZl1mMqbtDHlGnJRw30tA6xwOEZZ9dDhMi5Mw86DgyqjUYW5Mnh3Yz9
 sGuY5kSi3Ti7Vp1iICv96R2KOXqy75sAEufLEMEfs+J8FxjKPqLcn73QEeqIMS6BBTEV
 1kZ3DUGmHJOQSMr8BNTEDJHa7s19Kg2N7hSA96mRKdKVVW2y5imKrpjJtYJPnX28twMt
 ArCZDTDMf086J0k5mnEY5GtZsGgaGnXk8WAHOPGPU8rlLAqN85xKfcgpRwGGrSZ5ZBS9
 Jj7A==
X-Gm-Message-State: AOAM532dGY6R4+TiA0GUAsiLx+CMIYWDrqxj/umy+m+81R/35OTXusq7
 yl/7y0tWMzgZPUfDgLlC5+M=
X-Google-Smtp-Source: ABdhPJyNq7Hxm7thpemDAQbUMAcjYcqqmdPmwbm22NHsax+E614rEyqGn+G9L+erfG40fdN/jF21tQ==
X-Received: by 2002:a17:907:7684:: with SMTP id
 jv4mr2876710ejc.231.1615465192231; 
 Thu, 11 Mar 2021 04:19:52 -0800 (PST)
Received: from Ansuel-xps.localdomain (93-35-189-2.ip56.fastwebnet.it.
 [93.35.189.2])
 by smtp.googlemail.com with ESMTPSA id c7sm1273748edk.50.2021.03.11.04.19.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Mar 2021 04:19:51 -0800 (PST)
From: Ansuel Smith <ansuelsmth@gmail.com>
To: Rob Herring <robh@kernel.org>
Cc: Ansuel Smith <ansuelsmth@gmail.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Rob Herring <robh+dt@kernel.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 linux-mtd@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v5 2/3] dt-bindings: mtd: Document use of nvmem-cells
 compatible
Date: Thu, 11 Mar 2021 06:12:48 +0100
Message-Id: <20210311051309.16789-2-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210311051309.16789-1-ansuelsmth@gmail.com>
References: <20210311051309.16789-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210311_121952_976146_6B96270F 
X-CRM114-Status: GOOD (  13.41  )
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
 .../bindings/mtd/partitions/nvmem-cells.yaml  | 99 +++++++++++++++++++
 1 file changed, 99 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mtd/partitions/nvmem-cells.yaml

diff --git a/Documentation/devicetree/bindings/mtd/partitions/nvmem-cells.yaml b/Documentation/devicetree/bindings/mtd/partitions/nvmem-cells.yaml
new file mode 100644
index 000000000000..b53faf87d4e4
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
+  - $ref: "../../nvmem/nvmem.yaml#"
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
