Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA2D4606DF4E
	for <linux-mtd@archiver.kernel.org>; Tue, 10 Nov 2026 07:46:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=s8yTSN9+;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=dW4LT253;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=pK3c5o99
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=/clrBVvTf6ZlhP/lT65ECIrvJl8Alymy+sa854i+Eks=; b=s8yTSN9+bY46KZFuJI81lc1pmM
	KhnVH/TttTI6//Nyt4imRLIFwxxEWLOuupSx+UCg1JvTe6rKdndF8XLFGumYwTKSiPEhxmI6+bWs2
	2u3g7RGIrn83FzDatcE5I6l7DH73EgAeQjT4DfIuAtY/cH3t5vOma+36frnUw1puoBV8yg5i3S4fu
	/tY4wINqsfUlWQqQbs2Zu/aa0aHciUrOp8kyiG6/sVb+rqLTumwy3j7yVTEYkYBFQrN9O8EAsjKcc
	0aOElJ6zo+s57VfTgfXKq5+teA+Jvt1upMP09VtW4/28PAnB8Y9fcmzgTG3lSmqjlLiWE06Ybf2vR
	CkWo8L/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQgYP-00000002yUi-1GRU;
	Tue, 10 Nov 2026 07:46:05 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQgXa-00000002xLF-23Gk
	for linux-mtd@bombadil.infradead.org;
	Tue, 10 Nov 2026 07:45:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=HLZfvDioLp/vY/9zYDjLGVC8TxAnz3Z/4xHRKH8AmZg=; b=dW4LT253pQzfAmV25fwEQy444M
	beKUctmShUd/Tq6cH9nbsx6p4PvuYJ1kANlUv+REERXOXKdAu40nsvd+x5Q7qUTX7zTnxZO5Ac5dA
	pFz22JLhjNeOV+X0rNQQrO0HrEBv67L+mTyZhSolB8qTHVTbDG0drAnBIqEc/C4glldMVYbAISYmW
	Oq3tqPi7Xw33KCxT6zm0v+9R7LONNh63dXLw+i74wCk2b4tmcFs9i4yH9lueqfWqORDSw9/RRlupH
	PAlN26hb3BeByEGnTMZMb0E3yAgmeoklKf6K4X2Ho1b9ANltBCRqXlfGEB6Eckk/JpExy4XwRdcka
	jKqAVjSA==;
Received: from mail-oi1-x235.google.com ([2607:f8b0:4864:20::235])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQgXS-00000007e5w-05Fn
	for linux-mtd@lists.infradead.org;
	Tue, 10 Nov 2026 07:45:11 +0000
Received: by mail-oi1-x235.google.com with SMTP id 5614622812f47-53dda625f63so1140845b6e.1
        for <linux-mtd@lists.infradead.org>; Mon, 09 Nov 2026 23:45:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794296703; x=1794901503; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HLZfvDioLp/vY/9zYDjLGVC8TxAnz3Z/4xHRKH8AmZg=;
        b=pK3c5o99I9yd8EK8f/84FzY+amGQlXsi7rE/gZ9aEGoNA7i7yKa2U6+NqBhJCog4io
         PeDEk5VQI8hhnJB1jNkgnaJApZmuyhPwnCqXTy+EY8FrSIqVNozzn/PM4e7KEeRG9q8t
         lDukKs/XhRRqP/kXVExh+iHS7wba4cHDC3wZ5yuVS5FOEWbXilDXJLuz6BoXcB8dvhUC
         cc3uAAXQObxpDZeHERYPJ+0SrRsUzOW3x4ML/Z+4DspyEOCMqOg/tqeuYMNGczPnSZUZ
         P7wr/EKpTvB3gY41EUykH4RtmtPdervY60SpmXXeGxYeDbS9GeMi5UCvSw+GsWsfEgKK
         cKSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794296703; x=1794901503;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HLZfvDioLp/vY/9zYDjLGVC8TxAnz3Z/4xHRKH8AmZg=;
        b=KZOXrNoIFckcjga6oGOrCyi/7NKshY3wecTf+/4oG1bhYZvk1EqBayAoOmhQoCbRiU
         EGEJRiYiCmCeoLDWT0D2iaDfkZk3FV3TaeZKSy/ip//Nqr83qXgD0bPCC6Gx8pf1EgpV
         ZM33TTJmUW9+IMS9/6A5ktfec+jf2wkULT4y2RcLzmRPgoxjC3f9qmXD5VZGJXNAE9bN
         /w2JUQxyIDHH8fmJ2yCtx8/U4RmakojGNUNVIzpaOeyXYaMqbrUZNOsYX5vJM4xx2+Tk
         GPSKSWoiOqMdon5yIh/kW3Zuy0OJvPOwhASIVvrx9SkU7824X3ciupVyPiQObBrTf1Qt
         PDgQ==
X-Gm-Message-State: APuU4Z9l7k7q1woWeKSBnzP1rWDzfyr7+JWA+J8Ht/NLtfgNdxGKj6jp
	V7jNEsarroDOx4LqKnVi7uoKL2SZkR3tyk7Nr/hNlulqLTtlNzOzELx0
X-Gm-Gg: AYBFou1MDV8LeeUhjcUzqshk6Oc8+gQCtD7VJit+GRAV5HevGnxXEIyVQfmQ6QSVfov
	07n3IcOvVc9oaEFwbIPla4XK+fefvi38SfPtUuwGH6qX0IlZwb5RF/4ApgxjoIfW1fs8eLfFYRb
	Gcv4AAoTxhNr6fkRU9PPav0O030FCNO998rRsKYXknDixQALP75VlARkogxcNUBfgzzNj5viRj3
	Xg+VvaZ11F1K5B2Ar2FeACAPWPa7uOtvBTlvEz+2dgjpuTFf6xKRBEHO8npgzxrtgrxrNNncSDe
	HnYKIXsKFV/b4XaXGLvcIsW0mXoInbc55pPjIOH4WLg9G22Jh3+yQhYGucJ3PoHdJ/Awymr7BBo
	bB6jASCA6wP1sZ4L0cYU78hApzeNNtbAfT7JtZPDMGcxY1KDMzCO5I7es/nHqQTeP0Zjm48WxGM
	BYM6zHflnrIn5TT5n+/vBiOopT5BvxZtVcR/cVMY0jOfAVB+a4SyNkEgzGtmSkwkbixedwklJWz
	Njoccqt6TxkFge1flkDtq2HlqEBtrS5GS00MlXXkF58d891IPqD3Dg/reMFluRvRbGFKqgSqHox
	D+DdYpvrvuyHHlC5ojfMcVp3QbmSgFy5kXRk/O+f6eKJphY3Lcq/DaCxi4Mh9C509mSIGFhxQUs
	k7X5mmF4xLIIIzlhWaT3hOkfHxsEZWZ+KnR7mLgbPjbUwc++djciRF0MgCsIpUmdT4mGyiLeBuX
	L4RsyrENqNBXuAX9/rH4biUegB6ELlzyGjptmQCvZkQiAtImEbibOk
X-Received: by 2002:a05:6808:e85:b0:4ec:4c7e:37b5 with SMTP id 5614622812f47-5683cc8615cmr1404944b6e.29.1794296702875;
        Mon, 09 Nov 2026 23:45:02 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-5690504fdb5sm1522804b6e.3.2026.11.09.23.45.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 23:45:02 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Tue, 10 Nov 2026 00:44:41 -0700
Subject: [PATCH v2 38/58] mtd: rawnand: cadence: retain open-handle state
 on removal
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261110-submit-rawnand-retained-handle-lifetime-v1-v2-38-9137d08f05df@gmail.com>
References: <20261110-submit-rawnand-retained-handle-lifetime-v1-v2-0-9137d08f05df@gmail.com>
In-Reply-To: <20261110-submit-rawnand-retained-handle-lifetime-v1-v2-0-9137d08f05df@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261110_074509_575389_84B93DA0 
X-CRM114-Status: GOOD (  18.03  )
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

Allocate the final shared buffer before publishing any chip.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/cadence-nand-controller.c | 60 +++++++++++++++++++-------
 1 file changed, 44 insertions(+), 16 deletions(-)

diff --git a/drivers/mtd/nand/raw/cadence-nand-controller.c b/drivers/mtd/nand/raw/cadence-nand-controller.c
index d53b35a8b3cb..65c4eab600af 100644
--- a/drivers/mtd/nand/raw/cadence-nand-controller.c
+++ b/drivers/mtd/nand/raw/cadence-nand-controller.c
@@ -562,6 +562,7 @@ struct cdns_nand_chip {
 	struct cadence_nand_timings timings;
 	struct nand_chip chip;
 	u8 nsels;
+	bool registered;
 	struct list_head node;
 
 	/*
@@ -2991,6 +2992,11 @@ static const struct nand_controller_ops cadence_nand_controller_ops = {
 	.setup_interface = cadence_nand_setup_interface,
 };
 
+static void cadence_nand_chip_release(struct nand_chip *chip)
+{
+	kfree(to_cdns_nand_chip(chip));
+}
+
 static int cadence_nand_chip_init(struct cdns_nand_ctrl *cdns_ctrl,
 				  struct device_node *np)
 {
@@ -3007,9 +3013,7 @@ static int cadence_nand_chip_init(struct cdns_nand_ctrl *cdns_ctrl,
 	}
 
 	/* Allocate the nand chip structure. */
-	cdns_chip = devm_kzalloc(cdns_ctrl->dev, sizeof(*cdns_chip) +
-				 (nsels * sizeof(u8)),
-				 GFP_KERNEL);
+	cdns_chip = kzalloc(struct_size(cdns_chip, cs, nsels), GFP_KERNEL);
 	if (!cdns_chip) {
 		dev_err(cdns_ctrl->dev, "could not allocate chip structure\n");
 		return -ENOMEM;
@@ -3024,20 +3028,22 @@ static int cadence_nand_chip_init(struct cdns_nand_ctrl *cdns_ctrl,
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
@@ -3059,20 +3065,22 @@ static int cadence_nand_chip_init(struct cdns_nand_ctrl *cdns_ctrl,
 	ret = nand_scan(chip, cdns_chip->nsels);
 	if (ret) {
 		dev_err(cdns_ctrl->dev, "could not scan the nand chip\n");
-		return ret;
+		goto free_chip;
 	}
 
-	ret = mtd_device_register(mtd, NULL, 0);
+	ret = nand_set_release(chip, cadence_nand_chip_release);
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
@@ -3083,10 +3091,13 @@ static void cadence_nand_chips_cleanup(struct cdns_nand_ctrl *cdns_ctrl)
 
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
 
@@ -3127,6 +3138,7 @@ static int cadence_nand_init(struct cdns_nand_ctrl *cdns_ctrl)
 {
 	dma_cap_mask_t mask;
 	struct dma_device *dma_dev;
+	struct cdns_nand_chip *entry;
 	int ret;
 
 	cdns_ctrl->cdma_desc = dma_alloc_coherent(cdns_ctrl->dev,
@@ -3181,7 +3193,6 @@ static int cadence_nand_init(struct cdns_nand_ctrl *cdns_ctrl)
 		goto dma_release_chnl;
 	}
 
-	nand_controller_init(&cdns_ctrl->controller);
 	INIT_LIST_HEAD(&cdns_ctrl->chips);
 
 	cdns_ctrl->controller.ops = &cadence_nand_controller_ops;
@@ -3201,9 +3212,17 @@ static int cadence_nand_init(struct cdns_nand_ctrl *cdns_ctrl)
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
 
@@ -3260,6 +3279,11 @@ static const struct of_device_id cadence_nand_dt_ids[] = {
 
 MODULE_DEVICE_TABLE(of, cadence_nand_dt_ids);
 
+static void cadence_nand_release(struct nand_controller *controller)
+{
+	kfree(container_of(controller, struct cadence_nand_dt, cdns_ctrl.controller));
+}
+
 static int cadence_nand_dt_probe(struct platform_device *ofdev)
 {
 	struct resource *res;
@@ -3275,11 +3299,15 @@ static int cadence_nand_dt_probe(struct platform_device *ofdev)
 		return -ENOMEM;
 	}
 
-	dt = devm_kzalloc(&ofdev->dev, sizeof(*dt), GFP_KERNEL);
+	dt = kzalloc_obj(*dt);
 	if (!dt)
 		return -ENOMEM;
 
 	cdns_ctrl = &dt->cdns_ctrl;
+	ret = devm_nand_controller_init(&ofdev->dev, &cdns_ctrl->controller,
+					cadence_nand_release);
+	if (ret)
+		return ret;
 	cdns_ctrl->caps1 = devdata;
 
 	cdns_ctrl->dev = &ofdev->dev;

-- 
2.53.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
