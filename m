Return-Path: <SRS0=GnEg=IV=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF6FDC433DB
	for <linux-mtd@archiver.kernel.org>; Tue, 23 Mar 2021 07:41:22 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 64A576191F
	for <linux-mtd@archiver.kernel.org>; Tue, 23 Mar 2021 07:41:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 64A576191F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=9ZK+CSjiE8fqWAW8g1nmaTSxT87T1XZIo0Umfwkoekk=; b=PMByO5TDZ5ghbKzglZY1cccMf
	ztZAvupGbx6a9v+7bh2rJsb8sEEBxaas7c7J5N82K3ddNQ29Xeg+gnNNbVSKDzvpi+XPPtRNEZ0V9
	9CoElcsFQ1QGk5UOwPYsMalOxSdsWVlEhNx30hYkfG9OUwFpY4Q11QPikkjE1vfD7s8Vb44r/ucc0
	SjrbBa/zemaolr14su0H/A5AIkTqDCV/kX2MoEYoJAgJxibeF/eU2hkSMrBAPN/AcOCAee5b1DUng
	Rnaxt/mAfRy0JqBTEwrSL+RiT9xs3S49anpdSk+JMSJicbqM+RmRp2LiLvMArkyezzaf2TmV5cnDy
	q1eGqhYvg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lObeI-00EBJe-7l; Tue, 23 Mar 2021 07:40:22 +0000
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lObdm-00EBCW-Tz
 for linux-mtd@lists.infradead.org; Tue, 23 Mar 2021 07:39:53 +0000
Received: by mail-pj1-x102a.google.com with SMTP id
 f2-20020a17090a4a82b02900c67bf8dc69so11818747pjh.1
 for <linux-mtd@lists.infradead.org>; Tue, 23 Mar 2021 00:39:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=cGzmTTjWe1AbEuSBzNDXhCdxGNlI9I7Ym5rhNfsOEPE=;
 b=RRJTK1pfzaPiIg4O8eJnUtlpB1U56FQHHW/kPwgw4nhIsr/nTjDgEKrq0Y+zkB6FPV
 9L/si0PvnDb+3HoE8ohZIpt2XKP7eDyLcXz59tYjIi0RxvalmgmQEdHld3MA60g84PBg
 wgcdptFJikTVRsBW9SRBJQtd7QWT7ifheLwIw4kcFBIxpSV1wRDhqrH0eNPqCEGqLwid
 UI9XQ13eMHx1SJGprtlapmZtwJsEwyOHIINPFOkjX01D9oUH6Gos2e8VXHNaEJT4ALgL
 LbB5iscnnJGiVepzQkNny2ZYu0Df9+eF3VLUchoGtkYXhWvW0nQuBByhnZGR6YP+us9J
 d1sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=cGzmTTjWe1AbEuSBzNDXhCdxGNlI9I7Ym5rhNfsOEPE=;
 b=WD2DgEe3er1BWN7VZy9dPNxJ6UWKYaVMOODAyxhncMC3k8lNJ2KQjcPulcvUdrFZ5l
 QsD3oOPdAytKD5ICiQXtz4xSSxQWhJjlLdaCVDfSgOMeP8ZATgpM1aqpn3QHbbO6+cLE
 KMsBA7jdX7f5vtMvBg18Zh1S76HMpG917Gvgi3ak7MIhSwJmPZ/vAmuvLB6ifW4bZ7bM
 J+sWCI9JUUymsceDmYaeQa6yBN/NGCqZlVqfIqOJ2dqob/Er9+Wz/MlrUAWEcVVelVyt
 m4IbgkOhjtLId22NZWRpTDwGW2uMB1pUc4xb/0fLtQxD1v4n/KQHnX1DiFS0vZarAg1/
 c4mw==
X-Gm-Message-State: AOAM532BBxk8kX7CRPkzdYOh532C4XlwTqoKT75oGnBPakGscSFWJoeA
 IdM6Gy8Bsx/K5nVNuBto1Lyj
X-Google-Smtp-Source: ABdhPJy77U6rmZovSr8RvL2cMkDeU4jN/R3BFUQnsuCbAaCp1zxa3/iJxUE7FdougLiN+KzpyMoDjQ==
X-Received: by 2002:a17:90a:ec15:: with SMTP id
 l21mr3204024pjy.164.1616485189313; 
 Tue, 23 Mar 2021 00:39:49 -0700 (PDT)
Received: from localhost.localdomain ([103.77.37.149])
 by smtp.gmail.com with ESMTPSA id fs9sm1587465pjb.40.2021.03.23.00.39.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Mar 2021 00:39:48 -0700 (PDT)
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
 robh+dt@kernel.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 boris.brezillon@collabora.com, Daniele.Palmas@telit.com,
 bjorn.andersson@linaro.org,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH v8 2/3] dt-bindings: mtd: Add a property to declare secure
 regions in NAND chips
Date: Tue, 23 Mar 2021 13:09:29 +0530
Message-Id: <20210323073930.89754-3-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210323073930.89754-1-manivannan.sadhasivam@linaro.org>
References: <20210323073930.89754-1-manivannan.sadhasivam@linaro.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210323_073951_146701_E8519792 
X-CRM114-Status: GOOD (  11.48  )
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
index d0e422f4b3e0..678b39952502 100644
--- a/Documentation/devicetree/bindings/mtd/nand-controller.yaml
+++ b/Documentation/devicetree/bindings/mtd/nand-controller.yaml
@@ -143,6 +143,13 @@ patternProperties:
           Ready/Busy pins. Active state refers to the NAND ready state and
           should be set to GPIOD_ACTIVE_HIGH unless the signal is inverted.
 
+      secure-regions:
+        $ref: /schemas/types.yaml#/definitions/uint64-matrix
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
