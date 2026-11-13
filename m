Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 146C6606AD9B
	for <linux-mtd@archiver.kernel.org>; Fri, 13 Nov 2026 18:26:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=pTvpfoL8;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HnDGtgvc
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-ID
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=PNoLwMqSUaL4pDCm6UGNxd497c0/zGqBKkgJijn+Q5I=; b=pTvpfoL8gXr3Sq3iNleT/P73It
	1cTcP495NA1EqA8R/aGxHWMsz2XD2Xde0rQo9p9cN5AkU8W8yDPAzuhRyFTrCs9WkvwwI0sD8ou9/
	zDwpzk57Bsv9Y+yMnGhPrUpuFUdjroJfvEuTOJCRd7z3s7UFaLht+YjAKgr4co8K1bMSgyxbNUw+H
	FT5szlPFvYcqPJCdNFhxdFJoVOYZpszUZ9Pg1Eund/JDbsPyKdVLTOyYhIji4YlUtP0LlGZNBVp2i
	1/gJvHEy9XVGc9pQM6udTt2DKb0qZPfz2SeS7aiXO79kOVxsY/iFGeOuX36B4YknZqogWGqfb8wpj
	rdCBMcEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRvyq-0000000Dvz9-3FC3;
	Fri, 13 Nov 2026 18:26:32 +0000
Received: from mail-oi1-x236.google.com ([2607:f8b0:4864:20::236])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRvym-0000000DvuJ-3MfN
	for linux-mtd@lists.infradead.org;
	Fri, 13 Nov 2026 18:26:30 +0000
Received: by mail-oi1-x236.google.com with SMTP id 5614622812f47-55e0090c580so402802b6e.3
        for <linux-mtd@lists.infradead.org>; Fri, 13 Nov 2026 10:26:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794594388; x=1795199188; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SZxy7Yx5F8CCUEM8n5KMaftz8PulPwrUSyE4Y9PNbKc=;
        b=HnDGtgvcCVYRzsjBwBPwdptF+PTVedaqxJ0cekOD5rxSnD1x0SuOKOkVxGPBc3SsrD
         8/FxgtE3lLNWhbsCPeE/pAsGIxBQt4HKj8nXEveiIeAYXkcSVtFiEJLZo3LaFS509mND
         lZqH06UBbuhQAQL83gyp0kM53quwKOFQMjfukyBFVtnkGNjwYoeptQVjMDBnfbGpgMsp
         Izip+bxbJnPmw8Xc2BFbvBwmEnlMoEUClcy9v+QJCK8Hvytci2/saxSLq+JAUKI9wsHn
         Vv6FJ4lNJP1OBOABAmHI4cbXB8R8zbkvM8q/paT+WBZ/AlwJFxrQgdTOXsy8HsHnrfxy
         QIfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794594388; x=1795199188;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SZxy7Yx5F8CCUEM8n5KMaftz8PulPwrUSyE4Y9PNbKc=;
        b=rtqdi9iUgHiKu+v8GNbhTXqmFADW/iYQ1pKjdo4fBUOqRQX/6ABKQwlgkQMplbUrEO
         U086++3XOQQ7BiCmDpx0psdJ+23RYaPJmXAShBc41WlPFHAqYq7D4ddQZqKKdR/FO+FF
         GHXZtPKOtasTPctJ0kGwLNyk/mcJ2L11mviehSOfH3eDxzko+4Te5R8mfgk/+TsVC4sA
         cNn6ie3ZU2veP7u/9y5J09B7tnSI9aD2CZn2QxrmtgQdreOdQ0bGa2hJzwLStQry5Z/c
         dr+EoTimr+ZsYBsB9ko6avXYQB4PjCf28V/hM874I3StUsPkHKkIT1NJABVz6abactCA
         9ZqQ==
X-Gm-Message-State: APuU4Z+7MYJh87hSl8uVKZQmYDgrSB5vGniXDmrt4d4f8qyWPTCIIIGu
	k5O2blduMQ2XCioIW8wT3fxPaKoqI5rXk+M4I+jQuixJ38ECS9wawJnG
X-Gm-Gg: AYBFou04gJK7uYnV0O/nc7uJ2YdrSIYGhlF31rgllhGVg8Hm290gU5cQDNocWuY6iZL
	pBFAWkH7zsxT6SuMDMK/fG9BQBmbjKgTkdtQlDmqpOIW7cBqdTloD/3UwU3/zIY4LGsmF6Co/x6
	h6dOEM2DLQJ+fJ2MsJI37t+e4PHSimUCbyjmWWDzjClvjwxklPFfBo9+xBuR/v2lg6ynozY85K1
	ECKaNxstJBmzbJ801xN67SYaB+cSVR8DqUqmTljpBMmCp8h6rrWCS5/4P/asOq+ono8SPwt8vJn
	kcNIxLF+mVe+DWH7dNlzMkcXiUwu5Cu6cU50oA6/C/1JR/f+TE5z64S0m+e2Y1cmOxnyROOaNLN
	Ok5Q7arY5G4jPGARMlKpHBx+dwNlvvTy6cH3HsJmIRs3mLtFYlMtIJEGmkS9/JNzAnLXvtg+2RK
	sZvkE+1d3X61lHLZPQCQueym0cInF3cApepbLvqm+vzPylxAi6i0WyWx7wo/cTWskAS3HRBGbhE
	HDeBMDHPoeO8lDh+qtK42uho5C/RxSowjjt6x5xZhxAN6aCHUIdU+rYb/+DrthX4UUKvTkQvIKl
	USxBR67i7CtU1id5EC2Ifay81Kwf5F4IABHxfInIIxc7P3UzRSBb/xj5U17xC3wZlYhY6CbBVO1
	yFAdhTJgsroufCLW/bpxNtx2/uj1sVGMB10+GUBxS878a+hN/z33+FCQ9vo6fEU+c/4dXbyggR0
	xi1VhDZJkqT3MhnkjTsV6OjyN0auYM7+SO7URuhjbq9q4phqWHINcuB4iYvStc1Wl9ywepESY7
X-Received: by 2002:a05:6808:19a9:b0:4e7:c6f2:75a6 with SMTP id 5614622812f47-56e659263afmr3056003b6e.68.1794594387625;
        Fri, 13 Nov 2026 10:26:27 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4afe2011c25sm1887061fac.2.2026.11.13.10.26.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 10:26:25 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Fri, 13 Nov 2026 11:15:10 -0700
Subject: [PATCH v4 54/58] mtd: rawnand: fsl_ifc: retain chip state across
 removal
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-ID: <20261113-submit-rawnand-retained-handle-lifetime-v1-v4-54-556b1d7c6221@gmail.com>
References: <20261113-submit-rawnand-retained-handle-lifetime-v1-v4-0-556b1d7c6221@gmail.com>
In-Reply-To: <20261113-submit-rawnand-retained-handle-lifetime-v1-v4-0-556b1d7c6221@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261113_102629_187589_EDF0186E 
X-CRM114-Status: GOOD (  16.16  )
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
