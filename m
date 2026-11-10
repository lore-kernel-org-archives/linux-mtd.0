Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93F7160725B1
	for <linux-mtd@archiver.kernel.org>; Tue, 10 Nov 2026 07:45:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=JEQ3hw54;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=OXMU4Wqk;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yShELZ/v
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=AVq4lOiHEGZ/06zVRI+lCGqrxKscZJ2lVnIQRYsbLSE=; b=JEQ3hw54sq0ckH5puvg/gyFrDy
	SvSBxRsdaRLFoVKHLJfY2EGAQguvgFjVIQoZ/flqc8hBdyDFpTdj/9xkKgsvHR0gnMEDY5nP28Jqm
	SkkwRKK8Rj9OxpnAHmcNX6eJW7Y0QrzKSsS/sUfcLhDUGprJnSLZDAbrE/r/OPmAKJU0fXuKwJK55
	pUCUT8NtLh8h9LyggPShpCngW+yxw/FjczXWekORwPB6BsGKT88E80jVlAKeRrvRSGAZkgBUEARs6
	RMX8Jjl2UTGWHOzCNERS8eKdM4HuToltb0TPt97fWwr9U/gXqhGBNW/4XiHwbOUtphjYo54rj7Spv
	usIx33pw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQgXY-00000002xLH-28if;
	Tue, 10 Nov 2026 07:45:12 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQgXM-00000002wrs-3mnL
	for linux-mtd@bombadil.infradead.org;
	Tue, 10 Nov 2026 07:45:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=nMm4jGEIZaA4cihNMjFshhJxfpyyNdRfUomgpOxFZno=; b=OXMU4WqkKL0v0LmusUTZlfGS1B
	FK+l4KI3/eCXZPGmqwIgWbNRjP5b1GhKe1WuZmfeCAjJ0ZCZc3UP5AUkGDBTOWLAri8KffJSifvYq
	hxpVs8/9riKVImy79RJI8t9J4v1l2PiDaUTCxgCOSUO8PPawAafN9r1lbykg5/xJKwYmWHyeyFNIm
	2YgmJl9IbmyynHCE8ggikklJxrTKKx1MxcGrVtF8Q63fALv8XZiAZaGqtyyDdgn1vFR1mvV6MrA6f
	BiS41/2xC8yrAJgf76gVgOxc0Za2aRlNcAGy1V1Dr1JWl9mtzjR7Uzp1s05n1wnn8IgfTTH/7iqn1
	Z+WBtgbw==;
Received: from mail-oa1-x34.google.com ([2001:4860:4864:20::34])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQgXI-00000007e1p-0gFH
	for linux-mtd@lists.infradead.org;
	Tue, 10 Nov 2026 07:44:58 +0000
Received: by mail-oa1-x34.google.com with SMTP id 586e51a60fabf-4adea5b7a2fso814764fac.2
        for <linux-mtd@lists.infradead.org>; Mon, 09 Nov 2026 23:44:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794296693; x=1794901493; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nMm4jGEIZaA4cihNMjFshhJxfpyyNdRfUomgpOxFZno=;
        b=yShELZ/vlbH0yGG4YNaD0RFebGs9E/iMRRt49biO8fsoT2cl9KoFbBN7POMlY/iLp3
         ubULGfxfpoYqOzSNzpfRKFYnlpAAcu0aQX/oKvINAmH+s5IEvGxjVnl2cWn8bgZg6rmV
         OExE4IQrxT7nNsUhhXaf54cJ77yRA2LCmEJ7MZ40CDS0fvn8SPqauQBYvg9o96h2sn6y
         y7Rv2EE43Pg6K4KnggWOZAk0VUQgdE0UJDF2khVisWbij4tXnSKmr7CYRIQSjNpECBk9
         DSOTU8kJMFpzNS/Oq5eqOWEQPB6n2zKS9ZcWrBG1FDa7tgWUR0zWZQ+dWyUsw9R9JKqC
         spmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794296693; x=1794901493;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nMm4jGEIZaA4cihNMjFshhJxfpyyNdRfUomgpOxFZno=;
        b=NS6dsvYpJM+haZBxmssn8lVRfl8qjvL/e0kefJS4OklTIRhz1zYfKrj4RYKU3zyt7g
         Y8tUHUKbBN1dv1ZMALT9xEPuPKkHkbQpWNUzsxBigAzMwg8SwDzhlC8PSKEGdtU1sO5z
         BDMup7HnUzoFSLKHw5CFLIBGcy7goWi1KohlKWiPHC6O0ynZTNZ34B5elRTs7cKQ2Scn
         RP0RQLiaQBIUZeVMgFXg9NAGmDe25DXs1+eDENk5VuI+gNf2khsNV3J1+5kFs+vX/FD8
         fV6ioiQt3vLvGEMRq3jfoBPmeraE+Ras8KNWcaz2EKkCldoPOl7OY/8NbYTA+ySowaDT
         QTzg==
X-Gm-Message-State: APuU4Z9xO1eqPVvLMu8Vv1qq9i2kvWNMt7LKRi6t2jr7fgENzMdRUVz/
	mxo09pxdMRdAe/s2frHehhpUYDNwSWXsXtcZc3Ox0mtl7W9v5Jf50DPo
X-Gm-Gg: AYBFou30uvYdnCPzfvZ1TMl3s+tPJ2j8uQrX6iNX6r32ujueFeQCxbjJ54pPZTgbs9a
	9OeFh9LC4M9freVtfnMQ37RjOChs3+Aj1vaOxT8Qf4kbZuk2L0qfXL8nrtLj6QtGRQ5ahTL2Chd
	r1STJRHD2onTVK5lLQfMaG5VqPV+jsrLiEKDxZoMCzP4GpNr3CFnOz2J+Yoc58Z+WW8aN2IkQhP
	W7HA7PV3xonmjwRrUZuleNmX7CUPNp4CWG0WtBDODOe++v3V5ehIw5OoA8uuPUFmqVdnk3gLiys
	B/4f8tJB+ufZeKVPJrvMiRRDt00vogXYBcvKQ3R0EWfEkTWukJ1x9UEmPuFb6cthoBCLHAEKKqw
	I3EO2Mo9yD9mqeJMWU/6F9Zu4pnT8XkB0hPDbcnea8D1pvXCckifLksPxH3vMKYfFqUNwRhOVLS
	FLA848TymM1qKUwVa6zexHQdMqGeF5vieKIRTM/64LAR9EOhuAmVOf4qxov/E5EeCen/5VEXJU0
	BxEgYwaGH/Klv2+OzDpxjwTMGGB8YwlCD9a/g2a9ibcNn9kBasSTFoai4/8LKnSkSv4qjKtcj/P
	rCQZhSChj9qnHwnCEaDTGr663DoXs9gK4c7J9n2HseUg+cBLQZ8gYlcQgK5EuuWoGGgJIuOHhzT
	vruIzCO1mtPnqHRoebJvDd/l1MBek5uEHmhBj1s31T6z6mWEiGoV7u9GkLqsN8bCnrVKSDZB4of
	Fr7Yh0eDqgl3aqayasoE5LON8rjXoML33pOFHyjkhSRSIWapx7Ems=
X-Received: by 2002:a05:6809:1d7:10b0:56a:608:c445 with SMTP id 5614622812f47-56a0608ce7fmr477636b6e.51.1794296693511;
        Mon, 09 Nov 2026 23:44:53 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-5690504fdb5sm1522804b6e.3.2026.11.09.23.44.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 23:44:52 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Tue, 10 Nov 2026 00:44:33 -0700
Subject: [PATCH v2 30/58] mtd: rawnand: pl35x: retain open-handle state on
 removal
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261110-submit-rawnand-retained-handle-lifetime-v1-v2-30-9137d08f05df@gmail.com>
References: <20261110-submit-rawnand-retained-handle-lifetime-v1-v2-0-9137d08f05df@gmail.com>
In-Reply-To: <20261110-submit-rawnand-retained-handle-lifetime-v1-v2-0-9137d08f05df@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 James Hilliard <james.hilliard1@gmail.com>, 
 Michal Simek <michal.simek@amd.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261110_074457_133236_560CD1EF 
X-CRM114-Status: GOOD (  16.19  )
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

Unwind chip ownership on registration failures as well as removal.

Cc: Michal Simek <michal.simek@amd.com>
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/pl35x-nand-controller.c | 46 ++++++++++++++++++++++------
 1 file changed, 36 insertions(+), 10 deletions(-)

diff --git a/drivers/mtd/nand/raw/pl35x-nand-controller.c b/drivers/mtd/nand/raw/pl35x-nand-controller.c
index 26b61d856143..952fe5dcc84d 100644
--- a/drivers/mtd/nand/raw/pl35x-nand-controller.c
+++ b/drivers/mtd/nand/raw/pl35x-nand-controller.c
@@ -1049,6 +1049,11 @@ static int pl35x_nand_reset_state(struct pl35x_nandc *nfc)
 	return 0;
 }
 
+static void pl35x_nand_chip_release(struct nand_chip *chip)
+{
+	kfree(container_of(chip, struct pl35x_nand, chip));
+}
+
 static int pl35x_nand_chip_init(struct pl35x_nandc *nfc,
 				struct device_node *np)
 {
@@ -1057,22 +1062,24 @@ static int pl35x_nand_chip_init(struct pl35x_nandc *nfc,
 	struct mtd_info *mtd;
 	int cs, ret;
 
-	plnand = devm_kzalloc(nfc->dev, sizeof(*plnand), GFP_KERNEL);
+	plnand = kzalloc_obj(*plnand);
 	if (!plnand)
 		return -ENOMEM;
 
 	ret = of_property_read_u32(np, "reg", &cs);
 	if (ret)
-		return ret;
+		goto free_chip;
 
 	if (cs >= PL35X_NAND_MAX_CS) {
 		dev_err(nfc->dev, "Wrong CS %d\n", cs);
-		return -EINVAL;
+		ret = -EINVAL;
+		goto free_chip;
 	}
 
 	if (test_and_set_bit(cs, &nfc->assigned_cs)) {
 		dev_err(nfc->dev, "Already assigned CS %d\n", cs);
-		return -EINVAL;
+		ret = -EINVAL;
+		goto free_chip;
 	}
 
 	plnand->cs = cs;
@@ -1089,23 +1096,34 @@ static int pl35x_nand_chip_init(struct pl35x_nandc *nfc,
 					   "%s", PL35X_NANDC_DRIVER_NAME);
 		if (!mtd->name) {
 			dev_err(nfc->dev, "Failed to allocate mtd->name\n");
-			return -ENOMEM;
+			ret = -ENOMEM;
+			goto free_chip;
 		}
 	}
 
 	ret = nand_scan(chip, 1);
 	if (ret)
-		return ret;
+		goto free_chip;
+	ret = nand_set_release(chip, pl35x_nand_chip_release);
+	if (ret) {
+		nand_cleanup(chip);
+		goto free_chip;
+	}
 
 	ret = mtd_device_register(mtd, NULL, 0);
 	if (ret) {
-		nand_cleanup(chip);
+		nand_disconnect(chip);
+		mtd_put_master(mtd);
 		return ret;
 	}
 
 	list_add_tail(&plnand->node, &nfc->chips);
 
 	return ret;
+
+free_chip:
+	kfree(plnand);
+	return ret;
 }
 
 static void pl35x_nand_chips_cleanup(struct pl35x_nandc *nfc)
@@ -1118,8 +1136,9 @@ static void pl35x_nand_chips_cleanup(struct pl35x_nandc *nfc)
 		chip = &plnand->chip;
 		ret = mtd_device_unregister(nand_to_mtd(chip));
 		WARN_ON(ret);
-		nand_cleanup(chip);
+		nand_disconnect(chip);
 		list_del(&plnand->node);
+		mtd_put_master(nand_to_mtd(chip));
 	}
 }
 
@@ -1146,6 +1165,11 @@ static int pl35x_nand_chips_init(struct pl35x_nandc *nfc)
 	return ret;
 }
 
+static void pl35x_nand_release(struct nand_controller *controller)
+{
+	kfree(container_of(controller, struct pl35x_nandc, controller));
+}
+
 static int pl35x_nand_probe(struct platform_device *pdev)
 {
 	struct device *smc_dev = pdev->dev.parent;
@@ -1153,12 +1177,14 @@ static int pl35x_nand_probe(struct platform_device *pdev)
 	struct pl35x_nandc *nfc;
 	int ret;
 
-	nfc = devm_kzalloc(&pdev->dev, sizeof(*nfc), GFP_KERNEL);
+	nfc = kzalloc_obj(*nfc);
 	if (!nfc)
 		return -ENOMEM;
+	ret = devm_nand_controller_init(&pdev->dev, &nfc->controller, pl35x_nand_release);
+	if (ret)
+		return ret;
 
 	nfc->dev = &pdev->dev;
-	nand_controller_init(&nfc->controller);
 	nfc->controller.ops = &pl35x_nandc_ops;
 	INIT_LIST_HEAD(&nfc->chips);
 

-- 
2.53.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
