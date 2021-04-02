Return-Path: <SRS0=9wI6=I7=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9EAEC433B4
	for <linux-mtd@archiver.kernel.org>; Fri,  2 Apr 2021 15:03:02 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7E0C460FEF
	for <linux-mtd@archiver.kernel.org>; Fri,  2 Apr 2021 15:03:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7E0C460FEF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=stw9rSFLXZckxRRPJy6wVfHI9fWUUb7UjDqVnEnLFCU=; b=MKC9d/cnil25Dk2fAzqchnh8q
	4cYXDSS9w7O7MjZeY3T4YnnH6ZleEK6ODBBUMI3+W14aR38KRM8q2VXPIcaFWdctmzoXPGFoUvh91
	Aba+IcpHMGQfRDJSJG4VNM+TP5tSDntssmgW2U+hXiJ7YxDwoQ8eyLP4BgBWSIPxxtZ9gzaOVXV9N
	DbWd4IYaQiWP025DhMzrQB9PCHw9xntQ20AnokLTDlpCVXMhHouCrNFFT3Dm/8IwXLtC3gEdKH6m0
	YE4dwTEW4paRajS6q9KPmXUKmbZ5tV9UYCRZgiU9DVTIEP27ziq1qybLgrNoz/1r7XrB45WaNs8VD
	Vx3jT51lg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lSLJM-00DAOp-LZ; Fri, 02 Apr 2021 15:02:13 +0000
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lSLJ5-00DAMA-Rd
 for linux-mtd@lists.infradead.org; Fri, 02 Apr 2021 15:01:58 +0000
Received: by mail-pj1-x1036.google.com with SMTP id
 ot17-20020a17090b3b51b0290109c9ac3c34so4711183pjb.4
 for <linux-mtd@lists.infradead.org>; Fri, 02 Apr 2021 08:01:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=I0ki0lC8MA7ZU5srSBRCAeZerDP7DRSW7mDv/jEyzhw=;
 b=Ci8D2AZt97zfkPOnjeTjLmWKK3FPXfgKRs0RwYNoxUSajta/NJhKWe7Ns+zEC48euD
 JH+MOnJJ1OeLDSpBTV+kPLNd8ENZgIOFhNtLMoykTNEv2l8JLxgufZCgm7nRYDw/+Q6R
 MoA9IQGpMwqEXkbbnJZQtZeUxPYkyLUHbFLH3Nw0D5eIno7GJhRRsbdFG9eXg4e5f6b/
 hhq74R8qnEpbynsn5sdXPBVTL7thcMyJd0hoHyRQUp4cXyDWx7dJ9H02oE5G+POeHfqa
 3mFb1QlQRF4RcrpgOUM5jGWyjEPO1M/7hOLH9vAqCO+hoMysKUb0CX8UnEdGlpr1RBgM
 CNUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=I0ki0lC8MA7ZU5srSBRCAeZerDP7DRSW7mDv/jEyzhw=;
 b=t7MB93zksg3I4XYyOlbrRYPbwnV5WgZJcD4Oa/KnMsThobqvIMmDACl7vNKMKxeqs8
 sdB/GpItWrvtpNW1zGY0UNKCC03DHV+LAhNAZo+iakx1mW3LinSenonWbL7vlYr0rESt
 S9hIcW+YXIqxjp7zf+9yDbY3/xzMXyDxQHL054Gi96djKlvCny/ort2y+MjMLSDzgXN3
 eZAB4GZBxTv0PHWrKgJrD3r+wIU/3gkKQ1cFNXjccwJa8z7ThKbBDyFbetMs2dP9M4hH
 v/sWk3yw9YQZQWzLXVyrlgMytJcIkfqO+GaERJCIbGMXprXP4RGDmuqMKxzbDjc74Y1R
 URnw==
X-Gm-Message-State: AOAM532rveKRJXw+7gggwZxjk4NYIwFlJbYz8j5oBbv3HIw1ernbBljJ
 tFXcEFpJdr9ZiHuos+iwHFNt
X-Google-Smtp-Source: ABdhPJxYc8g1lG1UE/hCJUsbIYG48bPhURHEr7CPoRVJ52J7UlXJVrc71N7uNBiPeNTi7wq3vV2fXA==
X-Received: by 2002:a17:902:ea0e:b029:e4:81d4:ddae with SMTP id
 s14-20020a170902ea0eb02900e481d4ddaemr13231221plg.12.1617375714447; 
 Fri, 02 Apr 2021 08:01:54 -0700 (PDT)
Received: from localhost.localdomain ([103.77.37.174])
 by smtp.gmail.com with ESMTPSA id x7sm8773647pff.12.2021.04.02.08.01.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 Apr 2021 08:01:54 -0700 (PDT)
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
 robh+dt@kernel.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 boris.brezillon@collabora.com, Daniele.Palmas@telit.com,
 bjorn.andersson@linaro.org,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
 Rob Herring <robh@kernel.org>
Subject: [PATCH v11 2/4] dt-bindings: mtd: Add a property to declare secure
 regions in NAND chips
Date: Fri,  2 Apr 2021 20:31:26 +0530
Message-Id: <20210402150128.29128-3-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210402150128.29128-1-manivannan.sadhasivam@linaro.org>
References: <20210402150128.29128-1-manivannan.sadhasivam@linaro.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210402_160156_489730_C2A80DF5 
X-CRM114-Status: GOOD (  11.60  )
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

Reviewed-by: Rob Herring <robh@kernel.org>
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
