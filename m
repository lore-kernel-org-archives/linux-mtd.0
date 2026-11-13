Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7ADD1606FE95
	for <linux-mtd@archiver.kernel.org>; Fri, 13 Nov 2026 18:26:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=i7nhApqn;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tFxEaO3W
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-ID
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=w6fSJ8BPjd5IxYL+odhoASoI8fVMpO64Ny8E8PyrvJs=; b=i7nhApqnU0HyiRyKuFUbnVmGkm
	jHeijVXDBx3eehWFqzG1DNJOYV27W9E7l66sRYVhIKvxtosyqE+nXtAyLdRvotmzWs3OMjNMG7g3/
	7L7c2DXhi/z7HTWZ2B1zN55/RppJfJt5uf6xMY89FpxYLJvE3SpjvuTLlLdo2yuIOOLFZvUsuBFtH
	s0uNLcuGB/CcIVUZTAJIA8ry/3LuKWrcoyKglelSTSqRyJfc/Dh+SU839cNLTE6CGiCOC9oaaWZ3O
	k5oYvVfxTa79EOWCtfSjbPB4NEZSHRTNsOVNcFY++YimS2cpFpDgXMpSYBiFavKOarSODCzQLP3W6
	tmh9azoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRvyi-0000000DvrZ-44YC;
	Fri, 13 Nov 2026 18:26:24 +0000
Received: from mail-oa1-x35.google.com ([2001:4860:4864:20::35])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRvyd-0000000Dvla-2XCX
	for linux-mtd@lists.infradead.org;
	Fri, 13 Nov 2026 18:26:23 +0000
Received: by mail-oa1-x35.google.com with SMTP id 586e51a60fabf-4a77761ff8aso1565999fac.2
        for <linux-mtd@lists.infradead.org>; Fri, 13 Nov 2026 10:26:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794594378; x=1795199178; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2riwwIuDITOXYtuG9XDP+0W9d4KCwIC3n7aRF44epYw=;
        b=tFxEaO3Wq54iT/j1fvyGYnmqbg/f93KQI74pyGCjpqZmUPYlYZZF/z8nf8WamM0At7
         TLXbHqpvIeBHp5gp0mUQa3NvNijAfO0a6giMNSEawo4jxr9jXkohP133AsttkU3FI7JN
         B+7qMivFEcVfoVJoxcWk37uaSSaLY1ZqrL2dUCvnxACgVkdTHfVQTPQ8adY6QADw/Dab
         2uC3x7I740fYrrWi0BPkmBibT+YLg0/L+qvHRuBOgfefSCpFEd76+c3N11Xw6Po7Pk2U
         5+UrK4cMOm8yFHo9jYyT6xiPygKi7bdLSMMtpSpkMm9z4vOR5orOCGq5aWfNFxKznNZW
         D5VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794594378; x=1795199178;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2riwwIuDITOXYtuG9XDP+0W9d4KCwIC3n7aRF44epYw=;
        b=D+Q5LfNEGuTIWx5jKzPLSYgq/tvO8sMxSie+k69ilTfczUQ/nU/K7q5K+wrnjO4Em6
         TGChahbM05SMiI+AffYQ1B5NNBIzEnNMU2qlwq9ymFdig+mdtIxnDJb2WYGMmGdlE/CC
         +FF2Fj0pv5Uye48fimZVfrTvkLuofyj7lBJyFb4AwKeSbVFQqhF6BGVZwV2zghYpVhvY
         vn3RaNWWhmg/Rg5ZDjl2wvyXGb6Kn4j5LJcxlXR2v9iPJcPvdWGqqVPp3DGU4j0sp9rS
         nIabaaKvK69vmVFcaTKmctRA0pf/R32lcQZkzLuNMPEmW0y9HLNQ8xJEIDcv+B0NVhtK
         F9uA==
X-Gm-Message-State: APuU4Z+Lf4CJN7eOKGUDAsnUkM7zTiN1y30uXGb6kGvbaBR1xlUW8vmg
	4ALN1wqLpI64J49XiNzp5zeSkmp62BF6QvWMGroHFPYMSVJpTpP/4mnx
X-Gm-Gg: AYBFou00ywQuCshMLg8dxfvNxETaStSWCunAcbAlAtfsvZfRqgqbFk1qoSi19+NLyX1
	aKRzHQNxBxLmxwi014NzmIQOy3BPjAlAYHUSN8hvnjEFrYPp/isWODT3yNfJ0IiOL0k2m4+s/Xa
	umsnxijth34UwNr27/IVvveNbCzcKBUyC8z0QNqGrVTMmBt2P3B+9eaOH/5NT2niTuUnHdgnA47
	Dsp/MCzKrqjLF05E2SIL2FECEWHR7VqZd61skwwO8H8l5OJOc0KTHWqLacIPlDz8gBap3HyrwkN
	BK7czgxwzHoa2hiknWirMKcb1auasvtRDafILTecM2h3f3D7nM26HN4zqmqXE17SYC6LWKsUAny
	i5IF5Cq2IfbbOacysAU1XPTEHWpqztydbTaZU9pkWSYYuW3Acro0J4fZ2aJWpy6QXL/524sB8p7
	mbs+W969xuFOOjTvfYHo/53hIfjzrpc5W1l2eOBblTF3uBCjbcKv6JSzKOa7pv509QETQkZfmJo
	k2qH5mjcg7aSk7S9xwkZO5ZS9Rfo0P4FTNxhl3droskrd3/briKt3Z0ezA3fp10WGllcxm49frh
	tRfcwwZo1PaRSALGfTxCVefzDCPi7xjGAjjTqJ3PPFxXbvn6ZqQ8DHo0/ErLZlJcVpGt3Ookdew
	HbSvAMny4+Lj7vzimQSTpXOIBQTM9g6RGcsTK8EXBHCklzT86t2rx6jQWBkJm8QnZz5tVtXAjWs
	xdLbnLa8rxwS32LdgJztjAwvDJCCT0nNUq/ZVLKp1D6LEoK02anMI=
X-Received: by 2002:a05:6870:c459:10b0:48f:e0e5:a1f6 with SMTP id 586e51a60fabf-4afdf948d70mr2365773fac.42.1794594378235;
        Fri, 13 Nov 2026 10:26:18 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4afe2011c25sm1887061fac.2.2026.11.13.10.26.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 10:26:16 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Fri, 13 Nov 2026 11:15:06 -0700
Subject: [PATCH v4 50/58] mtd: rawnand: ingenic: retain chip state across
 removal
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-ID: <20261113-submit-rawnand-retained-handle-lifetime-v1-v4-50-556b1d7c6221@gmail.com>
References: <20261113-submit-rawnand-retained-handle-lifetime-v1-v4-0-556b1d7c6221@gmail.com>
In-Reply-To: <20261113-submit-rawnand-retained-handle-lifetime-v1-v4-0-556b1d7c6221@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 James Hilliard <james.hilliard1@gmail.com>, 
 Harvey Hunt <harveyhuntnexus@gmail.com>, linux-mips@vger.kernel.org, 
 Paul Cercueil <paul@crapouillou.net>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261113_102619_664539_326B176C 
X-CRM114-Status: GOOD (  14.44  )
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
