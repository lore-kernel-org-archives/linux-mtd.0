Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF2EF606A33D
	for <linux-mtd@archiver.kernel.org>; Tue, 10 Nov 2026 07:46:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=zN2X5ddu;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZGTWXF7V
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=v+0Bq3ngYBWsgNoKvOZ/K5S/WHq5P52HwnGQzl54vdA=; b=zN2X5ddupfbR4FCVrd6ol4Hn4c
	QoF6Vt0AoKJ6kax8TgDWtySoHKjCfTNaGakQ/ZGsJFMrdOe/FQzBLEiuFcwRPARAxrbxLrlCMEn6t
	RwoHvviGPrR0/d9oqemWx4f3th2dt/9Zm928MkwIcPUzC+l1ZCTOD17VhM4Ofqej+Nos/PdGPnNUz
	99GaOJgCoUfB/fgC//KTBlRt8T9tvu6Toai0gcxUNl2eBNdck4cJgOwM8FmlqA1M/2fxR72sTimib
	RqjUZYLZUDzBpjtP4mfhmPuCnePpkqnpvapDA27wL0WBFfZngcnLN/P7AIFM7sVFz7C1xNQfoPfvL
	/n+Wd0jA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQgZ1-00000002zRt-1HfD;
	Tue, 10 Nov 2026 07:46:43 +0000
Received: from mail-ot1-x331.google.com ([2607:f8b0:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQgXi-00000002xfS-1IqT
	for linux-mtd@lists.infradead.org;
	Tue, 10 Nov 2026 07:45:36 +0000
Received: by mail-ot1-x331.google.com with SMTP id 46e09a7af769-8451a619da7so1073478a34.1
        for <linux-mtd@lists.infradead.org>; Mon, 09 Nov 2026 23:45:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794296721; x=1794901521; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NppZ7CUb04bxQjnUofthCMie7KVnuMp1vzpPBAm263s=;
        b=ZGTWXF7VPLDz1TjlMiSTwlS+i04YMnPLyCF1ny5BuWZ195nvml/62OKxSsTMp+92eR
         2dnWITJdHh//puX7CMmE7bB/f+WNNjGZT1mSMXTDYRuCsniBhRRELH0uNdXW4bDp+L2M
         bNUDjn4IPy9HcCd5X9E93vzI1wt9qkGJBOQzewEzaa83iPKO22zG5C+j07aenpNTRFFw
         pDh6J97yp+1Z4rzEUgZ4nejfPaQEc5+3UXgFFnNTQ0TXGArFRSBhlTcpMawURDYKC3Ns
         q+M+FHBM+HARj3JznXM4Cg+EdVn040MIcYaHsmG4OMmMBEeMdW+JhdRrStXiXW2RwmHZ
         nlrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794296721; x=1794901521;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NppZ7CUb04bxQjnUofthCMie7KVnuMp1vzpPBAm263s=;
        b=sSAoptEybguGh/tJkEOA75zq2MZwtdi3pkRoWdbjlCVqHYhwPN1+nMIolzzZx8vqHm
         wdxEMWV/so8kL/PuxQ+rmFL7jb+RyUI/Mivbv01sX2mU5ZweIMK9W6Z/PgWCJ3sTXXkV
         M2QtdGVziDa0lrlrOAd9TJKRHuiknlRB4bssrhcm9dr/jVKtilcAadATw9w1dwnQ8arJ
         VMO14YrdpnhVq37C35aAEpL3wKMMB0qB2dR80ndLeen++Wqs009p7khSG/4ls8uozogU
         b9+Nz3OKK1TniDQ7X47dwPodX5oP63whCS1GhYXcDCd/Ynd/kEhyPPgk1Ns8r+YJldJR
         XkGg==
X-Gm-Message-State: APuU4Z+ioZ1c5Y1jM3UtXyYdd+tHdt8o0VhNrch8PA/+DNcJS3deNDvv
	xp2dC08UiGStv5Jaxxt6AfD4cTP7L9q43d+AXD5aCctlp1QzcxshYC/M
X-Gm-Gg: AYBFou2VIg0w/Hsu/oKL0zdtaNTocrrjpi1TkzI6mrm2RAgADGiQcuvU82HAzkt/ttQ
	ELZx/oUg8fuy1V/rpJHCSySpK8p7v1juhBhFUFAtQ3eUJYc+zLa9wjX9cy+IrAV//maFyGroo7w
	RspBVQfJWqMbJ7kTH104Eynt4z9heuBECp5fCHUmPedbFVHxQPJ+3POEDOQa/XBPLfD6M4lEdti
	kPODpKWjs1IBAfOKj+q0/nFsSYl6nmbo2TSHiDdsQFitE7/vAi+lTQ/4sztOvFh/XyRygLzaGqU
	e0B3eoUmZjfJqU2V+jQXORvFa8fYF3gS4QOn1NlAeMg8OTPfmZPGceyNgTdCPFXhucYLqzhiolo
	5EZFn/zYjbkxeYw+NgbldKsl4VFxcjI1wBkjPhawTie7zvuYbjxRVtuA6qqbOZcyTVpJK8gaLf0
	Mp6imDjUKYV8CoZUIHT75fJ2BLaePREaiypf4Hk+Lop5nkhg4XGk7JDQBRUmfpnmHzRgekOplZY
	YOGh+yVxvz5FUjatLsau3GY8VVR9pPRDwIfReqmQJRqgHWN3we+0QWoh8AJT7yl8Ot/cxr24Q1t
	cNHDEFZGxVFJUpgnp9qfGpTn/l1cHiAc4+qCYe1NrOzc4xsJykO6ihHCTRBHhJs7NVQ7q9CctjA
	WQXUHTDt9pgsolebn0qriFnp9HSguxSqj1IPsBqVu4RWezW1yE7sKYirizIGsH+y4J3e7z7SK9K
	GPars6EZYU6spULYC0bPo+BdbpIq45VcRpy2VaLtGgSbBnw57hIo8=
X-Received: by 2002:a05:6808:250d:b0:4f2:4d2f:7ba with SMTP id 5614622812f47-5683c8d763dmr1340541b6e.8.1794296721326;
        Mon, 09 Nov 2026 23:45:21 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-5690504fdb5sm1522804b6e.3.2026.11.09.23.45.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 23:45:20 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Tue, 10 Nov 2026 00:44:57 -0700
Subject: [PATCH v2 54/58] mtd: rawnand: fsl_ifc: retain chip state across
 removal
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261110-submit-rawnand-retained-handle-lifetime-v1-v2-54-9137d08f05df@gmail.com>
References: <20261110-submit-rawnand-retained-handle-lifetime-v1-v2-0-9137d08f05df@gmail.com>
In-Reply-To: <20261110-submit-rawnand-retained-handle-lifetime-v1-v2-0-9137d08f05df@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261109_234525_454459_B15ED26F 
X-CRM114-Status: GOOD (  17.02  )
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

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/fsl_ifc_nand.c | 58 ++++++++++++++++++++++++++++++-------
 1 file changed, 47 insertions(+), 11 deletions(-)

diff --git a/drivers/mtd/nand/raw/fsl_ifc_nand.c b/drivers/mtd/nand/raw/fsl_ifc_nand.c
index cc75b6a67e07..18b747e73c3b 100644
--- a/drivers/mtd/nand/raw/fsl_ifc_nand.c
+++ b/drivers/mtd/nand/raw/fsl_ifc_nand.c
@@ -40,6 +40,8 @@ struct fsl_ifc_mtd {
 /* overview of the fsl ifc controller */
 struct fsl_ifc_nand_ctrl {
 	struct nand_controller controller;
+	struct kref refcnt;
+	unsigned int users;
 	struct fsl_ifc_mtd *chips[FSL_IFC_BANK_COUNT];
 
 	void __iomem *addr;	/* Address of assigned IFC buffer	*/
@@ -961,11 +963,33 @@ static int fsl_ifc_chip_init(struct fsl_ifc_mtd *priv)
 	return 0;
 }
 
-static int fsl_ifc_chip_remove(struct fsl_ifc_mtd *priv)
+static void fsl_ifc_controller_release(struct kref *ref)
 {
-	ifc_nand_ctrl->chips[priv->bank] = NULL;
+	kfree(container_of(ref, struct fsl_ifc_nand_ctrl, refcnt));
+}
 
-	return 0;
+static void fsl_ifc_chip_release(struct nand_chip *chip)
+{
+	struct fsl_ifc_nand_ctrl *ctrl;
+
+	ctrl = container_of(chip->controller, struct fsl_ifc_nand_ctrl, controller);
+	kfree(nand_get_controller_data(chip));
+	kref_put(&ctrl->refcnt, fsl_ifc_controller_release);
+}
+
+static DEFINE_MUTEX(fsl_ifc_nand_mutex);
+
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
 }
 
 static int match_bank(struct fsl_ifc_global __iomem *ifc_global, int bank,
@@ -981,8 +1005,6 @@ static int match_bank(struct fsl_ifc_global __iomem *ifc_global, int bank,
 	return (cspr & CSPR_BA) == convert_ifc_address(addr);
 }
 
-static DEFINE_MUTEX(fsl_ifc_nand_mutex);
-
 static int fsl_ifc_nand_probe(struct platform_device *dev)
 {
 	struct fsl_ifc_runtime __iomem *ifc;
@@ -1016,30 +1038,35 @@ static int fsl_ifc_nand_probe(struct platform_device *dev)
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
+		kref_init(&ifc_nand_ctrl->refcnt);
 	} else {
 		ifc_nand_ctrl = fsl_ifc_ctrl_dev->nand;
+		kref_get(&ifc_nand_ctrl->refcnt);
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
 
@@ -1071,12 +1098,19 @@ static int fsl_ifc_nand_probe(struct platform_device *dev)
 	ret = nand_scan(&priv->chip, 1);
 	if (ret)
 		goto err;
+	ret = nand_set_release(&priv->chip, fsl_ifc_chip_release);
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
@@ -1087,6 +1121,7 @@ static int fsl_ifc_nand_probe(struct platform_device *dev)
 	nand_cleanup(&priv->chip);
 err:
 	fsl_ifc_chip_remove(priv);
+	fsl_ifc_chip_release(&priv->chip);
 
 	return ret;
 }
@@ -1099,9 +1134,10 @@ static void fsl_ifc_nand_remove(struct platform_device *dev)
 
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
