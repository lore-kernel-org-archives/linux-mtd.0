Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21E15CC6B0F
	for <linux-mtd@archiver.kernel.org>; Tue, 13 Oct 2026 22:41:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=siUmFags2EHKev8qVwXN0h7BOrIoYwL1VhjGVv0+KKk=; b=ZujRisI/dmXDtT
	PulvWDvJaN17cR7/9lhkDg8yJPqfy9FoTBzCG5ahEru0KSU+Z147QYnyuafzf1kHLfF3Be8vtJTZT
	qRWtv2jW8FzNUe2uUH5nIP90BdgIfAvh7AKksaWO4TGbEmAnPR0UFDpRUVvXITyqY/VEKz167lZQS
	uWo1uL0FAYykP/v3kYjXmjnqEAHrzz40/f0/fQMZ30jGWwzyPX7vRcLmFp0FDUvYlx08BDqy6STNA
	EBOLaK1dPMOxCc5AbARKAAT1xiF/vmxuWrCO9iVVJWFIIToAVyavhGC267uCzroAbzATCOWtJAtiP
	k5XMSsvB6c+hyQPqIN0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGlBp-0000000EAJg-28Oe;
	Tue, 13 Oct 2026 22:41:45 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGlBj-0000000EAGY-23HS
	for linux-mtd@lists.infradead.org;
	Tue, 13 Oct 2026 22:41:44 +0000
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-2df8c28a0b1so16809305ad.1
        for <linux-mtd@lists.infradead.org>; Tue, 13 Oct 2026 15:41:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791931298; x=1792536098; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=j/1itgMrpNBxkE6u/m9rVj9aqLYPpbOV4tP8FDG8nZw=;
        b=LBjrYzXdpVZsaaJMGsk/XarunznqHN5+LVIHVEyNj9ej1uLDIPBeW8tR+ChOOJNNR0
         y3cMlf1oDRAWg+ad8+UXjJ9ZMvPvVlRlrWwCuR93kqzNXL7OcD4dliNeLQ1K/o+4n1ii
         nqk23htmSfwfikVkmHJMHwGEdIzQ5XfxiRWJKn2uhfuQWYTuithu2XKeVzLAtd5fSJn9
         EboLczj2vWJ2tdt3iWuyhrittQB2Nk0GSM8yGNxC6oPjAB3erGsAv3eJtPoxyL4hoVos
         va+4btXIvSpQO3Be5fiBH/iwJoF/NWSYNAdm7uzcbqVzmY6tcN1BRjb/LbDAhrRSU3sN
         SMCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791931298; x=1792536098;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=j/1itgMrpNBxkE6u/m9rVj9aqLYPpbOV4tP8FDG8nZw=;
        b=ajvENFHHGW9UE5O9jaLtPs2Npaebcv4ec6ZBC14jSrg/1DPVjkBxz8BAJQIbmQU1h1
         B3eA8S4J7XZxlxEczNRk1jg48DIcEL09Z2qlrjZmOitDSdYOi00I94yuSpsBErv4lX4m
         KCM5+oBngBIAA2512a0P7xWbD21x6/jXPJc8/9RmqSsitEmI1uSrmlJ0AQ3wTysMBVh5
         +Y2RdBazSNn+xMhp+dSlkFxilMHMCt/OKy3nUL2nnJPTWpcb7FmK008ULS8Ro+RzyUy1
         CPUU6wf3qM9DTMZyz5lBGjR7tGGSzDVAl5inQ1QLO7CqgfIoOx3+u/4wgykiSbvzZuiC
         UYsw==
X-Gm-Message-State: AFq9FYJD4M+askaE4jW6hOWRwx+gq987jeXJsmwoocRA+8vE8bWaF0Xo
	/8WO99tJpYN9dXLbIbmO1vgeSTkDhm0Ysu6GMP+bja9cTpLr46mgZ1BahYICLp5M
X-Gm-Gg: AYBFou29keSvpnOZVxlSd1Mr9ihA6DDkvEMFIGqh8xbk/1651zQVdENAMDqaPfhvpv0
	on61/Q+Rk1QtIH5RQ4qQmekvbPRj8T4O2bSOAYWU897TF5P3elKdZ6+i+ViOIeyhkIt5hx8ugC7
	UfYFs6u/HAnw0ivC6jyh7c2cQZAhEOErXA6MxgT4hKLKXihuEXU3CxgzCb1KN0m2yR1nJkjhkWI
	IlzXmucJLUkD9WBIUpvZoVTT/NMtNyeuf5X4pjexkEGcTmEolUj9A23WrEwOBTZmiC8xyiXDSau
	ffWAx8LkG+MQaU4qvQFFdDpurFModaaZ+Ps5EZCKnaiBS27+Brx+uiracDqkm4DusB9gRwozT5A
	jRiDQzT3cK53JTAH9tnxT1Mxtp8gv1EQofkQi20yEkrcBsARpzt/q+Ys8AcFKmIE8xvB3YTkXcI
	uFzM07eGxO00wWQCMsGdLrnfyDekQlFjJsbJ51nR8oatPXba6FDB2AjM+u8zHZ8Tc/aL+YSmxNW
	4/ATqwbgDOzLBT6gmyHhmFwM92tkx5FymktpwQGnKVyFX0Wj+T/FR/Eq4og4W1MyIVFvl1iJ0Iy
	LXAPDOXwyqARqoL/tXmXGg9svZ63ZnfY8zlGTKZ8aN1Kya8n
X-Received: by 2002:a17:902:e748:b0:2e6:13b1:e1aa with SMTP id d9443c01a7336-2e8428a1f27mr123298395ad.15.1791931297983;
        Tue, 13 Oct 2026 15:41:37 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e34])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e8422fb8b4sm61576805ad.82.2026.10.13.15.41.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 15:41:36 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-mtd@lists.infradead.org
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] mtd: rawnand: fsl_ifc: drop unused controller chips array
Date: Tue, 13 Oct 2026 15:41:34 -0700
Message-ID: <20261013224134.42967-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.56.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261013_154139_646304_37A13C98 
X-CRM114-Status: GOOD (  14.19  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

The chips[] array in struct fsl_ifc_nand_ctrl is only ever written to,
never read.  Remove the array, the fsl_ifc_chip_remove() function that
cleared it, and its callers in probe and remove.

Assisted-by: opencode:big-pickle
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/mtd/nand/raw/fsl_ifc_nand.c | 24 ++++--------------------
 1 file changed, 4 insertions(+), 20 deletions(-)

diff --git a/drivers/mtd/nand/raw/fsl_ifc_nand.c b/drivers/mtd/nand/raw/fsl_ifc_nand.c
index cc75b6a67e07..7f4bf4e2cb78 100644
--- a/drivers/mtd/nand/raw/fsl_ifc_nand.c
+++ b/drivers/mtd/nand/raw/fsl_ifc_nand.c
@@ -40,7 +40,6 @@ struct fsl_ifc_mtd {
 /* overview of the fsl ifc controller */
 struct fsl_ifc_nand_ctrl {
 	struct nand_controller controller;
-	struct fsl_ifc_mtd *chips[FSL_IFC_BANK_COUNT];
 
 	void __iomem *addr;	/* Address of assigned IFC buffer	*/
 	unsigned int page;	/* Last page written to / read from	*/
@@ -961,13 +960,6 @@ static int fsl_ifc_chip_init(struct fsl_ifc_mtd *priv)
 	return 0;
 }
 
-static int fsl_ifc_chip_remove(struct fsl_ifc_mtd *priv)
-{
-	ifc_nand_ctrl->chips[priv->bank] = NULL;
-
-	return 0;
-}
-
 static int match_bank(struct fsl_ifc_global __iomem *ifc_global, int bank,
 		      phys_addr_t addr)
 {
@@ -1037,7 +1029,6 @@ static int fsl_ifc_nand_probe(struct platform_device *dev)
 	}
 	mutex_unlock(&fsl_ifc_nand_mutex);
 
-	ifc_nand_ctrl->chips[bank] = priv;
 	priv->bank = bank;
 	priv->ctrl = fsl_ifc_ctrl_dev;
 	priv->dev = &dev->dev;
@@ -1058,19 +1049,17 @@ static int fsl_ifc_nand_probe(struct platform_device *dev)
 
 	mtd = nand_to_mtd(&priv->chip);
 	mtd->name = devm_kasprintf(priv->dev, GFP_KERNEL, "%llx.flash", (u64)res->start);
-	if (!mtd->name) {
-		ret = -ENOMEM;
-		goto err;
-	}
+	if (!mtd->name)
+		return -ENOMEM;
 
 	ret = fsl_ifc_chip_init(priv);
 	if (ret)
-		goto err;
+		return ret;
 
 	priv->chip.controller->ops = &fsl_ifc_controller_ops;
 	ret = nand_scan(&priv->chip, 1);
 	if (ret)
-		goto err;
+		return ret;
 
 	/* First look for RedBoot table or partitions on the command
 	 * line, these take precedence over device tree information */
@@ -1085,9 +1074,6 @@ static int fsl_ifc_nand_probe(struct platform_device *dev)
 
 cleanup_nand:
 	nand_cleanup(&priv->chip);
-err:
-	fsl_ifc_chip_remove(priv);
-
 	return ret;
 }
 
@@ -1100,8 +1086,6 @@ static void fsl_ifc_nand_remove(struct platform_device *dev)
 	ret = mtd_device_unregister(nand_to_mtd(chip));
 	WARN_ON(ret);
 	nand_cleanup(chip);
-
-	fsl_ifc_chip_remove(priv);
 }
 
 static const struct of_device_id fsl_ifc_nand_match[] = {
-- 
2.56.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
