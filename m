Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6C58606AD8F
	for <linux-mtd@archiver.kernel.org>; Fri, 13 Nov 2026 18:26:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=JXkIFaB6;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=crQ0sij9
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-ID
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=fNReoEXJybJcXloCeqkeuJqFlUT2mhAofbOLBcD3B7s=; b=JXkIFaB6orw0/vtOVNbzpCrxbR
	BrXTO26SA5O689E3Bh+dGDJBDP9hWrvr18wXV/399NosSyGR0UusaxsORZCJLSxAsuNzFDfPS6QQG
	GLR0MtHScDVf6I78bNocw/QGVuzS3YXu0+srhGR0fLxYNk3sWI7n2K/ap3nuQb+WIW1vK7mtDYU22
	1EhiSKE7xiJ7wDnMYlLdpEOeqhbnsWkv4z0dYtiR1rK4naP0UfnuCYFTTb1bI2ybft5y6z7QMMx26
	YvtqGf/GNISqzanSUyKY783S6mlq0ToK+yy9PV+ket0KbFJtJrn61DSBnrXbmGp7msat/AeDQhZ7u
	iLRV1pJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRvyo-0000000DvwG-2BNZ;
	Fri, 13 Nov 2026 18:26:30 +0000
Received: from mail-oa1-x2e.google.com ([2001:4860:4864:20::2e])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRvyk-0000000Dvs8-0FWT
	for linux-mtd@lists.infradead.org;
	Fri, 13 Nov 2026 18:26:29 +0000
Received: by mail-oa1-x2e.google.com with SMTP id 586e51a60fabf-4911df1e196so1299386fac.1
        for <linux-mtd@lists.infradead.org>; Fri, 13 Nov 2026 10:26:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794594385; x=1795199185; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8Cb6dPwlg8+ZzGFvLTcZ7w9Luh7P7DOy/2x5a6GHxCk=;
        b=crQ0sij9YEDBgKxXoqew4ieK2wlMq4RmtIBGQgQHEKvI1hBX3qVeI1in/pMUsBRlSE
         IXnRJrhffOEDIchW7BraZlhs6YOfYwXobgXpj4BpZqMwhlPCuCrAoAPb+762dtZ1hRZg
         wJKJP3bMcjgF5pf1f+knlAY8IDeVEm+Y+Gi4v6rcyzmwBrnZ2WLX/PDRNCefEjQr/7SF
         PBUmOXwOU94YbqGDKF6LEIdK96riB6BS9G7XSzwddSpjrqcw00ndtzZYBbsi1ooS8Uz7
         S5OHQK2HCBpNK7N+uNBg0wS7BuMyukTaMtX2zPyUH3GiZjPKgFJyWGaq9pNWvt7IcqWk
         tW9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794594385; x=1795199185;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8Cb6dPwlg8+ZzGFvLTcZ7w9Luh7P7DOy/2x5a6GHxCk=;
        b=RyEPFxrfesRGUgIntUPZbjNdoiv93cAJYkFSNyKKIsWhiEe210qfzQCopgVlUvO4Bh
         DdMbDh14yTOVtsyLksKSEtF08pNC+sNUDYr0MoQa6ybhMXv0HoXk2jW0uf1sfCSoNXET
         8aN5mmu0SfZM29ZX6H/QFco0tLnvLkQSuZtfe1/mTqwF7PAHFXBC3fwwn4aM2AhZlz9X
         8fgdnh11dgHSabj+aqAThvfF/5K20tpO+d660FQXD8p3FI6A1MRTk9sMdB7BxR80yuIH
         mBxg7mutqu7IdSufvIg9TGQMJaBnzn7pgMHIdxyfDrVO1nUsRpQgJRmjNFgdl0gEQTBh
         Lp8Q==
X-Gm-Message-State: APuU4Z9Kos2SmSyMyanKCR//VC/9Amul8W6wDRbOBw8kV+t76Yz0yDrr
	+66ziyvU14INypU+cz46FAhMOJlH2IC4A3lDGig59sIDyZrKp5E8QKy9
X-Gm-Gg: AYBFou0XKcDnmI7O9wCR2FRRHn+JsUXOtQg9lTaO7QAILQyXuaVbvvjA/A07Tn3/S8X
	xeriJ0/IoPAf9LSlPuCpkcirtql863HBRF1PRzTVKLTRGh83SPhDKJtQyAbShs8xH5PQIwJpap+
	Wz3Mpmti3One9/eHJiWctdA8hwgfi+YoVev2ADyHTLPZ/HUdrjm9dKcXG9shbZ6/OfkkWisb7+S
	rE93/QGjyf87RaamdZGfDNddPUlxqUUPo2TwkPo9u6WO9rV0feI0LKDyW6/vDx7O6UTv1qGvR7z
	pL6p+6PqvsJUztsxJ0l2GmiqPeVzEYZXFhbQ+nSt3jZ9ZPoQ7uyEE+q0cnUpx6IJ+Y3zReE/IA8
	/b/4n9Y/jqJacLxa8iHYlXSnlly4WVFEX1ojF0ISSf9m34SbJq/+ZlHB1Ecw0Lo5X7MApmouLP+
	k5uLtiLOct5DLA5S9mnyCQcgAlqvFpnHypySBUTWXzPoqeKTWY2S+oDuirkuLCoJo2U/CFwXpvE
	w6dRHjV1aJ/7hvp5McKUdyzc8FUVzrSBJlHXkI5HPkAteWaWXQZJNf0EN/sAIytSpRq3kKIygEp
	Kbc/ZWcw7octYWicGUwlN3NKCCy9prxkYFChGxaG2XMwGbKdYLzXjaFndRyEgXmjTvqox7hX+a2
	0vNnMMgSSjCMNlHzbRxfRIWO+J7aiz/CP4qfMxRvpfm8x/jGBQqBgu3MyIE81RNQiAGXUP+66ew
	5JLOYoIsgc3QMWscEngYjvUnc9TalicUd287I9JkiAu6vJ7LkjE4U=
X-Received: by 2002:a05:6870:c2a8:b0:4ad:8d9f:98a3 with SMTP id 586e51a60fabf-4afdf4ee823mr2826842fac.35.1794594384902;
        Fri, 13 Nov 2026 10:26:24 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4afe2011c25sm1887061fac.2.2026.11.13.10.26.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 10:26:22 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Fri, 13 Nov 2026 11:15:09 -0700
Subject: [PATCH v4 53/58] mtd: rawnand: fsl_elbc: retain chip state across
 removal
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-ID: <20261113-submit-rawnand-retained-handle-lifetime-v1-v4-53-556b1d7c6221@gmail.com>
References: <20261113-submit-rawnand-retained-handle-lifetime-v1-v4-0-556b1d7c6221@gmail.com>
In-Reply-To: <20261113-submit-rawnand-retained-handle-lifetime-v1-v4-0-556b1d7c6221@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261113_102626_128755_B09D3EE8 
X-CRM114-Status: GOOD (  16.33  )
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
