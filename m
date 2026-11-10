Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9613D606A944
	for <linux-mtd@archiver.kernel.org>; Tue, 10 Nov 2026 07:46:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=tyHLp8Po;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=CHneQgF3
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=ScOviF9mK34YIvM2Hoy2o44degHwLsu5qqCZzbU2J5U=; b=tyHLp8PoS8Mv23IFNb6JCytWRT
	C3AUu2UCpb41ooqhL3jtp5uuBvEn/0MJC1h3Wnu7LHnT1ff4NLg9Ba155M969Z/EBAGRSV0EIZn6l
	Nk0WGQp6CUGAiFCt84dShNG1sMUVLlDEVxndjxHAy9RypLnm1MUmTwKIKXjjPrRwSraZTaRCEOnWR
	ZLMOt1cGqxHS4TzTvJmIaIvx0YDChfe43o0QXPBt/0dXocdaDJWG/dWJ3a8JFm81816U56BV/ZyDU
	Q6sdNCpSGhUPdNsFocffpQYg/7ixko0SewDFN66okA42U1XixPRkwap6q1wsDyiobFE2K0eb42H9k
	HrSKZI2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQgYo-00000002z3Z-2BSn;
	Tue, 10 Nov 2026 07:46:30 +0000
Received: from mail-oa1-x2f.google.com ([2001:4860:4864:20::2f])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQgXe-00000002xXK-3ZS2
	for linux-mtd@lists.infradead.org;
	Tue, 10 Nov 2026 07:45:25 +0000
Received: by mail-oa1-x2f.google.com with SMTP id 586e51a60fabf-48e9476e26aso650154fac.3
        for <linux-mtd@lists.infradead.org>; Mon, 09 Nov 2026 23:45:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794296717; x=1794901517; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PtoE/q2C4k2NNiMs/Ld1bUT7pKQ3a3d65YuvuOUWKZ4=;
        b=CHneQgF3Y+DqvgVHUW7aXJec82TLYim0XIk4qovlZus7I+i0Sg7MsNcap4/N23C56Y
         ZWuKrfikyoB++Pv5L5lzzWtrm05PjnnIGeGQTeep6xnY8waKZ93+4NLACBKRXJWq+rcY
         VBX398sUGVTNQKjl73QvJvGdFFYxiOk/uoxNNm3nN46NRScLif935aBzeraA2XA+ZG4R
         bCDKhPVPYHNbCF6yqKAh2v3yn2iIMxyJm/R8L6B81C3WaaNrMpGFwKqA58yYR6zAjaDu
         SFOSIeiD0ctW9M+4cjPr9UAcdvA7hcF7H3ytHPTCdXH2Yb2e6UNh/M/Ka+H3MgB2tjMM
         6yjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794296717; x=1794901517;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PtoE/q2C4k2NNiMs/Ld1bUT7pKQ3a3d65YuvuOUWKZ4=;
        b=n9+IkQuIoEQIOvkI1astEGOXiOP9k1jN3NrblsYP6pH5BJqS/vHoq2dTlXLN2Wusv/
         S/9zzFfVpAtq1BVg7eg7Bnk6NXZNe6AJiy5aEwa8eJQXfwaQf5UFvECJVlEcBtTGtz+L
         FlRgAZ+86rUmX+h13IAIoJ5HFxoXN6FLUMXHkfNvCFSghtpW+ZnOLlPf30wg+oQbzA64
         YfjtsnA6AZqbA35q2hE5IHEUCc24m0KaLMgCqI//wcpfcn/ajqy+XOBtnAQ4XVeVB+GZ
         cDkMeu1xTbot+JCV27RPb4xQ07XTs16JMYV00WTyP7eV2jMqTpBZaTt22XjFQTqHKarK
         bf3A==
X-Gm-Message-State: APuU4Z8lOG1vTtfLrW4vq+92XNRG9AA6O2DE/2SVrWijNmCgh1Gr+thl
	0RIIbosVcj4fQBzn2+elp/42Gg+OIpbfNITYQGt86Rm1CsOMW7t9oOBK
X-Gm-Gg: AYBFou25HHGMGk5xLHCTEjkdfLLz0Llr1TYs7h7P9VPzv9n58xocDg+og6KRvkj1Mz7
	54vhEycbiiXeSic/d7397EzVMGQUO/KC66bB0sm3KiRdGyRzpMK8YkJn6NPMntzXt2yDluuE3Gq
	57Z30fvhBA05LP3t7MGhzPO77v3WC8IXRgwNfmBe9EEVFMxOC1zQ7NoAGSuE3y2slYs2hTC+04W
	6bXe1zZZ3Uy1/+8B9MR4htyIIHvUSrODNqxj6qk75fC//R/n3fEoi2zRJ/Jy+hDo/7DaW7cPN9u
	cJHYjxCvxZTNK2yYX7PAaVtZaJZuKoaUrUIGN8C0xpevoexrskKPOaGVd1CoAQmLGLipGrbI4kM
	1pC1smw1J/++4yesW9UGv9iZOiV89pWp18K4S+PHAFDi6AcCam6eIqVgeJWMhnozeB0qN6Novqz
	rdzHcsh5qXBkXo+Oo2CaGiHbidGXLQpq/t0AEAn4n2JXCItitVOMa+15OevTaJppjwGkIWw4w6o
	ojF8RzBj/7JL6vaEVJ5h5oqWV0fGzZGDXWLm+zXNHKnJyyZbgZIxBCJiZ+w+mjVCPXcIrCsTRXE
	WYyO7eAYBCUngFYloUK9T8/UicKlKhmG6oZjNgIzBgyJekAR41jdDWXRSv16goh5r3s/RUUHyEU
	zHe0aecQZeRYTP8ZAnd4Xu3mxtBKuFHjeDRjNcopjH1tQMEJRqpe5ONM2Ui6AMB3UejHk1iWE7A
	3cnOeU9Tqmf+NTVO8OQWKGPZhLh0g79JecDw2Ge+E2JlLD3thusfA=
X-Received: by 2002:a05:6808:13c2:b0:4f4:4de8:9376 with SMTP id 5614622812f47-5683cd9c3f7mr1680606b6e.54.1794296716679;
        Mon, 09 Nov 2026 23:45:16 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-5690504fdb5sm1522804b6e.3.2026.11.09.23.45.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 23:45:16 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Tue, 10 Nov 2026 00:44:53 -0700
Subject: [PATCH v2 50/58] mtd: rawnand: ingenic: retain chip state across
 removal
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261110-submit-rawnand-retained-handle-lifetime-v1-v2-50-9137d08f05df@gmail.com>
References: <20261110-submit-rawnand-retained-handle-lifetime-v1-v2-0-9137d08f05df@gmail.com>
In-Reply-To: <20261110-submit-rawnand-retained-handle-lifetime-v1-v2-0-9137d08f05df@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 James Hilliard <james.hilliard1@gmail.com>, 
 Harvey Hunt <harveyhuntnexus@gmail.com>, linux-mips@vger.kernel.org, 
 Paul Cercueil <paul@crapouillou.net>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261109_234520_662144_556D8DD2 
X-CRM114-Status: GOOD (  15.46  )
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

Cc: Harvey Hunt <harveyhuntnexus@gmail.com>
Cc: linux-mips@vger.kernel.org
Cc: Paul Cercueil <paul@crapouillou.net>
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/ingenic/ingenic_nand_drv.c | 49 +++++++++++++++++++------
 1 file changed, 37 insertions(+), 12 deletions(-)

diff --git a/drivers/mtd/nand/raw/ingenic/ingenic_nand_drv.c b/drivers/mtd/nand/raw/ingenic/ingenic_nand_drv.c
index f1e2c82936b3..775ebf4dd3b9 100644
--- a/drivers/mtd/nand/raw/ingenic/ingenic_nand_drv.c
+++ b/drivers/mtd/nand/raw/ingenic/ingenic_nand_drv.c
@@ -341,6 +341,11 @@ static const struct nand_controller_ops ingenic_nand_controller_ops = {
 	.exec_op = ingenic_nand_exec_op,
 };
 
+static void ingenic_nand_release(struct nand_chip *chip)
+{
+	kfree(to_ingenic_nand(nand_to_mtd(chip)));
+}
+
 static int ingenic_nand_init_chip(struct platform_device *pdev,
 				  struct ingenic_nfc *nfc,
 				  struct device_node *np,
@@ -368,7 +373,7 @@ static int ingenic_nand_init_chip(struct platform_device *pdev,
 	if (IS_ERR(cs->base))
 		return PTR_ERR(cs->base);
 
-	nand = devm_kzalloc(dev, sizeof(*nand), GFP_KERNEL);
+	nand = kzalloc_obj(*nand);
 	if (!nand)
 		return -ENOMEM;
 
@@ -377,7 +382,7 @@ static int ingenic_nand_init_chip(struct platform_device *pdev,
 	if (IS_ERR(nand->busy_gpio)) {
 		ret = PTR_ERR(nand->busy_gpio);
 		dev_err(dev, "failed to request busy GPIO: %d\n", ret);
-		return ret;
+		goto free_chip;
 	}
 
 	nand->wp_gpio = devm_gpiod_get_optional(dev, "wp", GPIOD_OUT_LOW);
@@ -385,15 +390,17 @@ static int ingenic_nand_init_chip(struct platform_device *pdev,
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
 	mtd->dev.parent = dev;
 
 	chip->options = NAND_NO_SUBPAGE_WRITE;
@@ -404,17 +411,27 @@ static int ingenic_nand_init_chip(struct platform_device *pdev,
 	chip->controller->ops = &ingenic_nand_controller_ops;
 	ret = nand_scan(chip, 1);
 	if (ret)
-		return ret;
+		goto free_chip;
+	ret = nand_set_release(chip, ingenic_nand_release);
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
@@ -429,8 +446,9 @@ static void ingenic_nand_cleanup_chips(struct ingenic_nfc *nfc)
 		chip = &ingenic_chip->chip;
 		ret = mtd_device_unregister(nand_to_mtd(chip));
 		WARN_ON(ret);
-		nand_cleanup(chip);
+		nand_disconnect(chip);
 		list_del(&ingenic_chip->chip_list);
+		mtd_put_master(nand_to_mtd(chip));
 	}
 }
 
@@ -461,6 +479,11 @@ static int ingenic_nand_init_chips(struct ingenic_nfc *nfc,
 	return 0;
 }
 
+static void ingenic_nfc_release(struct nand_controller *controller)
+{
+	kfree(to_ingenic_nfc(controller));
+}
+
 static int ingenic_nand_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
@@ -474,9 +497,12 @@ static int ingenic_nand_probe(struct platform_device *pdev)
 		return -ENODEV;
 	}
 
-	nfc = devm_kzalloc(dev, struct_size(nfc, cs, num_banks), GFP_KERNEL);
+	nfc = kzalloc(struct_size(nfc, cs, num_banks), GFP_KERNEL);
 	if (!nfc)
 		return -ENOMEM;
+	ret = devm_nand_controller_init(dev, &nfc->controller, ingenic_nfc_release);
+	if (ret)
+		return ret;
 
 	nfc->soc_info = device_get_match_data(dev);
 	if (!nfc->soc_info)
@@ -493,7 +519,6 @@ static int ingenic_nand_probe(struct platform_device *pdev)
 	nfc->dev = dev;
 	nfc->num_banks = num_banks;
 
-	nand_controller_init(&nfc->controller);
 	INIT_LIST_HEAD(&nfc->chips);
 
 	ret = ingenic_nand_init_chips(nfc, pdev);
@@ -511,10 +536,10 @@ static void ingenic_nand_remove(struct platform_device *pdev)
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
