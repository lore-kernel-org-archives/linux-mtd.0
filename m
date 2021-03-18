Return-Path: <SRS0=Kfvc=IQ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C7A40C433DB
	for <linux-mtd@archiver.kernel.org>; Thu, 18 Mar 2021 12:45:03 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4EFF464F6B
	for <linux-mtd@archiver.kernel.org>; Thu, 18 Mar 2021 12:45:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4EFF464F6B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=9ZK+CSjiE8fqWAW8g1nmaTSxT87T1XZIo0Umfwkoekk=; b=ZTFcyNJYhRGzvaBO2XTawcWYf
	lJZ6HBtr3SQ1UjLxRVfZcGCKRYaKi2u0O9gDS7MQ1car9D3GFMJpOK7LeXA9KF1ybxFjWKUnZz/zf
	ha8se0noKEkXGLmJM6VD2hpQx5mRv17rohcuzRz0R0/HgD7yV0jGnicsqyhZs4U7TIPrM8HTxYZN6
	rM9naQIUCK7QM2CDD8Fjzd+FDUcAGP2HftNxnA3/oaw4CB3P2o/hvA7q4ljJQorsI/xFlTmhXsxng
	r7Cg6wymEsEppjfyrKl6F34DnAkUlaBTD7DjySzwH40rRObMbNltTghVUPbffPmdsqey0pR7Yg480
	YUusIr6IQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lMs0m-005F9Q-DL; Thu, 18 Mar 2021 12:44:24 +0000
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lMs0U-005F7D-LZ
 for linux-mtd@lists.infradead.org; Thu, 18 Mar 2021 12:44:08 +0000
Received: by mail-pj1-x102b.google.com with SMTP id bt4so2851301pjb.5
 for <linux-mtd@lists.infradead.org>; Thu, 18 Mar 2021 05:44:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=cGzmTTjWe1AbEuSBzNDXhCdxGNlI9I7Ym5rhNfsOEPE=;
 b=YC6h+Stopa6z4/mq+u/ZKuzl0bQVUdulYA/hh1D1RU0UCZ49zW6TI1tDmrWJyrxjsZ
 9+29bYa5hJW16jRKG8vqcJ6i3r78Be26LUrc7lP54b+z4rE0q2K6m03X+ptLa8hp7qMl
 PiHQln2RVCE4T8F+USS0E4npCJsvUczGecOPSjXYy2Rjq1iy7/n1gXVsrlknpFE9TUvE
 lEzpZtiBNO8JhjbVow7AKisJI8Hmcvqx7shtmV5sm0+/P7mXSrAykVtKCPNvy5D5kk6L
 iZLn4mmd2WFfWjcLH0/86A3m9tbErGOC4s2TL9/gTioudWfaN9AqT6wDQh5Y6VXgvtAC
 iVBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=cGzmTTjWe1AbEuSBzNDXhCdxGNlI9I7Ym5rhNfsOEPE=;
 b=uDGq2TTI0wgjWEO4y/ZgcN9nk8yl1U6QSG6lhIMH5tbp8W1IXskaLaK8oScsVeJwVG
 NoTGMherPolikSjwcPA7NH3Gk0FFaQCuU89RzuD5HwkaCZPuddRQQ0xFwP/EVEu2rEpv
 RBC20F8yi8jPk3tXoObIFsYjYgLy0IEWGMVvJXS32TUzMgdjeZ2VWRzEgfClKtunPS8j
 QQpUbDOopzPcAjphhrmweFe+rR9HzSRTz3obf6vF4WcafH+4SuqOnigqQ1WAk1fvBsJi
 aW5mVrcmTQ+huWasTwpu+XUmPJIx8wLe2/OP3LzkNFw+pVtzQpD0QiXtyP0jLi2djD8X
 ZniA==
X-Gm-Message-State: AOAM533A8MnS/5nWifDeGf1HLOvEhAyQjNdRH9zCHk+OXL8d4AzX4T2f
 0TIgDTIHdpPswo/+U37CIqUIspgeojrT
X-Google-Smtp-Source: ABdhPJyZmBBHjfYzZLXR3tLchvSFoaX5tKaC+xbOnAaz9tQnnDGB37XBmQLX8mkxaOkIvUg6+00nXg==
X-Received: by 2002:a17:903:4112:b029:e5:f79d:3eb1 with SMTP id
 r18-20020a1709034112b02900e5f79d3eb1mr9293334pld.48.1616071445438; 
 Thu, 18 Mar 2021 05:44:05 -0700 (PDT)
Received: from localhost.localdomain
 ([2409:4072:6d00:4737:af26:182c:a57e:1d9e])
 by smtp.gmail.com with ESMTPSA id w84sm2530694pfc.142.2021.03.18.05.44.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 Mar 2021 05:44:04 -0700 (PDT)
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
 robh+dt@kernel.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 boris.brezillon@collabora.com, Daniele.Palmas@telit.com,
 bjorn.andersson@linaro.org,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH v6 2/3] dt-bindings: mtd: Add a property to declare secure
 regions in NAND chips
Date: Thu, 18 Mar 2021 18:13:41 +0530
Message-Id: <20210318124342.32745-3-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210318124342.32745-1-manivannan.sadhasivam@linaro.org>
References: <20210318124342.32745-1-manivannan.sadhasivam@linaro.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210318_124406_763737_9F7A7B82 
X-CRM114-Status: GOOD (  11.04  )
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
