Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72FE3606A883
	for <linux-mtd@archiver.kernel.org>; Fri, 13 Nov 2026 18:16:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=cPuo5aTT;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=pvP1nKG0;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=oF/74AL0
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=3837wqjhTTSk+NA/3JhO62LBCqrEiVpklRBEyZVkR5w=; b=cPuo5aTT9rGWpC8+47O4ajNbzg
	ltGyWdS6d2ojAHs1o5JjlM+QRaMCnzRT3iWqn/xHT0K+dwzhiphZmwTCEAipt0ivl0q2gAzcnHYt3
	n4RA7wX602+LnLQ6futGiezmCkGlWWXTOJx1oBH2i9MwRXsbnoEN9QbBFsbJbfxJMo5ry3M+kJQTa
	IGcXqwHcZhMNs3tyWcnHOYx9s/6quS3SOWt1inS+n9+3gmshQKK3R4qSRQB9xZRCYjeDUzQEneCCi
	4SLwTV9qv590h6GmXvyV5nRwkpVyDE62QF4DZa8UNDGy4KPAWskbEXEUSDm291qsWGBpH08pOfGMy
	Zq8dRJcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRvpT-0000000Dt1m-28hT;
	Fri, 13 Nov 2026 18:16:51 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRvp1-0000000DsFZ-3Z5U
	for linux-mtd@bombadil.infradead.org;
	Fri, 13 Nov 2026 18:16:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=+OFEjQApaoiTgPpS/OsG2Bydz2dTAP/bVvX613SxTag=; b=pvP1nKG0cYcTqWgAQQFFAoZu/O
	TTgxeML5y7tsIl/szEWj/KUhIAxtnq6kaRuGUzj33fDxthMkKVpMbd7W95ITRayP33Bflr8YEHsAY
	QH/6layXO6FDecdAYvPd6G3SoMWp3s4hoRQEKKMz4SsZHcnfbN0tn0rJ5Zw2w2BzjBdd3gTFZ/zGR
	fMUqIO6tWB91W0CJp7oB1V1iyRcvPytsBZAa5PUdkXysgV+LglzUPhxQ4b4TZJgwvAsP8yOWwcePr
	t5LORUnOgFyASPwa0H5q1BMBytfzS6foC2HM44DpLa88RT3btVC/GjacTyyvIXKEk8+Nd2S+Ff76v
	aTbw9iWQ==;
Received: from mail-ot1-x32f.google.com ([2607:f8b0:4864:20::32f])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRvoz-0000000BdqM-0ERC
	for linux-mtd@lists.infradead.org;
	Fri, 13 Nov 2026 18:16:22 +0000
Received: by mail-ot1-x32f.google.com with SMTP id 46e09a7af769-844a8bf7e25so1710577a34.1
        for <linux-mtd@lists.infradead.org>; Fri, 13 Nov 2026 10:16:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794593779; x=1795198579; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+OFEjQApaoiTgPpS/OsG2Bydz2dTAP/bVvX613SxTag=;
        b=oF/74AL01G5vq9XJKcjRBU75V8/BdZGCuwVSm7rNrrBXy6CbkZe7/N6HK6M0p9Q6aF
         DVmQkH38GHPdBy5ZgfoHZRQk0QaQKGHZro94mCx1Mke0gcFmiiR19fCQyge05h/2zUDn
         NQgJFOpkAAwR293InKMMjhjGMbNezpE8/XZg97LnhT812oTfbgQsJuLoXVsQQh5NXsJ6
         VJ8y/DXJ/W0X/ZmVIHv5VocriwZx1wO1vsGmm1D9l11Jsl283vaqz4Z1fVq+Q4mAVaq/
         lTpRyQ/KMuVQIVwKl5f3CiqpA9pv8VakF2c9Jftiu6oaP9QoSOBiQYslAvAEJ7VkMz+B
         8NoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794593779; x=1795198579;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+OFEjQApaoiTgPpS/OsG2Bydz2dTAP/bVvX613SxTag=;
        b=ZyVOR/AAkc2slRKjXIVerNX+8RsLxgj7QHGQ3BalwRzBZXf4dFVwWAUDc/+CDauDsI
         HzMf1l/naeyLeHCrr6+FBjzqoCBySsImC5gNN3A1X95XEAZcQlR42sy9E+ey0KPrHBkQ
         p11mb3zAwIbxEdo5Fp1AAuKrJltW2ra9VVRlmLOMw/sc2GVSY4j9ARt+9GfvR3S+5sGt
         QaGDF1PxZsnfK1Ggp3HBmxfVKP7sNlrBpKiBMitqaNff3385HfXn6n6Pu/oPw5eEWcR5
         buE27Kn7QgSIwHSQxgRKB5aDq41BXynHXGNT4u+xDLiOaVxPqrqy9g2WSiStcgSUfVV2
         GRqA==
X-Gm-Message-State: APuU4Z/2OIsjdXMF3J5FRI5k9S67yModopLdsfZgmQtBZ18hDgzkukSc
	bgH/O9UzVq+SJK/9Xirb4+FFpAjRWSDjSZggfwCpzp+aZA1rfHB5SxVp
X-Gm-Gg: AYBFou2hmX4uvPa4eZCgdleR5DpmHwALUk8FXVFfxHOetUWQNlwG6E+km5Dd9p1Hw7b
	XmVoVqcHXEL8yeuMEQxmQABjVWCA3l5GoVZMddARWiIq7wuK/5I1qIhKoTLi3nZ+t78jsTCRDhn
	ZE2kxN+HzPZ69EUltMA46PH1zSMIDtdgpYDVcloYfYJakkrbQIX5Xsyw5CUX3QKC9JfAtgOZW6r
	SGK2zG2hQMeLcaD5FV20x2npCfbB3/od5Ytg7A6xjBz2bQ2xnmwfVBzn6CCtL4sRxGNk6HCDeBX
	bNxsT8cWZGVrRgfhTnmOEWImwiVP5NekRgaKX7D9nWMdC8fmxDkaO4jZiC91MB66XmVligQnufV
	XZVLT3UclZ/5HzA7o7dd7V5LTnC/jG/ZakBCb7XHOIxEDxojb2P0Wm9UWSYGiXtOa5PZx7xa8OE
	C0oUh8pWlRHg+kdkeDimWW8jMFoMXk+79LQ1YrAGAUy+Voi5AJWAoj9yGjzERzcbVjXAAP0OrEQ
	hRD8yyPYnO8gj4+RvuY6rPUvJ3h974eu/el8vAL4mBRzsN+FXH9VNeOBHDOMWnKjuE/oxs3lliK
	OSiy6WRcpRJ1SFXGZj7b9kMEWmXx8A8h/KyKY1gQzb01TTaB6phskoDosxd0/h25Ab29t9cTyFx
	c3XG9eM497P8X5nndzqNLdXo2t6+yZupZury/Cwh3eYNCwzIAfvZa16OeAid8hrN/14M02DvHHS
	fEeyTwaMCT4RLeOTIjXLNy8bF4rxN1mI3ayqa/pWAVE6KskaAJU84=
X-Received: by 2002:a05:6830:411c:b0:861:55b8:68d7 with SMTP id 46e09a7af769-86289828d11mr2760027a34.7.1794593779150;
        Fri, 13 Nov 2026 10:16:19 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-8628817d979sm3253414a34.22.2026.11.13.10.16.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 10:16:18 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Fri, 13 Nov 2026 11:14:57 -0700
Subject: [PATCH v4 41/58] mtd: rawnand: brcmnand: retain open-handle state
 on removal
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261113-submit-rawnand-retained-handle-lifetime-v1-v4-41-556b1d7c6221@gmail.com>
References: <20261113-submit-rawnand-retained-handle-lifetime-v1-v4-0-556b1d7c6221@gmail.com>
In-Reply-To: <20261113-submit-rawnand-retained-handle-lifetime-v1-v4-0-556b1d7c6221@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 James Hilliard <james.hilliard1@gmail.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Brian Norris <computersforpeace@gmail.com>, 
 Kamal Dasu <kamal.dasu@broadcom.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261113_181621_120003_4C9E0FFC 
X-CRM114-Status: GOOD (  17.03  )
X-Spam-Score: 0.1 (/)
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

Keep chip metadata and controller storage alive until the final MTD
reference is released. Unregister and disconnect each published chip
before releasing the resources used by its hardware operations.

Unwind previously registered chip-selects on probe failure.

Run NAND cleanup during disconnection; the final core-owned put only
releases retained allocation and layout data.

Cc: Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
Cc: Brian Norris <computersforpeace@gmail.com>
Cc: Kamal Dasu <kamal.dasu@broadcom.com>
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/brcmnand/brcmnand.c | 63 +++++++++++++++++++++-----------
 1 file changed, 42 insertions(+), 21 deletions(-)

diff --git a/drivers/mtd/nand/raw/brcmnand/brcmnand.c b/drivers/mtd/nand/raw/brcmnand/brcmnand.c
index 0378014da6d2..8b2ffe5d44af 100644
--- a/drivers/mtd/nand/raw/brcmnand/brcmnand.c
+++ b/drivers/mtd/nand/raw/brcmnand/brcmnand.c
@@ -3093,10 +3093,11 @@ static int brcmnand_init_cs(struct brcmnand_host *host,
 	nand_set_controller_data(chip, host);
 	mtd->name = devm_kasprintf(dev, GFP_KERNEL, "brcmnand.%d",
 				   host->cs);
-	if (!mtd->name)
-		return -ENOMEM;
+	if (!mtd->name) {
+		ret = -ENOMEM;
+		goto free_host;
+	}
 
-	mtd->owner = THIS_MODULE;
 	mtd->parent_dev = dev;
 
 	chip->ecc.engine_type = NAND_ECC_ENGINE_TYPE_ON_HOST;
@@ -3123,13 +3124,24 @@ static int brcmnand_init_cs(struct brcmnand_host *host,
 
 	ret = nand_scan(chip, 1);
 	if (ret)
-		return ret;
+		goto free_host;
 
-	ret = mtd_device_parse_register(mtd, part_probe_types, NULL, NULL, 0);
-	if (ret)
+	ret = nand_set_lifetime(chip, container_of(chip, struct brcmnand_host, chip));
+	if (ret) {
 		nand_cleanup(chip);
+		goto free_host;
+	}
+	ret = mtd_device_parse_register(mtd, part_probe_types, NULL, NULL, 0);
+	if (ret) {
+		nand_disconnect(chip);
+		mtd_put_master(mtd);
+	}
 
 	return ret;
+
+free_host:
+	kfree(host);
+	return ret;
 }
 
 static void brcmnand_save_restore_cs_config(struct brcmnand_host *host,
@@ -3294,6 +3306,21 @@ static int brcmnand_edu_setup(struct platform_device *pdev)
 	return 0;
 }
 
+static void brcmnand_chips_cleanup(struct brcmnand_controller *ctrl)
+{
+	struct brcmnand_host *host, *tmp;
+
+	list_for_each_entry_safe(host, tmp, &ctrl->host_list, node) {
+		struct nand_chip *chip = &host->chip;
+		struct mtd_info *mtd = nand_to_mtd(chip);
+
+		WARN_ON(mtd_device_unregister(mtd));
+		nand_disconnect(chip);
+		list_del(&host->node);
+		mtd_put_master(mtd);
+	}
+}
+
 int brcmnand_probe(struct platform_device *pdev, struct brcmnand_soc *soc)
 {
 	struct brcmnand_platform_data *pd = dev_get_platdata(&pdev->dev);
@@ -3307,9 +3334,12 @@ int brcmnand_probe(struct platform_device *pdev, struct brcmnand_soc *soc)
 	if (dn && !of_match_node(brcmnand_of_match, dn))
 		return -ENODEV;
 
-	ctrl = devm_kzalloc(dev, sizeof(*ctrl), GFP_KERNEL);
+	ctrl = kzalloc_obj(*ctrl);
 	if (!ctrl)
 		return -ENOMEM;
+	ret = devm_nand_controller_init(dev, &ctrl->controller, ctrl);
+	if (ret)
+		return ret;
 
 	dev_set_drvdata(dev, ctrl);
 	ctrl->dev = dev;
@@ -3324,7 +3354,6 @@ int brcmnand_probe(struct platform_device *pdev, struct brcmnand_soc *soc)
 	init_completion(&ctrl->done);
 	init_completion(&ctrl->dma_done);
 	init_completion(&ctrl->edu_done);
-	nand_controller_init(&ctrl->controller);
 	ctrl->controller.ops = &brcmnand_controller_ops;
 	INIT_LIST_HEAD(&ctrl->host_list);
 
@@ -3489,7 +3518,7 @@ int brcmnand_probe(struct platform_device *pdev, struct brcmnand_soc *soc)
 	for_each_available_child_of_node_scoped(dn, child) {
 		if (of_device_is_compatible(child, "brcm,nandcs")) {
 
-			host = devm_kzalloc(dev, sizeof(*host), GFP_KERNEL);
+			host = kzalloc_obj(*host);
 			if (!host) {
 				ret = -ENOMEM;
 				goto err;
@@ -3500,7 +3529,7 @@ int brcmnand_probe(struct platform_device *pdev, struct brcmnand_soc *soc)
 			ret = of_property_read_u32(child, "reg", &host->cs);
 			if (ret) {
 				dev_err(dev, "can't get chip-select\n");
-				devm_kfree(dev, host);
+				kfree(host);
 				continue;
 			}
 
@@ -3511,7 +3540,6 @@ int brcmnand_probe(struct platform_device *pdev, struct brcmnand_soc *soc)
 				if (ret == -EPROBE_DEFER)
 					goto err;
 
-				devm_kfree(dev, host);
 				continue; /* Try all chip-selects */
 			}
 
@@ -3528,7 +3556,7 @@ int brcmnand_probe(struct platform_device *pdev, struct brcmnand_soc *soc)
 	}
 
 	/* If we got there we must have been probing via platform data */
-	host = devm_kzalloc(dev, sizeof(*host), GFP_KERNEL);
+	host = kzalloc_obj(*host);
 	if (!host) {
 		ret = -ENOMEM;
 		goto err;
@@ -3554,6 +3582,7 @@ int brcmnand_probe(struct platform_device *pdev, struct brcmnand_soc *soc)
 	return 0;
 
 err:
+	brcmnand_chips_cleanup(ctrl);
 	clk_disable_unprepare(ctrl->clk);
 	return ret;
 
@@ -3563,16 +3592,8 @@ EXPORT_SYMBOL_GPL(brcmnand_probe);
 void brcmnand_remove(struct platform_device *pdev)
 {
 	struct brcmnand_controller *ctrl = dev_get_drvdata(&pdev->dev);
-	struct brcmnand_host *host;
-	struct nand_chip *chip;
-	int ret;
 
-	list_for_each_entry(host, &ctrl->host_list, node) {
-		chip = &host->chip;
-		ret = mtd_device_unregister(nand_to_mtd(chip));
-		WARN_ON(ret);
-		nand_cleanup(chip);
-	}
+	brcmnand_chips_cleanup(ctrl);
 
 	clk_disable_unprepare(ctrl->clk);
 

-- 
2.53.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
