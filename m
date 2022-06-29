Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 439B5C43334
	for <linux-mtd@archiver.kernel.org>; Wed, 29 Jun 2022 21:35:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cXPiH6KFUw0GFgiz0QmHXPb04EGmjrxfkmtTT5fWs7U=; b=VnkcPxtnQNTPeA
	wIaDptW/OXX4FcouURSud0Y1oZvyRPmmNe9S/RIyByaRMkeliTFMpwr1DmsrqV7+mxcIAV0MdTTCk
	2sS0Wi+HFgq55RTFS0IAk+FvOhK3lHgoQ8M7MMe9u2PsPEP3Bc3iXTB3Oe/aWUpc7BGWWU1WE81Xt
	yjnPyDddmrGJpiJCFT//jK2tPbGmS9RwiclvTxWXQslVH+ta2OvxS/jP2idzq+41PnFN6/yVMkBSf
	Lec5dqOUYyUfi4HDjmelQcESoNPl/1KUKudut8l16iKAtie0xy37vXnFATB/PtZ5E6AwkzVrcHYtR
	E/cpq8qyi+Jx1rxFAuTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o6fLK-00E8KJ-4f; Wed, 29 Jun 2022 21:35:26 +0000
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o6fLG-00E8Iu-3I
	for linux-mtd@lists.infradead.org; Wed, 29 Jun 2022 21:35:24 +0000
Received: by mail-ej1-x633.google.com with SMTP id ge10so35168575ejb.7
        for <linux-mtd@lists.infradead.org>; Wed, 29 Jun 2022 14:35:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=9hFpT71w8Y8NFBACfpOSVZPBieVKM+1lN0Bhp8Mtmog=;
        b=H6HWFiB6JDpuRFekKuj3enfoYHoGG3hh2lHBvMgE72/kEkTAXkW7fx9WhrLALCcE7t
         M1bootZg9eWsWesjH/X6iq+6bQnJMBH+tM8aiTBaHX4qA8k7jyt8ISL/VnJEbnJWYR6Q
         Wct98avi+zpjZQh4S4YyG+RkVECv/5mR3DIXDt9pkM5mtWXppq2w8rlGXr+Yb6B+qaSA
         C2GAN+9nm6eKy7g6hJVsZmRmDcSTOBk5//Xp9qkdUM+sdhpjHrfWX/PFNosvuUwP4/is
         fbMtqXo7VT4sNcbVL/OQuQsACLp+yYjDP7eESDkZ5MmHE+M56LW6RRwGIjeV4XY7tYj2
         DmyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=9hFpT71w8Y8NFBACfpOSVZPBieVKM+1lN0Bhp8Mtmog=;
        b=WhrM+f32Ah5ytLnwjq+Do7S9b36epKjCMYVOz3yRhtaWyCakIs4RSYUZ+C/XquCr14
         DumFNoW9Ye00sFgdp3Kix2cRQ9cgUltS/vfOPJIOt00+HGgJ7FADd7MAA8siCPJck5lA
         gpmU/hqmK9fArEht/IuC7BOEsusVH/+VImZpgIUWHLcdM+tUE/t0mTnusH2UmJ6z2+jc
         02gtGKtyQeRtyHgdnecXesVqOX6a9OOSeGpX7N0xjz4CGscxtcwh1LgR799VC36LRRkp
         zTkNrFzL/OYhPH7lTQKPhFfuHfpWhnSfHt+/avMDKx1+mPiuo9AdXdBRq0ksKH0sdEos
         Xvrw==
X-Gm-Message-State: AJIora/k7rUQA0aMEIKs0f6eLmqsxIFA1ETAPAN/0EVlcpdgW0KUQIxz
	ZANi7sHrQTj7Zje+IK5lQ1SC8mh6u/E=
X-Google-Smtp-Source: AGRyM1vmY4F3HF0zBUzjk7LEOZNPMtqy4zokl2BXrJnajDCerr9z5yokRpXpa+saTTZkiVB7rnBxoA==
X-Received: by 2002:a17:907:7f90:b0:726:e8ed:3c28 with SMTP id qk16-20020a1709077f9000b00726e8ed3c28mr5521372ejc.63.1656538520504;
        Wed, 29 Jun 2022 14:35:20 -0700 (PDT)
Received: from localhost.localdomain (dynamic-077-007-003-132.77.7.pool.telefonica.de. [77.7.3.132])
        by smtp.googlemail.com with ESMTPSA id s7-20020a1709066c8700b0070c4abe4706sm8237889ejr.158.2022.06.29.14.35.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jun 2022 14:35:20 -0700 (PDT)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: linux-mtd@lists.infradead.org,
	devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	tlanger@maxlinear.com,
	rtanwar@maxlinear.com,
	miquel.raynal@bootlin.com,
	richard@nod.at,
	vigneshr@ti.com,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: [PATCH v2 1/8] dt-bindings: mtd: intel: lgm-nand: Fix compatible string
Date: Wed, 29 Jun 2022 23:35:01 +0200
Message-Id: <20220629213508.1989600-2-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.37.0
In-Reply-To: <20220629213508.1989600-1-martin.blumenstingl@googlemail.com>
References: <20220629213508.1989600-1-martin.blumenstingl@googlemail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220629_143522_204800_80573E53 
X-CRM114-Status: GOOD (  12.66  )
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

The driver which was added at the same time as the dt-bindings uses the
compatible string "intel,lgm-ebunand". Use the same compatible string
also in the dt-bindings.

Fixes: 2f9cea8eae44f5 ("dt-bindings: mtd: Add Nand Flash Controller support for Intel LGM SoC")
Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
 Documentation/devicetree/bindings/mtd/intel,lgm-nand.yaml | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/mtd/intel,lgm-nand.yaml b/Documentation/devicetree/bindings/mtd/intel,lgm-nand.yaml
index 30e0c66ab0eb..c45dd87fb5fd 100644
--- a/Documentation/devicetree/bindings/mtd/intel,lgm-nand.yaml
+++ b/Documentation/devicetree/bindings/mtd/intel,lgm-nand.yaml
@@ -14,7 +14,7 @@ maintainers:
 
 properties:
   compatible:
-    const: intel,lgm-nand
+    const: intel,lgm-ebunand
 
   reg:
     maxItems: 6
@@ -75,7 +75,7 @@ additionalProperties: false
 examples:
   - |
     nand-controller@e0f00000 {
-      compatible = "intel,lgm-nand";
+      compatible = "intel,lgm-ebunand";
       reg = <0xe0f00000 0x100>,
             <0xe1000000 0x300>,
             <0xe1400000 0x8000>,
-- 
2.37.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
