Return-Path: <SRS0=l5Rv=EX=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4CD7C2D0E4
	for <linux-mtd@archiver.kernel.org>; Tue, 17 Nov 2020 17:41:09 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4B9F5246A6
	for <linux-mtd@archiver.kernel.org>; Tue, 17 Nov 2020 17:41:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="C2ufzJ0j";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="iMhheqEE"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4B9F5246A6
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:References:In-Reply-To:Message-Id:Date:Subject:To:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tmMFh1kV7OKbsb0MCbTeNJ/zwh7BUZDMOozqoLYmcK4=; b=C2ufzJ0jnvqQcx3+xFIIdIYFSS
	UD2sGuJGUMFU3UnKEl1sB00M1rVw+C5ZlBese7lqbePaXHG35jlIspdwI9Wh80EQcZAqUDqTOUCze
	jN2hlaUv699+5gO2Jt6EHRlz9v8TlYdnm7WZMBxCr1A4Fg72i7M96iK/u7aZVB5GcVXSUp19YUyKx
	4ghgD3nAaYn899aDq1k3B8cT9CAgvZC2yeN2V18DfxgVxTYBnyt3aIe4aAsPiRpjoB2eib57NX6cs
	Z0j32ovMo7VCapCgXRI+BwvkUcjB+ldz0WXKIu8BS4zokWHS+act2U0B/mCN/abOdZ08npp/Ibmi+
	sZpiMq8A==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kf4x9-0004wJ-RF; Tue, 17 Nov 2020 17:39:39 +0000
Received: from mail-pg1-x543.google.com ([2607:f8b0:4864:20::543])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kf4x6-0004uj-Or
 for linux-mtd@lists.infradead.org; Tue, 17 Nov 2020 17:39:38 +0000
Received: by mail-pg1-x543.google.com with SMTP id w4so16473195pgg.13
 for <linux-mtd@lists.infradead.org>; Tue, 17 Nov 2020 09:39:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=Z7z9ZRILC9uN9iHlx1xbJ9BYeKh/BzimXNJ9muC2tZE=;
 b=iMhheqEEtzlcTH3JWm7eKlSWO6dx+/gAWszscdzjMx9IT9JSPVzPdUu7Xlocg3dVp4
 RS5+e1e1hjcLCK4A+Xpo4IIlMmbkHzIIbD2VtAQsYELArr5qAx+uagVGYh1eFhhw1IeX
 mHCxvRlro8+iZzHxTuB5nBNU9tQ3IigTM/1s0rYId0eGZI3F8iOZRRHbpqUW1jtrZpmx
 JjLzFAODDzSPZMWTuznEM3H8wb1zgbLgEqQPXiR6p5/xCR8fdLQYDI9JgtN6T/0q+0tI
 1IKamxmeuoflCVM4GPjY7GWDfebj3peqcn6JdlCYn1E2pW8mSoz6M6WDcQsI1WCDXFrX
 uqNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=Z7z9ZRILC9uN9iHlx1xbJ9BYeKh/BzimXNJ9muC2tZE=;
 b=T1+7AaQUBD33VPokZHDm+3usT2VunKdsKzdeqN1eU77tw2eockIRDckGtwYSuP98Ph
 /7E7ROHlWBUcKcnTCvpjO/6pcR8IW7EDvOTIodiWWYlXPop33NUZ7s1f/+pkK2atPvNg
 mNzch/uW2+9nha94eZKdCPt6DiCxMqG0tMJkbZ5fsgadrDeMszEgu3s6mYggPXXGmZGr
 O+RzSq4s4A5DfeGDvf3SQLYWNFVTlf0ZRkCYub2jXjq4uQd+g8fw8ip/8jENSJ/4Bzji
 C4Z2CHRCNDJF8NzfvHzOs+bj1KSa4uUGlQx4mKPJybbNrHJpZvB924m1M3GBkSEQOUuZ
 tnCQ==
X-Gm-Message-State: AOAM531x/CzxyFbKpdWe2DpUm8jRV4ladyiIBE+nuY3bsKaWe3UEIuxo
 wmFwTjci1Kg1UN9S7uM4U1Eu
X-Google-Smtp-Source: ABdhPJyiyMmrvmPp7kwm8dB7Il6lF8A+hmI+MKoQZ7IM7qdwm41PZpdxi/RlvI+65FSOqv9cdsE5pA==
X-Received: by 2002:aa7:86c9:0:b029:18b:b0c:53e5 with SMTP id
 h9-20020aa786c90000b029018b0b0c53e5mr381547pfo.57.1605634774347; 
 Tue, 17 Nov 2020 09:39:34 -0800 (PST)
Received: from localhost.localdomain ([103.59.133.81])
 by smtp.googlemail.com with ESMTPSA id a21sm1751330pjq.37.2020.11.17.09.39.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Nov 2020 09:39:33 -0800 (PST)
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
 robh+dt@kernel.org
Subject: [PATCH 1/4] dt-bindings: mtd: partitions: Add binding for Qcom SMEM
 parser
Date: Tue, 17 Nov 2020 23:09:06 +0530
Message-Id: <20201117173909.23585-2-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201117173909.23585-1-manivannan.sadhasivam@linaro.org>
References: <20201117173909.23585-1-manivannan.sadhasivam@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201117_123936_882926_B4F30423 
X-CRM114-Status: GOOD (  14.57  )
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
 .../mtd/partitions/qcom,smem-part.yaml        | 31 +++++++++++++++++++
 1 file changed, 31 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mtd/partitions/qcom,smem-part.yaml

diff --git a/Documentation/devicetree/bindings/mtd/partitions/qcom,smem-part.yaml b/Documentation/devicetree/bindings/mtd/partitions/qcom,smem-part.yaml
new file mode 100644
index 000000000000..0682aef2d54f
--- /dev/null
+++ b/Documentation/devicetree/bindings/mtd/partitions/qcom,smem-part.yaml
@@ -0,0 +1,31 @@
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
+examples:
+  - |
+    flash@0 {
+        partitions {
+            compatible = "qcom,smem-part";
+        };
+    };
-- 
2.17.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
