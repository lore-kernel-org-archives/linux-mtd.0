Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE022606A335
	for <linux-mtd@archiver.kernel.org>; Thu, 12 Nov 2026 01:30:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=PvEll0wc;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=FK+FZhYJ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=fNReoEXJybJcXloCeqkeuJqFlUT2mhAofbOLBcD3B7s=; b=PvEll0wc1h73EOSncMr9lHx9BL
	Qk0YAQhnewLBJQK3L5TPgvtLFNymwTkdAaS5Bch6OmlPqNt94+JchcFkFNIA5JzKIheQtnoIUjrjq
	bt1SpAttpnDvyzzrxTulvIxjGZbKvuOcyLb6FJD7QSIg+oHlrLKvnEdYt4n7K2IllmsGYoie1REWZ
	982KymBis5zu4tNWZ1kPrP2n+XFA7MvNTMLB71goChNLMNPD337os3T3wVBOYkqtKxfqJigLco7kV
	BEaIdomp+mVrOOpfkzH4GR/Mb7zuMtnkSZo4d21q1m76uc0RWg1dlEGyzWVJMhMhkLwrvvdYy0XBF
	meA+de3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRJdt-00000008OI3-2CVI;
	Thu, 12 Nov 2026 01:30:21 +0000
Received: from mail-oi1-x22e.google.com ([2607:f8b0:4864:20::22e])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRJd1-00000008Mgr-2pvb
	for linux-mtd@lists.infradead.org;
	Thu, 12 Nov 2026 01:29:39 +0000
Received: by mail-oi1-x22e.google.com with SMTP id 5614622812f47-4ab8cb2a6e4so2364009b6e.0
        for <linux-mtd@lists.infradead.org>; Wed, 11 Nov 2026 17:29:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794446967; x=1795051767; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8Cb6dPwlg8+ZzGFvLTcZ7w9Luh7P7DOy/2x5a6GHxCk=;
        b=FK+FZhYJp6juDW5LELflYSNnIut2p9+THBt5QFJGnaTcnwRBXpzGfSINvwhVY8c36O
         lsmbqluZX94WoTawu5dlvcdsErZrvIjIAAydw8Zf3UgXYVlpO2mYfdRZNUh6KWbCZohE
         ltOjRw1GEnhCLMCgmMsvW91TQROUbxFrnc3eZoBUGtEiUKREbDyRJTR3OKHiBMRP7Whw
         DR3zmvhbBputwvJ7k0XI7QkNFoN0bV+KCmAlY5Fj9tqoLkfxzT7fQSc6piqjnPrwnWVC
         ul+iKUK/SpkCNI/JB9Yzu12t6doERkv88tNFNjYRUhSvSmRP7uGryzb17kCXVeVec90p
         mEhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794446967; x=1795051767;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8Cb6dPwlg8+ZzGFvLTcZ7w9Luh7P7DOy/2x5a6GHxCk=;
        b=h7NW3ZygNP/a+sOY0xAGBwDaFpycTOuJIBwdfmPk+mTph0E4VoQRiqDUxkqyspoHls
         swjPEz2xKJSY/SdU5mne7UndjNBcBCpNYCwRLRkAAIgtcSpicw4ZlAp4ZIHBL0Ka5b24
         QgnBDHKug4CI1Ul1jdhqZCw0KIZKAf/75aPeeHiFDsQLfZmixLt0Mmv6T191Lr+c4TKm
         EUgfwvL7VO91GRAh8v4SVY+yeBJkAlKWFHTcVMuSMMUhL3duYC7r69O76L4p1ihjuuM3
         vc/hFeYgVSp0TTs03zHj2AEzD4uAGZccbv5T0cCy+9ICaIzsSeLIUG+JEK3qKUuegTEB
         1Gag==
X-Gm-Message-State: APuU4Z8vX0TSERwABglRh12gVnQPjOhFBqoDT16BIFP6JgGkX9LE3w7S
	4BKQMGTUgqTmasfrykgt2dTiYmpYLd+qrIuexHWrMKrt7DxnxwQWUcRA
X-Gm-Gg: AYBFou3sJrh2ygBtGg0syCU6Mk24iPVcM2ucmE0w2hKfoo5jJkXQ8MfDS1tiwbsduWp
	waZY3x7wTcUVAbsECs74J87/nb2udtipKp6XmUZ2JWpespIV++Nevg3FH0dKEWBKOCfd9we/bUY
	Ig0SF+q2lnj3GnvAu7ZCqrwq1hTJ8W4wZjKn/FUqUfsTYpco+1x+kZ0iKjVKPgMB8VA7Cva0gJt
	TWiq3bIMqPgWdrtYcKrs22afa+e4jcbEfkGNEfR9wWz76flU42Y8IHAjTXFeSpOeznt8EeF4zRf
	2QpmHufjoHm8Orzuz3L1OLuSa9xyNVwKF+y/0Kjdl3szY3VABmGTSok0nmr16awyKWECY1sp09S
	jEOWf8AyKgAMqym+QFFgxZyH93CxE9jUCIz2HfWB6bg52vbHwoR5xjx6bGpTPFjTQ8BnTwWtw4O
	mZOJjrbQt/svmMiUAX0Zm28VRXejdzeVtajdLp+IwBb1YsuAfIltSBQlI31B1fPP5lcm/2PH4by
	fNoUkOQwI+g0FPEe22L+AFLFx+EvkMuz/ivHR3J/QpxBdgUZ1XEI5O2FNB5/DrnNC4Iz7Unv5KG
	Cpqk+w9aa09UDGxAwIMZ4Ps3xIeNwWUSNefPdd3SdFAKGp8n5nwNIA9xmVieLFj5UIDSgrRsRTK
	aeRd0xu5zwmsmnWqevzeicuQznG/LPcRALk3w0DbfbrJp4R5Kdld6zO5SsnZkkMEPE0Usjhwef2
	FXV6xsbuaDhclol1L5xIu4wnk03e/ejPKiHZVMRv4lWxkHrNl/anXZ
X-Received: by 2002:a05:6808:1789:b0:568:1cc2:96ec with SMTP id 5614622812f47-56b97c194a2mr4220392b6e.46.1794446966606;
        Wed, 11 Nov 2026 17:29:26 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-56905738049sm6823481b6e.10.2026.11.11.17.29.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 17:29:26 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Wed, 11 Nov 2026 18:28:32 -0700
Subject: [PATCH v3 53/58] mtd: rawnand: fsl_elbc: retain chip state across
 removal
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261111-submit-rawnand-retained-handle-lifetime-v1-v3-53-ce537999741d@gmail.com>
References: <20261111-submit-rawnand-retained-handle-lifetime-v1-v3-0-ce537999741d@gmail.com>
In-Reply-To: <20261111-submit-rawnand-retained-handle-lifetime-v1-v3-0-ce537999741d@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261111_172927_836455_AB377F04 
X-CRM114-Status: GOOD (  16.88  )
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

Keep a reference to the shared FCM controller for each scanned chip,
including chips retained after unbind. Count active banks separately so
a new binding cannot reuse controller state still owned by old MTD
handles.

Unregister and drain the chip before unmapping its chip-select window.
Run NAND cleanup before releasing the hardware. The NAND core releases
chip storage and the shared controller reference after the final MTD put.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/fsl_elbc_nand.c | 54 +++++++++++++++++++++---------------
 1 file changed, 31 insertions(+), 23 deletions(-)

diff --git a/drivers/mtd/nand/raw/fsl_elbc_nand.c b/drivers/mtd/nand/raw/fsl_elbc_nand.c
index 6216ffea4324..f1034b70f717 100644
--- a/drivers/mtd/nand/raw/fsl_elbc_nand.c
+++ b/drivers/mtd/nand/raw/fsl_elbc_nand.c
@@ -837,23 +837,22 @@ static const struct nand_controller_ops fsl_elbc_controller_ops = {
 	.attach_chip = fsl_elbc_attach_chip,
 };
 
-static int fsl_elbc_chip_remove(struct fsl_elbc_mtd *priv)
+static DEFINE_MUTEX(fsl_elbc_nand_mutex);
+
+static void fsl_elbc_chip_remove(struct fsl_elbc_mtd *priv)
 {
 	struct fsl_elbc_fcm_ctrl *elbc_fcm_ctrl = priv->ctrl->nand;
-	struct mtd_info *mtd = nand_to_mtd(&priv->chip);
-
-	kfree(mtd->name);
 
 	if (priv->vbase)
 		iounmap(priv->vbase);
 
+	guard(mutex)(&fsl_elbc_nand_mutex);
 	elbc_fcm_ctrl->chips[priv->bank] = NULL;
-	kfree(priv);
-	return 0;
+	if (!--elbc_fcm_ctrl->counter)
+		priv->ctrl->nand = NULL;
+	nand_storage_put(&elbc_fcm_ctrl->controller.storage);
 }
 
-static DEFINE_MUTEX(fsl_elbc_nand_mutex);
-
 static int fsl_elbc_nand_probe(struct platform_device *pdev)
 {
 	struct fsl_lbc_regs __iomem *lbc;
@@ -867,6 +866,7 @@ static int fsl_elbc_nand_probe(struct platform_device *pdev)
 	struct device *dev;
 	struct device_node *node = pdev->dev.of_node;
 	struct mtd_info *mtd;
+	const char *name;
 
 	if (!fsl_lbc_ctrl_dev || !fsl_lbc_ctrl_dev->regs)
 		return dev_err_probe(&pdev->dev, -EPROBE_DEFER, "lbc_ctrl_dev missing\n");
@@ -904,21 +904,25 @@ static int fsl_elbc_nand_probe(struct platform_device *pdev)
 		elbc_fcm_ctrl = kzalloc_obj(*elbc_fcm_ctrl);
 		if (!elbc_fcm_ctrl) {
 			mutex_unlock(&fsl_elbc_nand_mutex);
-			ret = -ENOMEM;
-			goto err;
+			kfree(priv);
+			return -ENOMEM;
 		}
-		elbc_fcm_ctrl->counter++;
+		nand_storage_init(&elbc_fcm_ctrl->controller.storage, elbc_fcm_ctrl);
 
 		nand_controller_init(&elbc_fcm_ctrl->controller);
 		fsl_lbc_ctrl_dev->nand = elbc_fcm_ctrl;
 	} else {
 		elbc_fcm_ctrl = fsl_lbc_ctrl_dev->nand;
+		nand_storage_get(&elbc_fcm_ctrl->controller.storage);
 	}
+	elbc_fcm_ctrl->counter++;
 	mutex_unlock(&fsl_elbc_nand_mutex);
 
 	elbc_fcm_ctrl->chips[bank] = priv;
 	priv->bank = bank;
 	priv->ctrl = fsl_lbc_ctrl_dev;
+	priv->chip.controller = &elbc_fcm_ctrl->controller;
+	nand_set_controller_data(&priv->chip, priv);
 	priv->dev = &pdev->dev;
 	dev_set_drvdata(priv->dev, priv);
 
@@ -945,11 +949,21 @@ static int fsl_elbc_nand_probe(struct platform_device *pdev)
 	if (ret)
 		goto err;
 
+	name = mtd->name;
+	ret = nand_set_lifetime(&priv->chip, priv);
+	if (ret)
+		goto cleanup_nand;
+	kfree(name);
+
 	/* First look for RedBoot table or partitions on the command
 	 * line, these take precedence over device tree information */
 	ret = mtd_device_parse_register(mtd, part_probe_types, NULL, NULL, 0);
-	if (ret)
-		goto cleanup_nand;
+	if (ret) {
+		nand_disconnect(&priv->chip);
+		fsl_elbc_chip_remove(priv);
+		mtd_put_master(mtd);
+		return ret;
+	}
 
 	pr_info("eLBC NAND device at 0x%llx, bank %d\n",
 		(unsigned long long)res.start, priv->bank);
@@ -959,32 +973,26 @@ static int fsl_elbc_nand_probe(struct platform_device *pdev)
 cleanup_nand:
 	nand_cleanup(&priv->chip);
 err:
+	kfree(nand_to_mtd(&priv->chip)->name);
 	fsl_elbc_chip_remove(priv);
+	kfree(priv);
 
 	return ret;
 }
 
 static void fsl_elbc_nand_remove(struct platform_device *pdev)
 {
-	struct fsl_elbc_fcm_ctrl *elbc_fcm_ctrl = fsl_lbc_ctrl_dev->nand;
 	struct fsl_elbc_mtd *priv = dev_get_drvdata(&pdev->dev);
 	struct nand_chip *chip = &priv->chip;
 	int ret;
 
 	ret = mtd_device_unregister(nand_to_mtd(chip));
 	WARN_ON(ret);
-	nand_cleanup(chip);
+	nand_disconnect(chip);
 
 	fsl_elbc_chip_remove(priv);
 
-	mutex_lock(&fsl_elbc_nand_mutex);
-	elbc_fcm_ctrl->counter--;
-	if (!elbc_fcm_ctrl->counter) {
-		fsl_lbc_ctrl_dev->nand = NULL;
-		kfree(elbc_fcm_ctrl);
-	}
-	mutex_unlock(&fsl_elbc_nand_mutex);
-
+	mtd_put_master(nand_to_mtd(chip));
 }
 
 static const struct of_device_id fsl_elbc_nand_match[] = {

-- 
2.53.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
