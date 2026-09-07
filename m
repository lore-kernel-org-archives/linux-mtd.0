Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DB33C79F9E
	for <linux-mtd@archiver.kernel.org>; Mon,  7 Sep 2026 00:43:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=SY7SdlKdx3Jlr1Dq1wIbZ/hQB6CCwoiH5x7wKZGLxjw=; b=DXFoPsFrQF2Wm+
	QASblYuYBYfBzLG/q+9nxqpMoPIO/y9Stv0lGtEaQpGMDdEDspYtH6cYHQP6nmjymP7+2Co0WZ2FU
	Naqe+1/MnOBDFoDEP5rYttZClxZi/pOs3yAAplrYCoiAcmt8P+LZjQp4hGqHipwgiL5ST601pg/Rk
	RC4v5YxxE6vXBhOEQIvWjeBSMj8zu5kLr9yE09F7unsVDoyike1kCQ+pXplXFwF2l+pXBMO9yfIh7
	hA7kygtx+YMEcm1YkbkSvVorrESv+QEx0JCKSatoF7S3637Qadx5dqZsKICUlTvJLUSAvogZXRp8K
	qZ0hZZxNIGfgDPmFtWNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3NSZ-00000005eQH-1lLK;
	Mon, 07 Sep 2026 00:43:43 +0000
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3NSU-00000005ePv-3JNS
	for linux-mtd@lists.infradead.org;
	Mon, 07 Sep 2026 00:43:40 +0000
Received: by mail-pj1-x102b.google.com with SMTP id 98e67ed59e1d1-38dfe910e9dso3235837a91.3
        for <linux-mtd@lists.infradead.org>; Sun, 06 Sep 2026 17:43:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788741817; x=1789346617; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=x0x88oH7CrnZpFAXii2e1khx4b7zho7HKvH8FBEonEo=;
        b=J7xXNc5KjegKxugdcLOqR2Y5Tuf104CXfvl7dmIO02NYeJ2XEAogyBLKST6ze4mqS9
         Jgwjrmpl86xVf6HNqepHnoniq7eiw3GOQwUUhIL2wI30z8mPZewSEsQCSvov2E726VCR
         4Cmo/1LQ3lW5/MIpcx+NdtlMaFbedAVB2kVnSV/PkOfNlYJ+Q7XNSRc8gca8ofFukeno
         ameqOVPhTUobcUPNR9920NphaUO/RPGWUnMf80bR+s5sDuByBy4Tsa++rdh7lq87DxoD
         +5omJVMWQ268tNkp8zTxoiNS2GlMy9MZQR4nK1qWz2jeYhk3PCfT0/yPQ6Am8qgfPpsC
         9aqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788741817; x=1789346617;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=x0x88oH7CrnZpFAXii2e1khx4b7zho7HKvH8FBEonEo=;
        b=Mx6TPm8JndnQZhRlXkTsvklLsB508onLP7l5Z0r10nyafePEGhF6lAo0ucTLMyM+bu
         WnNF7ukSUziteRWTk5wNEtle0cZYFlMTGYgPxx5yfo5j8d6eonEfimi0FgzbEKra8Odt
         KJQt63RO6/BVeXWRjDmmIwyuPou8+xBcOlpQeedKB8xkOPaoTevHP7AbCf1OA3IZRBQD
         mFXuBffIHKtDUkkCjpXmwv3XYF4ijD64espVzU+XaonDk79xa1N1spToMJZi4VGVdAHi
         TUeCMXZGDaqsOXw/ey6hI+PowwxDxKdls4gOHRlDVVKOmUlit3vmp5VG0+udmLNVNRye
         h+HQ==
X-Gm-Message-State: AFuF++keveXNr6a0Q3mn2V6qkrjKRsgfIFkyYaUcf7d0/Q7fCvN1Uufd
	M9jvAicVqPmiaID7waRbNdhwS2RvLtnaU2oSKkpmQcA0WOGgH1Ve1hBpGWg0Pg==
X-Gm-Gg: AYBFou3RsLjHzvBUnf7+a0bs2gveaAPcO2p6QED4wIiX2cm8wFDHAOq/8mpTymDCZ0W
	49waNTs4bJk0Co6Kubqu88W562LMPgjB4WsjUZEwKOkcYGi3BPzqFUq/ertXbC0K1yhHHn3nnXC
	GzRQTvItoJV6VzJq8ChRz+xNP79rX/jqfiStKXJOBO7O6DO7eYg76JvXeC0H7GqebLp7h1mnR0E
	ShgMjPXidtWEL4FQCXsL4WoC8gBZDLWtPDjmJu507OSU7z3CDUnoiglMFFsUdE2asJcFsviKvia
	QWM9bpo88fL+RUkcUTwiNhYVU0aBGRwuzDT9YahUPIDH4wm4ysyVAmeLkaUQKW/OITxo+E3XHgK
	6TcwNL7EC/j3QGQmuYtvbCPBczYR/FozqC0C7JCZFeqLSfRQKziiXSf0jAAx1VwDRY6GcUG4uCR
	JULB/KC+kt0ELrt3NPCUkpzMzei0QwAq4fGWnY2wgJuC/tlcCy3fFgEhjKiia92D0BewHm8cQYa
	z99dKAU5ByQa6IT9o87wpj9jrEiS9E2mosOE2fIEQdeDyLaN6HoyQdQ0Ml3N23TGwnuyPpOnhVq
	ONj81KFLsS2Zk1GCWlH3C8dziTAHTT70l/5ntA==
X-Received: by 2002:a17:90b:390f:b0:398:de23:9af6 with SMTP id 98e67ed59e1d1-39b261b216dmr29493077a91.15.1788741817065;
        Sun, 06 Sep 2026 17:43:37 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e35])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14324356931sm33187839c88.4.2026.09.06.17.43.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Sep 2026 17:43:36 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-mtd@lists.infradead.org
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] mtd: rawnand: fsl_ifc: use devm_platform_get_and_ioremap_resource
Date: Sun,  6 Sep 2026 17:43:34 -0700
Message-ID: <20260907004334.221683-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260906_174338_865332_24181A3F 
X-CRM114-Status: GOOD (  14.67  )
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
 drivers/mtd/nand/raw/fsl_ifc_nand.c | 29 +++++++++--------------------
 1 file changed, 9 insertions(+), 20 deletions(-)

diff --git a/drivers/mtd/nand/raw/fsl_ifc_nand.c b/drivers/mtd/nand/raw/fsl_ifc_nand.c
index b34524726dec..74db19e1d54f 100644
--- a/drivers/mtd/nand/raw/fsl_ifc_nand.c
+++ b/drivers/mtd/nand/raw/fsl_ifc_nand.c
@@ -969,9 +969,6 @@ static int fsl_ifc_chip_remove(struct fsl_ifc_mtd *priv)
 
 	kfree(mtd->name);
 
-	if (priv->vbase)
-		iounmap(priv->vbase);
-
 	ifc_nand_ctrl->chips[priv->bank] = NULL;
 
 	return 0;
@@ -996,12 +993,12 @@ static int fsl_ifc_nand_probe(struct platform_device *dev)
 	struct fsl_ifc_ctrl *ctrl;
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
 
 	ctrl = dev_get_drvdata(dev->dev.parent);
@@ -1010,15 +1007,13 @@ static int fsl_ifc_nand_probe(struct platform_device *dev)
 	ifc = ctrl->rregs;
 
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
 	for (bank = 0; bank < ctrl->banks; bank++) {
-		if (match_bank(ctrl, bank, res.start))
+		if (match_bank(ctrl, bank, res->start))
 			break;
 	}
 
@@ -1055,13 +1050,7 @@ static int fsl_ifc_nand_probe(struct platform_device *dev)
 	priv->bank = bank;
 	priv->ctrl = ctrl;
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
 
@@ -1077,7 +1066,7 @@ static int fsl_ifc_nand_probe(struct platform_device *dev)
 		  &ifc->ifc_nand.nand_evter_intr_en);
 
 	mtd = nand_to_mtd(&priv->chip);
-	mtd->name = kasprintf(GFP_KERNEL, "%llx.flash", (u64)res.start);
+	mtd->name = kasprintf(GFP_KERNEL, "%llx.flash", (u64)res->start);
 	if (!mtd->name) {
 		ret = -ENOMEM;
 		goto err;
@@ -1099,7 +1088,7 @@ static int fsl_ifc_nand_probe(struct platform_device *dev)
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
