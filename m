Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D90FFC79FB1
	for <linux-mtd@archiver.kernel.org>; Tue,  8 Sep 2026 06:03:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=M5v5os9qIADJeux2pmmAuL4MeMfdGFdN5OphiGorDQE=; b=1TIybuaIXV1Tzy
	9D9pOlEzMSA2ZZP6mtLJDYAzLifUEeXZL0XRsuW9tlD0OwwpDAJHDMEq+5fFX7e+M/x4jLHTapJYi
	tD5e740k9KLNZ75MWqPa6PyG1ZE1wY9/w8gPhgQGuBBDz1vJAcwS3nLxgUzmIZ7XoO96KAjh7icoV
	MNZpc8NBS+E9hQb5o0QWTspmxS9jXJpWIBppsc6Pc/tjASvwqwIkM8hXLsuqzsK8lJcnNMboFQPCa
	NiHKLiFtsZ8cgp2gnb9EQCSCngy+5xwoKBEznHfBx5fsAOkUKsxNQDZtCJD7ApnxHvhxgQWXEisL5
	JhtmW/v9x/wbng+VC9Ng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3ovc-000000087Rc-3hln;
	Tue, 08 Sep 2026 06:03:32 +0000
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3ova-000000087RH-19I3
	for linux-mtd@lists.infradead.org;
	Tue, 08 Sep 2026 06:03:31 +0000
Received: by mail-pf1-x433.google.com with SMTP id d2e1a72fcca58-8535a9be75eso3096310b3a.2
        for <linux-mtd@lists.infradead.org>; Mon, 07 Sep 2026 23:03:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788847409; x=1789452209; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=C4z6TM9f6LWcvEtLSVg7GWqirsSCBkLcI0Q+87lSZCw=;
        b=Kf+K3ERU/AofLZ51E50lOmnMdjIRtRuWYa6LNckhR0Z2R2J15caSHKkrKaeBKOEoUP
         BxbctBFdCMYwYTIzzpkgpfatBqBeaktJDgjnzGzISPdqKFUDzsjILNRic7AMCTO1Od70
         4el8LM6oAiz04aOiuJQaz8Ah9q1mLzjJTKNyCP3kSE1+ZbaY0bpoUBfniz207bVd0gTE
         wewm4UhCSZppiucv6h+UIzXu0CzW4UDwDDlSHQ/ZK3hAVcq5CDkj1hlI3vUodcCvQ/Yb
         XyzyG869h3lna2lze817z95q6Io0y2Y5zbCbwM0fFXIxvFk7qHe3VkoEAvMhn9DXvgQg
         O7Sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788847409; x=1789452209;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=C4z6TM9f6LWcvEtLSVg7GWqirsSCBkLcI0Q+87lSZCw=;
        b=C/cPt4Ph40Uxo+qBwg8WcuRmAJ6SDtgKTSDzVFjCzUErBQDZdnL65u9mTHd4Jjtk4k
         JKmNwB972sCGTHDNvLtBQm/VKkaBl1nwC4toVVhIJxFwW40bVTHnSrFknR/FV6OIfdOs
         WHFOkUiv0ofogwYnvXhOWSMi0aVooCHyp7BvgNqYgI6My0uABVhxxCq4TyU+vLwShHdu
         psQnMPxYlp3csIqfuSmfxwEqwpFtt6S/jxJFY7MliuyG8vzFUf4VNF+eyh4QcC7IAqoh
         JeJvXPwNH085oh5PfdoWEYp7cME38hH42fL33m1QviOfe1LdOFUWXUqwy2QWQPA+EcEW
         Rx2w==
X-Gm-Message-State: AFuF++mIGDAx12fcCKkbT14wb8m9U169gIEljV+u/80YcxOOb/rVq9No
	rK19RxiZdDZZv7X3C4coPBX4Mar01sL3R0j8ROFzv/2DCCqIiuX6R0ejARQYQw==
X-Gm-Gg: AYBFou0/rjMPR/k057HbSwDyHm6QYp/Z0dnoQw/pVHhB0gz1AAaXISSonWebYfNdmL0
	IgESjhhSol0B2nE6GAerr3O8BAGnVV7dnWrLXJ4LhO5XpRGPUCyixQ9TmNhSaoUEGRGo+tYC0Rg
	I4vGXbCmEPjZWlckzTK6y56LZh9CsEwIymSZYjnnXgSZkOeI/AoYdKEp72EA81aED8IAgDWOJ3B
	woJRfFkdMXRD+/eH9aupy+vJA+2yJtoKH4aRNVBDQ9ZzK3WvVvHeeCeksCoX7GiOurmCdsZywU/
	IzO4Y/zw6jhV8VCBtp3ST5b8AMbgrqxEQKg9yPhcQdJYLR37gVpvTAM3YK0W16JOUvimggfPqoI
	TEHkhzCe/94eMrKNGo5DGKlL6XITDGHaeuIpNzb193TEbQqxNI67Fb9vvK8ju0gPrbcJXXKJl38
	4kGc8RzE5FuUWxCigvitqnakaky4702oMthI8hqZ8r7yeWwyT33/085A9G5D6kjFds7BIVfNGRw
	IsGhcpv+QWvbmj3AxlCR3QfdYYnW5yrvAZgahOe1Q8T/RV/XOCm6EFhKFKab9powmO5Rqdq44fN
	C0NU8S9knOanEDMF+ztK1vNgxfeI7ivtGyCSNQ==
X-Received: by 2002:a05:6a00:1915:b0:84a:60a4:2651 with SMTP id d2e1a72fcca58-861669c6dd1mr36166021b3a.6.1788847409045;
        Mon, 07 Sep 2026 23:03:29 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e34])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8614f872e0esm5049222b3a.4.2026.09.07.23.03.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 23:03:28 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-mtd@lists.infradead.org
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCHv2] mtd: rawnand: fsl_ifc: use devm_platform_get_and_ioremap_resource
Date: Mon,  7 Sep 2026 23:03:27 -0700
Message-ID: <20260908060327.42775-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260907_230330_344117_B69D993C 
X-CRM114-Status: GOOD (  15.67  )
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

Replace the manual of_address_to_resource(), ioremap(), and iounmap()
in the probe/remove paths with devm_platform_get_and_ioremap_resource()
so the resource is managed and released automatically on probe failure
and driver removal.

Assisted-by: opencode:big-pickle
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 v2: rebase and remove now unused header.
 drivers/mtd/nand/raw/fsl_ifc_nand.c | 30 +++++++++--------------------
 1 file changed, 9 insertions(+), 21 deletions(-)

diff --git a/drivers/mtd/nand/raw/fsl_ifc_nand.c b/drivers/mtd/nand/raw/fsl_ifc_nand.c
index 4c2d95461c2e..469b233db73e 100644
--- a/drivers/mtd/nand/raw/fsl_ifc_nand.c
+++ b/drivers/mtd/nand/raw/fsl_ifc_nand.c
@@ -12,7 +12,6 @@
 #include <linux/platform_device.h>
 #include <linux/types.h>
 #include <linux/kernel.h>
-#include <linux/of_address.h>
 #include <linux/slab.h>
 #include <linux/mtd/mtd.h>
 #include <linux/mtd/rawnand.h>
@@ -968,9 +967,6 @@ static int fsl_ifc_chip_remove(struct fsl_ifc_mtd *priv)
 
 	kfree(mtd->name);
 
-	if (priv->vbase)
-		iounmap(priv->vbase);
-
 	ifc_nand_ctrl->chips[priv->bank] = NULL;
 
 	return 0;
@@ -995,12 +991,12 @@ static int fsl_ifc_nand_probe(struct platform_device *dev)
 {
 	struct fsl_ifc_runtime __iomem *ifc;
 	struct fsl_ifc_mtd *priv;
-	struct resource res;
+	struct resource *res;
+	void __iomem *vbase;
 	static const char *part_probe_types[]
 		= { "cmdlinepart", "RedBoot", "ofpart", NULL };
 	int ret;
 	int bank;
-	struct device_node *node = dev->dev.of_node;
 	struct mtd_info *mtd;
 
 	if (!fsl_ifc_ctrl_dev || !fsl_ifc_ctrl_dev->rregs)
@@ -1008,15 +1004,13 @@ static int fsl_ifc_nand_probe(struct platform_device *dev)
 	ifc = fsl_ifc_ctrl_dev->rregs;
 
 	/* get, allocate and map the memory resource */
-	ret = of_address_to_resource(node, 0, &res);
-	if (ret) {
-		dev_err(&dev->dev, "%s: failed to get resource\n", __func__);
-		return ret;
-	}
+	vbase = devm_platform_get_and_ioremap_resource(dev, 0, &res);
+	if (IS_ERR(vbase))
+		return PTR_ERR(vbase);
 
 	/* find which chip select it is connected to */
 	for (bank = 0; bank < fsl_ifc_ctrl_dev->banks; bank++) {
-		if (match_bank(fsl_ifc_ctrl_dev->gregs, bank, res.start))
+		if (match_bank(fsl_ifc_ctrl_dev->gregs, bank, res->start))
 			break;
 	}
 
@@ -1051,13 +1045,7 @@ static int fsl_ifc_nand_probe(struct platform_device *dev)
 	priv->bank = bank;
 	priv->ctrl = fsl_ifc_ctrl_dev;
 	priv->dev = &dev->dev;
-
-	priv->vbase = ioremap(res.start, resource_size(&res));
-	if (!priv->vbase) {
-		dev_err(priv->dev, "%s: failed to map chip region\n", __func__);
-		ret = -ENOMEM;
-		goto err;
-	}
+	priv->vbase = vbase;
 
 	dev_set_drvdata(priv->dev, priv);
 
@@ -1073,7 +1061,7 @@ static int fsl_ifc_nand_probe(struct platform_device *dev)
 		  &ifc->ifc_nand.nand_evter_intr_en);
 
 	mtd = nand_to_mtd(&priv->chip);
-	mtd->name = kasprintf(GFP_KERNEL, "%llx.flash", (u64)res.start);
+	mtd->name = kasprintf(GFP_KERNEL, "%llx.flash", (u64)res->start);
 	if (!mtd->name) {
 		ret = -ENOMEM;
 		goto err;
@@ -1095,7 +1083,7 @@ static int fsl_ifc_nand_probe(struct platform_device *dev)
 		goto cleanup_nand;
 
 	dev_info(priv->dev, "IFC NAND device at 0x%llx, bank %d\n",
-		 (unsigned long long)res.start, priv->bank);
+		 (unsigned long long)res->start, priv->bank);
 
 	return 0;
 
-- 
2.55.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
