Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E8AE606A335
	for <linux-mtd@archiver.kernel.org>; Thu, 12 Nov 2026 01:30:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=miBfmq0V;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LUNsZX3g
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=PNoLwMqSUaL4pDCm6UGNxd497c0/zGqBKkgJijn+Q5I=; b=miBfmq0V3Qhd5WD0nRcRQTzjdG
	PChgzh02Nf/DObLTtqhB6KRCvCXP9yPQ7iIPcSQb5Z/a0j2BKjsmSeKWLSAkHrbTweQftbrbNf+sg
	0uaW56cNp69mBVM6D4QwjyLmzxAvmZ++cynmaQjADRiNsdG4wnJakHwJLcfFOZhiLtoMPqnOGzoPj
	MXIxtGnSbat8mBXg++XUhm8V+SdZCNOsAdf5nGoPdqLrcr4uFXxq1MCP/snJJ+E8RWxfz1/Z+hFwu
	jxtk+F2Vu+iJmh/c0o/Cc6Jf7vN1wwPf3cVZ8fnueARP/OwGilORz0Y73UL5oTUqtRe6ENxZYApO2
	QiQJJ+6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRJdu-00000008OJm-0lkp;
	Thu, 12 Nov 2026 01:30:22 +0000
Received: from mail-oi1-x230.google.com ([2607:f8b0:4864:20::230])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRJd2-00000008Mjy-27sl
	for linux-mtd@lists.infradead.org;
	Thu, 12 Nov 2026 01:29:42 +0000
Received: by mail-oi1-x230.google.com with SMTP id 5614622812f47-4b28d9537bcso296280b6e.0
        for <linux-mtd@lists.infradead.org>; Wed, 11 Nov 2026 17:29:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794446968; x=1795051768; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SZxy7Yx5F8CCUEM8n5KMaftz8PulPwrUSyE4Y9PNbKc=;
        b=LUNsZX3gSkWwA30h/vxcU+EDcIGqWHznuYiqWXHHfYIGGEysc7EcvUidmnJNeZ01kB
         muMmbLU9RUilXQE7j5gj5IJCyDC4pBJXn4rWoOWvAItOebHmq/BD66ZQBCmKukKQEtxu
         wI6arYd0mWoRMh4Knhjc2KK70YQrsoNGlQFS8OwKAfj/BnvTUuyJQX0NDMTjURQrqVM/
         BFsS6RCItTGj090oiPZ1Y/ozYIMU2diDKL5w78k+cj1CsvTfRglNS+TFDHV+VuWqv8Yr
         MMC4WWYJaObnp9xzzePvnCpsgBj1DX9bhpBTbi3jkp89G+dS6eonJqBXykPLDxGxxhdN
         dbdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794446968; x=1795051768;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SZxy7Yx5F8CCUEM8n5KMaftz8PulPwrUSyE4Y9PNbKc=;
        b=iqOFEX7SO1FCHgJEOtcAAmp4LdZjlPaJq3jsRrvSPTdodd8hgdEeuG114+PQrD3bwv
         fND7/65wmeXGI33DIxwRtNn7o2FjO1Pv+cxYCfXByI3S2I2kDRLQQlbTc3utUSfKAV/4
         T9ueUTVIQ34tL/E0kxUjDY96T35Ec95+VpP53BvW74Mg+OjO4SlFX8BDr6o8DQ0TEkjd
         ZWfEuDJ0xn35KGOTiIp7k7+G5/efzjSzbmaT5L9lhd+yEHk1j3h7L7o2avxE9C9qqlbA
         dm6Wdax6hMth1CMjHaMW3s7zpQNSlPhHfIuLWR6xEfK/4d0iuKY1CE+6/hR6H3TNUc1l
         5Mmw==
X-Gm-Message-State: APuU4Z+a9EjET0hLQHniXQ/gsLa+8DG7Xc+c0iamlwhypEcHIYqYtcNR
	uO59EpThFo0GBTN5gxPRDjITo/l+4T3v6hRkQiCLW0QC/KrIDR7/W6w9
X-Gm-Gg: AYBFou3qu5mHh76ai7/LH6gvxTc2o1tdCEF9u9hKewNuL8BiEko9rLE3NSQRQ/qNij3
	wUrk+uAK+zWcn/t2VKNBTr1nlc7hewAAvjSMYngVtIPXJzhiVKH3esm8KNt8/DQQ5g6P4EQanvx
	bWIqEAUioo+u3vLbmT0O+WVPTJxrK0xj3WYMJ48q9275isN8xhB51HWzzIV/K/+eUDEjvYUDhWS
	DwPSwIbPBzsdICkixUdiNbtJwM8im4/xl31drZPAInw28Qzd/2YiNn8RmD4e8SqhMRz03pl/i3o
	LQf+iRbBYxyaFcoc5DOIcck9uzFfy8r0HW6S16tS5UXPG7+wNPzid3SMwckN0PQVq7HNqvSgyxk
	iaQwsJMEB56slE2v/deIO28q7edNEcJlD5QEPkzxWDzHhitrGGybN4zfdh2gquvGJHHORAu37q8
	WIlBoyvh7bfmpCfaYK/dGrVSmPtrFDY8UGuur7ClKhcD5bgEd68oi3v4EoJo6LOQH9LiNLZPfNZ
	iiUlbOk1F7FCvwyMbN9+P0KoBfsPO7YJOnS5lTclJ9K1Eah4nl68am5q9ScnDK8fdp4LfMo2dzy
	JZpQHIsnPGGRxWzM7oxhut1ALHbwVBdwF6wi7t4DpRToJT9ZZHB56zq7DDjk5nogIotVabYRuXG
	WvQv+s7g16dAarueRH6gMoKTrHO0wRnEXuOM6tLyf3K9oB0kylMPqtkPZS/W+2h/YgveUNn5OlQ
	jXQe4638m9Y453Kpdnf9MSOOhtW7MTbBF/k6L70yUZSGqgXTW0es+TyI4+xntJCh4554oH6u4ci
	/Y=
X-Received: by 2002:a05:6808:c2f5:b0:540:8ca:36e3 with SMTP id 5614622812f47-56cd7d08af0mr1074469b6e.19.1794446967621;
        Wed, 11 Nov 2026 17:29:27 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-56905738049sm6823481b6e.10.2026.11.11.17.29.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 17:29:27 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Wed, 11 Nov 2026 18:28:33 -0700
Subject: [PATCH v3 54/58] mtd: rawnand: fsl_ifc: retain chip state across
 removal
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261111-submit-rawnand-retained-handle-lifetime-v1-v3-54-ce537999741d@gmail.com>
References: <20261111-submit-rawnand-retained-handle-lifetime-v1-v3-0-ce537999741d@gmail.com>
In-Reply-To: <20261111-submit-rawnand-retained-handle-lifetime-v1-v3-0-ce537999741d@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261111_172934_715046_65099CDD 
X-CRM114-Status: GOOD (  16.62  )
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
