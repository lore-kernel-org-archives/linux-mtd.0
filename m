Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04985606A334
	for <linux-mtd@archiver.kernel.org>; Thu, 12 Nov 2026 01:30:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=lzQ2A84Q;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=BD64O9jy;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=n8FjxxQv
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=gi+U/EO/Xex6l4GSrxnZuFmEP43Ew+dM1zqCWPiJ1fo=; b=lzQ2A84Qmh+pz4Ffc4c0YlcGFm
	9l7qVtOhznBGp90JVSq29YMVXAqxGT3G8h3mAQYjl6VSe6pH9OxESCKMqzOCyBwaCfKCV1MeLQjsu
	5AVyKI8CoUQto8/axwtpva6HErnzT/fyAvg9AYumNoki6yiGMrR3GQ79whbmQoNcC0wu/ct16UNVo
	vEiR7cK8CgigH53EAV9kAcXGo2s/c2ekGC3kfUSkxj+LOg4NDE+VW9kcb7/DkULFSUmUbAKfG0q6w
	9/nCwCUVrjDz4HB57259koUWT9CT7pd50OMkRxwqlJmC0M8HbaM9ZjJyC9RCyo17ThBp5rTE9smzC
	uTDlczxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRJe5-00000008Oiu-1of7;
	Thu, 12 Nov 2026 01:30:33 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRJdL-00000008NBe-3Vuj
	for linux-mtd@bombadil.infradead.org;
	Thu, 12 Nov 2026 01:29:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=oWUwJV+JlBCEZrihlkA2MkXrd5z9pouBqsCsn0XzyXE=; b=BD64O9jyWsZVmQV5XKTjvMoiud
	StIrpKCPf4cD3r4v98Pm6pDSoCbdwcfu0n11eLFIiu7kqG5kVgGJPkCKBQveHl6CO67UwIDRQjKWA
	HI9rOE/HkzKZCx0q23oY5l9DrQzN1f3hpxieiG6bQ2cQjbrUwVYqEF45QKLJqJwZKBlVjPNnmQ6DS
	vO0hWf6Rs/AgB69KacHPFawEMQJ3+i9I5//sWmiVdAmpQF/ePkHaIjPBmEvyev9uMmwjrBTNVvKFW
	0xwjZ7jj8F3yk24NEUwV2FNGIjslCbfgA6GRQF0Y40di36s+8Z7WvaMB28IqT3/b7GtPxswLaLUtc
	ytPHvlcw==;
Received: from mail-oi1-x235.google.com ([2607:f8b0:4864:20::235])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRJd5-00000009mzB-1FRG
	for linux-mtd@lists.infradead.org;
	Thu, 12 Nov 2026 01:29:45 +0000
Received: by mail-oi1-x235.google.com with SMTP id 5614622812f47-51f2e9e6987so276020b6e.1
        for <linux-mtd@lists.infradead.org>; Wed, 11 Nov 2026 17:29:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794446969; x=1795051769; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oWUwJV+JlBCEZrihlkA2MkXrd5z9pouBqsCsn0XzyXE=;
        b=n8FjxxQvpBNmcbI2FDv4/HAYyiHwy9z3/1i5THGkHe88+4ErSxb8fkctgZWgYLa4Lw
         cG0SBSzMEBKeaTbc/Sufs4mIkwX8DBopD+tO9sJj4YegC+UubKoSV6VvSGgOwwUj97Ow
         UTa0G0yKWb7mic/U+c/4ZqKm/rdGJDLC6cMqBhgZiOkLT216bd0WvrBc4ZmUsV+/1YIb
         AZcIpfItto+9B3NNYF90DcurT0wTkY0s6btd5+a2BBuNt11FNcZuhoMliMrWrzffBd+l
         be8dvjj2GwquiXWjlXi9xmL5NZDb5X/w04RJg2unciU6z2xeDWZrnipG1S47RuTw5tRR
         4IBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794446969; x=1795051769;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oWUwJV+JlBCEZrihlkA2MkXrd5z9pouBqsCsn0XzyXE=;
        b=chm0tQkQJMG4/YKja67L3FQ6dWnGQ3XFtpCMetdCv6CXsz3sYznxMxsxUfsvXzhW1Z
         5btpfPp1XmocstcnQBW6IUYp7DP2RUxiWkEIUydza82r2ZYn7odoxvzAAzWzzavVUvNd
         PdJzedRbQI4nwyPOSPNBTeG4YG4lBs6vij3kI2lUSmZxAkl3t+8TNK84El2tGO1dXFKK
         NQYK2HzNkwbVN7/pLIfJFh/E5twcqHIy5uWoQCKpf4DSILC+ISwyvqG5mTyEJSs2XYZQ
         r4W/2I0OZYYDwYbYyofcCLhEzRR2S5Dqk/bnd3TJx3sxFH9WYGWQIG66juDUuHm/GjEI
         oVlA==
X-Gm-Message-State: APuU4Z/2AwOiqFonMqr0rpb05cLPw9tdQyPeOZHxy833Hme8CId8+4Jh
	rfOMYv5UTpsHRyXJD1GWP4swM9sidgBqlQucuwxJn7DyCRvwFUkcEqvU
X-Gm-Gg: AYBFou1poprjGpdJtuI4E+7Awlt/l8rLdQMDfR5PoU1qrPdR9Ovo5s4mTs0Gz80KVw0
	+QQO+E61MwnAPMzBNz5dj8V8/prIQnqmUqQoMuDKtmNO3gnIuxaRpFCD4LCJKwSTgyRUzGZvvDs
	7SsjsLluJTVAQqphnPFjYnSkyPSuVV54ZWnKa7rQS5vNSbP907PQGI4rK/JuX9RvUwjS+IcvZii
	/qB305Ug7AiyFhzCpzADpbjLx0m9MmAQrtQ44aYyhFP6qbqGHAVsGYiJvEATsumcXc+h4hiOWcx
	GwbVRQUuvBF6tCmU2foCtFTZYCc00AU/+tZXTtdnko4o5gb2Xt106F9sYTAcIbZSSOQV+fITjZS
	cw5Vyinhrq/c5bXyaPoY5lkR8Yw28l0UIV/nvsgCMEaawRZIXu3/aqw7XaX37Dm5uP6wXLTmo+k
	IxVIpKC1lMpWxFJwF86LJ87XyAQfbzU0vJbTQRq6YcnN28+RPh1xTbUQGAYbnLEEyyt89B2xzFh
	EfOqUUu2np7R6xtj20fts2qm1SpMmhufCOmHqW5M8IFyxKglMEnVkMtwv/ddeQWwbBst398yEAR
	12WQEq5fbHyxCfa1QsyFyjAn7gXoHA6l7I816IwUwKq9O/FEWxom+Y2z+UlCprUjuubsGJyuoc9
	REXEul3U7PkbZ4CcmAl++cfH9vhXMWgOojnmvknuCy+iXTuk+4Y3gQlGTQOjQLRpRg3iUj7cW5V
	54j1w+ZtNlrTQUgyAGquHDrUdC8eJh3AZd2Dsc80hK9TTQdUOUaoJU
X-Received: by 2002:a05:6808:11cb:b0:4a4:c95a:38d1 with SMTP id 5614622812f47-56cd547bd90mr885945b6e.4.1794446968745;
        Wed, 11 Nov 2026 17:29:28 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-56905738049sm6823481b6e.10.2026.11.11.17.29.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 17:29:28 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Wed, 11 Nov 2026 18:28:34 -0700
Subject: [PATCH v3 55/58] mtd: rawnand: r852: retain chip state across
 removal
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261111-submit-rawnand-retained-handle-lifetime-v1-v3-55-ce537999741d@gmail.com>
References: <20261111-submit-rawnand-retained-handle-lifetime-v1-v3-0-ce537999741d@gmail.com>
In-Reply-To: <20261111-submit-rawnand-retained-handle-lifetime-v1-v3-0-ce537999741d@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 James Hilliard <james.hilliard1@gmail.com>, 
 Maxim Levitsky <maximlevitsky@gmail.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261112_012942_883359_452FF266 
X-CRM114-Status: GOOD (  26.60  )
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
