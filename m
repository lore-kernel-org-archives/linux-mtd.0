Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE96C606A33D
	for <linux-mtd@archiver.kernel.org>; Fri, 13 Nov 2026 18:16:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=JRXRe2at;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=AlBHAQcl;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=058aT391
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=PvVtUfBl5DavzbtIO7jKSizTLw5xkL5dwhcKRwJZaTM=; b=JRXRe2at96HGvaQHvwtFndWvuB
	OzX5QXOFNWk0JEu5PyhFCj4W+1tvPjhM+PufiZMlgiDwdPgmDtoU7awJZH2/TY0jmuzC6mCIjhqnD
	z6PA29TcZ4DOu2lz6TJpDEmlA8RYWbadvaosqdJXhVzmV3tM1fzNT2ios72kmXEfZpmBZHQLyk55U
	xxr0fmVBsu5/VKZd/bqsbxAkMaLgJZh/K0Mmg13PW66KiuR6LsvcN6FtlTqtMijfYHp0mJPtI9BLy
	/ddBFowb4nwch5UaXgah6cvFhkiugL3Xk4V+RWM4slOmjemIs55BwzpwadDSNzQjsKP1e2nvcLkvk
	Bc51OFrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRvpX-0000000DtBY-0u7I;
	Fri, 13 Nov 2026 18:16:55 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRvp7-0000000DsIC-0lG7
	for linux-mtd@bombadil.infradead.org;
	Fri, 13 Nov 2026 18:16:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=gCbMn0D+0n67m7o+Cui6cZhy98vOvyTriDiAzIEEDOs=; b=AlBHAQcl1BL4SxZMd2T9rer7yp
	O+CGem2uu0gxLGge1TWDl/HsO5Gh32DMizcIlaEuS6zRPbYY3sJE1WT3+Gd0rwfy8iS58NjHy9ZE1
	RW3qMmy2Ixu4yvLO+Ew+O6GA19zFSGEFjb4djwhAx6ycDGlEhx30qf87Q9OGL3/2lIeJJVBYpRCs+
	c+0faxXfuGOlYg8/kvnauE4sgj5zZBfN/l7SF5GsjShypQyKDVtLWZ/Ir/7av4Imp4g/walq7Iu0C
	pe5q4Kq4fm/6Dm3lEIRbGx0vg5sLCyVHGQmRoY0k2uIeIhduoNERKGhdPLH4HfEEJoncdKjKKoQAA
	KiU+NCow==;
Received: from mail-ot1-x335.google.com ([2607:f8b0:4864:20::335])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRvp2-0000000Bdre-2ADZ
	for linux-mtd@lists.infradead.org;
	Fri, 13 Nov 2026 18:16:28 +0000
Received: by mail-ot1-x335.google.com with SMTP id 46e09a7af769-8470d7d430fso525252a34.3
        for <linux-mtd@lists.infradead.org>; Fri, 13 Nov 2026 10:16:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794593782; x=1795198582; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gCbMn0D+0n67m7o+Cui6cZhy98vOvyTriDiAzIEEDOs=;
        b=058aT391CJUCuc5kIlm5f0d7C68VS/Uucn2H8jTXQG+2/UqJ6aH/GxMQzlsZ9dzRup
         59MW3lX0AbudY+fliy3vCPZtCuAOkXnEMTV7BMXQFYCBzatecuTu+XeNMzJLYVJF+INs
         MINjOPg/otXwVYmnH5aEjCbhHA67b9JcCrTdMs37BrRKAKuB+i2gqtbG7hrhZl4eSsAv
         HiQYe1yfw48l+gfjhyA+Q7gm/DKm9B/Qr6dAORe8xbofpK7qE7zVHZf2PD7gZKKQUCZu
         mtxoxwobSVJkLe3WRLatKMB7AWfm/mQFGcUKX4sdeVm3QSk/k6RSyCnufwuMW+n3GmXG
         IPgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794593782; x=1795198582;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gCbMn0D+0n67m7o+Cui6cZhy98vOvyTriDiAzIEEDOs=;
        b=DplJwkwz94jBmgTrqUU2fp5X3bBZN003JNUjWhJL70stEo2Q42VQKsjJtl3bSEF9YU
         1HJXWoD6eGBYAE6G6qz59Cq1MNYYarrUMz5/y4c5MYiwNWCtnLJK+SJ3TeSnOme1yUPw
         3n8M7knzVmgCtScVHDBH1jYeAQVUzZDchP3sCKtjh3Z3/3iCtDntQXu1/FyEAoclqY18
         Cu3aS0dlGOR7bNCiNajvs/7i4sVtsYpUVY7rY78V9saZhfNg1z177kUmkdvgFXDWK3cI
         aqbJh5caP5T3DL3zRIwxIlCOTGKzDeYZUMZ5fzezKk1NIb6BFzoPn6ODdCqHNnAhxJKL
         LyZw==
X-Gm-Message-State: APuU4Z+RlF7R2/NeyvI6qiGSYovwPfU4naZVBErX62ufbhcSC0TO/fHO
	yM+BGFiOt9CtOqdgpq+8MIOC9UZS+Np5HnQmboVeVwdelA9zoRtFLY4Z
X-Gm-Gg: AYBFou3RqJWb6gXteuqvEEuT6Q/1hXjs1HK8pIcFI3yV0XEAOS6d0uM+mMhMGDrgIYr
	K5MEOIUS1eiPkQE+9MwacXMSbhn2Ce+F4G1btYKxTzQ4NN+mkMFMc/5ff+W/zeXQTKgP3QSmuyp
	0NRZLXH9yBnhqdqKPDObDGCwPkC970Ni4XgWjMN5yf39eMjDvrP7r5jL3MT7pZxuwT7L4uDShiO
	BI3o7v/8oDKyYb6nPlD3KL0rLnsKBaYVMJaOFt+8xNg0Y5T5VQqaNVPR/E9deQhceOKPpHB2E7B
	DEQA/U652RIq4067KHOEhemaZh82TmofFrgrQLZX1bgrBBFAWKFLKHeO34aXrVNzKG5Hl164nIQ
	ixmenH18dTwedoRpGGSiF1dVOe7HbbRIlmkt9XVZJNYSJwbQYjg6yYkNqk2sPEwvQD6dPEwpeTu
	Trwr5TGgwRjUbOl/A5TEviqF2r0BdKe/LvH9NxrJNfSsAHu3qIK4zBF85DdeQjxrWbnjqxuCKa4
	afUKrwlMH47vnEsM59eXOucTsLKsM0mXbANx8Nyi4OqGuTZxX7haluwbVhzW+FUiVS1zQzaHpdS
	SWZXh8DQDXX6XPvBWOoqgJ5Fs/NGr3hmGhhP3wF0KYNL2MMzpAW2fHA1A1j4DCgupv1UIeC9SBr
	SzqGvHoIO5eyssa5Z4+/W8euCWwiYlEMuFXkCiC342zfwx7nVi6IXcmYMtQNK0WtrOc93dK0TQp
	b++XAs/rGmoSazuj7xjin2hmhpqdSS84daWGe2iryD68rwJB4YCCM=
X-Received: by 2002:a05:6830:310d:b0:843:ed9d:1535 with SMTP id 46e09a7af769-86289913a56mr4040897a34.19.1794593782563;
        Fri, 13 Nov 2026 10:16:22 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-8628817d979sm3253414a34.22.2026.11.13.10.16.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 10:16:21 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Fri, 13 Nov 2026 11:15:00 -0700
Subject: [PATCH v4 44/58] mtd: rawnand: davinci: retain chip state across
 removal
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261113-submit-rawnand-retained-handle-lifetime-v1-v4-44-556b1d7c6221@gmail.com>
References: <20261113-submit-rawnand-retained-handle-lifetime-v1-v4-0-556b1d7c6221@gmail.com>
In-Reply-To: <20261113-submit-rawnand-retained-handle-lifetime-v1-v4-0-556b1d7c6221@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261113_181624_996859_3E85E2E0 
X-CRM114-Status: GOOD (  16.11  )
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
