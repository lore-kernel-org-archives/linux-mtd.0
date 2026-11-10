Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFD6D606F630
	for <linux-mtd@archiver.kernel.org>; Tue, 10 Nov 2026 07:45:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=iOFYa8yN;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EAky8quo
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=wm//XnDbGw6h7+N6hQTMr+Xzj6VzU1HCEJvh0pOsIb0=; b=iOFYa8yNBWH2chtH4lBP0vUqqE
	6iwgWiLiQ8h2p4OPJPFTR/MvrDFc0138mm0aYy+stJOiKAGqheShsESueNzdewllvVoSpFhKyhhKp
	0AC1LxqhSHGrgNXmT/2mGq3VnrCJKdm/Rtl0MpefaiBtTom8J24YfxbVIo7tGnHxVtYThtvQbjseB
	26PrpeZ3rmozp70lCPwaYtkXBt1n5QCVBzaz3mWA4xfVNiQlwPW3E176XyHzG1nXBHXMBA1H1iXs7
	XWJuBvlaymBQa2EbKmlcmhhEaVllwcnjYDFHD0cSYR1KfR+j7sLt6J2w6/mQCNVV0+ScGjrlSuX4g
	L7geu7rQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQgXN-00000002wvw-2RqP;
	Tue, 10 Nov 2026 07:45:01 +0000
Received: from mail-ot1-x32b.google.com ([2607:f8b0:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQgX8-00000002wPu-360X
	for linux-mtd@lists.infradead.org;
	Tue, 10 Nov 2026 07:44:57 +0000
Received: by mail-ot1-x32b.google.com with SMTP id 46e09a7af769-854b6e2e41fso899485a34.3
        for <linux-mtd@lists.infradead.org>; Mon, 09 Nov 2026 23:44:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794296686; x=1794901486; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yPalnhmB2Hlw2S3v9inZlxSAgERDikfH2sBKEiU7RGo=;
        b=EAky8quoRzf1/oLQ86kCHPVL16yYkWkejeSLTDbPL1hmFcT4Is1MRXgZnPJ9wMxBrr
         03erclpI//p0KMf8yNraOkkuKpcs4glE876J+Nyx2XGo4iF8bJPx7JGD1nsbCPJTQV/D
         NvpJa7zVxAwuBsdMS0Oy6KeYZhxfCex1toyYAu237iWS7od4PwVziTHi59QXPsAmj7Sv
         9a0hULDAIswyEHZV/4VfQ51vccGNrhLPjktzM0PE+guUTpUwM/VoeJWjenN231VXatP6
         Ur5UOgLXGODWju5qeETKC7HZiwmOAdPTRQfEUNQfhJha1TB7ByzKtPRNysV2jfQ+K9Me
         Gxyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794296686; x=1794901486;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yPalnhmB2Hlw2S3v9inZlxSAgERDikfH2sBKEiU7RGo=;
        b=uTDScy0loEZCDkSpKgJ6E1Hpb5vWgePLEZohQlrDATMUueqa8tkCelIPs+6a4gGgGq
         VLi/F4qVIROgkTzvKBBEkTiuGONqNDdS5cZclPDMXPLikVBdlWxjtu7sjnhCoGf5o6v2
         lPPqydNqkB/KZ4hqwNThKuyLnX398DejzXSCTOXP0Ro3jxXd+pu2fMo1grykORmue594
         Mra1WHaPNNomJc98CdChULUKH7O8Gvo9e0vPz/A6UycDhwMYIzYy3xqb57Z668/5FBem
         zZfrEKNynlhltX6fKoPjFa8MNypqTF4HVhElH56nw6rqrD6+WOTvcccUSQlhXGnfxCNm
         NbFQ==
X-Gm-Message-State: APuU4Z/MCwplGGhgiAfXFrzzLzAQvB6Kkq8987nr0KHthOf+OrQPCFw/
	v3fvKgC+Gonbhu1v3WoTGX7xQECjYAgWP0N8vdbpzn8Eaa7B9141b/Q/
X-Gm-Gg: AYBFou17sCK6Jo5Cr2HEZauxjlkyXSqDBS/hJ12om2kjHGut7cxCqKOkzA9hMi5OCvn
	AcDtTgEGy5YOXU4zGHTolrnlnoixRZfYXJpM98kLm+KDiYbPgoheyGgbimiM6n+LALgnDGRR4Xj
	F1bPPUB05jNModT+LpOBuSAkkR4cwm6D159eaYfLfQENLod6caVeizxz6hjhKydIA2gprGrBez7
	hTpNtoJnWkSr0z/OeFs4AJkI+t3j+s8Q0vy2DqE33Iyvi8R5NDmxGq8hvDRrNsroP8eP2W5GAlc
	9DE2HC9t09gA1twoIrKYmIqqxzmazKuYr2Gnw32RixoNkGrCSukklaP/0S46mFAGJEe15y50ODR
	mFMtt5Z2HonCKGqOLuUpO/dtCgBgrs27kLP2Zm4Sp1hzBwva4HE54/nvr9tYJjlx/Hxq6Dmf/xv
	7EUFjpjscR7/jLQDnE5veoXQOkCNVEuABtCCotQ/6iOSF5HG1gpR7A3BdGlgRGs5sVFwx9NZnXt
	rnp4J6jGfBM7HT3IzVS1hxErjiM42b0lmI++ALrzN+y1VTqDB0fgsAHYuCOvr0ImdYoM9z3Lqet
	99zvQg3UfB6epwODmk6o78zb4z5XB2OvkDnUluTggQ5FEpPeQCsakLUIWV+d/fTLFz3oV+vw7RM
	5oHIOI6QbLOjT15oS2c5EYSaRnSrE3Yw1ebOUMLQRai/uUUx3ag9fLL2sXrIas23STJDTn9IVt4
	IKibcf5ulwuVK21F3g2Pr4+/ajQKfzCAIXX4+3iXkXvfXCfVfeKwOj
X-Received: by 2002:a05:6808:2507:b0:551:2eeb:d53c with SMTP id 5614622812f47-5683ce07f0amr1272378b6e.44.1794296685734;
        Mon, 09 Nov 2026 23:44:45 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-5690504fdb5sm1522804b6e.3.2026.11.09.23.44.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 23:44:45 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Tue, 10 Nov 2026 00:44:26 -0700
Subject: [PATCH v2 23/58] mtd: rawnand: ams-delta: retain open-handle state
 on removal
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261110-submit-rawnand-retained-handle-lifetime-v1-v2-23-9137d08f05df@gmail.com>
References: <20261110-submit-rawnand-retained-handle-lifetime-v1-v2-0-9137d08f05df@gmail.com>
In-Reply-To: <20261110-submit-rawnand-retained-handle-lifetime-v1-v2-0-9137d08f05df@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261109_234446_829988_125A1EFD 
X-CRM114-Status: GOOD (  15.40  )
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

Apply write protection after unregister notifiers finish their writes.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/ams-delta.c | 29 +++++++++++++++++++++--------
 1 file changed, 21 insertions(+), 8 deletions(-)

diff --git a/drivers/mtd/nand/raw/ams-delta.c b/drivers/mtd/nand/raw/ams-delta.c
index fb2b7db70297..e918a41875a5 100644
--- a/drivers/mtd/nand/raw/ams-delta.c
+++ b/drivers/mtd/nand/raw/ams-delta.c
@@ -230,6 +230,11 @@ static const struct nand_controller_ops gpio_nand_ops = {
 	.setup_interface = gpio_nand_setup_interface,
 };
 
+static void gpio_nand_release(struct nand_controller *controller)
+{
+	kfree(container_of(controller, struct gpio_nand, base));
+}
+
 /*
  * Main initialization routine
  */
@@ -250,10 +255,12 @@ static int gpio_nand_probe(struct platform_device *pdev)
 	}
 
 	/* Allocate memory for MTD device structure and private data */
-	priv = devm_kzalloc(&pdev->dev, sizeof(struct gpio_nand),
-			    GFP_KERNEL);
+	priv = kzalloc_obj(*priv);
 	if (!priv)
 		return -ENOMEM;
+	err = devm_nand_controller_init(&pdev->dev, &priv->base, gpio_nand_release);
+	if (err)
+		return err;
 
 	this = &priv->nand_chip;
 
@@ -355,7 +362,6 @@ static int gpio_nand_probe(struct platform_device *pdev)
 
 	/* Initialize the NAND controller object embedded in gpio_nand. */
 	priv->base.ops = &gpio_nand_ops;
-	nand_controller_init(&priv->base);
 	this->controller = &priv->base;
 
 	/*
@@ -382,9 +388,15 @@ static int gpio_nand_probe(struct platform_device *pdev)
 		return err;
 
 	/* Register the partitions */
-	err = mtd_device_register(mtd, partitions, num_partitions);
+	err = nand_set_release(this, NULL);
 	if (err)
 		goto err_nand_cleanup;
+	err = mtd_device_register(mtd, partitions, num_partitions);
+	if (err) {
+		nand_disconnect(this);
+		mtd_put_master(mtd);
+		return err;
+	}
 
 	return 0;
 
@@ -403,13 +415,14 @@ static void gpio_nand_remove(struct platform_device *pdev)
 	struct mtd_info *mtd = nand_to_mtd(&priv->nand_chip);
 	int ret;
 
-	/* Apply write protection */
-	gpiod_set_value(priv->gpiod_nwp, 1);
-
 	/* Unregister device */
 	ret = mtd_device_unregister(mtd);
 	WARN_ON(ret);
-	nand_cleanup(mtd_to_nand(mtd));
+	nand_disconnect(mtd_to_nand(mtd));
+
+	/* Apply write protection after draining outstanding operations. */
+	gpiod_set_value(priv->gpiod_nwp, 1);
+	mtd_put_master(mtd);
 }
 
 #ifdef CONFIG_OF

-- 
2.53.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
