Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4574606A337
	for <linux-mtd@archiver.kernel.org>; Tue, 10 Nov 2026 07:46:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=EEYYI9G8;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fOG2V8S5
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=WCxP2BVPO3YfiLofpoqbBjG+OIPM3XdwRY6nFs76gLA=; b=EEYYI9G8D7edskFWwDJVrGyniV
	EqceTtitbONkqDi/QbZ+SmYqTiGKmF5l4wiVS8xz6BQ7mCH6z2QHcByRrZ+UVNqfWXKxI5syISP/7
	Q3sHFKDWyErMBdui1HmOUG0VvA4MaWjuYL4f335yrxsCwtzcp9LNY3o5zsn/NhPPn2Q7/pI9MGWo0
	wnrERI3sMs+oLOhfxjQBFNWlG6cWtNf/HEfCke8pjhntIU4/LVUqIJI5xpr6wgxFIlNpyG4ZnF8Os
	+Rp/Ox8Wvx+oV9OI3733FYkzUkb7yxNBzx0yflfgOiIbm3rJjPFszZ2D5BXJupTL78FN5ITqoPwo9
	4NHvokzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQgYV-00000002yf9-3dAJ;
	Tue, 10 Nov 2026 07:46:11 +0000
Received: from mail-oi1-x230.google.com ([2607:f8b0:4864:20::230])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQgXc-00000002xTp-1Uiw
	for linux-mtd@lists.infradead.org;
	Tue, 10 Nov 2026 07:45:20 +0000
Received: by mail-oi1-x230.google.com with SMTP id 5614622812f47-4ab8cb2a6e4so1048785b6e.0
        for <linux-mtd@lists.infradead.org>; Mon, 09 Nov 2026 23:45:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794296715; x=1794901515; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Au1rwh2obm9uwGdEt+TtwG7FPc9AMzgCv64EazeTRGE=;
        b=fOG2V8S5bx9sIrslNuDCuxbiNrXTYiWMohM+wrzBM8qHCBH+pTEiKVnIn1B3pxTzHX
         BKSfMsY+Uw1KX6yCLEErYCRETFFwe8bMYapaM4fE6VH8Jha8+vJ4awNm/9nvKvf2wW0c
         jHcc2aUBeYFWosMWy5WTAAHTmrpvb3vVNFk+sEVY+pZ/h/iVVYG6Ywds0u9xTiQEJRyA
         CgK7Di+Nxpl5KmagAqqKl7C8ndBXet8qONEfScGq82rBs+9OgVG0ZsqYBB3Zn7J4+KtJ
         pPs8OAYwi/GxW8QaIIsiCLRUYiGQfqJ/4Xlfp6ZFmkvjysA2rkHorMY//08p5bvToAk9
         iYqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794296715; x=1794901515;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Au1rwh2obm9uwGdEt+TtwG7FPc9AMzgCv64EazeTRGE=;
        b=gzoPqp07eT0cff80tcSRE5FZnzroJV/0jNzpht0OqzPgr4cUfKwDAkKKq1neOwStKQ
         iHU8D/Memq4rPPsb5CyWrUbhM8sT7ZPvFxButD4K1WxQpxTFKhUEQx75MoIUAXLQwk0B
         R62O/QNtG9Ryuz6dF8th5xoByKSoR4M+1jZO/bP2airlxoLrwdj6ecuuNuRImyBExY60
         QdIqiFxqEkjAWExaYyE83ttIjbewT+mBhkvP/zf/wcrJ7SaG/O/phxqfG1ITzaMYcCB1
         JtCC1jpmV7vzkvMmet7Xk74KxSGnVM9qIwDi58Y90gLETJr4eDSoFw+mxCsAirGx3v05
         i6bA==
X-Gm-Message-State: APuU4Z++abZ9ph21xeIqb4JUJvCVSoxSDZ9PD2iTwRKfjcPMuyExmXor
	fX30McwvFCW5twHMT6E64/b78bnyEi0kSZ/0pdun9TCvjAvfPg9yCS3g
X-Gm-Gg: AYBFou01wCx4945oDfaLcaCsf+eRLPMFFIqks93IKFmav4vJI/x7yNqL+RWZhXo/jOy
	limjnSLfM0D62CDvOSM66R9QwMVN1CbSrHLZyR6F3YjP1nT03imTi0oX7TnhZcs3Fdm00BqwLFb
	1R1JWCb3hj3T9UbKh50fXCcKK7ZH4kznadq+yJESGVdkRBBwyr0ZaKMunSka1VMKz+0vFAaoFWW
	EwcwzmQXSw3Ip3rFm8OqAhaMEWUEMGk6VVXy7Ylu7bRPYGVFMHfixD5Gjz/jKGzkRWEd7g5xZzp
	WbXPZuUC5+tRnyD1qJj46u+q2xH0ERSF5enXYh11TfH1pqVe+ZdYN1c4FCMKyRcYnnuiMFOwFoa
	udTdJd+2h0VWUEFfREiTdxou/AWnMOr1BjirDeEVDmUzvJtYDlfV3JPjl7hlVJpl0nGLYvbXiSG
	tzHcYm1LUQL+rmb4wBrlFPnFKw2dU8zdXkgu1ARlyBezNL1CXNVew9CjtZo2PrhD8YI/g8tgfp7
	Sd18P2EXjLYke3P/2wffxf+35IBW+GZ6w7w5V3xL8xX5kSvqcu48E/gu0EX9qQUsoONM7N/aBBs
	Ky22iR3H3525hPIhplhGQIbEk75/juuDF7sATVyhmckSB6gg+u4x12z+4kSFN7btex7YKvbmuEC
	gG9hwmDX2a5k4KFeQcmDj6Ew/RpAbU9QJjMuKEqAzd4n0Bt/GlwG3LG+kF4yLKDdVvaYn+YVUlh
	29aWVuPoDvYQOLWXuwgdxdKLVKll+WafouX2l4rHWMuuhaqt4rJ0o=
X-Received: by 2002:a05:6808:1996:b0:4a1:296:adec with SMTP id 5614622812f47-5683cbebf5dmr2115836b6e.15.1794296715421;
        Mon, 09 Nov 2026 23:45:15 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-5690504fdb5sm1522804b6e.3.2026.11.09.23.45.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 23:45:14 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Tue, 10 Nov 2026 00:44:52 -0700
Subject: [PATCH v2 49/58] mtd: rawnand: txx9ndfmc: retain chip state across
 removal
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261110-submit-rawnand-retained-handle-lifetime-v1-v2-49-9137d08f05df@gmail.com>
References: <20261110-submit-rawnand-retained-handle-lifetime-v1-v2-0-9137d08f05df@gmail.com>
In-Reply-To: <20261110-submit-rawnand-retained-handle-lifetime-v1-v2-0-9137d08f05df@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261109_234516_548975_462E598A 
X-CRM114-Status: GOOD (  15.90  )
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

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/txx9ndfmc.c | 42 +++++++++++++++++++++++++++++++---------
 1 file changed, 33 insertions(+), 9 deletions(-)

diff --git a/drivers/mtd/nand/raw/txx9ndfmc.c b/drivers/mtd/nand/raw/txx9ndfmc.c
index 4cc6e91dbc23..9eae5002e389 100644
--- a/drivers/mtd/nand/raw/txx9ndfmc.c
+++ b/drivers/mtd/nand/raw/txx9ndfmc.c
@@ -276,17 +276,33 @@ static const struct nand_controller_ops txx9ndfmc_controller_ops = {
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
+static void txx9ndfmc_release(struct nand_controller *controller)
+{
+	kfree(container_of(controller, struct txx9ndfmc_drvdata, controller));
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
+	ret = devm_nand_controller_init(&dev->dev, &drvdata->controller, txx9ndfmc_release);
+	if (ret)
+		return ret;
 	drvdata->base = devm_platform_ioremap_resource(dev, 0);
 	if (IS_ERR(drvdata->base))
 		return PTR_ERR(drvdata->base);
@@ -306,7 +322,6 @@ static int txx9ndfmc_probe(struct platform_device *dev)
 	dev_info(&dev->dev, "CLK:%ldMHz HOLD:%d SPW:%d\n",
 		 (gbusclk + 500000) / 1000000, hold, spw);
 
-	nand_controller_init(&drvdata->controller);
 	drvdata->controller.ops = &txx9ndfmc_controller_ops;
 
 	platform_set_drvdata(dev, drvdata);
@@ -361,7 +376,18 @@ static int txx9ndfmc_probe(struct platform_device *dev)
 		}
 		mtd->name = txx9_priv->mtdname;
 
-		mtd_device_register(mtd, NULL, 0);
+		ret = nand_set_release(chip, txx9ndfmc_chip_release);
+		if (ret) {
+			nand_cleanup(chip);
+			txx9ndfmc_chip_release(chip);
+			continue;
+		}
+		ret = mtd_device_register(mtd, NULL, 0);
+		if (ret) {
+			nand_disconnect(chip);
+			mtd_put_master(mtd);
+			continue;
+		}
 		drvdata->mtds[i] = mtd;
 	}
 
@@ -376,18 +402,16 @@ static void txx9ndfmc_remove(struct platform_device *dev)
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
