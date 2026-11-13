Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A63C7606ADB0
	for <linux-mtd@archiver.kernel.org>; Fri, 13 Nov 2026 18:26:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=B1wK7dPG;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=oI/QI8yD
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-ID
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=gi+U/EO/Xex6l4GSrxnZuFmEP43Ew+dM1zqCWPiJ1fo=; b=B1wK7dPGChMXUpN2EbdcEHCGxG
	fnVaWRPK18pIGcwEJ0DCaScLu1Wudr9RXIOSHPEDEGTn01nP6mPfuWYYbNNYqdk6KInve2yVyMnMb
	zlflDC4fa0kF0ytPZzRA2fECZl+F7ebapbqtVDEcObSr0gSLCSE7IYfeqqqyAZhmwuMGeTB+n/vtO
	UWnESaNxwp7VNY2vA3M4KAtCCBq5seFidcuwRlvnarxFWd+Zg90oq0Kwhb7r3lWUEEtZ1UCWgwvnM
	mc1vCCNtJP8T/r62UOvnwOwgkK61pCKVHPvzXuWH9oinDwe+SCtWOfYFPmYUY8XBtJlzudtsJP+t0
	vGfAGfnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRvyt-0000000Dw2W-0Uwy;
	Fri, 13 Nov 2026 18:26:35 +0000
Received: from mail-oa1-x2a.google.com ([2001:4860:4864:20::2a])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRvyp-0000000DvwS-1c24
	for linux-mtd@lists.infradead.org;
	Fri, 13 Nov 2026 18:26:33 +0000
Received: by mail-oa1-x2a.google.com with SMTP id 586e51a60fabf-43bf9548df4so2321729fac.0
        for <linux-mtd@lists.infradead.org>; Fri, 13 Nov 2026 10:26:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794594390; x=1795199190; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oWUwJV+JlBCEZrihlkA2MkXrd5z9pouBqsCsn0XzyXE=;
        b=oI/QI8yDNT5sl32FYR3J0Osy2tAoBvfPTVWxuTmxmAfMZUDZJl0yDw9B1WHdQdeOdx
         isi89iVPSRsiX2FJ5VWZmOgKYe1dhiFrtaym5vlBVkdCmZC2yDSUgk9DCb10WYbT9lAU
         iFBYjziQLTwtS+eAUH98M2MAEb59wCsZAPuOi/GXEHiPO2FRKuTbwtr6ISmEfGY9mS2D
         qnk/d1AUKNeCRiX9OdiJ7eoPg6OvlHApfeykVfxk5k0egcZv55jXDLioJzCrKnlidvF/
         /2WA0pB+raP8xzjVH4DVMuD9gATt8mrB3kOZbsa15c4/wYDl+l1c0XX7w3TNL0IyIFjz
         1hmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794594390; x=1795199190;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oWUwJV+JlBCEZrihlkA2MkXrd5z9pouBqsCsn0XzyXE=;
        b=Gy6irGGX04PhGMGwTDGPU1qUEOe8+aqn5wV/JQ6p0WBCV7vrrz+mo1BV+5Z5GmycL4
         yq8unutbrKHFwgE/1aYnp8JJbJuSwwbMnCV3Cv2k84HmoXpokmH/jwloBDJ56cpqFfTk
         UoTZtHe4nHqu5IU4T54tZLoYkbncSacKj0ADfUDMRhMkMOxRqWDPI7wDdFiy8VLs3gSP
         QekqPTRnyUCxrgX42NTr153bJ2LYqgBqXNKuzeQU5kSuatF9oGs+HqLWiN1izKiXHY5q
         1k47L8crzt+LyxtEoOK1sUuTC8aBEdel9OByeW43HbofUcraNXjMLK7/4XlOVSpv8gUM
         UjQg==
X-Gm-Message-State: APuU4Z99mFgCbj/bqGcAbqNZOl7RVKX9imDlK6/V+gfojxZuLFD+kNxe
	IFOYY0nzad5ikx5TlXoSFj+HH96yOX2G4/TPNbkvFP/XYLrPgxUI8oPS
X-Gm-Gg: AYBFou33Aamb0lUZCLNnGcmEc9l4weuHa47hqWtPfkhMq8G/zp6++QASvAjpW/XAeGm
	G3vneGtsikA4Ijl8Ht4j68+fa/T7DElIlYC2A2yxSl6YwhG6VdO2BOj+qggIgVneJF3LZSvUa2r
	RggYx4e7GJ3tzxmfnJ2YHqZr1iybreUACaNMj8sl/+i7J2OcF5mSwAdVwUcgeskkq7zMygd+dI2
	6qeo5ZLUCHJy6QQZweTLDiQaYcfwXBfjBMayUGMIGVrrUtTCMn2A+QWE+JrQkCiglsUZEWoVl4k
	ODZpm/4NaNzVNdMbLKO+y8w7kh5WMA8xTU7pDdZhns4Vt+oJbls40abi8i55ff22kJSlNlV7Oz9
	UIG1VtbpSDce/9RaCnJbiJ2/ZWzM0M2tzogA3oy9mACbydZmjEfgb/Aa/GvJWWBCEdcyT96+7St
	Ckum/4ftm6z95ros2TX5MsmyxYruhG8bJe7Q3Is+4dAVbV9tlkujyBSTDFtDKz5lKXKNk9MWsIC
	M3cKGrSg5NgY/0i1Ji+TVZ7kH5CSLRRmz54xEbLY1u+2NhsWrR6CkjbisCLcS1hNVUDJwgjO81m
	I22XLJSu3bHuATX7XFj4vCx2CdZS9C8DauPshd2amq0QP+3OwLPX/sqPO0qMJHVDMusySjWx1f1
	yt5+xbVa02pBXcTA+Pip6ZJi1dHpaWVvopnWsX8n2eUGoIHjZJImxEt9kEjyfhcGuXmrZ01FXio
	UxD2PCrjUgip3RqVKx+i6acmgLiObiBeUEr2MlZP3nikZZjiM/SEg=
X-Received: by 2002:a05:6871:453:b0:4ad:6057:560e with SMTP id 586e51a60fabf-4afdf0b94bemr3315722fac.8.1794594390099;
        Fri, 13 Nov 2026 10:26:30 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4afe2011c25sm1887061fac.2.2026.11.13.10.26.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 10:26:29 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Fri, 13 Nov 2026 11:15:11 -0700
Subject: [PATCH v4 55/58] mtd: rawnand: r852: retain chip state across
 removal
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-ID: <20261113-submit-rawnand-retained-handle-lifetime-v1-v4-55-556b1d7c6221@gmail.com>
References: <20261113-submit-rawnand-retained-handle-lifetime-v1-v4-0-556b1d7c6221@gmail.com>
In-Reply-To: <20261113-submit-rawnand-retained-handle-lifetime-v1-v4-0-556b1d7c6221@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 James Hilliard <james.hilliard1@gmail.com>, 
 Maxim Levitsky <maximlevitsky@gmail.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261113_102631_746651_348995A5 
X-CRM114-Status: GOOD (  25.17  )
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

A removed card can still have open MTD handles. Reinitializing the same
nand_chip for a newly inserted card lets those handles access
replacement media, while freeing it during PCI removal leaves dangling
references.

Allocate a fresh chip for every insertion and separate SmartMedia
scanning from publication so lifetime ownership is installed first.
Disconnect the old chip before disabling its hardware, and retain it and
the controller until their final MTD reference is released. Stop
IRQ-driven card-work scheduling before destroying the workqueue during
PCI removal.

Run NAND cleanup during disconnection; the final core-owned put only
releases retained allocation and layout data.

Cc: Maxim Levitsky <maximlevitsky@gmail.com>
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/r852.c      | 103 +++++++++++++++++++++++----------------
 drivers/mtd/nand/raw/r852.h      |   1 +
 drivers/mtd/nand/raw/sm_common.c |  15 ++----
 drivers/mtd/nand/raw/sm_common.h |   2 +-
 4 files changed, 65 insertions(+), 56 deletions(-)

diff --git a/drivers/mtd/nand/raw/r852.c b/drivers/mtd/nand/raw/r852.c
index 566662d45c2c..3c3161bc4b30 100644
--- a/drivers/mtd/nand/raw/r852.c
+++ b/drivers/mtd/nand/raw/r852.c
@@ -625,16 +625,29 @@ static void r852_update_media_status(struct r852_device *dev)
 	spin_unlock_irqrestore(&dev->irqlock, flags);
 }
 
-/*
- * Register the nand device
- * Called when the card is detected
- */
+/* Register a new chip instance for each inserted card. */
 static int r852_register_nand_device(struct r852_device *dev)
 {
-	struct mtd_info *mtd = nand_to_mtd(dev->chip);
+	struct nand_chip *chip;
+	struct mtd_info *mtd;
+	int ret;
 
 	WARN_ON(dev->card_registered);
 
+	chip = kzalloc_obj(*chip);
+	if (!chip)
+		goto error1;
+
+	chip->legacy.cmd_ctrl = r852_cmdctl;
+	chip->legacy.waitfunc = r852_wait;
+	chip->legacy.dev_ready = r852_ready;
+	chip->legacy.read_byte = r852_read_byte;
+	chip->legacy.read_buf = r852_read_buf;
+	chip->legacy.write_buf = r852_write_buf;
+	chip->controller = &dev->controller;
+	nand_set_controller_data(chip, dev);
+	dev->chip = chip;
+	mtd = nand_to_mtd(chip);
 	mtd->parent_dev = &dev->pci_dev->dev;
 
 	if (dev->readonly)
@@ -642,8 +655,17 @@ static int r852_register_nand_device(struct r852_device *dev)
 
 	r852_engine_enable(dev);
 
-	if (sm_register_device(mtd, dev->sm))
-		goto error1;
+	ret = sm_scan_device(mtd, dev->sm);
+	if (ret)
+		goto free_chip;
+	ret = nand_set_lifetime(chip, chip);
+	if (ret) {
+		nand_cleanup(chip);
+		goto free_chip;
+	}
+	ret = mtd_device_register(mtd, NULL, 0);
+	if (ret)
+		goto put_chip;
 
 	if (device_create_file(mtd->dev, &dev_attr_media_type)) {
 		message("can't create media type sysfs attribute");
@@ -653,8 +675,15 @@ static int r852_register_nand_device(struct r852_device *dev)
 	dev->card_registered = 1;
 	return 0;
 error3:
-	WARN_ON(mtd_device_unregister(nand_to_mtd(dev->chip)));
-	nand_cleanup(dev->chip);
+	WARN_ON(mtd_device_unregister(mtd));
+put_chip:
+	nand_disconnect(chip);
+	dev->chip = NULL;
+	mtd_put_master(mtd);
+	goto error1;
+free_chip:
+	dev->chip = NULL;
+	kfree(chip);
 error1:
 	/* Force card redetect */
 	dev->card_detected = 0;
@@ -667,16 +696,19 @@ static int r852_register_nand_device(struct r852_device *dev)
 
 static void r852_unregister_nand_device(struct r852_device *dev)
 {
-	struct mtd_info *mtd = nand_to_mtd(dev->chip);
+	struct mtd_info *mtd;
 
 	if (!dev->card_registered)
 		return;
+	mtd = nand_to_mtd(dev->chip);
 
 	device_remove_file(mtd->dev, &dev_attr_media_type);
 	WARN_ON(mtd_device_unregister(mtd));
-	nand_cleanup(dev->chip);
+	nand_disconnect(dev->chip);
 	r852_engine_disable(dev);
+	dev->chip = NULL;
 	dev->card_registered = 0;
+	mtd_put_master(mtd);
 }
 
 /* Card state updater */
@@ -734,7 +766,7 @@ static irqreturn_t r852_irq(int irq, void *data)
 	card_status = r852_read_reg(dev, R852_CARD_IRQ_STA);
 	r852_write_reg(dev, R852_CARD_IRQ_STA, card_status);
 
-	if (card_status & (R852_CARD_IRQ_INSERT|R852_CARD_IRQ_REMOVE)) {
+	if (card_status & (R852_CARD_IRQ_INSERT | R852_CARD_IRQ_REMOVE)) {
 
 		ret = IRQ_HANDLED;
 		dev->card_detected = !!(card_status & R852_CARD_IRQ_INSERT);
@@ -752,8 +784,10 @@ static irqreturn_t r852_irq(int irq, void *data)
 
 		/* let, card state to settle a bit, and then do the work */
 		dev->card_unstable = 1;
-		queue_delayed_work(dev->card_workqueue,
-			&dev->card_detect_work, msecs_to_jiffies(100));
+		if (!dev->removing)
+			queue_delayed_work(dev->card_workqueue,
+					   &dev->card_detect_work,
+					   msecs_to_jiffies(100));
 		goto out;
 	}
 
@@ -844,7 +878,6 @@ static const struct nand_controller_ops r852_ops = {
 static int  r852_probe(struct pci_dev *pci_dev, const struct pci_device_id *id)
 {
 	int error;
-	struct nand_chip *chip;
 	struct r852_device *dev;
 
 	/* pci initialization */
@@ -866,42 +899,27 @@ static int  r852_probe(struct pci_dev *pci_dev, const struct pci_device_id *id)
 
 	error = -ENOMEM;
 
-	/* init nand chip, but register it only on card insert */
-	chip = kzalloc_obj(struct nand_chip);
-
-	if (!chip)
-		goto error4;
-
-	/* commands */
-	chip->legacy.cmd_ctrl = r852_cmdctl;
-	chip->legacy.waitfunc = r852_wait;
-	chip->legacy.dev_ready = r852_ready;
-
-	/* I/O */
-	chip->legacy.read_byte = r852_read_byte;
-	chip->legacy.read_buf = r852_read_buf;
-	chip->legacy.write_buf = r852_write_buf;
-
 	/* init our device structure */
 	dev = kzalloc_obj(struct r852_device);
 
 	if (!dev)
-		goto error5;
+		goto error4;
+	error = devm_nand_controller_init(&pci_dev->dev, &dev->controller, dev);
+	if (error)
+		goto error4;
 
-	nand_set_controller_data(chip, dev);
-	dev->chip = chip;
 	dev->pci_dev = pci_dev;
 	pci_set_drvdata(pci_dev, dev);
 
-	nand_controller_init(&dev->controller);
 	dev->controller.ops = &r852_ops;
-	chip->controller = &dev->controller;
 
 	dev->bounce_buffer = dma_alloc_coherent(&pci_dev->dev, R852_DMA_LEN,
 		&dev->phys_bounce_buffer, GFP_KERNEL);
 
-	if (!dev->bounce_buffer)
+	if (!dev->bounce_buffer) {
+		error = -ENOMEM;
 		goto error6;
+	}
 
 
 	error = -ENODEV;
@@ -961,9 +979,6 @@ static int  r852_probe(struct pci_dev *pci_dev, const struct pci_device_id *id)
 	dma_free_coherent(&pci_dev->dev, R852_DMA_LEN, dev->bounce_buffer,
 			  dev->phys_bounce_buffer);
 error6:
-	kfree(dev);
-error5:
-	kfree(chip);
 error4:
 	pci_release_regions(pci_dev);
 error3:
@@ -976,6 +991,11 @@ static int  r852_probe(struct pci_dev *pci_dev, const struct pci_device_id *id)
 static void r852_remove(struct pci_dev *pci_dev)
 {
 	struct r852_device *dev = pci_get_drvdata(pci_dev);
+	unsigned long flags;
+
+	spin_lock_irqsave(&dev->irqlock, flags);
+	dev->removing = true;
+	spin_unlock_irqrestore(&dev->irqlock, flags);
 
 	/* Stop detect workqueue -
 		we are going to unregister the device anyway*/
@@ -995,9 +1015,6 @@ static void r852_remove(struct pci_dev *pci_dev)
 	dma_free_coherent(&pci_dev->dev, R852_DMA_LEN, dev->bounce_buffer,
 			  dev->phys_bounce_buffer);
 
-	kfree(dev->chip);
-	kfree(dev);
-
 	/* Shutdown the PCI device */
 	pci_release_regions(pci_dev);
 	pci_disable_device(pci_dev);
diff --git a/drivers/mtd/nand/raw/r852.h b/drivers/mtd/nand/raw/r852.h
index 96fe301d15da..a89ab61ea51e 100644
--- a/drivers/mtd/nand/raw/r852.h
+++ b/drivers/mtd/nand/raw/r852.h
@@ -128,6 +128,7 @@ struct r852_device {
 	struct delayed_work card_detect_work;
 	struct workqueue_struct *card_workqueue;
 	int card_registered;		/* card registered with mtd */
+	bool removing;			/* stop card work during PCI removal */
 	int card_detected;		/* card detected in slot */
 	int card_unstable;		/* whenever the card is inserted,
 					   is not known yet */
diff --git a/drivers/mtd/nand/raw/sm_common.c b/drivers/mtd/nand/raw/sm_common.c
index e238784c8c3e..a79e3c3c77d1 100644
--- a/drivers/mtd/nand/raw/sm_common.c
+++ b/drivers/mtd/nand/raw/sm_common.c
@@ -182,28 +182,19 @@ static const struct nand_controller_ops sm_controller_ops = {
 	.attach_chip = sm_attach_chip,
 };
 
-int sm_register_device(struct mtd_info *mtd, int smartmedia)
+int sm_scan_device(struct mtd_info *mtd, int smartmedia)
 {
 	struct nand_chip *chip = mtd_to_nand(mtd);
 	struct nand_flash_dev *flash_ids;
-	int ret;
 
 	chip->options |= NAND_SKIP_BBTSCAN;
 
 	/* Scan for card properties */
 	chip->legacy.dummy_controller.ops = &sm_controller_ops;
 	flash_ids = smartmedia ? nand_smartmedia_flash_ids : nand_xd_flash_ids;
-	ret = nand_scan_with_ids(chip, 1, flash_ids);
-	if (ret)
-		return ret;
-
-	ret = mtd_device_register(mtd, NULL, 0);
-	if (ret)
-		nand_cleanup(chip);
-
-	return ret;
+	return nand_scan_with_ids(chip, 1, flash_ids);
 }
-EXPORT_SYMBOL_GPL(sm_register_device);
+EXPORT_SYMBOL_GPL(sm_scan_device);
 
 MODULE_LICENSE("GPL");
 MODULE_AUTHOR("Maxim Levitsky <maximlevitsky@gmail.com>");
diff --git a/drivers/mtd/nand/raw/sm_common.h b/drivers/mtd/nand/raw/sm_common.h
index 57fc9f86f9ee..d8a330d6b730 100644
--- a/drivers/mtd/nand/raw/sm_common.h
+++ b/drivers/mtd/nand/raw/sm_common.h
@@ -33,7 +33,7 @@ struct sm_oob {
 #define SM_SMALL_OOB_SIZE	8
 
 
-int sm_register_device(struct mtd_info *mtd, int smartmedia);
+int sm_scan_device(struct mtd_info *mtd, int smartmedia);
 
 
 static inline int sm_sector_valid(struct sm_oob *oob)

-- 
2.53.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
