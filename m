Return-Path: <SRS0=UneP=HY=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D77CAC433DB
	for <linux-mtd@archiver.kernel.org>; Mon, 22 Feb 2021 12:03:56 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 76A4D64E24
	for <linux-mtd@archiver.kernel.org>; Mon, 22 Feb 2021 12:03:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 76A4D64E24
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=awExAj0i1QMfiXX22wRnLbO/GtKv41x5KKUSEU2Y/k8=; b=uj/c7TVBZViX4+LGU3R+BuLyr
	J7wclTlzT7frflcvxfenurYLJ4PvAOtzCbDhvMeDbzdwTr1F6bzBzt1g787I9BB95LJMQFUAlaL+1
	/88gjgitWmgz7FBbLR8n5YuOX+h96hs2Abveu4dKgdumdU1PpxkvMshN1l9wdNhPYUminSzYALBXu
	bMsD5XHAzHRISPeuKma7PXWmBTt8NUrrfMB5sYdZJh2DN5VWlGs42vMpbwZ/kZ4rSD/yLC/IwOp2R
	g/eWqpVMwas/LVBS+nlrils2SvMJ0QyN1mYaJX4e29elSmZ/JYbrpjKKl75QrYHepaVYXVNNCG7pt
	NtQ9+aBZA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1lE9w1-0000ju-FM; Mon, 22 Feb 2021 12:03:29 +0000
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1lE9vw-0000io-Lb
 for linux-mtd@lists.infradead.org; Mon, 22 Feb 2021 12:03:27 +0000
Received: by mail-pj1-x1032.google.com with SMTP id e9so8901734pjj.0
 for <linux-mtd@lists.infradead.org>; Mon, 22 Feb 2021 04:03:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=iOqS3cmQFNPFE5oe5VQB+Nk7w3LubjtRbocEu7F5iiI=;
 b=vFxVbXKUqZ/PhEhh0tcVrVjqFnWAQDNVgcn43MpfUe4vuLQ1G8UaFfLvQIHe5/qGQw
 MQz/G0mcLEqEa33/kZXqP2CyYxjWxPjqwHOhf3fQrN/OvnTT83e1tdLUPXZbLjvKN1nt
 vNHbKLAnUXCdqyMeg72hnk/pS5kpbs949/bNJbXzDcB9U8P67S45nFj0r3dip4n5q8J4
 ExibsB4a1fiXD0F5IecD2lHsQFre4zikn3FD592AottfLygfpk5frggIz8yMgfK2TKYE
 5/t1caj+HICVv17ZEJlMYg03wpmWYNyd4oL8mR0CBr54PWV8GnvPlEp+cy0MCR5bZl72
 AQ7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=iOqS3cmQFNPFE5oe5VQB+Nk7w3LubjtRbocEu7F5iiI=;
 b=sRlHXcmEjdWGoP0XYSVSj3SINS665oro7cz7RxuUxy7/42mRylyRoEZ1pUDdfZWNa4
 K803EgvoCJQn4u7hjBt9CMkR3FeaNIASxx8vFv0xRmPPUjtB6jPRPh0BnBpUa9wbl1+v
 H2vKddXpFTRktsvG0bolwn5Qq9P/tPOKnBZCLVmEUiEF2VNAO/aVuY1TIWYJ9PdDS9ew
 Vis4aumVmDmcOPTPPUYPDYH8VElFR22lqJL03JWjEAZUhJOQA4fqLNK2YzeLfZEobi9c
 JisPJv2SK6zsLtmKEQO+tMhg2whA7EajCzVuZce1VOkv6GJ+BhSmmMWb0t0W0SekvJUB
 jj3Q==
X-Gm-Message-State: AOAM533iwim2rV9Bo7+jAsepvygQiPdEKxffxYcSXGcc9kedMg7CU2yR
 dROkXSCTfJm8U/bpf1rWmHhsS76qbOi0
X-Google-Smtp-Source: ABdhPJwDxNavOfUSgL+tVcok+qfNwASekjEXEmDMFINM10uJIvTfV9yZKboK8YK7erN+uRsIa3jkVw==
X-Received: by 2002:a17:90a:3d0d:: with SMTP id
 h13mr23313246pjc.224.1613995401804; 
 Mon, 22 Feb 2021 04:03:21 -0800 (PST)
Received: from localhost.localdomain
 ([2409:4072:6215:cc7b:cb8f:abf4:d1c9:3864])
 by smtp.gmail.com with ESMTPSA id g17sm17017221pfh.14.2021.02.22.04.03.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Feb 2021 04:03:21 -0800 (PST)
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
 robh+dt@kernel.org
Subject: [PATCH 2/3] dt-bindings: mtd: Add a property to declare secure
 regions in Qcom NANDc
Date: Mon, 22 Feb 2021 17:32:58 +0530
Message-Id: <20210222120259.94465-3-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210222120259.94465-1-manivannan.sadhasivam@linaro.org>
References: <20210222120259.94465-1-manivannan.sadhasivam@linaro.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210222_070324_730760_B41BE069 
X-CRM114-Status: GOOD (  11.78  )
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
 linux-kernel@vger.kernel.org, boris.brezillon@collabora.com,
 linux-mtd@lists.infradead.org,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
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
driver can skip touching them.

Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 Documentation/devicetree/bindings/mtd/qcom,nandc.yaml | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/mtd/qcom,nandc.yaml b/Documentation/devicetree/bindings/mtd/qcom,nandc.yaml
index 84ad7ff30121..7500e20da9c1 100644
--- a/Documentation/devicetree/bindings/mtd/qcom,nandc.yaml
+++ b/Documentation/devicetree/bindings/mtd/qcom,nandc.yaml
@@ -48,6 +48,13 @@ patternProperties:
         enum:
           - 512
 
+      qcom,secure-regions:
+        $ref: /schemas/types.yaml#/definitions/uint32-array
+        description:
+          Regions in the NAND memory which are protected using a secure element
+          like Trustzone. This property contains the start address and size of
+          the secure regions present (optional).
+
 allOf:
   - $ref: "nand-controller.yaml#"
 
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
