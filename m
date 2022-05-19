Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FC2CC433EF
	for <linux-mtd@archiver.kernel.org>; Thu, 19 May 2022 19:01:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rhcyscWLmITqD80ZtAzplf0zggcCIN1u0X/XWAUCuC4=; b=eP7VEhH5qdCYUI
	58LYzCjvEgvZkzMyo1UO4GCp9j887XTKcuwSkaynqsnZU3Mfh39w2pugtCueXkr31fdrDhPIwD0t5
	CLuf+DO1aenV+Lvbnc7ySqKES17Ku/II7a3+8JKl/zwiCVoBQXwyHolfXSQf2Tc2+2Fhj4hctIa13
	dXW+nGTSNdP+dyPYXHPc5p5/Qtt23MbOE6P0gVFugriuAt/PRDVdkEBUtX6NfA1oF7o/qXMijBwzu
	ierk+9RXVLxnGsgyyrZC9bNrnyO8WOOs4A7EJ+lLZfz33grUw7Gu7AEM/pSOxoibMcobvXoJKIP1s
	a7ux7R3vJgCrGKIWknJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nrlP4-0093Yx-SC; Thu, 19 May 2022 19:01:43 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nrlOs-0093RA-HF
 for linux-mtd@lists.infradead.org; Thu, 19 May 2022 19:01:32 +0000
Received: by mail-wm1-x332.google.com with SMTP id n6so3403163wms.0
 for <linux-mtd@lists.infradead.org>; Thu, 19 May 2022 12:01:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=iFLnLP7/OEuz4wdRDIn1ORAc4gGIzikzoEkwYYDgvJg=;
 b=pEKTjR6x27IA9qHOPQmR8lGbD+qmD1MFFfvO5Fo2WxWCMdjGvVNsnGfhtxeJcJwavw
 2Jz75TW+zFV8/MyE+XkuDCk7JgfbjfYB1AJpPOKrtIvURmna+8dfDA39Vl3zlLuGJ1tu
 JITeyYoywHsvh0ZvySVoVcT3K6evGfCgd9unj85iqx9Hy3xNA9muKVgOxiF3qiKngM0R
 hBbQEn+BU8I1fOOxTxaTeYNoi/XU/ZkZ6sm21AJ+HepoxwlOW8BGoeU1T04FROIesBYw
 eaafM4qQsE/o6eXy8FpLrQib86NqfEDu0mFlKe6Jci0UWjYPEiFo+DpcU+CX2d9NZ4rc
 zjqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=iFLnLP7/OEuz4wdRDIn1ORAc4gGIzikzoEkwYYDgvJg=;
 b=hhjrCogOTO+r27vmIj20+GDdRMXl7tOejHnpOPkjV8YugI/cs7jDanVgyPojg3sigd
 +Mdz6fyRzl/UBVb+kHOHcDloJZhBRVh2ehKI29t3z7BcZlcVUF24PtBmi5pQQ7FgqLD7
 AbSSrVrfJMvCzhLMWbAHD1DgZBKFcTyaHMNGCF7bOJT/xnNcwIk8jbFDIfGqA06boH7B
 S2IRQITJu4w+382VrTkDkoS+xknGIDuGYpILzOIy+sZRELHbKZFYLBWvpBPpVM/7UUfB
 xeV9/V1I8bkFRVu7keXWp6UIq98jxfnRvm0TTVW0mHEJkmydo1dBJpxroZ2dmasaeGfx
 jCqw==
X-Gm-Message-State: AOAM530P9Te7ZnNWHJ/cK1MDfmBQC70Q8D5lOnQt71vu9folROgVGjJV
 UVW4KrgsHlWtKHD6CLKdeLk=
X-Google-Smtp-Source: ABdhPJzBDLRZjlSbYLz0uYv/HMjZXBE35+YIa6k2BqBn3h6pAKwLPh6Ct9EGeA+dXiOIsb3a3+w+qg==
X-Received: by 2002:a05:600c:acf:b0:397:345f:fe10 with SMTP id
 c15-20020a05600c0acf00b00397345ffe10mr2022718wmr.15.1652986887545; 
 Thu, 19 May 2022 12:01:27 -0700 (PDT)
Received: from localhost.localdomain (93-42-70-190.ip85.fastwebnet.it.
 [93.42.70.190]) by smtp.googlemail.com with ESMTPSA id
 h11-20020a05600c414b00b00395b809dfd3sm333767wmm.12.2022.05.19.12.01.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 May 2022 12:01:27 -0700 (PDT)
From: Ansuel Smith <ansuelsmth@gmail.com>
To: Manivannan Sadhasivam <mani@kernel.org>, Andy Gross <agross@kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-mtd@lists.infradead.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Ansuel Smith <ansuelsmth@gmail.com>
Subject: [PATCH v4 2/2] dt-bindings: mtd: qcom_nandc: document qcom,
 boot-pages binding
Date: Thu, 19 May 2022 21:01:12 +0200
Message-Id: <20220519190112.6344-3-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220519190112.6344-1-ansuelsmth@gmail.com>
References: <20220519190112.6344-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220519_120130_634420_51176D45 
X-CRM114-Status: GOOD (  13.07  )
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

Document new qcom,boot-pages binding used to apply special
read/write configuration to boot pages.

QCOM apply a special configuration where spare data is not protected
by ECC for some special pages (used for boot partition). Add
Documentation on how to declare these special pages.

Signed-off-by: Ansuel Smith <ansuelsmth@gmail.com>
---
 .../devicetree/bindings/mtd/qcom,nandc.yaml   | 26 +++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/Documentation/devicetree/bindings/mtd/qcom,nandc.yaml b/Documentation/devicetree/bindings/mtd/qcom,nandc.yaml
index 84ad7ff30121..a59ae9525f4e 100644
--- a/Documentation/devicetree/bindings/mtd/qcom,nandc.yaml
+++ b/Documentation/devicetree/bindings/mtd/qcom,nandc.yaml
@@ -102,6 +102,30 @@ allOf:
             - const: rx
             - const: cmd
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - qcom,ipq806x-nand
+
+    then:
+      properties:
+        qcom,boot-pages:
+          $ref: /schemas/types.yaml#/definitions/uint32-matrix
+          items:
+            items:
+              - description: offset
+              - description: size
+          description:
+            Some special page used by boot partition have spare data
+            not protected by ECC. Use this to declare these special page
+            by defining first the offset and then the size.
+
+            It's in the form of <offset1 size1 offset2 size2 offset3 ...>
+
+            Refer to the ipq8064 example on how to use this special binding.
+
 required:
   - compatible
   - reg
@@ -135,6 +159,8 @@ examples:
         nand-ecc-strength = <4>;
         nand-bus-width = <8>;
 
+        qcom,boot-pages = <0x0 0x58a0000>;
+
         partitions {
           compatible = "fixed-partitions";
           #address-cells = <1>;
-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
