Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25785606A8B1
	for <linux-mtd@archiver.kernel.org>; Fri, 13 Nov 2026 18:16:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=uGLKZUmY;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=VPW3V9vw
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=dAM0S9XkLaecNilSj9h6d/mNwjybFb/FQcbQfuagZh8=; b=uGLKZUmYlwm4SMw4iDiRni8Hp2
	TGk3qxbL7pDPDe0CVduBVkcrj+RH1/YKwTa5L/51QxYQQ/8ifo4nu6oPc05BxI0h57q87x0QiUkxf
	8HkycFXFZsO8p5Vfe/RbMa+NgRa9LM1OXg+fVeH+rwrmWB6k+GGGXcbORRBNVeWBB2Vc4myqomoxB
	GqCHh/8+QUnUoKvp67yoJpKF/EKLfLdZb/hhNgX9la8HrpJWTiqdJEAB+NK/tmaV1L8hJXLmvO1eR
	xNSQiS5rF4E46EGE5yQa/BNYlC541y+QHkskQcmyekp4ePMZpfoNshDKh9bHdTfW7a/Dyi7gCXEM4
	GA0PfWYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRvpC-0000000DsVy-294B;
	Fri, 13 Nov 2026 18:16:34 +0000
Received: from mail-ot1-x332.google.com ([2607:f8b0:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRvoq-0000000DroV-1qP8
	for linux-mtd@lists.infradead.org;
	Fri, 13 Nov 2026 18:16:14 +0000
Received: by mail-ot1-x332.google.com with SMTP id 46e09a7af769-8470d7d430fso525164a34.3
        for <linux-mtd@lists.infradead.org>; Fri, 13 Nov 2026 10:16:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794593772; x=1795198572; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5mPUHEVu65L+xu4Mh38b6InONgI5Ier43hx3eUD05eE=;
        b=VPW3V9vwS9/iOmKbmxSNwddo8S424wuCD6SQ9nRx7tZZWREQaqZJ0jNjuglGBbl+pM
         KfzBA5gqrv5rtZSiRi+/lX+IyilIOqH0YdE3lF0JBqexxU3/7frwFqp1McJkyPqnGNhw
         4DedSybRQwzFVMlSrDXJg2smllKWH7ZMhHISO5FoiSEntwJuOX8Z2e+mBFu9498ii+Wm
         NhQ/QpBo06qGCWAIvn/zbKz+KoQGjaBMNLYiJnXfCYIfYKQLo1NnAiMJ7mxAIvNaem2I
         ySrSM9hxCO9iv+eCQUsdt102IATsFUQ/svDdSfsCnIoa49+n49F02/HPLApWLohPnVYX
         SF4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794593772; x=1795198572;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5mPUHEVu65L+xu4Mh38b6InONgI5Ier43hx3eUD05eE=;
        b=FZQNgW9YhQfJ2ZyLyBX0GSQ1cqtKAmnZ8RlOTBu7mkI8MVgDmhMd++IjrUzYiW+PUN
         ND1lWrhgoS2SmWtbO6xbzBL1GZ+C1CVsZ68v3zGo3qiLoExwsToNUgdnbCcnWOG19aSz
         +4wTs3zSHfm+F61Iu5ObYtGvtvm1Np2Qd+RDUfqSX+58mquhicVDmgnkZh59bnW73qLA
         EwtKTCG2CmjAQ6sIP+cJYkb3KCdL9aNEazdlWltT3pNKiIrzKqMJuWQxLMYQ6L3nJaB1
         orKNq46KXOicUe27VrhftYT5+bYrvCYUVIigj1H39GM0A0Ox1uniNqTZbV6GlITXKtDJ
         eevA==
X-Gm-Message-State: APuU4Z/lsONitX8fC2z0oj1WAlsW+Kxkorj/0NcOh+QQadD/jqtCmXxe
	d8PTI6hYsz7m4s7um6jQniW5ilGIBEOVQDr2LH4pTcwIZb8Hke0K1hOc
X-Gm-Gg: AYBFou2vaktyuxrV/HvwBpttVsmkYyI1lvL8ZWSnVmzUAyUbmD9scSuwu/vUjVIgKef
	Ix1Af28EosFKW0IgJtoQKfz6Mj04njQTcNVY3dDWha7tKvvSr2/9rxWg3mTZDOeJX7jc02aj6xl
	LDs2nrJ97aOcgHP5wpXB8RfO3HJQxBVMkHcC25CXDzpt0ebo6QLQgTTVmlSxswQm1ALI51Q1rZr
	VxYjKOYg7bshLL0YwyaGvqg3/cSmY4383bKfbWU/dTkKzQRmLnysoQ/CUuJB2KUT8UeCHvUbDTn
	RtNNp8nwFEZ6XAchlDLUrxdd+3jjL5BQCphkE0h4xEkCmHFIoF96ykf0j8nwA8jF38fWIiygbnT
	Ma/Ydwirqs7bN6c7SDFheTK7ggI/qxxgBUsfXEgJRElPHYyLyF02/brDnj3cOLeMbbTimqD2g6/
	9SKwpxj+kxFRKtDlhSpPOKKLE3eezwIQKF5fmbqsqrwR3/YJE6qjW/y5c0PTyazQuLFF872g0Nc
	NP3SDHBhpgtf41hssWbTj2alJucpovEsguFvEWSjtiBjjPjE4EJ107mcgplfkLRcycZvM+pdAKS
	E09VN+n8tioo3aGEvlyC48ZDcfPFpAVtvvDanrSvSb4k7pndXHIFnVie5S3xxzJ/G/4RKaumUr7
	xzc6tf98ieLkhmsPcoc/FNkROIbcZM3RIz2i2hG52H2P5RLnvGLTsOWkhU4vTEiQ46qBi0GLSqo
	GmpC4oQAMM43gU6RWJ8o/8lzpg+fOMx6N7sAoX2DOHiLgUdq91YyMfbHkiiLaX67JzkGTvm/vZ
X-Received: by 2002:a05:6830:44a7:b0:821:a094:b26d with SMTP id 46e09a7af769-862898f49f0mr2869747a34.13.1794593771578;
        Fri, 13 Nov 2026 10:16:11 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-8628817d979sm3253414a34.22.2026.11.13.10.16.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 10:16:10 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Fri, 13 Nov 2026 11:14:51 -0700
Subject: [PATCH v4 35/58] mtd: rawnand: marvell: retain open-handle state
 on removal
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261113-submit-rawnand-retained-handle-lifetime-v1-v4-35-556b1d7c6221@gmail.com>
References: <20261113-submit-rawnand-retained-handle-lifetime-v1-v4-0-556b1d7c6221@gmail.com>
In-Reply-To: <20261113-submit-rawnand-retained-handle-lifetime-v1-v4-0-556b1d7c6221@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261113_101612_741351_30DA3D8C 
X-CRM114-Status: GOOD (  15.85  )
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

Retain the layout metadata used by OOB queries and unlink before put.

Run NAND cleanup during disconnection; the final core-owned put only
releases retained allocation and layout data.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/marvell_nand.c | 44 ++++++++++++++++++++++++-------------
 1 file changed, 29 insertions(+), 15 deletions(-)

diff --git a/drivers/mtd/nand/raw/marvell_nand.c b/drivers/mtd/nand/raw/marvell_nand.c
index 56350209f7e0..7bd5537d6b62 100644
--- a/drivers/mtd/nand/raw/marvell_nand.c
+++ b/drivers/mtd/nand/raw/marvell_nand.c
@@ -2630,9 +2630,7 @@ static int marvell_nand_chip_init(struct device *dev, struct marvell_nfc *nfc,
 	}
 
 	/* Alloc the nand chip structure */
-	marvell_nand = devm_kzalloc(dev,
-				    struct_size(marvell_nand, sels, nsels),
-				    GFP_KERNEL);
+	marvell_nand = kzalloc(struct_size(marvell_nand, sels, nsels), GFP_KERNEL);
 	if (!marvell_nand) {
 		dev_err(dev, "could not allocate chip structure\n");
 		return -ENOMEM;
@@ -2654,19 +2652,21 @@ static int marvell_nand_chip_init(struct device *dev, struct marvell_nfc *nfc,
 			if (ret) {
 				dev_err(dev, "could not retrieve reg property: %d\n",
 					ret);
-				return ret;
+				goto free_chip;
 			}
 		}
 
 		if (cs >= nfc->caps->max_cs_nb) {
 			dev_err(dev, "invalid reg value: %u (max CS = %d)\n",
 				cs, nfc->caps->max_cs_nb);
-			return -EINVAL;
+			ret = -EINVAL;
+			goto free_chip;
 		}
 
 		if (test_and_set_bit(cs, &nfc->assigned_cs)) {
 			dev_err(dev, "CS %d already assigned\n", cs);
-			return -EINVAL;
+			ret = -EINVAL;
+			goto free_chip;
 		}
 
 		/*
@@ -2688,7 +2688,8 @@ static int marvell_nand_chip_init(struct device *dev, struct marvell_nfc *nfc,
 			marvell_nand->sels[i].ndcb0_csel = NDCB0_CSEL;
 			break;
 		default:
-			return -EINVAL;
+			ret = -EINVAL;
+			goto free_chip;
 		}
 
 		/* Retrieve RB id */
@@ -2702,14 +2703,15 @@ static int marvell_nand_chip_init(struct device *dev, struct marvell_nfc *nfc,
 				dev_err(dev,
 					"could not retrieve RB property: %d\n",
 					ret);
-				return ret;
+				goto free_chip;
 			}
 		}
 
 		if (rb >= nfc->caps->max_rb_nb) {
 			dev_err(dev, "invalid reg value: %u (max RB = %d)\n",
 				rb, nfc->caps->max_rb_nb);
-			return -EINVAL;
+			ret = -EINVAL;
+			goto free_chip;
 		}
 
 		marvell_nand->sels[i].rb = rb;
@@ -2737,9 +2739,14 @@ static int marvell_nand_chip_init(struct device *dev, struct marvell_nfc *nfc,
 	ret = nand_scan(chip, marvell_nand->nsels);
 	if (ret) {
 		dev_err(dev, "could not scan the nand chip\n");
-		return ret;
+		goto free_chip;
 	}
 
+	ret = nand_set_lifetime(chip, container_of(chip, struct marvell_nand_chip, chip));
+	if (ret) {
+		nand_cleanup(chip);
+		goto free_chip;
+	}
 	if (pdata)
 		/* Legacy bindings support only one chip */
 		ret = mtd_device_register(mtd, pdata->parts, pdata->nr_parts);
@@ -2747,13 +2754,18 @@ static int marvell_nand_chip_init(struct device *dev, struct marvell_nfc *nfc,
 		ret = mtd_device_register(mtd, NULL, 0);
 	if (ret) {
 		dev_err(dev, "failed to register mtd device: %d\n", ret);
-		nand_cleanup(chip);
+		nand_disconnect(chip);
+		mtd_put_master(mtd);
 		return ret;
 	}
 
 	list_add_tail(&marvell_nand->node, &nfc->chips);
 
 	return 0;
+
+free_chip:
+	kfree(marvell_nand);
+	return ret;
 }
 
 static void marvell_nand_chips_cleanup(struct marvell_nfc *nfc)
@@ -2766,8 +2778,9 @@ static void marvell_nand_chips_cleanup(struct marvell_nfc *nfc)
 		chip = &entry->chip;
 		ret = mtd_device_unregister(nand_to_mtd(chip));
 		WARN_ON(ret);
-		nand_cleanup(chip);
+		nand_disconnect(chip);
 		list_del(&entry->node);
+		mtd_put_master(nand_to_mtd(chip));
 	}
 }
 
@@ -2939,13 +2952,14 @@ static int marvell_nfc_probe(struct platform_device *pdev)
 	int ret;
 	int irq;
 
-	nfc = devm_kzalloc(&pdev->dev, sizeof(struct marvell_nfc),
-			   GFP_KERNEL);
+	nfc = kzalloc_obj(*nfc);
 	if (!nfc)
 		return -ENOMEM;
+	ret = devm_nand_controller_init(dev, &nfc->controller, nfc);
+	if (ret)
+		return ret;
 
 	nfc->dev = dev;
-	nand_controller_init(&nfc->controller);
 	nfc->controller.ops = &marvell_nand_controller_ops;
 	INIT_LIST_HEAD(&nfc->chips);
 

-- 
2.53.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
