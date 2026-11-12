Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A253606A880
	for <linux-mtd@archiver.kernel.org>; Thu, 12 Nov 2026 01:29:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=r8619ohV;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=rJ5xfrbP;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=l4v/EBha
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=3837wqjhTTSk+NA/3JhO62LBCqrEiVpklRBEyZVkR5w=; b=r8619ohVg6v2ZVdse6p8JrKsEa
	fy8vOaGc9aQexoGlheA3rG+qS87WjtlwR7JRUgHAwUrOe0L9Yfr5wIdHAp3CA/c/z1HgqBNIpoFhq
	/HYt5VVV3wNBOuDJh28TzNeKO3fj8I6MkeU3ScH5uWak6srSqQhD7fBIFS2MnSvJtlxEYeJtIz/Qc
	OyoP663AQrF0NgKddKDDVrzmu3oQjpw6niqv8gvG498H2FrrMAcWXbcEbEHKH4dbaSDWjYoS3K8E+
	8mVDjq7i3P230QeVsc3d2IUlrSL+5Mtaj+jbhUreZZo2BIZmcQRbFz7rUIrPfb1pevcLuD/3zsiYw
	kcTmvAKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRJdV-00000008NYj-3CZt;
	Thu, 12 Nov 2026 01:29:57 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRJcs-00000008MPF-2k3t
	for linux-mtd@bombadil.infradead.org;
	Thu, 12 Nov 2026 01:29:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=+OFEjQApaoiTgPpS/OsG2Bydz2dTAP/bVvX613SxTag=; b=rJ5xfrbPWlLysEmlML3/XZ2Pyr
	0hk6JA2aj0atTLa5fFmk0/eUeqpZk5opzzXj52qhphuePgW/efpyl2as7Sd2h8MjAljmXH9kOfucC
	Hr/6g+JBz05ISAilIbJIeXXTG6+mCve6vn2XbK6KFS+qK+7ZZchisZolnS1aC4beg4glIoaXYoldG
	2hYgPITon6M8egeDzjwEkYgV5Xj19YD8snx5EkJbAB8QsLpfswDUk82LhroLxySz9QfscWRfWkmsi
	Un2MGvtUDJSYK1qZIrqOxCRFXxBmYjYdnk9EtQWvNhT+XbjgKqvh918ZQAmeopI0ZDYfNSw7GP09B
	nrYr00hA==;
Received: from mail-oi1-x22c.google.com ([2607:f8b0:4864:20::22c])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRJcp-00000009mtd-3EU1
	for linux-mtd@lists.infradead.org;
	Thu, 12 Nov 2026 01:29:17 +0000
Received: by mail-oi1-x22c.google.com with SMTP id 5614622812f47-53ec9237600so1849537b6e.3
        for <linux-mtd@lists.infradead.org>; Wed, 11 Nov 2026 17:29:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794446954; x=1795051754; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+OFEjQApaoiTgPpS/OsG2Bydz2dTAP/bVvX613SxTag=;
        b=l4v/EBha6PRVloCFhBL8HgcocwUHa/NmVz7ZA+ThaxblohKOySMwniSiE3d/PuWKc4
         UZjQvRVqkDmlk3p/vXpFQDvLsK/hDPgO/3NywQ2K51qsxzxEW/u22iIv0q/lPT40z35f
         fDC0E06SHWlXiT5k0Bo4YUYG8VYb+M0KkUyOF7XOgXmJb9P23uDwhvXOqcsIQlQCrW+S
         T74ZsVnV+1nIiAVQd7wWwWAq1qe2lyrX8UBvRkxKsppZCV4HzrUseTnuE5vJOyLKRTAX
         4tEMv81eruWSNiY0MZXLNqPTYGLelYnu9evu2x2ReWUw/m1HLCJ5cZczgpdpuu4NbzHC
         XFsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794446954; x=1795051754;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+OFEjQApaoiTgPpS/OsG2Bydz2dTAP/bVvX613SxTag=;
        b=l2i4LRm94vMwQJfjOcrysGTKzHhhoEgsDHRFw7kBz78YY5qLkxjMg2y8ArhxWFbiqJ
         vJsLW5hT+ZXcED9Z+UPvOeJwnJfBME3Crq72u6h5YsGS1IF3kU8O0ZCK0F9w3aE3Hn56
         OL3OjfwXr50KI5EFbamzjjNVuuo32n9kN3WiwwuaAPNHdaS7lyhI3zqAIDlmAyN4wb8l
         lfsVppQ8BUhgpgpGFj+Y2Lonj7/FoIDJKR6CGvnL1xeayR4vMxJ3MBRrEA3NopA1EQPo
         OkOrTklPSrYgyfzyJJhDVKlS47geTY754UOasx0IazPtBT8IWUw7flDmTFJ8QUtwaETa
         hBuw==
X-Gm-Message-State: APuU4Z+LcarAmwlYKAKSL5LeJ1T/ATUW4XRc40vVwXIZz5N877cY2AWs
	2gZUX9S5kLwO9ky2VjS/NiKsNEes92itd8rK1AAN+an6+nNdk+Bpjyi3
X-Gm-Gg: AYBFou0RLBo9bchkn+6Uiuw2kWn6WwkH5Fv4QjjiR329FBJQZ9OIBiftI8ZQQxDhPZj
	Pdwd7kRYfBxtB7GxsQMNoka0TfbD5A3Fm/ogq/INmaCyIWyf/vKEJdyo5/H927Tvl/UX7ByCFHi
	9xllrsvcVVlxwHoayAlLUakXVx/suiXm+L6QztcNSly08EMcdVdvUZHAloGdmmkTNiO2WjuLTUi
	9PtGOtF7Y3UkX3vxjrEzF4sXv6ILc0JWqd/feXm6euulyLTK/G37URjC47Ox37K1YRkk900Dl7w
	/rx0gr3ECUDbFrXhRQ8FIgUZqtezaXgjV/UvJlqJTEnTssIjZhpBZfY6Kyug07jtsPTkVXKXiwS
	UTjYj3+Oyt1zt08pPIoHMhaKt2JERI0DogrLIBg2lDP+q7jpDzOhUcHqFD1HGMRIdALOli4Gjli
	2vUL94B8434XWhWen3q6UJtfEa1c70ev6ocXn1j9+jYQxlbEMNI8BW2J6bn6CyHkzOo9zXWn6Tc
	48f3/3kHLSisTi/dY9YxNNuSeHVZgHThkb2PiU0CVzDhSL1H/4UgeBsvXEmXwfyxhu2XEptJEhr
	GCHbhwZG3XS4j9sIEhq+t6rb5xONtDY2YCGKk3C9lF6uOC5XqgG017burGUTZ1lOfiXlOkIh847
	wIOeRUO4MyLg7hB380M909cM2IUstehXAUzZt6U2aRTJ7JLQU8bUz+ybBS4BD6lxckaBRZLoUT+
	FdrkvLAhpEe2RDDDd87cY176B6JMe3v8TVcEBmaU7T+1JTUw9q9fECrgcaIvFb8KSqk3Pzcv9aM
	Q==
X-Received: by 2002:a05:6808:6508:b0:565:343d:7e09 with SMTP id 5614622812f47-56b95b7e2d9mr3691847b6e.30.1794446953851;
        Wed, 11 Nov 2026 17:29:13 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-56905738049sm6823481b6e.10.2026.11.11.17.29.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 17:29:13 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Wed, 11 Nov 2026 18:28:20 -0700
Subject: [PATCH v3 41/58] mtd: rawnand: brcmnand: retain open-handle state
 on removal
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261111-submit-rawnand-retained-handle-lifetime-v1-v3-41-ce537999741d@gmail.com>
References: <20261111-submit-rawnand-retained-handle-lifetime-v1-v3-0-ce537999741d@gmail.com>
In-Reply-To: <20261111-submit-rawnand-retained-handle-lifetime-v1-v3-0-ce537999741d@gmail.com>
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
X-CRM114-CacheID: sfid-20261112_012915_821597_70F3ED71 
X-CRM114-Status: GOOD (  17.74  )
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
