Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C7B3606D966
	for <linux-mtd@archiver.kernel.org>; Mon, 16 Nov 2026 06:30:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=3A7BZ34r;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=poLecLck
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=dAM0S9XkLaecNilSj9h6d/mNwjybFb/FQcbQfuagZh8=; b=3A7BZ34rP/aSDJGaITWVO5+f3j
	Zq9Roy1fimvWiMOGR1eyvZVnPlCP2xCbEVSq6gewz3YY64xb1dah7cIcSW5MtZYaJ5S52DoA2nduQ
	gN7Y7X2+brpxvdMiAhKWDp4swupyajIfAQkfnmSXI2oEknCf7DdEdiwdW0IOpQtyn+3cK2Xndoqug
	OzdNP4JzdvhTu2vaL1StNm4i8kikVjVyCO3gC+I3XK4WwSiCzVpZJaaaK/pGnjxSt1vXTSu/IzSmL
	UKbmYA4PCim4WHALlE/SiO1Sk2wrEQy5hCAE82PSrZzD+CXhyXPD/UyRLbjmn8QSZF/M6B87+pju2
	Wux7ZPDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSqEn-00000001GHh-3BYx;
	Mon, 16 Nov 2026 06:30:45 +0000
Received: from mail-oo1-xc2f.google.com ([2607:f8b0:4864:20::c2f])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSqEX-00000001Flx-26LY
	for linux-mtd@lists.infradead.org;
	Mon, 16 Nov 2026 06:30:30 +0000
Received: by mail-oo1-xc2f.google.com with SMTP id 006d021491bc7-71acdd32a53so634965eaf.3
        for <linux-mtd@lists.infradead.org>; Sun, 15 Nov 2026 22:30:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794810629; x=1795415429; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5mPUHEVu65L+xu4Mh38b6InONgI5Ier43hx3eUD05eE=;
        b=poLecLck8hRVQ1RzYd0riQgKXPx+IuicH88iuweLZZrSDTq4/aQ38tjNrH3XYbrS2q
         ZHhMWxKZlgyca84VO+2Mlopz7dgo4XuN24rle+YL5/q7zl2FIGwIuxFOBIBgRoSHg3GO
         v9WjritUIHeTCaz1ZS/m9cuRSVSPBIm2ml7j7FOYvgPXHOxASM7c2F7DXc3O14oLVFxx
         QBmDYpaH5K4K7evm/baqFx18suWV7Tc6GbHhXA1l3Co+4tEntfD4wcmHq6jRSlPJkIgA
         tANjyi9s3QmlcR5XyCnD8iN/efeG7M3lSW4GmD0xNrw4vBOgYlFcDt06/tDf4JWlIarh
         fbAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794810629; x=1795415429;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5mPUHEVu65L+xu4Mh38b6InONgI5Ier43hx3eUD05eE=;
        b=Mo1wAYV6HzFQzR5khhzOXeIM3n+giUWVkpy/FyNQp4Ewm22OXnqlgs3ON3osqNdbly
         zALI7ujx1bEApC2FUdi+2KZLFeWbXNTqc9G7n4ZMcgdGkHnDsJEFNJQzWGk3az0oFO2A
         vF6/GG4eqdu+7kiOd7NmPcIzoy1ENDZ6wOnb8QfD3wAKuxswaMUDCW1QNnYtGaq5OA3p
         T/3n4j1Qj2wEn2lj+dN1Lv+7ZPLKRepLU0cBOmRj1PP7/+uPVoWPgGYHES9Kuve8tVaf
         hEZAsKOurtTCH7o/hF7etzGqa3lUUK9dAPbCOuuFOlIuARhcACMeCAymPv+82UjlTzMH
         uu4A==
X-Gm-Message-State: APuU4Z+2lbFI+0kmbsSJJRONtp00dZdJjJMBd/OodjTq3RlQTaAwW33t
	N/ACj/PwwD6t8MJnOzLkkk5sOVkP/U7w6bbalCYQNm4AkEFc7X62JDoJ
X-Gm-Gg: AYBFou1P83p4orkx2SIg7m1aM10wxMMJrUcs5d6bNHJQlX4TekLhn08FHtiECM3sBSX
	FyxBeBTsu9QbmwRaXYcbEnXR4nkAlaVGchOVR0W5iSjYgK+qvG4Qyq2G8Vi2TszObMJMERCzkt5
	bQ81Yos7R5ENCiVuCm9RGDzSH1n3R3RS3sWbpfMk6d+T+7Aa5hpkQGh4f5tap4RXm/B2qilbGvi
	G3JJZcCZevOY97RbHs9ZEyCixMotp74PQp+DhHiEgo7FsZhmRDlFRfPs7hSGCGRPG6kazfHh/f+
	we+G/SfMYvMRBZTnqL2TOGoa8DRdsJPS46TslWccwLOFQ0UDiU2D+foZDGqhsYuA8XE3qhduhNC
	ql9iV6RBKrTfPmznOeBOHyEQBtuiSUi0vGmtZN43yaVmx3vjgg2hIf4CXDM/lYJQ7KLxcN9QjY0
	Oz35CvE1Tam6I7w02Ojn1G7RsS2WDl2Ney0gHBAnW6A/morXomcpLGSVf6aO/ELXLbfVvAvuota
	9q49fqhFE9/vmu1B/eDQ04QsgbfxAQsff0S+y3OKbeGe+ve508zBmx6oSo/9/zCfcuNwNnhBKLN
	thGIhn1lZbKSSQjG0cfgOjwGcmk1qZBCXJ0W76RjIqlcZdAOfcoxBJ750iaFiZzzIAkM1hDhD76
	aThSSv+uU/cVJmoWZqvt04LMp6AjJT0i6e/dyBIxSZ/SNQU1Zy1dJ9FO+FJJVIEXsrG2NcFTSj+
	FfYFJ1WDg4LUS6qKl9N0wyhGwraWEMqS4beGai5swayFpznXA8zHzD
X-Received: by 2002:a05:6820:1353:b0:71a:e96b:d510 with SMTP id 006d021491bc7-71ae96bdd7dmr2063803eaf.23.1794810628588;
        Sun, 15 Nov 2026 22:30:28 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-71ab42c41e9sm7994558eaf.6.2026.11.15.22.30.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 22:30:28 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 15 Nov 2026 23:29:50 -0700
Subject: [PATCH v5 35/58] mtd: rawnand: marvell: retain open-handle state
 on removal
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261115-submit-rawnand-retained-handle-lifetime-v1-v5-35-cbc49c5c5e74@gmail.com>
References: <20261115-submit-rawnand-retained-handle-lifetime-v1-v5-0-cbc49c5c5e74@gmail.com>
In-Reply-To: <20261115-submit-rawnand-retained-handle-lifetime-v1-v5-0-cbc49c5c5e74@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.17-dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261115_223029_553348_29166472 
X-CRM114-Status: GOOD (  15.50  )
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

Retain the layout metadata used by OOB queries and unlink before put.

Run NAND cleanup during disconnection; the final core-owned put only
releases retained allocation and layout data.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/marvell_nand.c | 44 ++++++++++++++++++++++++-------------
 1 file changed, 29 insertions(+), 15 deletions(-)

diff --git a/drivers/mtd/nand/raw/marvell_nand.c b/drivers/mtd/nand/raw/marvell_nand.c
index 56350209f7e0..7bd5537d6b62 100644
--- a/drivers/mtd/nand/raw/marvell_nand.c
+++ b/drivers/mtd/nand/raw/marvell_nand.c
@@ -2630,9 +2630,7 @@ static int marvell_nand_chip_init(struct device *dev, struct marvell_nfc *nfc,
 	}
 
 	/* Alloc the nand chip structure */
-	marvell_nand = devm_kzalloc(dev,
-				    struct_size(marvell_nand, sels, nsels),
-				    GFP_KERNEL);
+	marvell_nand = kzalloc(struct_size(marvell_nand, sels, nsels), GFP_KERNEL);
 	if (!marvell_nand) {
 		dev_err(dev, "could not allocate chip structure\n");
 		return -ENOMEM;
@@ -2654,19 +2652,21 @@ static int marvell_nand_chip_init(struct device *dev, struct marvell_nfc *nfc,
 			if (ret) {
 				dev_err(dev, "could not retrieve reg property: %d\n",
 					ret);
-				return ret;
+				goto free_chip;
 			}
 		}
 
 		if (cs >= nfc->caps->max_cs_nb) {
 			dev_err(dev, "invalid reg value: %u (max CS = %d)\n",
 				cs, nfc->caps->max_cs_nb);
-			return -EINVAL;
+			ret = -EINVAL;
+			goto free_chip;
 		}
 
 		if (test_and_set_bit(cs, &nfc->assigned_cs)) {
 			dev_err(dev, "CS %d already assigned\n", cs);
-			return -EINVAL;
+			ret = -EINVAL;
+			goto free_chip;
 		}
 
 		/*
@@ -2688,7 +2688,8 @@ static int marvell_nand_chip_init(struct device *dev, struct marvell_nfc *nfc,
 			marvell_nand->sels[i].ndcb0_csel = NDCB0_CSEL;
 			break;
 		default:
-			return -EINVAL;
+			ret = -EINVAL;
+			goto free_chip;
 		}
 
 		/* Retrieve RB id */
@@ -2702,14 +2703,15 @@ static int marvell_nand_chip_init(struct device *dev, struct marvell_nfc *nfc,
 				dev_err(dev,
 					"could not retrieve RB property: %d\n",
 					ret);
-				return ret;
+				goto free_chip;
 			}
 		}
 
 		if (rb >= nfc->caps->max_rb_nb) {
 			dev_err(dev, "invalid reg value: %u (max RB = %d)\n",
 				rb, nfc->caps->max_rb_nb);
-			return -EINVAL;
+			ret = -EINVAL;
+			goto free_chip;
 		}
 
 		marvell_nand->sels[i].rb = rb;
@@ -2737,9 +2739,14 @@ static int marvell_nand_chip_init(struct device *dev, struct marvell_nfc *nfc,
 	ret = nand_scan(chip, marvell_nand->nsels);
 	if (ret) {
 		dev_err(dev, "could not scan the nand chip\n");
-		return ret;
+		goto free_chip;
 	}
 
+	ret = nand_set_lifetime(chip, container_of(chip, struct marvell_nand_chip, chip));
+	if (ret) {
+		nand_cleanup(chip);
+		goto free_chip;
+	}
 	if (pdata)
 		/* Legacy bindings support only one chip */
 		ret = mtd_device_register(mtd, pdata->parts, pdata->nr_parts);
@@ -2747,13 +2754,18 @@ static int marvell_nand_chip_init(struct device *dev, struct marvell_nfc *nfc,
 		ret = mtd_device_register(mtd, NULL, 0);
 	if (ret) {
 		dev_err(dev, "failed to register mtd device: %d\n", ret);
-		nand_cleanup(chip);
+		nand_disconnect(chip);
+		mtd_put_master(mtd);
 		return ret;
 	}
 
 	list_add_tail(&marvell_nand->node, &nfc->chips);
 
 	return 0;
+
+free_chip:
+	kfree(marvell_nand);
+	return ret;
 }
 
 static void marvell_nand_chips_cleanup(struct marvell_nfc *nfc)
@@ -2766,8 +2778,9 @@ static void marvell_nand_chips_cleanup(struct marvell_nfc *nfc)
 		chip = &entry->chip;
 		ret = mtd_device_unregister(nand_to_mtd(chip));
 		WARN_ON(ret);
-		nand_cleanup(chip);
+		nand_disconnect(chip);
 		list_del(&entry->node);
+		mtd_put_master(nand_to_mtd(chip));
 	}
 }
 
@@ -2939,13 +2952,14 @@ static int marvell_nfc_probe(struct platform_device *pdev)
 	int ret;
 	int irq;
 
-	nfc = devm_kzalloc(&pdev->dev, sizeof(struct marvell_nfc),
-			   GFP_KERNEL);
+	nfc = kzalloc_obj(*nfc);
 	if (!nfc)
 		return -ENOMEM;
+	ret = devm_nand_controller_init(dev, &nfc->controller, nfc);
+	if (ret)
+		return ret;
 
 	nfc->dev = dev;
-	nand_controller_init(&nfc->controller);
 	nfc->controller.ops = &marvell_nand_controller_ops;
 	INIT_LIST_HEAD(&nfc->chips);
 

-- 
2.53.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
