Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA010606A335
	for <linux-mtd@archiver.kernel.org>; Mon, 16 Nov 2026 06:31:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=dDrIsq3t;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XQTwbyPw
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=fNReoEXJybJcXloCeqkeuJqFlUT2mhAofbOLBcD3B7s=; b=dDrIsq3t6c7lIO1XID5fU6FbuD
	E039cgu9KrGnc+oDZ9DtY54v1MFLDk7AWS5LMgD9RqFywrHKWQjZxaZY3h3uNZaUhfBFB5b7oT7Nt
	TxJSqWj7CpcC/Xi78qJp8igX60ila1RHsNw9pf0FiOD6bqsWSbPd8ZdC/o3n2abehuf9khNRW8S5O
	RWQ50rI2ZBbgX5fMvL+I0Uw3rAOXPJNZf0gGBPfQ0FW+6UIIxaUAhl4OTCm/1U9GDWAAFerdY86B0
	fZVSiuvKRjBhsLM64+7z5QKrekG8vjxoINxxlFAA7+jyOq+2o1NT/6srAZRCOTdZ98PHuFK62JKmB
	HJtC9JiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSqFW-00000001HeD-10LP;
	Mon, 16 Nov 2026 06:31:30 +0000
Received: from mail-ot1-f42.google.com ([209.85.210.42])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSqEt-00000001GQZ-28Ll
	for linux-mtd@lists.infradead.org;
	Mon, 16 Nov 2026 06:30:54 +0000
Received: by mail-ot1-f42.google.com with SMTP id 46e09a7af769-8451a619da7so2708538a34.1
        for <linux-mtd@lists.infradead.org>; Sun, 15 Nov 2026 22:30:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794810649; x=1795415449; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8Cb6dPwlg8+ZzGFvLTcZ7w9Luh7P7DOy/2x5a6GHxCk=;
        b=XQTwbyPwxv/Y0bc65ifQ+8oJ5qZvTJH7NmNw1sOO7Bho3sSjEtnMlJGEohpkl5eul8
         50Qz7awMCf2DpIDV69j7wMMK8njXsWyh/Y48430w0pTa4DgxWDAFVRSarZOFY7n0b565
         UlsATQaHfWu0yiF4m1c+7tOknGdOqUN0FElXaYL99hRe+f96ljh2PD7sco7Q6Pqc7ZOn
         cF052uy+DFzkPrkUjWThfMsyam3XVa7tqqq9cUmHvEJfnDCNEsLv3gv4/J9A6MZTr+q1
         isAR1p5tnX3LqeaWrrG7Zlu3gcOOCBARoh9boRbxgEMA3kf/YStuT4z/pkHQxj7PypBi
         fHew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794810649; x=1795415449;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8Cb6dPwlg8+ZzGFvLTcZ7w9Luh7P7DOy/2x5a6GHxCk=;
        b=cwd+FFPOozcfT1/sF2IBd6hwaUlhDcCgXmqHDMo82rUZNn4ehNFZDYA+F5oGm/F+jA
         2JYINAeP6xSGv5xqVm7EtHcskIjr+inrgYQ4jlkOBlmJkY8FJuJCjP6meJfT6MqzpRYY
         BUMf1uaFkI0iU+H5s5qY9LKkxw6UWYZUZ5ARbL9fDnp8LUr2YKxRihw8bSLnatP0+tvc
         tULPqHPNY0m9Yy4J4vnF75sQj+fUPr+Jp0jxnLfwuE3w7aJu5tv5swh9mD7j5/8ywO2T
         7t464V6Q8/hSmdjezwdrp06g0mGj/ihMb6XWgETfpDSe3MAG0YYBAuuGAtdBsCt1g85G
         s/EA==
X-Gm-Message-State: APuU4Z83uRAaLql8qzsKyNytnMkhR65Z8sYSedjPxekJ6NgwZeOnaYVF
	uTThbun+/S9wUL0z+GiSSZbrBe0AmFQ1EHJjtEEWDWmco23ssIAKUqVk
X-Gm-Gg: AYBFou17xeJ4bsEQjVUGjvJ32//1J7B52xAqXz01o5ZVkFbFf98EnEfdS6Xfcc1cNf1
	qWxJw09LY6PG/Biu5xLcIW9rrrEumEdEegHspZ57RMnLGxvmfuZbehJypkVBncbohXYs/bJEg0X
	DFZLmcKTNxC96XqbkCI1wYrNzzkc/IHMfJaEnHK1lPDalACffpCZpUy2GGcML6E1hfgaTbtB49g
	INzVp9NZukSHuzHQEUTodYldTq1o10rp+2n91SrnjxnQHGUabgGZX16OPZz9gG5BVfPAt7wX+sn
	6iyEGwAnxvGRK1uxbmgXm32U0H58v19Vxv6+taGO0Dib7Qype/uBWXbNHdMrh1oCe0PzeAMP/i5
	cXN7QhT9+tVD+aQzqpT2W7HpWMBrQ3wdDVVMv5SZJa6UPlwclDNgb2Nx9wtyobYYwp4QNpJG8dn
	Jwv5k5KDQz6GMGbgPTVtzgFWdGHkNh4s0x5Cj/rqeeIuoBs4zNfuH4dhlSznNYrnHbnYO/uNDo+
	sWU6MzWtD4ULw5kozFOP2Cb8zcLdnMaxePcA5+wbk1osV8DzYzm9rOQ+nVjdNI/HqiIM5MZ9MDP
	7kV6uzqmTdtrYPfM/ZZ6y39zXE3ViJf5LrfUBe+3Qvb/xrYixh0tOHo25VcW6diEsqL59EgLXvP
	hN/YUc1kUvEdtvjdVh0PBfFINEN8kbt0SgKdw+2IjGMM6hnkLwgGEet4478dBEVNM1dUiJT6FPS
	72Ns/by52DS3z8Kl8OqpHAciEPDvIHqAdAjVorH5q2AM+TgAj7a8s=
X-Received: by 2002:a05:6820:f006:b0:70a:4053:52d0 with SMTP id 006d021491bc7-71ab4cdde61mr6740625eaf.12.1794810649580;
        Sun, 15 Nov 2026 22:30:49 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-71ab42c41e9sm7994558eaf.6.2026.11.15.22.30.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 22:30:48 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 15 Nov 2026 23:30:08 -0700
Subject: [PATCH v5 53/58] mtd: rawnand: fsl_elbc: retain chip state across
 removal
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261115-submit-rawnand-retained-handle-lifetime-v1-v5-53-cbc49c5c5e74@gmail.com>
References: <20261115-submit-rawnand-retained-handle-lifetime-v1-v5-0-cbc49c5c5e74@gmail.com>
In-Reply-To: <20261115-submit-rawnand-retained-handle-lifetime-v1-v5-0-cbc49c5c5e74@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.17-dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261115_223053_210589_850533B5 
X-CRM114-Status: GOOD (  16.32  )
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
