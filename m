Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C630606A8B8
	for <linux-mtd@archiver.kernel.org>; Mon, 16 Nov 2026 06:30:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=onQSxSkT;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xBN09EZw
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=QCPKe7MmZLORHNbSKfjdAH50/Op1sr98XluwcV25cqE=; b=onQSxSkTUohYbCMMOMfYawu178
	3qyg7g57KCv+c+eZb4Fd5GSKK34CXNRkqOf8YK+Pl16IqgwiSHRyf15yGrQOK8P5AD0rNJoKfgmdK
	NDg3jGmqFc7GmkMgNGhZeY8OrPTBuDe7psLQSXGaAqdOv3AX0E2dho2LgW2PQ96mtUp/LDrCM0lX3
	aoTJsbrZ8vOVGzH6GKwfP4ZfK7ntGMz+9Ug7KBfsL168/PF5sn+B0dI2I6RH5MJ0haYvG8eBrEamq
	eCApQmdzg3r4M9FMdfYNiYrGj5BbgOo/uuCKSodhbhdrWOMrtMraKU4Gr8T2QeDMODHbdBq6+1YM0
	o+AOkrPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSqE7-00000001F3h-42MK;
	Mon, 16 Nov 2026 06:30:03 +0000
Received: from mail-ot1-x336.google.com ([2607:f8b0:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSqE1-00000001ElZ-1si7
	for linux-mtd@lists.infradead.org;
	Mon, 16 Nov 2026 06:29:58 +0000
Received: by mail-ot1-x336.google.com with SMTP id 46e09a7af769-86156cf8a7eso3337149a34.1
        for <linux-mtd@lists.infradead.org>; Sun, 15 Nov 2026 22:29:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794810596; x=1795415396; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pCH6ltMRkGhTexZfJVTK7WEYzKuilKml1/PSTmzk1ak=;
        b=xBN09EZw0t9nIdr32UqG4G+eCfJRIasAWit3uo8KLbXq8MZ4FAwZitbvhfDolmXn4R
         m+bGb+YI+8qmeRu88JUKKt9o8tHdnlzP2LYDw7kAjpuBxFSHEdeGjz7gF+68AKz5rf6H
         wq7j1zaxin4iWPApK38oPt3YyW5IoGWeJLX10uaWkM5glo6vxvsBI4cfQoEb2q9UBJzg
         4KjX01x6I6YM+MT/pYQlzy3Sv5WZVS6Xs0DgpSvBsDeOPqfcuXK3kPEmUhp4jDVhcSBV
         ZoaxrZPraSn/JLr7hAffLxMFx2jU1EbZbeJb0NVbv234DADhRRvwNWKLakFHdEH6MwFA
         pTig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794810596; x=1795415396;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pCH6ltMRkGhTexZfJVTK7WEYzKuilKml1/PSTmzk1ak=;
        b=oan9k2tqBTj5BjMuCAPBrKmorCWKToVmPtVuoP6tmG1nUoHzsUVmb31Nj8kYtrWcht
         HJa1m8sa9Eo7rUq/gEiKjbeVVH7Z2Ogx5mYPwD1aCVogPE/XlVUzp8pJebnc15oBBJMr
         PZIcHk8Gt3WXTJO8KqRCL+PqqK2Ulc8b/FtG3qWXckseSW1zNp0seidrIlxsNJz4/7nK
         uEY8y5Bos6NOG5EJ5DUGxc565aikirF9j04UmJdcuAS3R08XGU4WgKvWfRHqJX2zM4cv
         OGbfOOBJY0Z62kyzcGw22lhuYHP9KhMuAZEIh8QQIxgV3TdsK1UsMZp+b2XgQeyYCnvc
         6duQ==
X-Gm-Message-State: APuU4Z94LcBTaB6EJOyHPZ1BETsGIb2w29D5zGiw+MMimTTH5aIe+HYQ
	rP1dDRx1dkuzkfww+ZfMQn4ZRRE2t5SCyk4k0/7VuLgZ3jcOkOayiKi0
X-Gm-Gg: AYBFou3mtwwd7zc4sRFJXaajzFGJBvSizqJtY8h4JM87tcoSv2Tr573Ns58Snq/fRho
	i5q28sIsk94TsjBiU2d9mwy3frHk/6CaZdmUiLE5yatWuAzoCUYIYUHxpyGYQtuLcwLMHACRXr0
	XO4ExfIXQtzjKWIBT9/Z34O/JQACfRRn1CAGkve4XGasSUeCLuc3m6Zk+bAGPmtHyd6GfhPBj9K
	Bsfgrr/VDccFRGA1O7QA/s03Gwo8cVIkd3hroMlvxWyag4wSgfyGIjJhrunAkkKPH5nX4wmTMDE
	wbqI0N71T8FgwMrgtz+lxYujqz/7pxU15HmLI9I82Z1d7gDT0p3fZPL/9GJvojyS+MOEX2AmMfb
	vlLLQtx0TmuJ4lQc+ggoggbUq3gjflF0AavVOTfDmLTs9FQ0LOEgVsWlym8+28OPxwrOvdTurfZ
	ScD61gb6Vbm4dh2yxtxZTEAn6yN6M0a+lFMPRXTfVRQuRvAJot0dqjqtbVrvWt2FxWNZrG3g/2u
	V9OXPWZNBSIeqSFztJ9YidfSfI0xMZzv+3ZOM/7yOnJn+5utJWl5/JhDFwBQqHTeqm8cY4KJ8w0
	v4Uc1auMbUpyutPh8rmxEpB30rCXMZ9K2gecEIkqzlI3a3Q/Fvcft4qs159cEAsOmmaOFrKBpp9
	GuVwJJwwZwoKk04y1lzrbp7UxH+TeuUkDHFixucNKOqlycXsTtP1OhMpye8eMl3qtOI6ixfMYjH
	TZouVury9p9+NkEyE48OJJuCYJI6nv78Z1y7BhzolYPn68x/shRH0=
X-Received: by 2002:a05:6820:7043:b0:71a:de33:9235 with SMTP id 006d021491bc7-71ade339c6dmr2095104eaf.42.1794810596210;
        Sun, 15 Nov 2026 22:29:56 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-71ab42c41e9sm7994558eaf.6.2026.11.15.22.29.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 22:29:55 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 15 Nov 2026 23:29:24 -0700
Subject: [PATCH v5 09/58] mtd: rawnand: gpio: retain open-handle state on
 removal
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261115-submit-rawnand-retained-handle-lifetime-v1-v5-9-cbc49c5c5e74@gmail.com>
References: <20261115-submit-rawnand-retained-handle-lifetime-v1-v5-0-cbc49c5c5e74@gmail.com>
In-Reply-To: <20261115-submit-rawnand-retained-handle-lifetime-v1-v5-0-cbc49c5c5e74@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 James Hilliard <james.hilliard1@gmail.com>, 
 David Woodhouse <David.Woodhouse@intel.com>, 
 Russell King <rmk+kernel@arm.linux.org.uk>, Mike Rapoport <rppt@kernel.org>
X-Mailer: b4 0.17-dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261115_222957_491479_18B33342 
X-CRM114-Status: GOOD (  15.59  )
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
