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
	by smtp.lore.kernel.org (Postfix) with ESMTP id A8D2DC433DF
	for <linux-mtd@archiver.kernel.org>; Fri, 16 Oct 2020 13:27:19 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2186F20848
	for <linux-mtd@archiver.kernel.org>; Fri, 16 Oct 2020 13:27:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="b+nozsm/";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ut4aWp68"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2186F20848
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=a0gnvnNSSs3+tbU02ueAW9yhI3B9Lel5XvVJn9zEb9Y=; b=b+nozsm//NoLjEHdrqDOgFnABZ
	ZzthhHAOMzLzkWhPkx8j06lhX5zTu1XsFSDTv4EkNjwyGMLeD4VmuSOmc3AY12r+upTOdqG0vChZ1
	EwE4RL9GjEZf85LeLOltK7dhWqSKWnIXRgqVsPfAPwn4aXYyMZE+IxJ96bc8PBloLteoe4ha1LYsr
	VAYjGZCENoeIEIRmuxg/wK1tvtrv+7NukVoq4hD3FBA0WjJGIkcKvnD9alK/QXr0sg6GGONxLuMdp
	Fsu3zLy8MelKR1k9/Rxldmd53nvO37cnbHn4qdcNFkZtRTPPw8x10ThaSk02n8qLuse2tnA2vfoC5
	z5uEH7gw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kTPku-0006uM-Tp; Fri, 16 Oct 2020 13:26:48 +0000
Received: from mail-qt1-x843.google.com ([2607:f8b0:4864:20::843])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kTPks-0006tK-Oj
 for linux-mtd@lists.infradead.org; Fri, 16 Oct 2020 13:26:47 +0000
Received: by mail-qt1-x843.google.com with SMTP id z33so1569638qth.8
 for <linux-mtd@lists.infradead.org>; Fri, 16 Oct 2020 06:26:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=CB82VRPjsAmWp2J25jyqNrV3O2qA0GxRUDtI+33GkIA=;
 b=Ut4aWp68V7T4ruYoqiq2xQvtfuIdhlWfwcijzQEYifgVoaokTj3IEEckIr8c2aVSY/
 8o0n/soWOJx1ql+V2tQfRyxeiSdY1H2Tpwc0Gnw1o0neL4UFN0Y5n1hEvCyXck9ik4GI
 Zv3hopsJ98iTvcV7dRd+c68tX2VXZGvmd8Vz/iXwz6PiHYGk4g8OD3DFchUPmFHnysby
 duuKUyCVSeRkCyQ2FW1jX02eetyutrVzFRfnTLph3beyPWUtWiLthv10eCCfprhtNtQK
 0UM6zw5JG5/dv4XS7rDSmO/uAZNWRld6Y98yJ8acviI6OkkVZP2ap2+g5Fn8WsKAUfPo
 9ppw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=CB82VRPjsAmWp2J25jyqNrV3O2qA0GxRUDtI+33GkIA=;
 b=COl7j/zmGKJqQB4jDtXwyFB22G5VJjZ9iFvPtZVWveFlNtzWA7eERI3FifBRRk/6V9
 qj9GJCao91PRT7VNFVzBtJ3rC1dk2QjidVpmpH3yhHi9H0nwzlbj7IVFXSNbeAPBbIKc
 0WXuXd+K28B7mC4Pyg0IRnWycoKk89w00P14sHYljT1qtShx1BQakT5uIHjsVZ7zAPGW
 DQgIL58a/3whUe/gON1M8CvE7Kktc1GmnNTc/pQKebI6FOjcpSgOt+suug5UKehBFhzw
 sRrD5bRmqFGg3KGY45SLgAqVSlPuOep34jJjp8mXSFdGpRyDQ3a2pd3SiSDcioFLm/ge
 FBwA==
X-Gm-Message-State: AOAM532TpsPrZGUP2OE9ZHGfKeGohOn0RBZ9KNJWa+/TssCkajueZ4QL
 8uI80eCCgFZz7pF8STn7wdQ=
X-Google-Smtp-Source: ABdhPJx4EBvJKqL6vhF0LcEAqA3xTMaay1hGnt/cHCYjqmfdDhDddZ48P3CYQdfxFHBbcklmRAS/qA==
X-Received: by 2002:ac8:5c94:: with SMTP id r20mr3269617qta.292.1602854804546; 
 Fri, 16 Oct 2020 06:26:44 -0700 (PDT)
Received: from localhost.localdomain ([2804:14c:482:997:843a:71ae:df40:2826])
 by smtp.gmail.com with ESMTPSA id
 p136sm840797qke.25.2020.10.16.06.26.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Oct 2020 06:26:43 -0700 (PDT)
From: Fabio Estevam <festevam@gmail.com>
To: miquel.raynal@bootlin.com
Subject: [PATCH v2] mtd: rawnand: ifc: Move the ECC engine initialization to
 the right place
Date: Fri, 16 Oct 2020 10:26:26 -0300
Message-Id: <20201016132626.30112-1-festevam@gmail.com>
X-Mailer: git-send-email 2.17.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201016_092646_822272_C61A86F7 
X-CRM114-Status: GOOD (  16.36  )
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

In fact, we need the probe function to call nand_scan() in order to:
- identify the device, its capabilities and constraints (nand_scan_ident())
- configure the ECC engine accordingly (->attach_chip())
- scan its content and prepare the core (nand_scan_tail())

Moving these lines to fsl_ifc_attach_chip() fixes a regression caused by
a previous commit supposed to clarify these steps.

Based on a fix done for the mxc_nand driver by Miquel Raynal.

Reported-by: Han Xu <xhnjupt@gmail.com>
Signed-off-by: Fabio Estevam <festevam@gmail.com>
---
Changes since v1:
- Do not remove a blank line

 drivers/mtd/nand/raw/fsl_ifc_nand.c | 43 ++++++++++++++++-------------
 1 file changed, 24 insertions(+), 19 deletions(-)

diff --git a/drivers/mtd/nand/raw/fsl_ifc_nand.c b/drivers/mtd/nand/raw/fsl_ifc_nand.c
index 0e7a9b64301e..e345f9d9f8e8 100644
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
@@ -910,25 +934,6 @@ static int fsl_ifc_chip_init(struct fsl_ifc_mtd *priv)
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
