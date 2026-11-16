Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7518606A8AC
	for <linux-mtd@archiver.kernel.org>; Mon, 16 Nov 2026 06:31:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=nQx5n6BB;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WPVyg215
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=Jsasm4Zv3HMlavjOBYtJaIgiDoxa+1u1sOMpM+hN+/Q=; b=nQx5n6BBKdcdAFicvEIIegJSw3
	WnS6mb5ED0MNy2SeKWktvhPyQ0E2SAPhXiCJNuSd2JMqHu1eC1qz/NFcpotQDYzuP5d2SHQnGpRPX
	I92vUnVwDwbPDuKCjMT9vsAdKlaJxeWBYvVPhIxLq9gwGAfKGQDJV/dI1Ui1KCBMKXBfcy9pDdjBX
	4t30Ym0F3vIVfCC4ksMydrOKNd7LDcam84EtVV2kzlmARfzYJWeCZwy0WHB1Y958qOl/pVk4isP+h
	0o8Zx/Jxw3CxiK3J1RmVWuPSp0/NM+BwVRZFM2nsiD2gnhURjBEaEZ36nWQY3Ep3UXTCnzKRRvBKW
	U4aZhsHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSqF5-00000001Gk0-46KF;
	Mon, 16 Nov 2026 06:31:04 +0000
Received: from mail-oo1-xc2b.google.com ([2607:f8b0:4864:20::c2b])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSqEb-00000001FqS-0sWR
	for linux-mtd@lists.infradead.org;
	Mon, 16 Nov 2026 06:30:37 +0000
Received: by mail-oo1-xc2b.google.com with SMTP id 006d021491bc7-6b1afdf5196so1046785eaf.2
        for <linux-mtd@lists.infradead.org>; Sun, 15 Nov 2026 22:30:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794810632; x=1795415432; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/RbITScvmyfE/Fkxqbl633jAaoI3LnbBlJcMHpQ8T4s=;
        b=WPVyg215y09aji2OtIUYuVALJxi86A3xwrwNniVW1KuHtTH8XXL04eLOr2u/UzXhsZ
         i9WXeskVVjv6dRqqGU5NHHGKMqAbDTmqZyUjB1V4Q1nPCWYCVzouw4zw0r7Hg73dBEph
         FBzCFCog+1/aGXKg9zFLnt43cveksbkz5XE3Gq3Cp17PNd3EZYxx1T+2fSoYtApt/v9y
         AZCEZ8H69s4DrwxXF0KqV8pUsJe4WMS79kz1klNeuQBydW6Pzg3Q5p8NiKP0hYZqHUUz
         XEUTZarb+/XdieKDsIOzrHgruCXZbP699FTqJX5ZvnKFrBJN+jKv7kdKN6UNFu5WAZ5t
         FEnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794810632; x=1795415432;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/RbITScvmyfE/Fkxqbl633jAaoI3LnbBlJcMHpQ8T4s=;
        b=uwikkbuOyplzMSxIhlv0iSvJYUX14cLnvq/oercdSHgND2aNvc63N0AXGDb+DgmTUM
         sybwbU3ShJk7x26KEWrS0DN052q0FGqbLuYsyDilJDOk3eXIRB/fRPCIaAA0pryWKL9p
         7lixFWVjEUyLtGRXTQ/rvc5NOqW3ew0DOCIwyddcaprjOF7qGiYGFrarAgigSvAnCOHU
         t7dBY9gv906SBVwcpH3DNkGYeJqiCaXRBoPT9YIG8EZocEuyGSXqwJXgJ7Z7jXNb+Ckj
         JrL1kUytQO7awPA38iMnqZXS1j0KN+amipY6eN44GggWxwWqqPvFvUftfe9dNj6BUAIu
         RJQw==
X-Gm-Message-State: APuU4Z8M/50eNWyhC/2Ewq9BMaRBeHyvaMqIRutN60HNEE1MI9F2xcEI
	zzwNWX6PLhRoxTqC0/go8ZEXbKeIXRDGBAiqSrdgMsVCQcAqsg5FhoYu
X-Gm-Gg: AYBFou2Z54mlCt3jXgAisjJECFwRy7zhdXOUFJMuOIItCXo5CR43MrBH1gxI+xMKrs5
	DoCuQGG1TNJBRUNejlpUSM9RRN//784TyStqJbro6TIZpEc/EBOIF6jq4bgjLC6kD2CErohWw9g
	Fol9Gc8y6PEHyo5MqIiXFy00mjwFeDfe2vbg3HlZHDkHYkwyoKZKBCKuZ9GL+amKHcQtX0hdQbg
	F9lmKLK29V+f3eAt18Qzoy7D8hlbqUORhtFkQ9fArOn5t0gjehy/z8q1cBuCMNG0F+2NxMGDCoB
	ALHvEdksrB/oWSqDXNDaX1MSdy3fdsWHaADbTuUvmLuiewGzhkWdUEPVkUC0/NPdP9YRCRM2rYH
	mWLa1f2k71reY3+Q2XF83fd+ivBU8jLNm9iItRiQxjPnEMSFRvOLX8FhfU8JgOF6Hz358BvmaBF
	lw3m3SFWS7WJkgociPonF2GNlCrfKt6hjtYzEU8QiMZH/q+J33gUlDyrazAhuD2Lt0KoMlMuMuh
	gK4JBVxpc9AXIgiLQI/L9Ys85rJdHz5yeAxa1TClXu79EwD3yXWUq69SZMdZThWoRkWx3YqvGSS
	ZsA9zvnsRiKCXQtYgZskm+abs8ll0yaZzrcbJ404EhNe8JmT9B2dE04WubvKnfNsdPXFTiVSYKL
	bwD8nUQ1ARCy1fm5fjdhQ0yMQ/t7vRwOFeGcRij2Hql+olsk470iacIB4cXaAH+0J838m24Lfr8
	OU1S57sli7UQqSS8DMShdwncKpxmv7ZuctwoArbottMBvgn2dTECc=
X-Received: by 2002:a05:6820:1381:b0:71a:e932:8688 with SMTP id 006d021491bc7-71ae93289demr2085637eaf.41.1794810632331;
        Sun, 15 Nov 2026 22:30:32 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-71ab42c41e9sm7994558eaf.6.2026.11.15.22.30.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 22:30:31 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 15 Nov 2026 23:29:53 -0700
Subject: [PATCH v5 38/58] mtd: rawnand: cadence: retain open-handle state
 on removal
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261115-submit-rawnand-retained-handle-lifetime-v1-v5-38-cbc49c5c5e74@gmail.com>
References: <20261115-submit-rawnand-retained-handle-lifetime-v1-v5-0-cbc49c5c5e74@gmail.com>
In-Reply-To: <20261115-submit-rawnand-retained-handle-lifetime-v1-v5-0-cbc49c5c5e74@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.17-dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261115_223034_276438_94EAE6E1 
X-CRM114-Status: GOOD (  15.65  )
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
