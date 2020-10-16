Return-Path: <SRS0=K4do=DX=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF04EC433DF
	for <linux-mtd@archiver.kernel.org>; Fri, 16 Oct 2020 12:19:10 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4343B20708
	for <linux-mtd@archiver.kernel.org>; Fri, 16 Oct 2020 12:19:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Kk4n7kK+";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hxl5l9kx"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4343B20708
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=SIkKSNGwoQKjpNqaT7sMSZKR7OUnZrzIeO4q8gpm7ZI=; b=Kk4n7kK+myHCzD5fji3akb9btf
	AHNyIxFYaKxUERlDfLiPcbzTeRoGNIZfeb+N7mpadgjH8HPE4p7Ao0l2nriwF0Dfy99iyw9lxvMpm
	/+bwsbFA4OC/vmoCzM98Asq8ht2ISvibY8ShhhyaF/xa03SAS1ckaF4JaOuCblJ7kg1BWcE8RcDJh
	d5A/rKQbHs9+8Kzk05RHN9aiCBS0GzVOEvdmi+x8VbEtciXosW6IQwOzGJr8besuB4qISIJrJdgax
	fWiAjnL+gwVNK+8nwXlsKGONNEaQ6ETBXqQnM47d98Y/UmIea82llnJLRIwgSIRN9SgjQHJIalHFh
	4WMV/MUQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kTOga-0000qm-8W; Fri, 16 Oct 2020 12:18:16 +0000
Received: from mail-qv1-xf43.google.com ([2607:f8b0:4864:20::f43])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kTOgX-0000pZ-Ap
 for linux-mtd@lists.infradead.org; Fri, 16 Oct 2020 12:18:14 +0000
Received: by mail-qv1-xf43.google.com with SMTP id s17so966258qvr.11
 for <linux-mtd@lists.infradead.org>; Fri, 16 Oct 2020 05:18:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=38YezOKnfAyyHNe8LQKo/d/tCqj7P6oDvPTrWE4/Kcc=;
 b=hxl5l9kxVXLglVDkU3e6oz3TEWolUnMTECKB+ctpuxDG28LFtkk5rd4rHnHV26zBdQ
 m8+E6hX/a2hlFi4oHamZOKzPFBcy4xhgIitvn0ntdIBHPQrTpNkrZE6kBpv6gpCArU/m
 SCRz3HrOot0KP9EWeKC7rUn1/vR1A6ZYNIYrv6mwDBL15YYY4qlHkl7b//WTKVxz+Snw
 1eorOLGoCjAJpEQ6XUGWS+RtSKc2sLLNQzVDJX53PMk48gq85c5QX9n7X8UxEifMcTOR
 fEoIGbqX97/M3Vln4Vp6PKIfCJYvkLCif8+83aBuNKm9I6UlQEXXXX+/1kmvERkBWJMG
 U0TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=38YezOKnfAyyHNe8LQKo/d/tCqj7P6oDvPTrWE4/Kcc=;
 b=Qo2Iuh/Vt9Q+c2wfRcIj4Gtl55tys4cN1k9FUuO+e0NAW1uB14T1tWpAzFGCipOX0G
 HwrOyzMBuFcx4c2p1X1onhAaPBn78myTyFVEsMdPFQ+dt3WjIurdxvRa/ef3DqkNPG8i
 FEAAPe8EsdjA8GjlOb9RXX1Tc5A+uXaPpS+QiE96jyFZ8I2FdzEiSbU3qe2HU0SFdUju
 snCnbd+7eSvnh+2aL/KdJGqnIfpC/qDDEJKYRk/1ZDEdZDWabbVl4+7js94was7W4ACe
 RvhaG2yimOqO9uDk2pTBguQ2rxJF2v2RqcgauTDQ53Mnj6fFaPvElugau6HyOsLSuqu+
 QdLw==
X-Gm-Message-State: AOAM5305wBdhShSqLkXNogNk4+Cior3nBQNs8XsYLc9vqg/GBDgw7+lC
 TJAy+r8oXjF7S+zksGXIsus=
X-Google-Smtp-Source: ABdhPJwvvAPULIRNclsA8f8xNot8++Df/ygLhPsN7kCrYHaJTqqIzpdQlr0mMmWJnFIpw/3H6mksvg==
X-Received: by 2002:a0c:ea4e:: with SMTP id u14mr3610382qvp.42.1602850691325; 
 Fri, 16 Oct 2020 05:18:11 -0700 (PDT)
Received: from localhost.localdomain ([2804:14c:482:997:843a:71ae:df40:2826])
 by smtp.gmail.com with ESMTPSA id
 o14sm915681qto.16.2020.10.16.05.18.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Oct 2020 05:18:10 -0700 (PDT)
From: Fabio Estevam <festevam@gmail.com>
To: miquel.raynal@bootlin.com
Subject: [PATCH] mtd: rawnand: ifc: Move the ECC engine initialization to the
 right place
Date: Fri, 16 Oct 2020 09:17:52 -0300
Message-Id: <20201016121752.28525-1-festevam@gmail.com>
X-Mailer: git-send-email 2.17.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201016_081813_406839_6391258C 
X-CRM114-Status: GOOD (  16.21  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: vigneshr@ti.com, richard@nod.at, boris.brezillon@collabora.com,
 linux-mtd@lists.infradead.org, kernel@pengutronix.de, han.xu@nxp.com,
 Fabio Estevam <festevam@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

No ECC initialization should happen during the host controller probe.

Indeed, we need the probe to call nand_scan() in order to:
- identify the device, its capabilities and constraints (nand_scan_ident())
- configure the ECC engine accordingly (->attach_chip())
- scan its content and prepare the core (nand_scan_tail())

Moving these lines to fsl_ifc_attach_chip() fixes a regression caused by
a previous commit supposed to clarify these steps.

Based on a fix done at the mxc_nand driver by Miquel Raynal.

Reported-by: Han Xu <xhnjupt@gmail.com>
Signed-off-by: Fabio Estevam <festevam@gmail.com>
---
Hi Han Xu,

Does this fix the ECC regression on Layerscape?

Hi Miquel,

If Han can confirm this fixes the problem, then I will audit the other
drivers and submit the fixes too.

 drivers/mtd/nand/raw/fsl_ifc_nand.c | 44 ++++++++++++++++-------------
 1 file changed, 24 insertions(+), 20 deletions(-)

diff --git a/drivers/mtd/nand/raw/fsl_ifc_nand.c b/drivers/mtd/nand/raw/fsl_ifc_nand.c
index 0e7a9b64301e..113048a1c423 100644
--- a/drivers/mtd/nand/raw/fsl_ifc_nand.c
+++ b/drivers/mtd/nand/raw/fsl_ifc_nand.c
@@ -707,6 +707,30 @@ static int fsl_ifc_attach_chip(struct nand_chip *chip)
 {
 	struct mtd_info *mtd = nand_to_mtd(chip);
 	struct fsl_ifc_mtd *priv = nand_get_controller_data(chip);
+	struct fsl_ifc_ctrl *ctrl = priv->ctrl;
+	struct fsl_ifc_global __iomem *ifc_global = ctrl->gregs;
+	u32 csor;
+
+	csor = ifc_in32(&ifc_global->csor_cs[priv->bank].csor);
+
+	/* Must also set CSOR_NAND_ECC_ENC_EN if DEC_EN set */
+	if (csor & CSOR_NAND_ECC_DEC_EN) {
+		chip->ecc.engine_type = NAND_ECC_ENGINE_TYPE_ON_HOST;
+		mtd_set_ooblayout(mtd, &fsl_ifc_ooblayout_ops);
+
+		/* Hardware generates ECC per 512 Bytes */
+		chip->ecc.size = 512;
+		if ((csor & CSOR_NAND_ECC_MODE_MASK) == CSOR_NAND_ECC_MODE_4) {
+			chip->ecc.bytes = 8;
+			chip->ecc.strength = 4;
+		} else {
+			chip->ecc.bytes = 16;
+			chip->ecc.strength = 8;
+		}
+	} else {
+		chip->ecc.engine_type = NAND_ECC_ENGINE_TYPE_SOFT;
+		chip->ecc.algo = NAND_ECC_ALGO_HAMMING;
+	}
 
 	dev_dbg(priv->dev, "%s: nand->numchips = %d\n", __func__,
 		nanddev_ntargets(&chip->base));
@@ -742,7 +766,6 @@ static int fsl_ifc_attach_chip(struct nand_chip *chip)
 							mtd->writesize);
 	dev_dbg(priv->dev, "%s: mtd->oobsize = %d\n", __func__,
 							mtd->oobsize);
-
 	return 0;
 }
 
@@ -910,25 +933,6 @@ static int fsl_ifc_chip_init(struct fsl_ifc_mtd *priv)
 		return -ENODEV;
 	}
 
-	/* Must also set CSOR_NAND_ECC_ENC_EN if DEC_EN set */
-	if (csor & CSOR_NAND_ECC_DEC_EN) {
-		chip->ecc.engine_type = NAND_ECC_ENGINE_TYPE_ON_HOST;
-		mtd_set_ooblayout(mtd, &fsl_ifc_ooblayout_ops);
-
-		/* Hardware generates ECC per 512 Bytes */
-		chip->ecc.size = 512;
-		if ((csor & CSOR_NAND_ECC_MODE_MASK) == CSOR_NAND_ECC_MODE_4) {
-			chip->ecc.bytes = 8;
-			chip->ecc.strength = 4;
-		} else {
-			chip->ecc.bytes = 16;
-			chip->ecc.strength = 8;
-		}
-	} else {
-		chip->ecc.engine_type = NAND_ECC_ENGINE_TYPE_SOFT;
-		chip->ecc.algo = NAND_ECC_ALGO_HAMMING;
-	}
-
 	ret = fsl_ifc_sram_init(priv);
 	if (ret)
 		return ret;
-- 
2.17.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
