Return-Path: <SRS0=cHBa=H3=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68F36C433E0
	for <linux-mtd@archiver.kernel.org>; Thu, 25 Feb 2021 14:10:20 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0217964F03
	for <linux-mtd@archiver.kernel.org>; Thu, 25 Feb 2021 14:10:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0217964F03
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=kGA34IiC07gMaNpvWZ3SlVzmO+WkpIR6wst1MR+hnk0=; b=QAAEAAIedW5rGepX/IAv7lMmY
	eS/W4i7cHu8cc0llb4srDDBKhQiqDHVXJz8HUmn9gpZU1cETe1Wx2JqK1L4ZjKigkdU+pfO73mvlj
	j/fnvEy/0O4p/eLomS25KUkBNX9mLIooJ4d9XI3JUyZ5xofAyxv2k8TMTpZwqQ2IH5vNQaYN0kIvA
	wNnenno0rYM2RLhL2zCkmqad7tpzqoUvsv/cm0tSAc+7BdmUw9OMEbpZpiSM0+yq621iRea/g9IZS
	dQI4+tNt9DksIOvs60dm3Vmffnvp78yjVGG+7l7hSKw7195NBcx84x/8GTFhLVW6a2rBCW15AdumO
	D29LXOelQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1lFHKX-0006zS-4j; Thu, 25 Feb 2021 14:09:25 +0000
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1lFHKU-0006yO-CO
 for linux-mtd@lists.infradead.org; Thu, 25 Feb 2021 14:09:23 +0000
Received: by mail-pg1-x530.google.com with SMTP id g4so3866042pgj.0
 for <linux-mtd@lists.infradead.org>; Thu, 25 Feb 2021 06:09:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=+/fZuaWYVZIMIkTfAOgxpNFqBTcFkZg8zMovp/of1IE=;
 b=QQq9Hyp6dQvfLQP4R5h1797glkzOuUgcY0k++QNnerFfLYh8aDNnUmh6CJDyZpKB7J
 wTIUaAnpolneUPzLvhoOY0e1qkVec2T1vTEf/iYQbSL5QUPB4rq747O500T6shcgcG7W
 ny4VVf3fnupgoSCjCksbtABCyhQ5uu6fYFpj0FCklS+ahdoV1PknvSzpvG49D7GJg+Xt
 iDvC4NIQxLG5CxKcdx8jHxar/Y98e1nDeGBDWfouLejDbCq/RgCkiK7Sof/aOem9cRVT
 bah8x4QnwbN2ulCCBygGmOUMpMVw0kSyrK0zruK/56IdTO/97MchfA0leEwnEjtrL6J6
 nlNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=+/fZuaWYVZIMIkTfAOgxpNFqBTcFkZg8zMovp/of1IE=;
 b=oduply9lFUSon0kWAZzMRLHIXjFwCv0IHYSgH4mqXVHl8v1hqVeLSQjW/YpaSIj/vh
 L7TxfinQHIgnqpHaLHOa+Z+jCRumFiJpj6eYWAIOzVZn2PbVQSLP+Q7/W/cNYe2SVCz5
 Kx25K6yOJOVvTuKjYFzUC8mtdh2Ey1fe2WXqe6Elr0y662U+BNMJHmDg1W/cIWJiYWNg
 8/24xlSUkaMC3/VKqvzQ6i4jTi4kP4xAoEz5E0MrRtcEUuHjG/HW6+T9fevockW4PseG
 awE4XHGN0rI14t9+Ke7D0k97kmSqOfRyRgDpKxTZduTIm1mcnLKVqMYWQ1gMHbxRSNM4
 XPWA==
X-Gm-Message-State: AOAM532X1K/RLQvDml0wYA2ue3WQ0yslaU+pJO0IokamuWhUqjnNvOM7
 eptb50TtuHgI/IHFmGRQ966K
X-Google-Smtp-Source: ABdhPJwVFyz+crFLDkYG/XHLDkUo66t4VXaT6pkICGmOeNSZ9uGzMSs/LPo3hrAylx2FuDPNOpMlVg==
X-Received: by 2002:a63:a512:: with SMTP id n18mr3051853pgf.329.1614262160060; 
 Thu, 25 Feb 2021 06:09:20 -0800 (PST)
Received: from localhost.localdomain ([103.66.79.45])
 by smtp.gmail.com with ESMTPSA id f3sm6228918pfe.25.2021.02.25.06.09.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Feb 2021 06:09:19 -0800 (PST)
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
 robh+dt@kernel.org
Subject: [PATCH v3 2/3] dt-bindings: mtd: Add a property to declare secure
 regions in NAND chips
Date: Thu, 25 Feb 2021 19:38:41 +0530
Message-Id: <20210225140842.66927-3-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210225140842.66927-1-manivannan.sadhasivam@linaro.org>
References: <20210225140842.66927-1-manivannan.sadhasivam@linaro.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210225_090922_478490_327CF57C 
X-CRM114-Status: GOOD (  12.52  )
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
Cc: devicetree@vger.kernel.org, Daniele.Palmas@telit.com,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
 linux-kernel@vger.kernel.org, bjorn.andersson@linaro.org,
 boris.brezillon@collabora.com, linux-mtd@lists.infradead.org,
 linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On a typical end product, a vendor may choose to secure some regions in
the NAND memory which are supposed to stay intact between FW upgrades.
The access to those regions will be blocked by a secure element like
Trustzone. So the normal world software like Linux kernel should not
touch these regions (including reading).

So let's add a property for declaring such secure regions so that the
drivers can skip touching them.

Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 Documentation/devicetree/bindings/mtd/nand-controller.yaml | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/mtd/nand-controller.yaml b/Documentation/devicetree/bindings/mtd/nand-controller.yaml
index d0e422f4b3e0..acc7dfd6ef28 100644
--- a/Documentation/devicetree/bindings/mtd/nand-controller.yaml
+++ b/Documentation/devicetree/bindings/mtd/nand-controller.yaml
@@ -143,6 +143,13 @@ patternProperties:
           Ready/Busy pins. Active state refers to the NAND ready state and
           should be set to GPIOD_ACTIVE_HIGH unless the signal is inverted.
 
+      secure-regions:
+        $ref: /schemas/types.yaml#/definitions/uint32-array
+        description:
+          Regions in the NAND chip which are protected using a secure element
+          like Trustzone. This property contains the start address and size of
+          the secure regions present.
+
     required:
       - reg
 
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
