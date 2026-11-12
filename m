Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BDC0606A880
	for <linux-mtd@archiver.kernel.org>; Thu, 12 Nov 2026 01:30:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Ze9Su/e4;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=p7OZHgK/
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=Jsasm4Zv3HMlavjOBYtJaIgiDoxa+1u1sOMpM+hN+/Q=; b=Ze9Su/e4J8bJaXwG5VnJf2wBZO
	Uuev6G0sUBRqtEGXdg7oMNVbIxbrTRrI8ovbNw5rqfmEt8wGxZLRtbCNrKNbPVx0qlsfcm1fS+ekT
	1/iyUVrreqxhwPS1dV6lrusdRChSWNfFVFralDJodIHDqBQaat7Pi/COeO3udFgas+7xikNF9Ised
	ksiYs5DjID8SJ6LawmFENNptSl6HKk6q0R4d0U7bg8t3wEbG5cBMf39YfvVHxeRZjJjpvE7oN8UML
	eYefh1NHjHm0J6co3mjQKF1PWasQ6dLFL8BwC5KZFtGb/pYc436DXjJqfUPyMduxd7aZZ0HIP6eQI
	qb6wdOCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRJdg-00000008Nuw-1XYh;
	Thu, 12 Nov 2026 01:30:08 +0000
Received: from mail-oi1-x229.google.com ([2607:f8b0:4864:20::229])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRJcq-00000008MLE-29we
	for linux-mtd@lists.infradead.org;
	Thu, 12 Nov 2026 01:29:35 +0000
Received: by mail-oi1-x229.google.com with SMTP id 5614622812f47-4af173320f9so2180746b6e.2
        for <linux-mtd@lists.infradead.org>; Wed, 11 Nov 2026 17:29:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794446955; x=1795051755; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/RbITScvmyfE/Fkxqbl633jAaoI3LnbBlJcMHpQ8T4s=;
        b=p7OZHgK/R7HEHIxnbXz8XpEZv2wltYSAfmkRQ9Z88gOo8adc5D7KW8XeL9WUkT+SZr
         eU5V9cKgSuqwy4EUl+5jxHVQ8FxxztP6X/j6L9WUeHaedAfBhtb+TdbxKreiAqsKfuXj
         fVreBoRs+PzKk9eho+RVbPWyJAp8C+ZviMIBrAqGZUKdScisBtR6Z8NApj79rggwN9Er
         uB3CF2rXqixWJH7P+58P3vQMMo37HsgVzYg7HRmxrb5e9B/6yr06Jf6HYgSjyopoqtFn
         n3G0Hiuk/CgjCUzQPvYRKg9XBg10HGUIn135md4vrAam4n8FylU82eJ0saUNW96wE3NR
         9knQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794446955; x=1795051755;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/RbITScvmyfE/Fkxqbl633jAaoI3LnbBlJcMHpQ8T4s=;
        b=ho8wdEsFLMeR1diPMmhdMIvie9iqq1piFnXuMyL9sS3/gu77nWj/PZXoJQaSg2rhvF
         +y/pr3nDQ9CZHVe2dSFn6y+ot+Fd30cAtaJYpYHVmBk3eHZDk8sVbQJgQYrYmmWxRgAs
         KxtVSsqWwSr7DNW3rxOyoSOwNg1Loxq7vl15YaSZjLowtNRzcpy2sRFZKTv5t4NyxMhu
         Nwcfu/4MCyx9oTduDo7eVNZaHkfXpjdkMisXqfgTjB6jW9NbPFqB/NYTk5n+xOFWGPYY
         +AqxdxFbckJp7ddej2+MNbCI1JwFRXvcrMVth8idlQI/Wuo2e0d4TmvRQlFdm1/PTA6G
         Scxg==
X-Gm-Message-State: APuU4Z8RIjwrTBHQoUDRNvhQtw7eZMeyGJ32hxQEhdqxSKZ55QAsYnN7
	ePEs7ontLYlukLAJvnnjqUhadITOCDfon36ZCIw+7krk+IFvuMZusFb8
X-Gm-Gg: AYBFou1UaMesm0H+UbGS16ZBiqFA17fdw3Q0h1gT03kl9kOzZmTQMXdIH95DslNpHfi
	HDbbEnBEXabNjoKO+gyhueksAJeM6k32xPkHqOgieAl+J5E7rSgmSeKznKOj6XW6vOHvJsqC6rA
	pfm4GTJUY47fhI3WquiFUJ1ztjhH02KzhKeW81AFuDtfyyTAu9b9ZfZifvkaiTXgC3YFCNYPFbL
	c36iEqmCqXUQVX0NLLFO7qUCKHGxgyjvieTh7bm2mYBxo6i7b0E8kcKp+r9YfFRjZM+PInEfD7n
	qTJ+bUhDZWKGQl4ow8lZnYmjAVXQI/ImGnG9fu+jDNff5MxSarrjL+sXXvYQ1Qfg89gI4ypf+ZI
	NX89Cq3gPYVyOhle3OaXsPiBx9qLPTTmbIzw4AT4E9pHgxhDFscAfdBxTNf/H0TzL14EMlbtfi8
	xtCZ+qLcG2/VXmpK4BnyOgOLokweJELN/dpws1vtj9iXDzfU+qD+TLG7TWw9OVX5vDn2ohxJaD/
	zSFmW5Kh9GVzyi8TvuSqrm9XyX+vrv9Xxy0ws7A/1dGadXReT/XduKJdKlQG/prOCUT+F9s7XR6
	hdAf9cI5J7g2sem7iFboPnmUif+fYr/lO+d7US4ubV168KXBOEGllqrqAGnjZxrz3IPTHS0XXTX
	pUaNAcPpGyAk634NBsUYf25Jv72Mb9SvwS/cFQz5QsMVGii06/IQG0E7DGUh2mXIDexyMsCM8MT
	+vwF8BkCYV3WbJdTsJyHqF0QK2kO0iP11FgYOXjcEidLe1KODsEJUH
X-Received: by 2002:a05:6808:1819:b0:55c:859:adc with SMTP id 5614622812f47-56b97710429mr4145217b6e.55.1794446950746;
        Wed, 11 Nov 2026 17:29:10 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-56905738049sm6823481b6e.10.2026.11.11.17.29.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 17:29:10 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Wed, 11 Nov 2026 18:28:17 -0700
Subject: [PATCH v3 38/58] mtd: rawnand: cadence: retain open-handle state
 on removal
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261111-submit-rawnand-retained-handle-lifetime-v1-v3-38-ce537999741d@gmail.com>
References: <20261111-submit-rawnand-retained-handle-lifetime-v1-v3-0-ce537999741d@gmail.com>
In-Reply-To: <20261111-submit-rawnand-retained-handle-lifetime-v1-v3-0-ce537999741d@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261111_172916_674064_30B74A21 
X-CRM114-Status: GOOD (  16.12  )
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

Allocate the final shared buffer before publishing any chip.

Run NAND cleanup during disconnection; the final core-owned put only
releases retained allocation and layout data.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/cadence-nand-controller.c | 49 +++++++++++++++++---------
 1 file changed, 33 insertions(+), 16 deletions(-)

diff --git a/drivers/mtd/nand/raw/cadence-nand-controller.c b/drivers/mtd/nand/raw/cadence-nand-controller.c
index 05d0659e6527..4e365ffdf905 100644
--- a/drivers/mtd/nand/raw/cadence-nand-controller.c
+++ b/drivers/mtd/nand/raw/cadence-nand-controller.c
@@ -562,6 +562,7 @@ struct cdns_nand_chip {
 	struct cadence_nand_timings timings;
 	struct nand_chip chip;
 	u8 nsels;
+	bool registered;
 	struct list_head node;
 
 	/*
@@ -3007,9 +3008,7 @@ static int cadence_nand_chip_init(struct cdns_nand_ctrl *cdns_ctrl,
 	}
 
 	/* Allocate the nand chip structure. */
-	cdns_chip = devm_kzalloc(cdns_ctrl->dev, sizeof(*cdns_chip) +
-				 (nsels * sizeof(u8)),
-				 GFP_KERNEL);
+	cdns_chip = kzalloc(struct_size(cdns_chip, cs, nsels), GFP_KERNEL);
 	if (!cdns_chip) {
 		dev_err(cdns_ctrl->dev, "could not allocate chip structure\n");
 		return -ENOMEM;
@@ -3024,20 +3023,22 @@ static int cadence_nand_chip_init(struct cdns_nand_ctrl *cdns_ctrl,
 			dev_err(cdns_ctrl->dev,
 				"could not retrieve reg property: %d\n",
 				ret);
-			return ret;
+			goto free_chip;
 		}
 
 		if (cs >= cdns_ctrl->caps2.max_banks) {
 			dev_err(cdns_ctrl->dev,
 				"invalid reg value: %u (max CS = %d)\n",
 				cs, cdns_ctrl->caps2.max_banks);
-			return -EINVAL;
+			ret = -EINVAL;
+			goto free_chip;
 		}
 
 		if (test_and_set_bit(cs, &cdns_ctrl->assigned_cs)) {
 			dev_err(cdns_ctrl->dev,
 				"CS %d already assigned\n", cs);
-			return -EINVAL;
+			ret = -EINVAL;
+			goto free_chip;
 		}
 
 		cdns_chip->cs[i] = cs;
@@ -3059,20 +3060,22 @@ static int cadence_nand_chip_init(struct cdns_nand_ctrl *cdns_ctrl,
 	ret = nand_scan(chip, cdns_chip->nsels);
 	if (ret) {
 		dev_err(cdns_ctrl->dev, "could not scan the nand chip\n");
-		return ret;
+		goto free_chip;
 	}
 
-	ret = mtd_device_register(mtd, NULL, 0);
+	ret = nand_set_lifetime(chip, cdns_chip);
 	if (ret) {
-		dev_err(cdns_ctrl->dev,
-			"failed to register mtd device: %d\n", ret);
 		nand_cleanup(chip);
-		return ret;
+		goto free_chip;
 	}
 
 	list_add_tail(&cdns_chip->node, &cdns_ctrl->chips);
 
 	return 0;
+
+free_chip:
+	kfree(cdns_chip);
+	return ret;
 }
 
 static void cadence_nand_chips_cleanup(struct cdns_nand_ctrl *cdns_ctrl)
@@ -3083,10 +3086,13 @@ static void cadence_nand_chips_cleanup(struct cdns_nand_ctrl *cdns_ctrl)
 
 	list_for_each_entry_safe(entry, temp, &cdns_ctrl->chips, node) {
 		chip = &entry->chip;
-		ret = mtd_device_unregister(nand_to_mtd(chip));
-		WARN_ON(ret);
-		nand_cleanup(chip);
+		if (entry->registered) {
+			ret = mtd_device_unregister(nand_to_mtd(chip));
+			WARN_ON(ret);
+		}
+		nand_disconnect(chip);
 		list_del(&entry->node);
+		mtd_put_master(nand_to_mtd(chip));
 	}
 }
 
@@ -3127,6 +3133,7 @@ static int cadence_nand_init(struct cdns_nand_ctrl *cdns_ctrl)
 {
 	dma_cap_mask_t mask;
 	struct dma_device *dma_dev;
+	struct cdns_nand_chip *entry;
 	int ret;
 
 	cdns_ctrl->cdma_desc = dma_alloc_coherent(cdns_ctrl->dev,
@@ -3181,7 +3188,6 @@ static int cadence_nand_init(struct cdns_nand_ctrl *cdns_ctrl)
 		goto dma_release_chnl;
 	}
 
-	nand_controller_init(&cdns_ctrl->controller);
 	INIT_LIST_HEAD(&cdns_ctrl->chips);
 
 	cdns_ctrl->controller.ops = &cadence_nand_controller_ops;
@@ -3201,9 +3207,17 @@ static int cadence_nand_init(struct cdns_nand_ctrl *cdns_ctrl)
 		goto unmap_dma_resource;
 	}
 
+	list_for_each_entry(entry, &cdns_ctrl->chips, node) {
+		ret = mtd_device_register(nand_to_mtd(&entry->chip), NULL, 0);
+		if (ret)
+			goto unmap_dma_resource;
+		entry->registered = true;
+	}
+
 	return 0;
 
 unmap_dma_resource:
+	cadence_nand_chips_cleanup(cdns_ctrl);
 	dma_unmap_resource(dma_dev->dev, cdns_ctrl->io.iova_dma,
 			   cdns_ctrl->io.size, DMA_BIDIRECTIONAL, 0);
 
@@ -3275,11 +3289,14 @@ static int cadence_nand_dt_probe(struct platform_device *ofdev)
 		return -ENOMEM;
 	}
 
-	dt = devm_kzalloc(&ofdev->dev, sizeof(*dt), GFP_KERNEL);
+	dt = kzalloc_obj(*dt);
 	if (!dt)
 		return -ENOMEM;
 
 	cdns_ctrl = &dt->cdns_ctrl;
+	ret = devm_nand_controller_init(&ofdev->dev, &cdns_ctrl->controller, dt);
+	if (ret)
+		return ret;
 	cdns_ctrl->caps1 = devdata;
 
 	cdns_ctrl->dev = &ofdev->dev;

-- 
2.53.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
