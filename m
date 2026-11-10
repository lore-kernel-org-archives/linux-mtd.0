Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 759D66075546
	for <linux-mtd@archiver.kernel.org>; Tue, 10 Nov 2026 07:45:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=fCwpZtew;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Ayb0OGD1
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=KkF4XxlTvyis2LXA/yNSJUM2hWZucRxmTW9K6O/ol5A=; b=fCwpZtewkJlHrb8TxNNDe3gCsH
	QHsw8Jfk2MzaFZhiJ816YyjvKmgZzA4LYeK6eU8PD2NEJnVlXKqC/T5hums997pxrp60ogUWJj3iq
	lueTzcFuxQiT4FD8V36b4Knox9B0KexuQTt71mYi2OIPETSad8NoanVX6kIOVRlrQP7H6fzJqnmcY
	YQMmcLOym6iAYDojXpCOqbtOeg2/tpHrjSldsrzKVLwgTcuPgTyqudyNk8twFOLcdCyQkgb8qPiix
	vl2zsoZ5itsfqKvB45abj0GRcN+mwQ91sy5XWz8qSGhxhQ+Lh0apinP1lKu+goZMMly1mk1DvdINx
	HmaUHNsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQgXg-00000002xXL-2QXB;
	Tue, 10 Nov 2026 07:45:20 +0000
Received: from mail-oi1-x231.google.com ([2607:f8b0:4864:20::231])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQgXB-00000002wVd-3tOx
	for linux-mtd@lists.infradead.org;
	Tue, 10 Nov 2026 07:45:05 +0000
Received: by mail-oi1-x231.google.com with SMTP id 5614622812f47-51f2e9e6987so1035554b6e.1
        for <linux-mtd@lists.infradead.org>; Mon, 09 Nov 2026 23:44:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794296689; x=1794901489; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iv/6ZsmmLFxc/jyASLD4sobeWNDYEN/sj8IUC+djj6E=;
        b=Ayb0OGD1SCVYlDO83yRLPwHvVXkp/jFQ51fVUmhhe0Lhg1NzQZ9yPjvT4kRK+8Tagt
         HcY2OGX5r2oAgTpN1vrDc4vpE/sWlG87nB1wG7exkfuDSGiqRcsIinSZ58iXgvXRSzV0
         UC4Vc/J0bMZ2kCNIv5is/MsA7nr8Dc4W9BH7NVWx8j2AyRB5UgKnxwO87lv0OgVRDXNk
         Pk6P4yDzFcaYWp2UVBXDg0hyCiJ8cS+2xdJ7qDODlC/R2aufJt0zfILnUm6PgQLYgxHj
         CVmAD3xjUGegQEZcrWbYhB78Y7w6HgBs+mI/b6A8tgPcNfZ2sgVq6kdCgJh4C72TvyBs
         BnTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794296689; x=1794901489;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iv/6ZsmmLFxc/jyASLD4sobeWNDYEN/sj8IUC+djj6E=;
        b=hzi9mxkoeM9+AS4kXEzcBt1XjrUrrOUpY0DsThIahksmAx5M/B+Khp97cj+MK/TD/t
         Dup0jXfRkqcy1sg2lQvG4ZQZp/HwYwoBOjGksB56wO1c4XUMzVDxQRd4+K/OOjSvSM1k
         vX9xxaWBjTcJVn6YRMAsrB+Q5mKPdu9lOsQgtn5E6aoEvkP4D8lCJXUoSVI5G//veHEt
         yMdnKeAJ53hYsPi56txw6VPREffjUMKOoeE4fk7kryD1OC2gYqkYBLiPdFDxMsIHhz1F
         eF85tPp5M5AU2O5QBsKX6Zqfieyt+62DRZvU9L4LKtMegnNrxk2+kBYcu0GCTR6lAxSX
         ai7A==
X-Gm-Message-State: APuU4Z9CDhJnGUk9mSR//g7zVyTHazZz1nP08Ato/xYyp2iJz519/XgA
	Dtl2breVOTCPoflJvKEkjrMWQsvHQeqdC4F0LsfpztfjKCxE8XK24Ks4
X-Gm-Gg: AYBFou2xzyg32X+UaUxQOJwcRvO438Y54s87DrRNYoqojV0gFsSwEopBvvjvjBM8bFN
	d8z8Ey35WYcvhJJl/9+7CDS+Y/452TnNjtpuS1kDsTjMwxGN0Erv8EMBVZeK/q1Mpd/izWPBvPx
	/zEQseAwqypD9igwK1lgqLIS/hmG52tHMIMl5gbwYMaII4mhL5nL2DmRGBw29wMobeirQHBpzu9
	4xIeD1Zsl5MIOam6+4H0AOCSIdSgPgco2fLjdbGpUrkgJt9uijDb+EZN6SD3mJMjkqYlVYjwQ33
	f/l4smH+KW79AV/W1uRctKb/alTwLwQgTfp3H+XSoZ9Pa6jNxZEI93YToAwPZTOPX1zUeyy71Sr
	0K7UWjz5y3b7EeBnJ+LtrRhVQQ28B8iIs3DfncbpaKE01YMnDc8HjsuqwQYNtZL362j5el3VRnU
	/gzDMtPitmvA+6w8e+lq5OPyv3oLOCWv0wP+t9IUR1hGBmDqMi/0YyOSWUlcvuEnv+PF8lruoMj
	72mRcMS4LucWgTwrQuTkRgnZQ7cbKB99uFt29Rp+cxweHTdyLoH5hQuTk119AXl/e8XbwbIf0hX
	vHbS3mLZtNwLcARmHBOXDgVcFxLuhsiekfXHcBQVtbh/dISuYeIOYfnxNvMTQZJDPMlVvFH+zja
	9yu+PRd0LxPEOlc9QGf2mc4VyP/U1dTiMfWI5r4KzSTwut7fRnFkGzJ5Yo3gzMcEEyFr4bunhAb
	GKszR7IKlmZLNLW5/cpNx2QHxuBDbFPZUYUgdwCK4N8PZvbWux9dE=
X-Received: by 2002:a05:6808:13c4:b0:495:ca1b:7865 with SMTP id 5614622812f47-56881290bb2mr945678b6e.11.1794296688872;
        Mon, 09 Nov 2026 23:44:48 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-5690504fdb5sm1522804b6e.3.2026.11.09.23.44.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 23:44:48 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Tue, 10 Nov 2026 00:44:29 -0700
Subject: [PATCH v2 26/58] mtd: rawnand: vf610: retain open-handle state on
 removal
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261110-submit-rawnand-retained-handle-lifetime-v1-v2-26-9137d08f05df@gmail.com>
References: <20261110-submit-rawnand-retained-handle-lifetime-v1-v2-0-9137d08f05df@gmail.com>
In-Reply-To: <20261110-submit-rawnand-retained-handle-lifetime-v1-v2-0-9137d08f05df@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 James Hilliard <james.hilliard1@gmail.com>, Stefan Agner <stefan@agner.ch>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261109_234450_042226_62833F22 
X-CRM114-Status: GOOD (  14.69  )
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

Keep managed register, IRQ and clock teardown after chip disconnection.

Cc: Stefan Agner <stefan@agner.ch>
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/vf610_nfc.c | 22 ++++++++++++++++++----
 1 file changed, 18 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/nand/raw/vf610_nfc.c b/drivers/mtd/nand/raw/vf610_nfc.c
index 9940681810cf..903a25c549d8 100644
--- a/drivers/mtd/nand/raw/vf610_nfc.c
+++ b/drivers/mtd/nand/raw/vf610_nfc.c
@@ -805,6 +805,11 @@ static const struct nand_controller_ops vf610_nfc_controller_ops = {
 
 };
 
+static void vf610_nfc_release(struct nand_controller *controller)
+{
+	kfree(container_of(controller, struct vf610_nfc, base));
+}
+
 static int vf610_nfc_probe(struct platform_device *pdev)
 {
 	struct vf610_nfc *nfc;
@@ -813,9 +818,12 @@ static int vf610_nfc_probe(struct platform_device *pdev)
 	int err;
 	int irq;
 
-	nfc = devm_kzalloc(&pdev->dev, sizeof(*nfc), GFP_KERNEL);
+	nfc = kzalloc_obj(*nfc);
 	if (!nfc)
 		return -ENOMEM;
+	err = devm_nand_controller_init(&pdev->dev, &nfc->base, vf610_nfc_release);
+	if (err)
+		return err;
 
 	nfc->dev = &pdev->dev;
 	chip = &nfc->chip;
@@ -873,7 +881,6 @@ static int vf610_nfc_probe(struct platform_device *pdev)
 
 	vf610_nfc_preinit_controller(nfc);
 
-	nand_controller_init(&nfc->base);
 	nfc->base.ops = &vf610_nfc_controller_ops;
 	chip->controller = &nfc->base;
 
@@ -885,9 +892,15 @@ static int vf610_nfc_probe(struct platform_device *pdev)
 	platform_set_drvdata(pdev, nfc);
 
 	/* Register device in MTD */
-	err = mtd_device_register(mtd, NULL, 0);
+	err = nand_set_release(chip, NULL);
 	if (err)
 		goto err_cleanup_nand;
+	err = mtd_device_register(mtd, NULL, 0);
+	if (err) {
+		nand_disconnect(chip);
+		mtd_put_master(mtd);
+		return err;
+	}
 	return 0;
 
 err_cleanup_nand:
@@ -903,7 +916,8 @@ static void vf610_nfc_remove(struct platform_device *pdev)
 
 	ret = mtd_device_unregister(nand_to_mtd(chip));
 	WARN_ON(ret);
-	nand_cleanup(chip);
+	nand_disconnect(chip);
+	mtd_put_master(nand_to_mtd(chip));
 }
 
 #ifdef CONFIG_PM_SLEEP

-- 
2.53.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
