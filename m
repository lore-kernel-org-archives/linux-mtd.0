Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B3C5606A335
	for <linux-mtd@archiver.kernel.org>; Mon, 16 Nov 2026 06:32:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=tvq85qC4;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=VvT5ZVf3;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=z4m09E8D
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=w6fSJ8BPjd5IxYL+odhoASoI8fVMpO64Ny8E8PyrvJs=; b=tvq85qC4U651d3pg2VVx5lcnzx
	+yFBynL95Za7D2k4C6zCJ6sUjjYM4nLwxBCX7M0SUS+rxriH6lDpywhIwaOKsU/Uf/uM3BMSQ7hWn
	/zqWjMo6xZF+mgF0WZ+9YC/uXTk7k2Ufe788EsfI+/tizzWy0ZjznuQKLHNXJ+HA53ayjThyQKggp
	jdqonr1T0JBV4jXKH/Dl0RbCB49bK7/eylvb+CJV2pARGm0bNskmLE48wlVkk7vSJmIElklfYUv3a
	2TPG6+dpHQvFe/aIBI8v960Uf9gvfcLrnafPrDaaE8to4KXJx44Q04ztWn7InmScV/eLc/rxo+pJ+
	B7+ProsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSqGR-00000001Iml-29ku;
	Mon, 16 Nov 2026 06:32:27 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSqGI-00000001GUm-0IBJ
	for linux-mtd@bombadil.infradead.org;
	Mon, 16 Nov 2026 06:32:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Cc:To:In-Reply-To:References:Message-Id
	:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender
	:Reply-To:Content-ID:Content-Description;
	bh=2riwwIuDITOXYtuG9XDP+0W9d4KCwIC3n7aRF44epYw=; b=VvT5ZVf3WvpfqvSx4bfLwLZSi/
	XtCD6NTMl9oRsxh57H83zZGj9rWVqf6cq2okw9DCQZyrVuCq+SINry+hDjragTpy3MS+94Yj52Sti
	uutzOkdPdeadBan4Z4EUGes2ykAwyHldGk6BSZmg5YDjUuhXJOq8pkMMVIvvXXwcgGgz2lCFCCQcc
	M+d2rbNewiQAFvHy35fA+XUe83rJa5v41jWVK+3dGJlGIK5OgGzSCO50iQSdUyWLeEO7D82sPj36W
	8NRQYH5wcB+42waprzLLcHBwHI5YZPJhft+Bb5clbaAMSLD1+dcwHCYZAISDG0bX4Cr+j22YOyc2w
	gFaj8qMw==;
Received: from mail-oo1-xc32.google.com ([2607:f8b0:4864:20::c32])
	by casper.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSqEr-0000000Cehp-11sD
	for linux-mtd@lists.infradead.org;
	Mon, 16 Nov 2026 06:30:52 +0000
Received: by mail-oo1-xc32.google.com with SMTP id 006d021491bc7-71ac798b8bbso1416224eaf.1
        for <linux-mtd@lists.infradead.org>; Sun, 15 Nov 2026 22:30:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794810646; x=1795415446; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2riwwIuDITOXYtuG9XDP+0W9d4KCwIC3n7aRF44epYw=;
        b=z4m09E8D9H/kXLoH3UGWw3I38mvpt8d+F+qjmpBs7Uy3u1EACSuUq+D+UenNrW49TC
         xh/txoNk50HhFY1jemLofXlykYgzYad0Vt/M/92DJuIrkXY6Qi8kVWU7vrT6rv5bCwxM
         Y3aZRuHJvlyOEoBo7U8tnswiN4tMZHyj0ROh8wu7DrmwdNck+sjBRckjNPHtFssBX9TJ
         1x5quyCgeCim49r35s8NZg+d03eB/bxNin4GFz2s69FNvCMPgxIHRI3PcTDBV2NOdNbZ
         TSHq2PS+fsfTc18ckB1Q1LS/K8cdOkT539E3bhNNXo7UL3uAg34lr8IJ4wI4XY2+WgBH
         Klhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794810646; x=1795415446;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2riwwIuDITOXYtuG9XDP+0W9d4KCwIC3n7aRF44epYw=;
        b=ntDbECRGsYh6j9Kn6lG6fJYEi7FoZi69WfClFK4nz4rBcQShxRHRri7KBh/QhgjdG0
         ZC8Pf9gJxqm+ymKVbz2DVOv5ubQ9OhqgjnQXDoCxKa5/ry4u4MT9rxonKkcXIyy39oCx
         +b+keEBMFM1s8TvJkxgks/HFwpcvlm8UbgLWDfK75ReewXX5NKITGN7N6uWU+uPRpFNe
         S2iAY5hT5wH1xkN/j5rMbtKVMnGsikQRcCX8mLltgQw+oLtNlbvVAV1wR2PZa5yrgVGY
         XQswf5/bKN9tBW57Wv9tT19nFNz+ppeicbkEPL0m5gDcMfr4RnHwz2nTOr3K96mp0+jD
         ubPg==
X-Gm-Message-State: APuU4Z9bneVSWtiPeghseGwBnR99bIfJXDEdwwhiLbSzf/TxomgHQFnf
	Ifu72pUEM4V8wXn/03YyAzFxPOSl0GPeLjw321dr+ZyJulYUSCf259fs
X-Gm-Gg: AYBFou0D+M6Ny7KIDkWSFDGRfQ92K1A0f3NtqtuFt4Dys931HhNj/421uVQlCPu0RQt
	s+rYQlOyRfydzD+NUiNR3LI34Efl1Ge+XuXls1iH54i8fj3iYLrU6NvdealM0Eken4vTP8uGbHW
	iIu1gG7g1q5JO+wuOtTy6D48PmMoZV27tftbDcYSe0rToXB+YawxxnYp2QjWc+BVCfj3y5SRJ0o
	TzU3opK79EfrZROrvXXdrRHMI7a7H6zYNnV00Ccs9L84EwJiNbDk5/uiwNM629PF367RhZEqh9e
	pwENLdcIUpdVJDR4E/0iUcpvVHTjUPpCpDd9LTGI9z7PwlUsR4RehkODgwZqU2aBP3taZcGRGW8
	9suIoYKZnV9HCgcjTkIOaKYNq346M8eyYQibgJ9IWfoVld/g60RQt/znTn5FETkL4KOyDeelHK+
	SWmpO86inQsJOHyhzkoVqqfgir1fw8ilfdPHzpzbBVx2h1tvr7fWjyoamFCQxXD8Gbq/UraxnnA
	lzH4CwtRRfJ53METPMWDVQi7b9jy3GOqfpodJpubmC6gl5o3C9Zk8BbWAFx9d8RaNn1cEOkFIZy
	hY/aidL9S2G2zual6eqEhUtNEwJQLYscgqmHb0rfHsgV/PSXFoM/0aK7qst/WbFUXpHRxbEMqSm
	SRlCH4z2QYTGLAwisQNKbKQ2g6NqQqtXpK5vbCYYGtO0kj6xbc0JGtogCSi8LzGJw0pviL5wyfX
	bLtrFAC6D/VX+PP1BvPQz6hp/+nkk3kPY4z41XVwNv7uteqHkZrpw=
X-Received: by 2002:a05:6820:a513:10b0:71a:eb81:3bb6 with SMTP id 006d021491bc7-71aeb813ddamr1408535eaf.38.1794810646022;
        Sun, 15 Nov 2026 22:30:46 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-71ab42c41e9sm7994558eaf.6.2026.11.15.22.30.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 22:30:45 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 15 Nov 2026 23:30:05 -0700
Subject: [PATCH v5 50/58] mtd: rawnand: ingenic: retain chip state across
 removal
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261115-submit-rawnand-retained-handle-lifetime-v1-v5-50-cbc49c5c5e74@gmail.com>
References: <20261115-submit-rawnand-retained-handle-lifetime-v1-v5-0-cbc49c5c5e74@gmail.com>
In-Reply-To: <20261115-submit-rawnand-retained-handle-lifetime-v1-v5-0-cbc49c5c5e74@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 James Hilliard <james.hilliard1@gmail.com>, 
 Harvey Hunt <harveyhuntnexus@gmail.com>, linux-mips@vger.kernel.org, 
 Paul Cercueil <paul@crapouillou.net>
X-Mailer: b4 0.17-dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261116_063049_470295_549C293F 
X-CRM114-Status: GOOD (  14.73  )
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

Unregister and disconnect all chips before releasing the ECC provider.
Retain each chip and its shared controller until the final MTD put,
while releasing hardware resources during device removal.

Run NAND cleanup during disconnection; the final core-owned put only
releases retained allocation and layout data.

Cc: Harvey Hunt <harveyhuntnexus@gmail.com>
Cc: linux-mips@vger.kernel.org
Cc: Paul Cercueil <paul@crapouillou.net>
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/ingenic/ingenic_nand_drv.c | 39 +++++++++++++++++--------
 1 file changed, 27 insertions(+), 12 deletions(-)

diff --git a/drivers/mtd/nand/raw/ingenic/ingenic_nand_drv.c b/drivers/mtd/nand/raw/ingenic/ingenic_nand_drv.c
index bdda06ae0d72..2818ffe76796 100644
--- a/drivers/mtd/nand/raw/ingenic/ingenic_nand_drv.c
+++ b/drivers/mtd/nand/raw/ingenic/ingenic_nand_drv.c
@@ -368,7 +368,7 @@ static int ingenic_nand_init_chip(struct platform_device *pdev,
 	if (IS_ERR(cs->base))
 		return PTR_ERR(cs->base);
 
-	nand = devm_kzalloc(dev, sizeof(*nand), GFP_KERNEL);
+	nand = kzalloc_obj(*nand);
 	if (!nand)
 		return -ENOMEM;
 
@@ -377,7 +377,7 @@ static int ingenic_nand_init_chip(struct platform_device *pdev,
 	if (IS_ERR(nand->busy_gpio)) {
 		ret = PTR_ERR(nand->busy_gpio);
 		dev_err(dev, "failed to request busy GPIO: %d\n", ret);
-		return ret;
+		goto free_chip;
 	}
 
 	nand->wp_gpio = devm_gpiod_get_optional(dev, "wp", GPIOD_OUT_LOW);
@@ -385,15 +385,17 @@ static int ingenic_nand_init_chip(struct platform_device *pdev,
 	if (IS_ERR(nand->wp_gpio)) {
 		ret = PTR_ERR(nand->wp_gpio);
 		dev_err(dev, "failed to request WP GPIO: %d\n", ret);
-		return ret;
+		goto free_chip;
 	}
 
 	chip = &nand->chip;
 	mtd = nand_to_mtd(chip);
 	mtd->name = devm_kasprintf(dev, GFP_KERNEL, "%s.%d", dev_name(dev),
 				   cs->bank);
-	if (!mtd->name)
-		return -ENOMEM;
+	if (!mtd->name) {
+		ret = -ENOMEM;
+		goto free_chip;
+	}
 	mtd->parent_dev = dev;
 
 	chip->options = NAND_NO_SUBPAGE_WRITE;
@@ -404,17 +406,27 @@ static int ingenic_nand_init_chip(struct platform_device *pdev,
 	chip->controller->ops = &ingenic_nand_controller_ops;
 	ret = nand_scan(chip, 1);
 	if (ret)
-		return ret;
+		goto free_chip;
+	ret = nand_set_lifetime(chip, to_ingenic_nand(nand_to_mtd(chip)));
+	if (ret) {
+		nand_cleanup(chip);
+		goto free_chip;
+	}
 
 	ret = mtd_device_register(mtd, NULL, 0);
 	if (ret) {
-		nand_cleanup(chip);
+		nand_disconnect(chip);
+		mtd_put_master(mtd);
 		return ret;
 	}
 
 	list_add_tail(&nand->chip_list, &nfc->chips);
 
 	return 0;
+
+free_chip:
+	kfree(nand);
+	return ret;
 }
 
 static void ingenic_nand_cleanup_chips(struct ingenic_nfc *nfc)
@@ -429,8 +441,9 @@ static void ingenic_nand_cleanup_chips(struct ingenic_nfc *nfc)
 		chip = &ingenic_chip->chip;
 		ret = mtd_device_unregister(nand_to_mtd(chip));
 		WARN_ON(ret);
-		nand_cleanup(chip);
+		nand_disconnect(chip);
 		list_del(&ingenic_chip->chip_list);
+		mtd_put_master(nand_to_mtd(chip));
 	}
 }
 
@@ -474,9 +487,12 @@ static int ingenic_nand_probe(struct platform_device *pdev)
 		return -ENODEV;
 	}
 
-	nfc = devm_kzalloc(dev, struct_size(nfc, cs, num_banks), GFP_KERNEL);
+	nfc = kzalloc(struct_size(nfc, cs, num_banks), GFP_KERNEL);
 	if (!nfc)
 		return -ENOMEM;
+	ret = devm_nand_controller_init(dev, &nfc->controller, nfc);
+	if (ret)
+		return ret;
 
 	nfc->soc_info = device_get_match_data(dev);
 	if (!nfc->soc_info)
@@ -493,7 +509,6 @@ static int ingenic_nand_probe(struct platform_device *pdev)
 	nfc->dev = dev;
 	nfc->num_banks = num_banks;
 
-	nand_controller_init(&nfc->controller);
 	INIT_LIST_HEAD(&nfc->chips);
 
 	ret = ingenic_nand_init_chips(nfc, pdev);
@@ -511,10 +526,10 @@ static void ingenic_nand_remove(struct platform_device *pdev)
 {
 	struct ingenic_nfc *nfc = platform_get_drvdata(pdev);
 
+	ingenic_nand_cleanup_chips(nfc);
+
 	if (nfc->ecc)
 		ingenic_ecc_release(nfc->ecc);
-
-	ingenic_nand_cleanup_chips(nfc);
 }
 
 static const struct jz_soc_info jz4740_soc_info = {

-- 
2.53.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
