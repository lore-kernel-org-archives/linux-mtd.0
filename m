Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 139F56074E5D
	for <linux-mtd@archiver.kernel.org>; Thu, 12 Nov 2026 01:30:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=zqNLYIh9;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=01ld57vw
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=PvVtUfBl5DavzbtIO7jKSizTLw5xkL5dwhcKRwJZaTM=; b=zqNLYIh9FJltjSFhxGulyNgfxz
	l9j3MXcqxDkUWL7WOVM6n24KKp5rvOMd7EdSOXwBg1BielrQCfUzUra0fBDlYJGH1i1fcC+BDPaaa
	xn4Y1yRuZujDsjSD83SszdBuSGhOSUBpl0uKCX75GPxFtVRzhwffD46g6aXA02sVTf4bdv/vvlnzc
	x02s4ofRzCm1tgn3hUCcKpT8uJqJRd138/Mb6V3bAJBmuJP6w/kGgDVCwa8u01c+0Czm1IWVeawQI
	K59WgWR50YkvwoRY9RKyXRWha7OoEjNLWbaVDxfJV4yTFDvi4CpLUROLwdBpQSC8boV6rWq7i9ttl
	iz4tEbhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRJdh-00000008Nxx-0iu9;
	Thu, 12 Nov 2026 01:30:09 +0000
Received: from mail-oi1-f181.google.com ([209.85.167.181])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRJcs-00000008MP0-2nKa
	for linux-mtd@lists.infradead.org;
	Thu, 12 Nov 2026 01:29:35 +0000
Received: by mail-oi1-f181.google.com with SMTP id 5614622812f47-4c5d8c7f326so1480259b6e.1
        for <linux-mtd@lists.infradead.org>; Wed, 11 Nov 2026 17:29:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794446957; x=1795051757; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gCbMn0D+0n67m7o+Cui6cZhy98vOvyTriDiAzIEEDOs=;
        b=01ld57vwFT7BK0EH/6JJ80wdmHz0OUfTcsO6+eOI3QHmvzsOiQ7J7ed20JzpgoQTRC
         sJQyK/wWcxG2h3pv2vnkG0CpBfFp43bSgJw9MIHkXPV1sjQAfuqQdQDgtGAE/8Ez21yP
         hy2MVjDpfdhL+ZRh4vNxytgUkPcl1l1D08mW9nEqAQ8zGa8er6qfJS1dzo1/LFX9X1uL
         KS7O3qJdQdg46zbhE7rCmYgA6SyO7NWYlmLN2eEEhW0JhYeEM9gzkoVZET6aNO70A4gZ
         KU631b3tEgpAIikj3jfKkxC7sNNKF52w4kTjDmHQnIuvFR4Wi/oofC3yoaICey/nHdrd
         VoLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794446957; x=1795051757;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gCbMn0D+0n67m7o+Cui6cZhy98vOvyTriDiAzIEEDOs=;
        b=zqAKpZmynDBGMNef2jbB1rL7ftNiUQ/RpTAROE3NsiaEt9Kg8rm6jX/lZlS5Wd2fb0
         dGFzQ07y3x12XcF5fsm9kBtGMWURJ9xtkWJnnESK4JE8cQ4LoHb7lSAG4MrCFMirAUgb
         cGKJRwICbE9wArM1NcRtyLkpPw1WY5do53HEPeWQfa/zWJfWqA5p9Nj9n2JYURYm8pig
         M4dErReaCHFmGCmbXx/EIv+qx22YsUUBIY6Jlcaim11KpDeT245X8k5TvhiYhQkAbiZ0
         lWbIrFq1/DuOHikngJhEj6cFku9f4EoEov2j15R25qRYQtco/NpudlMZqjZqTn5bpvEB
         6M1Q==
X-Gm-Message-State: APuU4Z9LCifpKuvjBQeyaddPC4s9xIaAGp9fCzG6QutrtL3WpjCInKtI
	5IcGJupDtGMvBLLbxeWvj8NgTeQkmH2tBGNwF+XGz8V6iEHfPD0wDwXA
X-Gm-Gg: AYBFou2e7nfGmWHGbO5NgYDH9BABve8uyDD7FXOQtDcW/2N9R5LE6L1B2nNUqMLKTbb
	ZqsK0DqEuNS8FGD/6aZqjrmVFsH4O1rCrYsiArN1Xou4dHn7o5ySCgC48Ptc/WLC8wPlSoyl5J0
	zqMvn8cb8o5ZAOP+Dg5aJR3/+d6ZWBiyIix0+QV+ZToMRK3D1ye73bsPsY5exEwrdWGp6I3j8gX
	s/daQeaXrCovZyArVXIvrCmaB8DvlO+3umFmOdRwKw9Vch1PJB8Bfd67heRnjUJbaali9DZROC2
	bUk2q1L6v9ilR5+CvCWNKcj0wvYrjT3fzZ7bmiMk/44GdH5BvdoRgvqObBUGoSa/M0pjU6GJN/6
	zaseDdNdnkiuXndmEcK4GOb3GeHjt+UX8R+u9bKxs/U5bdPS26BiM7JJaj7Nwy6DWQLdcpPY+tU
	+sT6ymiDxmOrGrDq2JGCV+ZbyfhGPXyC3pqEdbETm89upcUsUrUDAzUV5OdgTeX7jl3KgdLppiC
	D8Zw+IWp4ZuIilUsFzfPrnDdslwxOjjPrNbr8IIN/mXDPFain7uFtv2ZjYiQ5EVc0rozz7zLJBr
	doI5JMHWMAeXY/fhjFCPsnZ7maSWYWvCXy1nCeMaCi872fujbXPh87KOiwygJ5/97TZ6RKY3Unh
	TO3EPmjlbtGLscp4N7d25Q2AfCeVVl+kz/x/iVMMY0aspr5qsf1eOzhcuW5MFXcs15XezgNnS3M
	DVUkHi7YP99Lb7uOcUZNAJCdNg3aRqHfUoNMaGU86wydT7GC9kN3+p
X-Received: by 2002:a05:6808:11c6:b0:4c2:5ac:7f9e with SMTP id 5614622812f47-56b975048c8mr3616841b6e.43.1794446956842;
        Wed, 11 Nov 2026 17:29:16 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-56905738049sm6823481b6e.10.2026.11.11.17.29.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 17:29:16 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Wed, 11 Nov 2026 18:28:23 -0700
Subject: [PATCH v3 44/58] mtd: rawnand: davinci: retain chip state across
 removal
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261111-submit-rawnand-retained-handle-lifetime-v1-v3-44-ce537999741d@gmail.com>
References: <20261111-submit-rawnand-retained-handle-lifetime-v1-v3-0-ce537999741d@gmail.com>
In-Reply-To: <20261111-submit-rawnand-retained-handle-lifetime-v1-v3-0-ce537999741d@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261111_172918_802245_4414FF49 
X-CRM114-Status: GOOD (  15.72  )
X-Spam-Score: -1.8 (-)
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

Disconnect the chip before releasing the shared four-bit ECC engine.
Run NAND cleanup while the driver is bound, and retain chip and
controller allocations while MTD references remain.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/davinci_nand.c | 24 +++++++++++++++++-------
 1 file changed, 17 insertions(+), 7 deletions(-)

diff --git a/drivers/mtd/nand/raw/davinci_nand.c b/drivers/mtd/nand/raw/davinci_nand.c
index 17c6fa73f4c3..40291db1fda5 100644
--- a/drivers/mtd/nand/raw/davinci_nand.c
+++ b/drivers/mtd/nand/raw/davinci_nand.c
@@ -919,9 +919,12 @@ static int nand_davinci_probe(struct platform_device *pdev)
 	if (pdata->core_chipsel > 3)
 		return -ENODEV;
 
-	info = devm_kzalloc(&pdev->dev, sizeof(*info), GFP_KERNEL);
+	info = kzalloc_obj(*info);
 	if (!info)
 		return -ENOMEM;
+	ret = devm_nand_controller_init(&pdev->dev, &info->controller, info);
+	if (ret)
+		return ret;
 
 	platform_set_drvdata(pdev, info);
 
@@ -986,7 +989,6 @@ static int nand_davinci_probe(struct platform_device *pdev)
 	spin_unlock_irq(&davinci_nand_lock);
 
 	/* Scan to find existence of the device(s) */
-	nand_controller_init(&info->controller);
 	info->controller.ops = &davinci_nand_controller_ops;
 	info->chip.controller = &info->controller;
 	ret = nand_scan(&info->chip, pdata->mask_chipsel ? 2 : 1);
@@ -995,12 +997,18 @@ static int nand_davinci_probe(struct platform_device *pdev)
 		return ret;
 	}
 
+	ret = nand_set_lifetime(&info->chip, NULL);
+	if (ret)
+		goto err_cleanup_nand;
 	if (pdata->parts)
 		ret = mtd_device_register(mtd, pdata->parts, pdata->nr_parts);
 	else
 		ret = mtd_device_register(mtd, NULL, 0);
-	if (ret < 0)
-		goto err_cleanup_nand;
+	if (ret < 0) {
+		nand_disconnect(&info->chip);
+		mtd_put_master(mtd);
+		return ret;
+	}
 
 	val = davinci_nand_readl(info, NRCSR_OFFSET);
 	dev_info(&pdev->dev, "controller rev. %d.%d\n",
@@ -1020,14 +1028,16 @@ static void nand_davinci_remove(struct platform_device *pdev)
 	struct nand_chip *chip = &info->chip;
 	int ret;
 
+	ret = mtd_device_unregister(nand_to_mtd(chip));
+	WARN_ON(ret);
+	nand_disconnect(chip);
+
 	spin_lock_irq(&davinci_nand_lock);
 	if (chip->ecc.placement == NAND_ECC_PLACEMENT_INTERLEAVED)
 		ecc4_busy = false;
 	spin_unlock_irq(&davinci_nand_lock);
 
-	ret = mtd_device_unregister(nand_to_mtd(chip));
-	WARN_ON(ret);
-	nand_cleanup(chip);
+	mtd_put_master(nand_to_mtd(chip));
 }
 
 static struct platform_driver nand_davinci_driver = {

-- 
2.53.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
