Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E9086074E66
	for <linux-mtd@archiver.kernel.org>; Thu, 12 Nov 2026 01:30:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Du+VMcSc;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NrcFNlyF
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=CIFnDtJjU1m97Pi/30miMiacin5hRTW3/Ck9g863tkg=; b=Du+VMcSctGezdyHF0sqEBUdWC1
	IWhcPbjiRHbLifLzBueeMHrO3CR113NUgp4tbAU4yxz9aMC5j1jRB1rTb1wMqVi+crtpy6MiNOQSi
	eeAKDrITjoOCMEAuKESbSQkdi1G5Ibw4d8wwmzwWfSVFH4BBPQIekDdJQqBMaepIK8KBKOBvjwEcH
	qBPaHcmr0bkrV3Fdp54W1jXsLipSbWi55eAOlMB4yiQvV31v3ZpcDG5Z9t61ifJSmCz0vvtI24yUC
	WBGGdN6y/drVPvmvGLssjnoR1aPeHABV02fa/1uMHYZMgPD5hPef864Zs0y3ckkKCJ4BdyeUyCzIm
	o3zmStAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRJdb-00000008NjO-1BlI;
	Thu, 12 Nov 2026 01:30:03 +0000
Received: from mail-ot1-x334.google.com ([2607:f8b0:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRJco-00000008MGv-0krQ
	for linux-mtd@lists.infradead.org;
	Thu, 12 Nov 2026 01:29:22 +0000
Received: by mail-ot1-x334.google.com with SMTP id 46e09a7af769-85a5455bd3cso2099203a34.3
        for <linux-mtd@lists.infradead.org>; Wed, 11 Nov 2026 17:29:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794446953; x=1795051753; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tdquIJI5TFIgyn6qHtFYCE5BS2Ylwfdjlp7GjhPPIPA=;
        b=NrcFNlyFI6hEfsP8xLsSbJKtFZymhZ4bXN6HIkjqklnHQ7HArFlZ16PznwkGizLPGu
         s0JKU8kf/DUFmg7LoTcrb9uQ37ukBQgOh9iVw3y0ZYI9wAdZSl3wux8Sxp82rCxwWHhk
         NHup0/hQoj8yo8q6w+bmYmNzx52bk8KLhCrIOXNH3PfZoc/dfnxnPTJ6zSR6aeECoJHi
         R1UHG0E+eh27n6UdJLYFPKToiqGjJUH9+w/Eg+kdXEH4KBMkBme1UAIZstyVeFjVzCTb
         Nz3tY7f2Sio1Wl8PV3YGeWc3suWqPjdZ24ptK6AmsJA/gZtO39JQ6ILl6h61spzT8+fg
         2Pwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794446953; x=1795051753;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tdquIJI5TFIgyn6qHtFYCE5BS2Ylwfdjlp7GjhPPIPA=;
        b=q5qJQjmwbbYXH4FzQz5Nxdh47ZKUd3YeY+8busTnMOXcxcNfiCEN5zmrYBngYHecDu
         0hH4p3bP7JahJ2e5O/1neFM6maqOiUVrGH7w3QR5LyhiMPb8TV2ukLSOFPqwCwENDHCW
         Rt7MlH3Jau4UA9nS0SQYg8PO9VTglfWtRJJdeLZsrDwOac36gSa+qgR+Cc2ddcoEPyIi
         D3KtJpzqp886RQDG8JWfVIJivnJ7tLuexhyYumA/9g0w3zenZioD/ugOpDJ1r/wrALfC
         1VLFLFvOlGYBKydKbSLQ+wyccJe9Vr5bZ/ergq9/vsUu16Tr6ExID3sQddTbnXgvXxxz
         vBgg==
X-Gm-Message-State: APuU4Z+9hLTI/ItPuY0zA7IqWgiZa9v7w0eRESbaU/iUFhFSe3/UoRyh
	aq/NCQc1eSsGhNy/JlI24HT1moTG6CId0aadRCJOI0T7GHQh1pfIWx0U
X-Gm-Gg: AYBFou34OuBAuHBlK3hQSRs87Kay1XifVSrBULxC+v/ptxJURpggvwCVQ+BwivWsXEB
	uWuvA8a1r6fsBTnB43yWO1DwHFAKHXuns9gPhiIfVbupoOEvwmw2X5f63drHPx9VQR4ajHcqFHw
	yZpOIPCEsBcv+OYy2DqGVR8CiDJEIcj6B7lQKXayvPL/4z3nxWuPXyvwAhtQ+QAxjva7k/QNNk7
	IBheAiMIrwjhZcTFIquL5JKNnQn+AjgwcUBcrSScSdjoCFGcorp664WVPi1DSkYBiIIk/f5T4t/
	ksxN25bI+dsXRsndg0DhPgnAaxa3MQ/PalIpzOEhgDaOvZBNqe7T79Zf2W63EMHejL6ri0XJbJh
	1kDvQUBXNQAfpyRK575VaoeIajIxyETQbVFCI3RTFqGGrmg2q5+k8BF1d+Trhx3iYVB+XtkRYcL
	iNSJTapzWtG2wEpVyXD+GtAN42/RMQpzp3VF2jkkurVaU0gqpI6kQG0KCUAY+vpu7aNWAyyWBcJ
	5X98y0nfdRdwW16elSeNnf2Bv+S/N9jww9nGATBrqR0pXxx2vpa93FJJb+HA/lJVU+lkTODm5Vb
	byu/5MI3+H0vVDcs06E/WH2mB4vscOdZ+3q3OWxOjGjKzM3ceNLHne7v+nN7n5WUSPbMrQ2O4lt
	dAwFekeu7wrJhZwYfA05MinAxglWTK5XqGapfW/RusTRxWYdkxC1KqqCM1UmswFdWlKgeUuVzAK
	cWNRZlTywAaAvb8oWWJ8KJLxIzcBA5KBIaE8fydLNsnkFJ5y7emJlE6kRyj4F63lRnf+8BMX/mN
	g==
X-Received: by 2002:a05:6808:1246:b0:4bb:ac05:9ebf with SMTP id 5614622812f47-56b961950cfmr3423531b6e.14.1794446948425;
        Wed, 11 Nov 2026 17:29:08 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-56905738049sm6823481b6e.10.2026.11.11.17.29.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 17:29:07 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Wed, 11 Nov 2026 18:28:15 -0700
Subject: [PATCH v3 36/58] mtd: rawnand: renesas: retain open-handle state
 on removal
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261111-submit-rawnand-retained-handle-lifetime-v1-v3-36-ce537999741d@gmail.com>
References: <20261111-submit-rawnand-retained-handle-lifetime-v1-v3-0-ce537999741d@gmail.com>
In-Reply-To: <20261111-submit-rawnand-retained-handle-lifetime-v1-v3-0-ce537999741d@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 James Hilliard <james.hilliard1@gmail.com>, 
 linux-renesas-soc@vger.kernel.org
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261111_172914_766874_E6B6C642 
X-CRM114-Status: GOOD (  15.38  )
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

Keep chip metadata and controller storage alive until the final MTD
reference is released. Unregister and disconnect each published chip
before releasing the resources used by its hardware operations.

Disconnect all chips before dropping runtime PM and transfer buffers.

Run NAND cleanup during disconnection; the final core-owned put only
releases retained allocation and layout data.

Cc: linux-renesas-soc@vger.kernel.org
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/renesas-nand-controller.c | 35 +++++++++++++++++---------
 1 file changed, 23 insertions(+), 12 deletions(-)

diff --git a/drivers/mtd/nand/raw/renesas-nand-controller.c b/drivers/mtd/nand/raw/renesas-nand-controller.c
index 135cdb67a472..8a2a55007148 100644
--- a/drivers/mtd/nand/raw/renesas-nand-controller.c
+++ b/drivers/mtd/nand/raw/renesas-nand-controller.c
@@ -1217,8 +1217,7 @@ static int rnandc_chip_init(struct rnandc *rnandc, struct device_node *np)
 	}
 
 	/* Alloc the driver's NAND chip structure */
-	rnand = devm_kzalloc(rnandc->dev, struct_size(rnand, sels, nsels),
-			     GFP_KERNEL);
+	rnand = kzalloc(struct_size(rnand, sels, nsels), GFP_KERNEL);
 	if (!rnand)
 		return -ENOMEM;
 
@@ -1229,17 +1228,19 @@ static int rnandc_chip_init(struct rnandc *rnandc, struct device_node *np)
 		ret = of_property_read_u32_index(np, "reg", i, &cs);
 		if (ret) {
 			dev_err(rnandc->dev, "Incomplete reg property (%d)\n", ret);
-			return ret;
+			goto free_chip;
 		}
 
 		if (cs >= RNANDC_CS_NUM) {
 			dev_err(rnandc->dev, "Invalid reg property (%d)\n", cs);
-			return -EINVAL;
+			ret = -EINVAL;
+			goto free_chip;
 		}
 
 		if (test_and_set_bit(cs, &rnandc->assigned_cs)) {
 			dev_err(rnandc->dev, "CS %d already assigned\n", cs);
-			return -EINVAL;
+			ret = -EINVAL;
+			goto free_chip;
 		}
 
 		/*
@@ -1257,23 +1258,29 @@ static int rnandc_chip_init(struct rnandc *rnandc, struct device_node *np)
 	mtd->parent_dev = rnandc->dev;
 	if (!mtd->name) {
 		dev_err(rnandc->dev, "Missing MTD label\n");
-		return -EINVAL;
+		ret = -EINVAL;
+		goto free_chip;
 	}
 
 	ret = nand_scan(chip, rnand->nsels);
 	if (ret) {
 		dev_err(rnandc->dev, "Failed to scan the NAND chip (%d)\n", ret);
-		return ret;
+		goto free_chip;
 	}
 
 	ret = rnandc_alloc_dma_buf(rnandc, mtd);
 	if (ret)
 		goto cleanup_nand;
 
+	ret = nand_set_lifetime(chip, container_of(chip, struct rnand_chip, chip));
+	if (ret)
+		goto cleanup_nand;
 	ret = mtd_device_register(mtd, NULL, 0);
 	if (ret) {
 		dev_err(rnandc->dev, "Failed to register MTD device (%d)\n", ret);
-		goto cleanup_nand;
+		nand_disconnect(chip);
+		mtd_put_master(mtd);
+		return ret;
 	}
 
 	list_add_tail(&rnand->node, &rnandc->chips);
@@ -1282,7 +1289,8 @@ static int rnandc_chip_init(struct rnandc *rnandc, struct device_node *np)
 
 cleanup_nand:
 	nand_cleanup(chip);
-
+free_chip:
+	kfree(rnand);
 	return ret;
 }
 
@@ -1296,8 +1304,9 @@ static void rnandc_chips_cleanup(struct rnandc *rnandc)
 		chip = &entry->chip;
 		ret = mtd_device_unregister(nand_to_mtd(chip));
 		WARN_ON(ret);
-		nand_cleanup(chip);
+		nand_disconnect(chip);
 		list_del(&entry->node);
+		mtd_put_master(nand_to_mtd(chip));
 	}
 }
 
@@ -1322,12 +1331,14 @@ static int rnandc_probe(struct platform_device *pdev)
 	struct clk *eclk;
 	int irq, ret;
 
-	rnandc = devm_kzalloc(&pdev->dev, sizeof(*rnandc), GFP_KERNEL);
+	rnandc = kzalloc_obj(*rnandc);
 	if (!rnandc)
 		return -ENOMEM;
+	ret = devm_nand_controller_init(&pdev->dev, &rnandc->controller, rnandc);
+	if (ret)
+		return ret;
 
 	rnandc->dev = &pdev->dev;
-	nand_controller_init(&rnandc->controller);
 	rnandc->controller.ops = &rnandc_ops;
 	INIT_LIST_HEAD(&rnandc->chips);
 	init_completion(&rnandc->complete);

-- 
2.53.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
