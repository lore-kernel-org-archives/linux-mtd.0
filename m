Return-Path: <SRS0=h6Lp=II=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BAD29C433E6
	for <linux-mtd@archiver.kernel.org>; Wed, 10 Mar 2021 21:09:33 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 24C3264FC4
	for <linux-mtd@archiver.kernel.org>; Wed, 10 Mar 2021 21:09:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 24C3264FC4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=bBSBz3tPNFcd2f5C3UEFJ6HEx1jDcMxj+ZWABzOmY30=; b=HrXn468a/Kjc7SD4VXYedYb0a
	AJcW/pQXEfwPLE633W2ald1TWXDGJ7aH5EfxPCAWZCWAJxJOXB/g/qfwQxWD4OUIPVEfHokSTdnuR
	CHtoYysunc8yyPJ4Te3FFix2Z80y346nU35slgSyVMR/mbAY4e9bVq6A02pGNCv9JlrXnX9rAHLFV
	RRHsRmeKbUGo0mRPWeCa5Q0kC8V3t5IFryKdtha9bwO187A8cqVuoEnSwyl+dvM1FTJk6OD35a3tZ
	UqrwpdxyLwr6KjlCAe+k6xE6y8LCiDnHCfaI+SYNGAVuKVdagXc3aAfu61nXTALg+91CAd8xYblMo
	DNWZtkCNg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lK64I-007j3U-Ue; Wed, 10 Mar 2021 21:08:35 +0000
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lK646-007j1E-8L
 for linux-mtd@lists.infradead.org; Wed, 10 Mar 2021 21:08:24 +0000
Received: by mail-ej1-x62e.google.com with SMTP id lr13so41642117ejb.8
 for <linux-mtd@lists.infradead.org>; Wed, 10 Mar 2021 13:08:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=xFPq8+0A2tlhUqOfS/rUAsa/NrqBUr4EOZh4j7x/kE8=;
 b=JbnVyzZa1vdrvsdVaMOgex/cASkTjl1o4wSqdy14c7b1cs35dkpyoTqPxMe1iZ9xIW
 ozDMZGxem6kIz3SrNxj/XwIj6Oz+YQerhEm1fq7m2uOXwXBbePy7gZB5Yxoyd8/5/9Y9
 WRGJthxCeqLJNNJYOhHbxxt5qD19bXL7h17RbTDMGo8Mo3L0CGueOfFhhUYFmyidoSS0
 vpqpXTT4fLoH5li48+5BHthS0qw75PWV+te4UCj1EuPSODlJ6ezWXyMHEsIW8mq5XtIo
 TV1TMxDIxZrwx0/vXmU6Kfwkt2slS7+cD1JhxiY9CV68Ve4mFC15ddlmWkI4x/BiUrPz
 US1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=xFPq8+0A2tlhUqOfS/rUAsa/NrqBUr4EOZh4j7x/kE8=;
 b=steEr9+jXaFQpQcDHU21Oq5f2mJ3b3ybUdRYFngcmrQ2XYbmFvykz/8qupYUvOPKcu
 JHk/rQ+7i1xbYxjhIU80zdAfCwha3Ht2UE4Kbq9UAxks9GPOeOOQWpAL0DBJnUheROWy
 1+3SS7G4Fv+yCYDII9j/L23IeaDxF8BKK0chUsEdS2PWDubrC/nHiGmdgN1iN1jXL3pT
 dHYV2ByFnpSsLi4WgT05iUjQss3W6b58Xoh+YEyKIwTG5SeGuMh4RwSJ5vm5v5lD9J/g
 Fh7mzCyhjj32GKSOjnMob+jrjb0vGzXEIx4176gua+EKc+WHoTOzWL7TTS2WVnCxEMan
 rlDw==
X-Gm-Message-State: AOAM532NbS1XmdOrISlONP4dhEUVi0VedkxEhTzjz9busVZrjAVnoJvp
 nrGRAIgR3wFF9JbwPWWm23g=
X-Google-Smtp-Source: ABdhPJxMhxvqt2uc/XnQM5SDA5v8uHHMAXEtGaa7sBmASydWA4ifJqbigVy0BKUn8EKN7vpqd7KmOQ==
X-Received: by 2002:a17:906:688:: with SMTP id u8mr360665ejb.38.1615410501645; 
 Wed, 10 Mar 2021 13:08:21 -0800 (PST)
Received: from Ansuel-xps.localdomain (93-35-189-2.ip56.fastwebnet.it.
 [93.35.189.2])
 by smtp.googlemail.com with ESMTPSA id f19sm252947edu.12.2021.03.10.13.08.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Mar 2021 13:08:21 -0800 (PST)
From: Ansuel Smith <ansuelsmth@gmail.com>
To: Rob Herring <robh@kernel.org>
Cc: Ansuel Smith <ansuelsmth@gmail.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Rob Herring <robh+dt@kernel.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 linux-mtd@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v4 2/3] dt-bindings: mtd: Document use of nvmem-cells
 compatible
Date: Wed, 10 Mar 2021 22:08:02 +0100
Message-Id: <20210310210812.8880-2-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210310210812.8880-1-ansuelsmth@gmail.com>
References: <20210310210812.8880-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210310_210822_500202_A45D7B4A 
X-CRM114-Status: GOOD (  14.21  )
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
 .../bindings/mtd/partitions/nvmem-cells.yaml  | 96 +++++++++++++++++++
 1 file changed, 96 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mtd/partitions/nvmem-cells.yaml

diff --git a/Documentation/devicetree/bindings/mtd/partitions/nvmem-cells.yaml b/Documentation/devicetree/bindings/mtd/partitions/nvmem-cells.yaml
new file mode 100644
index 000000000000..f70d7597a6b0
--- /dev/null
+++ b/Documentation/devicetree/bindings/mtd/partitions/nvmem-cells.yaml
@@ -0,0 +1,96 @@
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
