Return-Path: <SRS0=GKVC=I6=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4BF86C433B4
	for <linux-mtd@archiver.kernel.org>; Thu,  1 Apr 2021 15:16:41 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D27556136E
	for <linux-mtd@archiver.kernel.org>; Thu,  1 Apr 2021 15:16:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D27556136E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=9ZK+CSjiE8fqWAW8g1nmaTSxT87T1XZIo0Umfwkoekk=; b=IyvIlyk7+2wypwC6n+A7gJraf
	jBegMqzEYjP0BLfmlp16KRQObiGDTahdKqDQw1Aj9LPHex6meAhvkO+2rqq1YmyyHoxsko1HwAWPQ
	uPKmcZMh/02uJV5itQjPS1x6th16a/afo4LQfGs0+ctWbCDKzwsyMO5q3jzTVrt/v7nLS6E1+WQjr
	8wCOf7PgAqwmBUGgE1Y4NSDykEeRLEnqNRQrG+tsyS2wz91MOtQVWgkpREg2mZTqBAvcgi9vaP+RH
	cyLRjYvMwzZnpd5ik0Rjn2S5421GUK4pLgCH59tSCL0gC4MzrAT5NbbI7yPg7ROFyT/LLfLY+F6tD
	n7L0K78mg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lRz2z-009ycq-NU; Thu, 01 Apr 2021 15:15:49 +0000
Received: from mail-pg1-x534.google.com ([2607:f8b0:4864:20::534])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lRz2i-009yYU-7V
 for linux-mtd@lists.infradead.org; Thu, 01 Apr 2021 15:15:34 +0000
Received: by mail-pg1-x534.google.com with SMTP id f3so1760752pgv.0
 for <linux-mtd@lists.infradead.org>; Thu, 01 Apr 2021 08:15:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=cGzmTTjWe1AbEuSBzNDXhCdxGNlI9I7Ym5rhNfsOEPE=;
 b=p8Vu5ZvLUSLepbw2MVmx2WeN8I+Zxz5MU2S6/VR8IzPIHsXrQtI4YtTw5Ithnwu2Sr
 34QwLJU5Ujb/2ElBq3VO13OHtVIsZ3iqJjNeChtJXsKzXUVTN9oQOiS+Rh3NyEY0sH7m
 oHsIQgF1noCVG0hBMXQThunqlM5C9iF7Vgpm/axnPEW7lGzW772zMv98DTkS3tyHiICN
 bmQkdGmL7Ff2mnAz2meAtZtrrhKnPLFJjiaBx4sWn386lnanoXLuKjGFC/aUSblE1gnx
 7y83EYuPkbobFshrGX6+nic5asRx3GLqrWnOE+F3ZH+huVDcOHvHb4FDGRY7U2iVkNtT
 ugiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=cGzmTTjWe1AbEuSBzNDXhCdxGNlI9I7Ym5rhNfsOEPE=;
 b=N18XyqbZeNecGbM4DQJ2TvEEZWEDBEO7BsYtgBPdps7FqqX2yNcP36DlD3ZU1mnqs+
 FClKeoxzN6QXklFMTmBXEnLDSRFeeiTM0LiseOXkzBwhmht9E43vt3UYkxQnQFbOifYI
 dGYDwOiQH6qUAMo0ayissJ63zNPB3/mvcqZT4pG4e1O0HV2sb6qV1DyxKcSbWHHxb1uz
 r9DEfCdpzySyScApfCP+fOLlFJBdSDsIbDh83fX4EgAD5Hno57Vh416JobO0J+SuEHqD
 QrGP5Fbc2ivzfKjjwtU8+fsfzYY0ePSgQ+3f5dd/1I8q262A70dEsr0nr3FoWe9rZxtK
 MQ0g==
X-Gm-Message-State: AOAM531+KszczUZV03XRIQpaGph0Nk0YPgsr3WOMLfNoWiHpNeJ1diN4
 KpQrl9gqXK77XVUZjYJ6WivD
X-Google-Smtp-Source: ABdhPJwRmhl3TIKgIdZ+RmULKMqYyRa10/cmsKN2X28wr+9oyOZImS9dX/firxN51T5kWZBZAaKQcQ==
X-Received: by 2002:aa7:8b0f:0:b029:20d:1b60:e823 with SMTP id
 f15-20020aa78b0f0000b029020d1b60e823mr8022613pfd.16.1617290130298; 
 Thu, 01 Apr 2021 08:15:30 -0700 (PDT)
Received: from localhost.localdomain ([103.77.37.138])
 by smtp.gmail.com with ESMTPSA id 35sm5652769pgr.14.2021.04.01.08.15.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Apr 2021 08:15:29 -0700 (PDT)
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
 robh+dt@kernel.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 boris.brezillon@collabora.com, Daniele.Palmas@telit.com,
 bjorn.andersson@linaro.org,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH v9 2/4] dt-bindings: mtd: Add a property to declare secure
 regions in NAND chips
Date: Thu,  1 Apr 2021 20:45:06 +0530
Message-Id: <20210401151508.143075-3-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210401151508.143075-1-manivannan.sadhasivam@linaro.org>
References: <20210401151508.143075-1-manivannan.sadhasivam@linaro.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210401_161532_362595_EABE6A5B 
X-CRM114-Status: GOOD (  11.49  )
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
