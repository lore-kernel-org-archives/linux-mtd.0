Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEA8F606A33D
	for <linux-mtd@archiver.kernel.org>; Fri, 13 Nov 2026 18:15:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=N4PX6sR/;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=KvnO1jUU
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=QCPKe7MmZLORHNbSKfjdAH50/Op1sr98XluwcV25cqE=; b=N4PX6sR/96vdflrdiJJtDvmmQV
	XyDgdTqrjyAjyI1vF1Nn1elWGr7g7HPqHeuQ+OvF+O1ioCadgHQ0oUZekJLz9jlic7imfUpaHwwMv
	wFVDvYMDX8fJeFAXUW32WgGtFZIjhZJbkab0S3T3DJUnfXx+hFXP25CAc6iSRoRlTLroQQYSm6IP0
	0kJcaJ4g837RlPrOfBjAnb4tLbvWbZwKERUEkFIuthysk+0sgQshpHkBub2iEj1tYG+lXm/7fH1DH
	jTkaFFscgmNgxewcCxiPk1/wS+1EQq870Kgp4gm+k+R5x0ziBP5ZTDRpaRtNklmnJufJc0wuiZdHY
	bi6DWanw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRvoH-0000000DqsI-3gH0;
	Fri, 13 Nov 2026 18:15:37 +0000
Received: from mail-ot1-x330.google.com ([2607:f8b0:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRvo4-0000000DqYY-3VMy
	for linux-mtd@lists.infradead.org;
	Fri, 13 Nov 2026 18:15:28 +0000
Received: by mail-ot1-x330.google.com with SMTP id 46e09a7af769-8451a619da7so1559617a34.1
        for <linux-mtd@lists.infradead.org>; Fri, 13 Nov 2026 10:15:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794593724; x=1795198524; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pCH6ltMRkGhTexZfJVTK7WEYzKuilKml1/PSTmzk1ak=;
        b=KvnO1jUUuSCBeawD65owarGA5gVf9H/3yjOos/FSBW2G/p9gTeVk4RZUgiNiWHD2bk
         0HxTeCES17PZ4/lIKJhTMkmd9DHdinfRm4AdPZdEim6zMnGSrZbYSPochDLiEpsrIAGq
         MIi/9RoTvqeyzGeFjpRtQHAabZ+wNGOmIetlYXP0s+JBcc8ovqigPGTSMPls0mueTQ+k
         gySJIfSTh33R8E0XSi32xt85mEyJ49RQyhIGFkjSEWKvqeJyc4ENo27ixhleSb/as/ML
         dSVuboUMGMjEKM7ztq1lxNd4DSokfXqXvzRrqDpuF0HOcnHWOWYcr8JA2VKVuuJC8dDD
         mIFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794593724; x=1795198524;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pCH6ltMRkGhTexZfJVTK7WEYzKuilKml1/PSTmzk1ak=;
        b=xnavqyaoRgrTIVDqIGc1hrARQMifnHLScMxUL3cRLj8/3f7bAUFRY+2Im4XIsA7IXo
         bKbdcUO2BXjRA84pG7yGrrMngXsAkAbwF0i9s8VXPPRFVLYe2Gum7H3dqhveXGwO5lML
         Q+WCgSsDTwxkabWtyARUMRZ6g0BkMUxm+iy40aLXG4qt7Rb2NYbUhjLu8evIMUMbyHKV
         Ha1Cumm38NRmf33xkEAdLRfzAWGKRxPX2tP/c/C9hmHVZCgKQnWK2QPyTd+QMnJxAbo8
         gjaiYff33vK3m3gU8Zdu+KW054JV99sqR6XuADK7iIkUDXtaEanQ/x+vy1Lq67+kpv/A
         IdNQ==
X-Gm-Message-State: APuU4Z+1Hp8xCJTG8p2OeZ+FVv0I8N7DYph5IXRdOR5QgdIfhXf5JEL2
	TtQwsU/9HrdqE6eAOd97zxWBgUC2OowYjLm0gHa2JEMZ7kYIIGjDtl8Z
X-Gm-Gg: AYBFou1IMD+MUQAyi0Gx6V42I3XXDPwenVCQGGknAy+ShUpTVS3W2yRwvt8uBU0rltr
	Qlv8uqnq54A3EJZN1NtQdlC2qdBCFP1Dq0Ydy+axWcOJO8HccMRuNDD8I/PQYebAesLQlsiR7f+
	ryjRBe5mUD0hNnK2P9fgPQMCpAU3sCkvOAYATk2r1xTwk/B4hGDpcUF8EnCmbFEF5iIfrKGLGS9
	Y8kOJsHkq//l6WUo0T3d4JolH34NqOTmQrIrmURSVQ+RIM+VFZ3s2iDu5ID5VFYFHqGGSYrAujL
	qziR1qMfBX1y0B3s1QvAUjV7MRBfqFZCoa1qzHu+SNBaOKgHj1kCF/j6lRwYtRQ+mKEpljKFQ+/
	F4qIgNKwkWHvJ5vDuj4k8HZuzFz4lg1cAjNq+/bADLGagFVhKY8OqfypIB+mX+8s5EaUtrdyLKK
	joF0UqA8kVRlD+j6N2luajoR7poHISpobffxMfse78v1XtuWLwq6L9qhlG2+JMb0sh8fTsvnqoc
	9KVrHAHh7ZRNFZAr8taTKlVe4luZcIyt8W6TL9pGHFVg5K3zxPDiaBuxYSySWPcLhJu97jHfDA8
	ZLVBpuQZPjJats+6W+Ei79L9S92tkQJ/BQriXeojgi2rW0USC8mJkBzO/TJZ8oZa9+jfB4vZnOg
	3tzGPbeeQJaXtfqxux0jXW0IKCxf27MN6OBTY/ZWabAjlYd6KFKGZ1Z+B5+wK76Yh4HIfNqefpF
	DLElie/j5lu5p1Unx1eZxvtGdELlV45haH0zG8aVw/0w7n0W9o2Lp3dQQ7SNQ5izYr7AoJ1CDT
X-Received: by 2002:a05:6830:264b:b0:828:d647:3324 with SMTP id 46e09a7af769-8628985318amr2953908a34.13.1794593724048;
        Fri, 13 Nov 2026 10:15:24 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-8628817d979sm3253414a34.22.2026.11.13.10.15.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 10:15:23 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Fri, 13 Nov 2026 11:14:25 -0700
Subject: [PATCH v4 09/58] mtd: rawnand: gpio: retain open-handle state on
 removal
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261113-submit-rawnand-retained-handle-lifetime-v1-v4-9-556b1d7c6221@gmail.com>
References: <20261113-submit-rawnand-retained-handle-lifetime-v1-v4-0-556b1d7c6221@gmail.com>
In-Reply-To: <20261113-submit-rawnand-retained-handle-lifetime-v1-v4-0-556b1d7c6221@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 James Hilliard <james.hilliard1@gmail.com>, 
 David Woodhouse <David.Woodhouse@intel.com>, 
 Russell King <rmk+kernel@arm.linux.org.uk>, Mike Rapoport <rppt@kernel.org>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261113_101524_928071_1F4940A2 
X-CRM114-Status: GOOD (  15.54  )
X-Spam-Score: -1.9 (-)
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

A retained MTD handle can outlive GPIO NAND unbind. Drain and disconnect
NAND operations before disabling the chip, and keep the chip metadata
and controller lock alive until the final MTD reference is released.
GPIO and MMIO resources are still released during unbind.

Also release scanned NAND metadata when MTD registration fails, using
retained ownership once a device could have been published.

Run NAND cleanup during disconnection; the final core-owned put only
releases retained allocation and layout data.

Fixes: aaf7ea200004 ("[MTD] [NAND] GPIO NAND flash driver")
Cc: David Woodhouse <David.Woodhouse@intel.com>
Cc: Russell King <rmk+kernel@arm.linux.org.uk>
Cc: Mike Rapoport <rppt@kernel.org>
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/gpio.c | 16 +++++++++++++---
 1 file changed, 13 insertions(+), 3 deletions(-)

diff --git a/drivers/mtd/nand/raw/gpio.c b/drivers/mtd/nand/raw/gpio.c
index d17fb2244923..2a8c44865636 100644
--- a/drivers/mtd/nand/raw/gpio.c
+++ b/drivers/mtd/nand/raw/gpio.c
@@ -273,13 +273,14 @@ static void gpio_nand_remove(struct platform_device *pdev)
 
 	ret = mtd_device_unregister(nand_to_mtd(chip));
 	WARN_ON(ret);
-	nand_cleanup(chip);
+	nand_disconnect(chip);
 
 	/* Enable write protection and disable the chip */
 	if (gpiomtd->nwp && !IS_ERR(gpiomtd->nwp))
 		gpiod_set_value(gpiomtd->nwp, 0);
 	if (gpiomtd->nce && !IS_ERR(gpiomtd->nce))
 		gpiod_set_value(gpiomtd->nce, 0);
+	mtd_put_master(nand_to_mtd(chip));
 }
 
 static int gpio_nand_probe(struct platform_device *pdev)
@@ -294,9 +295,12 @@ static int gpio_nand_probe(struct platform_device *pdev)
 	if (!dev->of_node && !dev_get_platdata(dev))
 		return -EINVAL;
 
-	gpiomtd = devm_kzalloc(dev, sizeof(*gpiomtd), GFP_KERNEL);
+	gpiomtd = kzalloc_obj(*gpiomtd);
 	if (!gpiomtd)
 		return -ENOMEM;
+	ret = devm_nand_controller_init(dev, &gpiomtd->base, gpiomtd);
+	if (ret)
+		return ret;
 
 	chip = &gpiomtd->nand_chip;
 
@@ -345,7 +349,6 @@ static int gpio_nand_probe(struct platform_device *pdev)
 		goto out_ce;
 	}
 
-	nand_controller_init(&gpiomtd->base);
 	gpiomtd->base.ops = &gpio_nand_ops;
 
 	nand_set_flash_node(chip, pdev->dev.of_node);
@@ -374,11 +377,18 @@ static int gpio_nand_probe(struct platform_device *pdev)
 
 	if (gpiomtd->plat.adjust_parts)
 		gpiomtd->plat.adjust_parts(&gpiomtd->plat, mtd->size);
+	ret = nand_set_lifetime(chip, NULL);
+	if (ret) {
+		nand_cleanup(chip);
+		goto err_wp;
+	}
 
 	ret = mtd_device_register(mtd, gpiomtd->plat.parts,
 				  gpiomtd->plat.num_parts);
 	if (!ret)
 		return 0;
+	nand_disconnect(chip);
+	mtd_put_master(mtd);
 
 err_wp:
 	if (gpiomtd->nwp && !IS_ERR(gpiomtd->nwp))

-- 
2.53.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
