Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A487606A336
	for <linux-mtd@archiver.kernel.org>; Mon, 16 Nov 2026 06:31:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=XvrjzDBY;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=IhCfFbCq
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=PNoLwMqSUaL4pDCm6UGNxd497c0/zGqBKkgJijn+Q5I=; b=XvrjzDBY7NtaVySNwPC97wsqxy
	YyEEMQeZJuSj5Zk31rq0L1m0U/popeIiEWpsrcC8r7pF9c2N6+x9oftXm510CoKeuHt14kDhQTlc1
	XYtPgraBmY0Q8enq8g6l4UMf9IifjjSxIB9Yt+PfAlN5gKUwQ8Zt3W2Me64bec9aStnYmZWGVepCg
	9wlWEJpTq65RZ0Yl2XiD8pOVtF9si0srMcZ64Bl5Y4Z9KEsPPr2ht2N5h/+NjCU9DE71MGDAWZvIl
	738TmLxledW7vrv4rorS+iRuQ0BWMvDSMlf1FnMfSAVKB7l7+zbCjW0mF5ICwQ0qDRdwAX2+AFv6V
	Hm00aPwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSqFU-00000001Hc8-20Qa;
	Mon, 16 Nov 2026 06:31:28 +0000
Received: from mail-oo1-xc2d.google.com ([2607:f8b0:4864:20::c2d])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSqEt-00000001GRt-2Jme
	for linux-mtd@lists.infradead.org;
	Mon, 16 Nov 2026 06:30:54 +0000
Received: by mail-oo1-xc2d.google.com with SMTP id 006d021491bc7-71ac9e15640so1442448eaf.3
        for <linux-mtd@lists.infradead.org>; Sun, 15 Nov 2026 22:30:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794810651; x=1795415451; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SZxy7Yx5F8CCUEM8n5KMaftz8PulPwrUSyE4Y9PNbKc=;
        b=IhCfFbCqbC6EHQv9aOpftoebuvpnYgC0HXisjWCIHPawNlTEBDSgl8MToH5AAkvHAK
         NwHKWBPmLRFMjoqp+g9QndTBZG4XsOLTMbLA+579zkTqsvVEvD4B36qVg8LF0AIZzcN8
         EzBMld3fKRr8ElokCZBl3+s7CC9KvAdW/iL6Gmby0P3r//sobDTIykxcXqwR+RAse3oO
         lAnYs25WtxkqF+5kZAV1lN0ie4MMd9kkcbeWBmMzBFFmcxgrXrwgTjERKF8DBHBKxsP4
         ODfTF/gBEN83U+kS9tLf97zYCaRZGsPZHX8zbzrMktz3KzM5FuisS6x/tU6bCRTCLUxt
         0MXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794810651; x=1795415451;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SZxy7Yx5F8CCUEM8n5KMaftz8PulPwrUSyE4Y9PNbKc=;
        b=UknU0/ADerFhkJjSQO9clbZ64YWMWH2SBXwVyjqFjXeWzDMbSi9t8bhuJ5/YyEM4c3
         mvhW7gmXvdqF+PSKdUXBPP2U1XVSk60uNq0lhNEU7NnknFNDAEN+mTkSLbDyAIpD3Xyz
         XSHL9C05FzzoJb/7Kn/40Lf8/hqW4zcjEzHbZeoI19yZ9IZ9URexEANnxNMdXxhcimEO
         dp/m+REU6se/m1oOj3tB5N4wJpKw0ptblqNF0VdSBCr1l5tFZ/SD9YOXfX1Q8OfnSci0
         HJgiTcr2j1EgJUZ7KxaWGZu2HYpyCRA0vJ0HVMuRN700TYamBEWthXklG7Xz0xevH7q5
         VDrQ==
X-Gm-Message-State: APuU4Z/QJWL/7YnAq2tEgRInfd66RhkllleY9tepNM9L0DxOP3hBcSc+
	aPLhsYMTHu8Ua0yNo38cynPu3phE7fJqeGZsJXXi3lzioBpPt0p6hS7Xcv9G1exR
X-Gm-Gg: AYBFou2sC9anZ5wZG37W02D1Fa4R+jwpgJC3fk3RyiyS4Embntb4FBfqsyAdpSqYeIY
	u7Qg/wPHvNfpYLp41EmJyJAVmUS3wGgD0ipRKp2VouDGWhmK62ZGqrLMohFYpqADYns+DcPRDkg
	r3UKfRhyNyjQefBoYIjzxMmjyRaRZ7k/XSTf6ajlmA7T9IF959fWTKhVD70aGszvp3QX5Rao6kW
	SD5XcR1SRENol69mKaUyO7BPYtXgbpDjcga/QKrejiYVfoLcuOGPviY6Yfy9Ncc6BV0Qsc0Ql7G
	Dt6D2mtt75ibhubFkuuCbkihymUbobVR+yQ5EmGNKnaUs0eaZoJ1cGMU+8HY4MtJP97KT1Xv347
	2u295YczFwnj36CGJ917x+Sv8b32N9q2BYW2osxMKWfoM0drpCU1LMhGRhBp/bGe3WAwkf2qJiv
	x9RmJs6fPFRoghRxYsWk4LrcK2kZ4bNOsrGZHOVnuSBJWSGyqquuIVsb9QzXGtycWu+1dch+Z0b
	ERjLVdiauJeOIviO6xwTMDKy9xJtC6Cg7GZS9X4DE6goXjdxpAp7vGcYv7yaRkT9y3R6qoj8Qtp
	4GDfm6vYGULgtX0EbGFeUbyUOeqweR3vJOhf4iPYrZtdAyW+Sfbrko1UbnkBM7KkmuunnG7Sc5v
	dJuu2PQ2Vy3djuF6PPtcBB2LsEhO1eq3toHscGmtz+WjSAbJ41uE1tGiJOUNs4p3V0ELG5o8BKc
	vF5DWWr7EoMMir8aUi/TLj8lPChT4QDiIGkCgTM4aiRaUK1fc4MDk=
X-Received: by 2002:a05:6820:8594:20b0:71a:ee95:bfcd with SMTP id 006d021491bc7-71aee95c2ddmr1216134eaf.36.1794810650798;
        Sun, 15 Nov 2026 22:30:50 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-71ab42c41e9sm7994558eaf.6.2026.11.15.22.30.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 22:30:50 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 15 Nov 2026 23:30:09 -0700
Subject: [PATCH v5 54/58] mtd: rawnand: fsl_ifc: retain chip state across
 removal
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261115-submit-rawnand-retained-handle-lifetime-v1-v5-54-cbc49c5c5e74@gmail.com>
References: <20261115-submit-rawnand-retained-handle-lifetime-v1-v5-0-cbc49c5c5e74@gmail.com>
In-Reply-To: <20261115-submit-rawnand-retained-handle-lifetime-v1-v5-0-cbc49c5c5e74@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.17-dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261115_223053_232178_186135D5 
X-CRM114-Status: GOOD (  16.15  )
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

Separate active bank membership from ownership of the shared IFC NAND
controller. Retained chip references keep the controller lock and chip
metadata alive after removal, without retaining hardware mappings.

Disconnect before device-managed resources disappear and drop the shared
controller reference from each chip's final release callback.

Run NAND cleanup during disconnection; the final core-owned put only
releases retained allocation and layout data.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/fsl_ifc_nand.c | 46 +++++++++++++++++++++++++++----------
 1 file changed, 34 insertions(+), 12 deletions(-)

diff --git a/drivers/mtd/nand/raw/fsl_ifc_nand.c b/drivers/mtd/nand/raw/fsl_ifc_nand.c
index 20ae012adbaa..8b48c94ea8c5 100644
--- a/drivers/mtd/nand/raw/fsl_ifc_nand.c
+++ b/drivers/mtd/nand/raw/fsl_ifc_nand.c
@@ -40,6 +40,7 @@ struct fsl_ifc_mtd {
 /* overview of the fsl ifc controller */
 struct fsl_ifc_nand_ctrl {
 	struct nand_controller controller;
+	unsigned int users;
 	struct fsl_ifc_mtd *chips[FSL_IFC_BANK_COUNT];
 
 	void __iomem *addr;	/* Address of assigned IFC buffer	*/
@@ -961,11 +962,20 @@ static int fsl_ifc_chip_init(struct fsl_ifc_mtd *priv)
 	return 0;
 }
 
-static int fsl_ifc_chip_remove(struct fsl_ifc_mtd *priv)
-{
-	ifc_nand_ctrl->chips[priv->bank] = NULL;
+static DEFINE_MUTEX(fsl_ifc_nand_mutex);
 
-	return 0;
+static void fsl_ifc_chip_remove(struct fsl_ifc_mtd *priv)
+{
+	struct fsl_ifc_nand_ctrl *ctrl;
+
+	ctrl = container_of(priv->chip.controller, struct fsl_ifc_nand_ctrl, controller);
+	guard(mutex)(&fsl_ifc_nand_mutex);
+	ctrl->chips[priv->bank] = NULL;
+	if (!--ctrl->users) {
+		priv->ctrl->nand = NULL;
+		ifc_nand_ctrl = NULL;
+	}
+	nand_storage_put(&ctrl->controller.storage);
 }
 
 static int match_bank(struct fsl_ifc_global __iomem *ifc_global, int bank,
@@ -981,8 +991,6 @@ static int match_bank(struct fsl_ifc_global __iomem *ifc_global, int bank,
 	return (cspr & CSPR_BA) == convert_ifc_address(addr);
 }
 
-static DEFINE_MUTEX(fsl_ifc_nand_mutex);
-
 static int fsl_ifc_nand_probe(struct platform_device *dev)
 {
 	struct fsl_ifc_runtime __iomem *ifc;
@@ -1016,30 +1024,35 @@ static int fsl_ifc_nand_probe(struct platform_device *dev)
 		return -ENODEV;
 	}
 
-	priv = devm_kzalloc(&dev->dev, sizeof(*priv), GFP_KERNEL);
+	priv = kzalloc_obj(*priv);
 	if (!priv)
 		return -ENOMEM;
 
 	mutex_lock(&fsl_ifc_nand_mutex);
 	if (!fsl_ifc_ctrl_dev->nand) {
-		ifc_nand_ctrl = devm_kzalloc(fsl_ifc_ctrl_dev->dev, sizeof(*ifc_nand_ctrl),
-					     GFP_KERNEL);
+		ifc_nand_ctrl = kzalloc_obj(*ifc_nand_ctrl);
 		if (!ifc_nand_ctrl) {
 			mutex_unlock(&fsl_ifc_nand_mutex);
+			kfree(priv);
 			return -ENOMEM;
 		}
 
 		fsl_ifc_ctrl_dev->nand = ifc_nand_ctrl;
 
 		nand_controller_init(&ifc_nand_ctrl->controller);
+		nand_storage_init(&ifc_nand_ctrl->controller.storage, ifc_nand_ctrl);
 	} else {
 		ifc_nand_ctrl = fsl_ifc_ctrl_dev->nand;
+		nand_storage_get(&ifc_nand_ctrl->controller.storage);
 	}
+	ifc_nand_ctrl->users++;
 	mutex_unlock(&fsl_ifc_nand_mutex);
 
 	ifc_nand_ctrl->chips[bank] = priv;
 	priv->bank = bank;
 	priv->ctrl = fsl_ifc_ctrl_dev;
+	priv->chip.controller = &ifc_nand_ctrl->controller;
+	nand_set_controller_data(&priv->chip, priv);
 	priv->dev = &dev->dev;
 	priv->vbase = vbase;
 
@@ -1071,12 +1084,19 @@ static int fsl_ifc_nand_probe(struct platform_device *dev)
 	ret = nand_scan(&priv->chip, 1);
 	if (ret)
 		goto err;
+	ret = nand_set_lifetime(&priv->chip, priv);
+	if (ret)
+		goto cleanup_nand;
 
 	/* First look for RedBoot table or partitions on the command
 	 * line, these take precedence over device tree information */
 	ret = mtd_device_parse_register(mtd, part_probe_types, NULL, NULL, 0);
-	if (ret)
-		goto cleanup_nand;
+	if (ret) {
+		nand_disconnect(&priv->chip);
+		fsl_ifc_chip_remove(priv);
+		mtd_put_master(mtd);
+		return ret;
+	}
 
 	dev_info(priv->dev, "IFC NAND device at 0x%llx, bank %d\n",
 		 (unsigned long long)res->start, priv->bank);
@@ -1087,6 +1107,7 @@ static int fsl_ifc_nand_probe(struct platform_device *dev)
 	nand_cleanup(&priv->chip);
 err:
 	fsl_ifc_chip_remove(priv);
+	kfree(priv);
 
 	return ret;
 }
@@ -1099,9 +1120,10 @@ static void fsl_ifc_nand_remove(struct platform_device *dev)
 
 	ret = mtd_device_unregister(nand_to_mtd(chip));
 	WARN_ON(ret);
-	nand_cleanup(chip);
+	nand_disconnect(chip);
 
 	fsl_ifc_chip_remove(priv);
+	mtd_put_master(nand_to_mtd(chip));
 }
 
 static const struct of_device_id fsl_ifc_nand_match[] = {

-- 
2.53.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
