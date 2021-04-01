Return-Path: <SRS0=GKVC=I6=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62D33C433ED
	for <linux-mtd@archiver.kernel.org>; Thu,  1 Apr 2021 15:22:38 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E20DF6136E
	for <linux-mtd@archiver.kernel.org>; Thu,  1 Apr 2021 15:22:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E20DF6136E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=stw9rSFLXZckxRRPJy6wVfHI9fWUUb7UjDqVnEnLFCU=; b=qHkoslHKjpb596dvWft9zi8kp
	uwBu2U7UC1iTsXHSoTfQunG0+k/88JtW90qkqKKerD+GS+gogBaHL55RsfocvEid41qn8FclJspAZ
	kGv7SeT2ctlZWt0noi9Ui6htlDIZFt/q4ikTzMCCPIJiWhKMupyOVjHIrobNclN0a88lUc8kRIJEO
	Xvy5IdSyNFsCvh6GlhKoK5pUW8KbNUP5alY9p2kMQbz4f4ilPJPoCVfyv5GA9/VD3ganFxTYZoQHa
	rCxNE/5z/q9G7ZrfhTzKfLf14q/HFMaTujAZWZ+OajkoKeUV7Q4+QJ3yStGqCa2ujU0faayOK+/fC
	cqiSjyhyQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lRz95-009zsu-EL; Thu, 01 Apr 2021 15:22:07 +0000
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lRz7J-009zVh-HL
 for linux-mtd@lists.infradead.org; Thu, 01 Apr 2021 15:20:21 +0000
Received: by mail-pf1-x431.google.com with SMTP id q5so1690078pfh.10
 for <linux-mtd@lists.infradead.org>; Thu, 01 Apr 2021 08:20:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=I0ki0lC8MA7ZU5srSBRCAeZerDP7DRSW7mDv/jEyzhw=;
 b=qQ0v8/k4NrH6jKqHmdH5VXybvg1m4144BVeYDTvfC96mDKCt11Vs81OC9ACNp+Zhp4
 A5BoQrzj8lb2eWR43CMRD+1En5lcgIjRxX2LZan9wjifgdEP6YOd0eymSZskboVwCAnU
 WABpIPUI8bJsBNhKiDsOESSHZXui8Ye72eq0WPv/fZc1CeXA09dhGjV9r7FBkveB0zbu
 JTLDqxpnrdkuSa/+o5dTKcqYRN8G7UhDxWDSJtjm6hwKiZivqC/5+EsT1nkoFPjBdf/O
 uSH37NVre7DHl6MXpEl1f3AUJ0gZGSRSehux30GBHeXBAXjDVMRLaE9FpgQKlW/2yacY
 KkEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=I0ki0lC8MA7ZU5srSBRCAeZerDP7DRSW7mDv/jEyzhw=;
 b=EqK3E7sNuaA/wKdhD47dGPYqYEHqcKL2MWOaP+NCm1UqKm4Ldr0iao126jEF721AtR
 RcEXogSCfPUlo+Nn2WDtQLS11jXp0KXTFAB/nBSnqI1fE5XSiSM8/TRwGwPRWurOK2V8
 OzHGR4PKy40wnoq3GpJuJ5R7UgKo9G3/VkVSOXKFi5u/7OwCE6G182taCahnRC34UyqF
 sNT4jnfBrF0bB24l5IT+JYTuj6PJW0nthymecy1OqAOeog1hCDLGw+GI9C9AFY3PV3/7
 sLIvS3Fx1Q350H9HOyfIYyDD8CB/TDwVclH732+aE6OxTATcamgmjgFA1j9fmFe6UmmH
 eI6w==
X-Gm-Message-State: AOAM532G2FnzuR0QuP/LZnzGk4aoYAuCYzflZQti35HuSCNGrCzMLzoH
 d9ZZwPBqMoZb7uxKzz0Cv/IHX4Fl6HW+
X-Google-Smtp-Source: ABdhPJzwbbKb4PxWcqooRWmHcWkE3XNAzSdnNl7CBX4C1OfeHXT92d/xTOsH+fB0qhD9v7jbEPwu+g==
X-Received: by 2002:a63:be0f:: with SMTP id l15mr3536418pgf.39.1617290415914; 
 Thu, 01 Apr 2021 08:20:15 -0700 (PDT)
Received: from localhost.localdomain ([103.77.37.138])
 by smtp.gmail.com with ESMTPSA id l22sm6500919pjl.14.2021.04.01.08.20.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Apr 2021 08:20:15 -0700 (PDT)
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
 robh+dt@kernel.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 boris.brezillon@collabora.com, Daniele.Palmas@telit.com,
 bjorn.andersson@linaro.org,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
 Rob Herring <robh@kernel.org>
Subject: [PATCH v10 2/4] dt-bindings: mtd: Add a property to declare secure
 regions in NAND chips
Date: Thu,  1 Apr 2021 20:49:53 +0530
Message-Id: <20210401151955.143817-3-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210401151955.143817-1-manivannan.sadhasivam@linaro.org>
References: <20210401151955.143817-1-manivannan.sadhasivam@linaro.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210401_162018_028911_A5B1C221 
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
