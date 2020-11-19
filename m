Return-Path: <SRS0=mdPP=EZ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D059AC2D0E4
	for <linux-mtd@archiver.kernel.org>; Thu, 19 Nov 2020 07:14:21 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 384E2246B8
	for <linux-mtd@archiver.kernel.org>; Thu, 19 Nov 2020 07:14:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="rcKblESL";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="fF2c5BlB"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 384E2246B8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:References:In-Reply-To:Message-Id:Date:Subject:To:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ha72IdCglX5I2VMZsXHnk6dnCgg/xSmMM6pUzd8Ft00=; b=rcKblESLqcJwZd/+tGSzxS675D
	0vZM/Xi9U1hL/k9RoOk4hkiBz46myk+47P3IvGabOL33MvBGPWhd56BrlZ/u8PWsXOjdr/3GF+jc4
	HhJVKecGgmregZpHl/3QzQqIWMobwrEJwzTFo7o0taHbGDnPll0scUbIlzOnbN+Q9eNg1qGvZ40yT
	s6vOqL6HYCMpVjfYNpJJLQ/qZlYPzz+tErOwjggaG/N8RfUJ16hjhqEE+xw8xLlPH5CAAkJfYI1dC
	WoS349mBSHDfCdtwi5l1mVnVN2Kt+Vc33g1kndHx9vxAGSxajmhyRSD80QmBJH8iLZepSNCOLBCaf
	qXTqjW9g==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kfe8N-0005no-T9; Thu, 19 Nov 2020 07:13:36 +0000
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kfe8K-0005n9-Ae
 for linux-mtd@lists.infradead.org; Thu, 19 Nov 2020 07:13:33 +0000
Received: by mail-pf1-x432.google.com with SMTP id t8so3571913pfg.8
 for <linux-mtd@lists.infradead.org>; Wed, 18 Nov 2020 23:13:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=jVl81ZS9fFrGd+ufPYRPV6WNHXbkD50mNDrAZQnv39A=;
 b=fF2c5BlBENboF8Y1Nu+N/7xWoSQULa2VjGFTzkM/PYZUg9jiRfN5JYusVOEWtV9MPl
 jJYZmS5J/IlXmMNYIuXyb4V/n5xXtnf38pU9c4PJe4GeKYVCVvQgNz75dWekVZZNX+6o
 eprwSUaJ7Ouz1qi/CaVZ3on68RVP1ntMBe+7+00OyIW0/m2t7EnL1JRgLPKsvyae9K6H
 ckDeHn+mGx9YaSAe9sYoxmEPsIYolSMkg3ccFTNiYHlLeWAd79KOw/Ses7BqCK05kjSD
 qRae4SK6ns5N+JKHV4+bdFF1oyoso50x9fKdpCKBiwMrqyXG7TEJ5klCi1US9VVr5G0H
 AsXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=jVl81ZS9fFrGd+ufPYRPV6WNHXbkD50mNDrAZQnv39A=;
 b=m9/3m0/sOXC2HIWuprWJHYsAOZwe0Fq7z6075sRGQI0YS93NQU7PmhD5kJ02zThxbx
 TIprQk77wCCGqWda0r25sGmbs6VKGkIf+4hg6yYKIs+t0TACRf57YFYrKzCZHjiWfFCL
 YH9fC1/ceWBh/Wo1dahMHDW9fa/Sg6dseF+GUiJE/36+KIxLBAAxOkiY6Qdg7firwsRf
 r11qZBqkfhEBz3IuxaV3uVD+qPEXHMWea/j/Ph2SCvPBV++B5OvlKr6zwPA7PXKYHTKc
 Tvfp/mKUMh1gS68LlNUkKYQf9YRNgOfxFQ/87mx/OTmunn+iaHfzhe1qp9YLzarHi4/d
 TRzw==
X-Gm-Message-State: AOAM5322NyMSy0YYYaMxZYwpmU90dqpPv5YZsGv2WNbAVL+6eDlJIvd+
 NXuX2wea3cHL4lqJPkIST3gg
X-Google-Smtp-Source: ABdhPJy2OIX2ioBGmz//Ste9wS23OQDzJmRj//wqH1/EVhXbCvQefRNgQX340DjN0ZtVUT25ucLIXg==
X-Received: by 2002:a17:90b:ec6:: with SMTP id
 gz6mr1192362pjb.142.1605770010350; 
 Wed, 18 Nov 2020 23:13:30 -0800 (PST)
Received: from localhost.localdomain ([103.59.133.81])
 by smtp.googlemail.com with ESMTPSA id 12sm5491577pjt.25.2020.11.18.23.13.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Nov 2020 23:13:29 -0800 (PST)
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
 robh+dt@kernel.org
Subject: [PATCH v3 1/4] dt-bindings: mtd: partitions: Add binding for Qcom
 SMEM parser
Date: Thu, 19 Nov 2020 12:43:05 +0530
Message-Id: <20201119071308.9292-2-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201119071308.9292-1-manivannan.sadhasivam@linaro.org>
References: <20201119071308.9292-1-manivannan.sadhasivam@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201119_021332_480078_5B8441E3 
X-CRM114-Status: GOOD (  14.24  )
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
Cc: devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, bjorn.andersson@linaro.org,
 linux-mtd@lists.infradead.org,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Add YAML binding for Qualcomm Shared Memory (SMEM) Flash partition
parser.

Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 .../mtd/partitions/qcom,smem-part.yaml        | 33 +++++++++++++++++++
 1 file changed, 33 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mtd/partitions/qcom,smem-part.yaml

diff --git a/Documentation/devicetree/bindings/mtd/partitions/qcom,smem-part.yaml b/Documentation/devicetree/bindings/mtd/partitions/qcom,smem-part.yaml
new file mode 100644
index 000000000000..cf3f8c1e035d
--- /dev/null
+++ b/Documentation/devicetree/bindings/mtd/partitions/qcom,smem-part.yaml
@@ -0,0 +1,33 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/mtd/partitions/qcom,smem-part.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm SMEM NAND flash partition parser binding
+
+maintainers:
+  - Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
+
+description: |
+  The Qualcomm SoCs supporting the NAND controller interface features a Shared
+  Memory (SMEM) based partition table scheme. The maximum partitions supported
+  varies between partition table revisions. V3 supports maximum 16 partitions
+  and V4 supports 48 partitions.
+
+properties:
+  compatible:
+    const: qcom,smem-part
+
+required:
+  - compatible
+
+additionalProperties: false
+
+examples:
+  - |
+    flash {
+        partitions {
+            compatible = "qcom,smem-part";
+        };
+    };
-- 
2.17.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
