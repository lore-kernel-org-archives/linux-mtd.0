Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4673E60A383D
	for <linux-mtd@archiver.kernel.org>; Thu, 12 Nov 2026 01:30:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=fe3NgFDC;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PgDHp32G
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=K1x2mNj5Nak4KcczeFfDMuav8dv1CH0fr7dU4qQ3i3w=; b=fe3NgFDC4ye378vzYk1ee+0uXh
	6Xh5CN3+wkIO8hkxsi7VQ0O4rTxUzDDvNqopHnOEtk/GUGonF2cSuGRdRjRC3gtQ0cEMdXIel1WtY
	Hp9zyt0lUU62rkSZNZTBmeY5en7SrO91GpsN5iV0bS3wNJUi4pSsp/7mWr8LrQ35XiitbuGNFqHyz
	XatPJdCZRV1Ix8FLafsrcpCLrURoS7GsUoZ35eRlTfngUKhUUT5W+GeM4X+0KLxozBlqF4FsmbD0Q
	ESDROUNrnhH49rrgUk9dwTDra+vD6GR1BS1UU1XeB+gLj2a2EY2iO8W/Q1axrvZ1tRy8aeVoTC0i/
	6PosA+8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRJds-00000008OGZ-2F1S;
	Thu, 12 Nov 2026 01:30:20 +0000
Received: from mail-oi1-x22e.google.com ([2607:f8b0:4864:20::22e])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRJcx-00000008MbN-1xoK
	for linux-mtd@lists.infradead.org;
	Thu, 12 Nov 2026 01:29:37 +0000
Received: by mail-oi1-x22e.google.com with SMTP id 5614622812f47-5641f26ce05so1557757b6e.2
        for <linux-mtd@lists.infradead.org>; Wed, 11 Nov 2026 17:29:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794446962; x=1795051762; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kNGcaHU4xg09YyH3FdGk4qxS8on/P7E4zZCMCqu0z3c=;
        b=PgDHp32GUHWJCwwCx2XGrhh9LnAbAFIEHycpCkj2c6aK7sB0BDXLHX5c2kkAeD3H0h
         kB5rDrekr2b7pD1ieAdqDznxio5Wm3kaZTzdyZWM20uF+38iocAzRbmVmzWyfx9iLAKR
         YSu3EXHGrxjH/gGhqHpv27yfcEo9x4zwPuqEAOSF8fGC9MnST5eyHl2kEVcmNfvkLYIg
         eT21Le2bFadHXmRbzEOu8nVecRGLq/hea0GrEU5oZOSFUZ+bXVMc4tunPqRopon3n3UH
         fJn3+/C67zM/ZaI35hYmM5M1kTGMPQJNjlSPX+aPwzdFHKYIM9ChK9JbsjJIZRaThCMH
         1WHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794446962; x=1795051762;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kNGcaHU4xg09YyH3FdGk4qxS8on/P7E4zZCMCqu0z3c=;
        b=slQH+cMyo3qnCeQ3gWTGK+YmdSTNJOWAoOoDKJq2FU8+D/UVY4EAMV2ZJ7/tPi8f+l
         M+mU8kG1yGyyNjy/zVNn6vwsmh1nwgoVLomeJtqSj3e28FBYt2fenSJVFEWyVDghXGuU
         sf7mG3rTZ8SInQz6PoGFN0h7KT91BGDBnEr/sIFFhMsnE3a7NndxmCkySUjtciMk7853
         drbJDp9qZMewzvWIunioInDth/8StPV64sy0NDW4J8DbMZSBxV2C7q3jXRuFWPCXYFKs
         4S8pRKECl3sMWma13fkYnc4DAV3ltY+Rq9w3aerzyta/gXVV370jZfevneXODEPZHE14
         UVMw==
X-Gm-Message-State: APuU4Z+aSLuHRMkqVrLYW3LpqdIn4yWHgJ6m6EXYN+8Ofo8TuNEYLFSC
	GyVnfBV68FO4l39eCA2n2hmkbstFAga3O5NWg27k/zpPSwtUnh/h/7V9
X-Gm-Gg: AYBFou1L8ywepPu3ofPjztP72KWCUjeirhfHtvnXAiLnPDDr00YAkEiahpM0ft3F5/m
	QMoKpbPfiKbeR8MtoFGCbIzvkneV24hmazz8eaSNOP2G5B/dr0839oCrduHFXYJIm9YsNNEmUYH
	pTon9bxlTTf3EQ/oP/qHSmVWTTckzFvRQfn5xJlmO0lAPN8hCg7/9kpj53YvTw2w2Rt453qEeNp
	WhYGIv/7o14AqJMhvLaxfdBShAkFNxb2yQuZVwby7zJZuF2bD6Q+g+7Ehu5Oeeenoqcc74ZQPjl
	H7cOLMWrqN1WjTlItptP038Gwy1kuyFdY100Uy0bQHOSuf8VVVQVowC/WiiIHp/kviBgU7Kiro8
	xlLF4hkKZ1mtq4sT5qKJwQ/ZY/WBjaBnhw2XWNcSg1756NvOAoawLRxPwOxVT4uJ6wtv/ZRJ1bV
	05X1MKdkWQocBLL+rMQ3gUdOHWZIiammErAl8Fu1PWdaEHua7hVDVIjru69lcvcnqiZ7ck/e36s
	XYp3hl2j12nt0hIyu0j5OVM4oQd5gXarz8IAjbXqA5J2RNO/XId5058CrAhZjl2jTFOXwH6MP9r
	L+b3a6SzSC88yoBT3HGpfG27ykjSdetHkHlgt/gOX3dWiYJvZ6lmtOI2Bxh8nVPEJ8xghe75gqi
	JqoIaBaiu8e+7fwe4D1bskjcUkolkiOEBuzugamnwfpJEGmRBMRYtuE8NUuD72khqIPUhzxzurq
	GvqjZZpmZScBrkWCcXT03kn2YkdLTV7FAkaC2sK9JPlcxoc7ENFFv5
X-Received: by 2002:a05:6808:11c7:b0:4cb:818f:d571 with SMTP id 5614622812f47-56b95880764mr4083159b6e.25.1794446962300;
        Wed, 11 Nov 2026 17:29:22 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-56905738049sm6823481b6e.10.2026.11.11.17.29.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 17:29:21 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Wed, 11 Nov 2026 18:28:28 -0700
Subject: [PATCH v3 49/58] mtd: rawnand: txx9ndfmc: retain chip state across
 removal
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261111-submit-rawnand-retained-handle-lifetime-v1-v3-49-ce537999741d@gmail.com>
References: <20261111-submit-rawnand-retained-handle-lifetime-v1-v3-0-ce537999741d@gmail.com>
In-Reply-To: <20261111-submit-rawnand-retained-handle-lifetime-v1-v3-0-ce537999741d@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261111_172924_648611_E639CE26 
X-CRM114-Status: GOOD (  16.06  )
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

Retain each chip and its shared controller while MTD references remain.
Unregister and disconnect before dropping driver ownership, and check
MTD registration failure without publishing partially initialized chip
slots.

Run NAND cleanup during disconnection; the final core-owned put only
releases retained allocation and layout data.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/txx9ndfmc.c | 39 ++++++++++++++++++++++++++++++---------
 1 file changed, 30 insertions(+), 9 deletions(-)

diff --git a/drivers/mtd/nand/raw/txx9ndfmc.c b/drivers/mtd/nand/raw/txx9ndfmc.c
index 6fd6e530c38b..bd0cc30ab820 100644
--- a/drivers/mtd/nand/raw/txx9ndfmc.c
+++ b/drivers/mtd/nand/raw/txx9ndfmc.c
@@ -276,17 +276,28 @@ static const struct nand_controller_ops txx9ndfmc_controller_ops = {
 	.attach_chip = txx9ndfmc_attach_chip,
 };
 
+static void txx9ndfmc_chip_release(struct nand_chip *chip)
+{
+	struct txx9ndfmc_priv *priv = nand_get_controller_data(chip);
+
+	kfree(priv->mtdname);
+	kfree(priv);
+}
+
 static int txx9ndfmc_probe(struct platform_device *dev)
 {
 	struct txx9ndfmc_platform_data *plat = dev_get_platdata(&dev->dev);
 	int hold, spw;
-	int i;
+	int i, ret;
 	struct txx9ndfmc_drvdata *drvdata;
 	unsigned long gbusclk = plat->gbus_clock;
 
-	drvdata = devm_kzalloc(&dev->dev, sizeof(*drvdata), GFP_KERNEL);
+	drvdata = kzalloc_obj(*drvdata);
 	if (!drvdata)
 		return -ENOMEM;
+	ret = devm_nand_controller_init(&dev->dev, &drvdata->controller, drvdata);
+	if (ret)
+		return ret;
 	drvdata->base = devm_platform_ioremap_resource(dev, 0);
 	if (IS_ERR(drvdata->base))
 		return PTR_ERR(drvdata->base);
@@ -306,7 +317,6 @@ static int txx9ndfmc_probe(struct platform_device *dev)
 	dev_info(&dev->dev, "CLK:%ldMHz HOLD:%d SPW:%d\n",
 		 (gbusclk + 500000) / 1000000, hold, spw);
 
-	nand_controller_init(&drvdata->controller);
 	drvdata->controller.ops = &txx9ndfmc_controller_ops;
 
 	platform_set_drvdata(dev, drvdata);
@@ -361,7 +371,20 @@ static int txx9ndfmc_probe(struct platform_device *dev)
 		}
 		mtd->name = txx9_priv->mtdname;
 
-		mtd_device_register(mtd, NULL, 0);
+		ret = nand_set_lifetime(chip, txx9_priv);
+		if (ret) {
+			nand_cleanup(chip);
+			txx9ndfmc_chip_release(chip);
+			continue;
+		}
+		kfree(txx9_priv->mtdname);
+		txx9_priv->mtdname = NULL;
+		ret = mtd_device_register(mtd, NULL, 0);
+		if (ret) {
+			nand_disconnect(chip);
+			mtd_put_master(mtd);
+			continue;
+		}
 		drvdata->mtds[i] = mtd;
 	}
 
@@ -376,18 +399,16 @@ static void txx9ndfmc_remove(struct platform_device *dev)
 	for (i = 0; i < MAX_TXX9NDFMC_DEV; i++) {
 		struct mtd_info *mtd = drvdata->mtds[i];
 		struct nand_chip *chip;
-		struct txx9ndfmc_priv *txx9_priv;
 
 		if (!mtd)
 			continue;
 		chip = mtd_to_nand(mtd);
-		txx9_priv = nand_get_controller_data(chip);
 
 		ret = mtd_device_unregister(nand_to_mtd(chip));
 		WARN_ON(ret);
-		nand_cleanup(chip);
-		kfree(txx9_priv->mtdname);
-		kfree(txx9_priv);
+		nand_disconnect(chip);
+		drvdata->mtds[i] = NULL;
+		mtd_put_master(mtd);
 	}
 }
 

-- 
2.53.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
