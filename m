Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1AC6606A887
	for <linux-mtd@archiver.kernel.org>; Thu, 12 Nov 2026 01:30:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ZNdraEo6;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=iIUDv70y
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=w6fSJ8BPjd5IxYL+odhoASoI8fVMpO64Ny8E8PyrvJs=; b=ZNdraEo67broxN5ABXtDUk/7az
	8cPVbqO/t33vs3cUUHsjJk8rgaIUSXDPz2p90oMr7HkrqivVLh2h3QkteyssFcOq6V/UAjOkSf+Mz
	xG8MRfwfVRAW1sZwaSP2g/jAcHAO7pRx9akAX8y2dVvLXeAVaDJgjt5iOCqb8jwVmDw69Vk5nCYvY
	zNPo6ebNk7d7AmuowejHI78DeK80DPWBiWqSz7phTLT6DmlS0V/CbAuxTZgNkBGkLdu5v1A9vVkS+
	nR6aGmcSS8KfYUffcDidGN/3Tg1JmTZIG94Cimb+XZXSZaDRn1NlzI9skeurv43/qgzHrRfR9hefy
	MoMzcpZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRJdt-00000008OHb-0mdK;
	Thu, 12 Nov 2026 01:30:21 +0000
Received: from mail-oi1-x236.google.com ([2607:f8b0:4864:20::236])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRJd3-00000008Mk7-0MeK
	for linux-mtd@lists.infradead.org;
	Thu, 12 Nov 2026 01:29:40 +0000
Received: by mail-oi1-x236.google.com with SMTP id 5614622812f47-53c156ba662so1936790b6e.1
        for <linux-mtd@lists.infradead.org>; Wed, 11 Nov 2026 17:29:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794446968; x=1795051768; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2riwwIuDITOXYtuG9XDP+0W9d4KCwIC3n7aRF44epYw=;
        b=iIUDv70yrmZhR6P6jWormYPgZ3JnFVU9dr08fO1oaN6tMy6X3z3t/15X9NVvSgzVxo
         aRYuDzv3qgxnVje57MQIaPJNOSLCkdqmGoUHP5aDkKeOlnEqr3+nQeqUbWzIMSIVtlcz
         D34/frdu0geQakm6ZQiOa4tTq7608DpkAT3KL7NV68dXYhbtu3goKxcSEJN4qYyiDKBf
         ZnDyKPz1l2XkngkIOWdjtHdFiY1587aKREwIo0I6LwVO4V7VY/ZYJZh2GzpPQ1CxNqvS
         NOkYJEEHAL+nE3vlTUX4TGgajCIQrr3kOZ1uIDnQu8yxdIuWsRKAmw8QySZzkNTkV0vM
         Ieaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794446968; x=1795051768;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2riwwIuDITOXYtuG9XDP+0W9d4KCwIC3n7aRF44epYw=;
        b=pjzW33x2BDGpsYdp8mML2OipNYWDHea+FoVbMp8hwzZyWr4XIRW0htdR6m27YIzC/V
         lgU8O1vdokey0A/SusBQmx/ITDf2nVKUXGg+w9NL/mYsckn9+l00DvwFwDPZAtF/UVNl
         Dw723gUY3m33fuH7B1kTZhRD9sdkEaNqFqL9sbSEanONQJHg63PJLovAyYuDEnS7IkDl
         58qhb41vw2yOzNJWQTuRmRVFMaTX0uZyOygpk2qUH8+5HQQamZfb63iShYNTXunBVFvo
         s/vnpA15aO8UOJoosW7SNkXtbd8kjEV1Lmr4lLcf9hr5aefMlPNShMDuY4BN5N7OnJFo
         45AQ==
X-Gm-Message-State: APuU4Z/XeVDLlyt0EKvltOnMASplS+jLwoWsKCvNxapW/cyegLWcoOo9
	MBTAluRzJgXkyz/l63dpRyLr1dert4o18/0nySNEt17Qh+139XLL9AE7
X-Gm-Gg: AYBFou0HS+TvyzfosYVHClxlxA/6WAsoVnmD8S0zh16jyESI724q9YX93no8dGBdWz2
	g/WN7TWII4SYaENWZpHZBl+rznVr+trk2wqWBmmf9grm50HyYGOaNvXXDXSC3QdJgPpdeYe913F
	MGbL/G5+hqrA83E+3D1CARG/cZU+zeLt3Q8ZL0OIMLVWbHMOEsejh+a0yb8en/AHP3sNpwj0MWO
	fBMCbWga3p3oqUDKOPDINsBSNSklAq8YEFrVOL43zP8YNkqT2bGFosFx10ID9DN/NUuREKitV7+
	MaF8Dax4Y+iHprXBnZTkI+F1m8CTanFFKfKl/ooonFRURVpJL4BChVuBpjiNfDtQ2F8DRQDKnD6
	9dh5hV/VBlx9Y87vdV06pCTsQ7QPJ7WwRgYhSjBRXTIDA/GwKM9UGlGowqKdTqmzuPNGon9ncTB
	irVLNq5PPWOFJ2lOhXNMBdUTZ+1EEz1vXaBIdYAFpx1eKExq1QEYaK1ICCdakWYv1e42ChELglf
	3UQFhZO0NllYb0Y97+CdrvlUoN0brTraAIv3JSTMdpEQwTxs0FsOt2vZwu78Grk8SEmFu80TwNh
	GbUvNt8ot/sZYgdLxi+9uKeXMyGC+AT+x6BGnLs9ntT8tyhIbeAUv1OHRoifEswOzNk78ms59Cq
	XF86yvgB+PYHpSjImmmu+SlFaO9KCsFbmFRaMShNhKlBZOXGyzwO4SMkiMlcfaHFjeK8NwT1aOu
	SV/54LRABJ99DxuQR9iIVRFa0k2TbNvLgWl/BTl7HtDW2UTYmOZXE+
X-Received: by 2002:a05:6808:f12:b0:569:5c3:d578 with SMTP id 5614622812f47-56b93243299mr4395163b6e.9.1794446963491;
        Wed, 11 Nov 2026 17:29:23 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-56905738049sm6823481b6e.10.2026.11.11.17.29.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 17:29:22 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Wed, 11 Nov 2026 18:28:29 -0700
Subject: [PATCH v3 50/58] mtd: rawnand: ingenic: retain chip state across
 removal
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261111-submit-rawnand-retained-handle-lifetime-v1-v3-50-ce537999741d@gmail.com>
References: <20261111-submit-rawnand-retained-handle-lifetime-v1-v3-0-ce537999741d@gmail.com>
In-Reply-To: <20261111-submit-rawnand-retained-handle-lifetime-v1-v3-0-ce537999741d@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 James Hilliard <james.hilliard1@gmail.com>, 
 Harvey Hunt <harveyhuntnexus@gmail.com>, linux-mips@vger.kernel.org, 
 Paul Cercueil <paul@crapouillou.net>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261111_172934_750564_B95A37F9 
X-CRM114-Status: GOOD (  14.88  )
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
