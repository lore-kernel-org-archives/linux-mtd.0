Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 968BFC79F8C
	for <linux-mtd@archiver.kernel.org>; Mon,  7 Sep 2026 00:56:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=5xbjW77i07pvOMgksg1Ty/7JIMsW0nxuab4FLAGIwNg=; b=vlrYtTdfx1NyFn
	LqdKk7iI7AFfmrSyGFmo/pgBKmB4vfulSxMrtCZ6HIfE4nAnK9f0rikZbq7hxzBUUsU6aPoQnmNLi
	cKFzDCLWTc6t22HZdS1lFlcY3sRsFLo+xHtiIl6GJdgAAdSvNk1oGQiU0n/X1AgwziR/RQN6pbq52
	36wjR5DXxCYJ10UhiYUuE7PHa0xWNAZfCV0JMTAeNKmIq2UtkJjPPv19F0qU5r/GzlJzR629wgLpV
	yjisNMEqtyX7HwDJErKd+TSjHjPDCaqStkPw52z0ws72uz6WEMpsOIg/+1NMOSPOHhWw1EzC65Evj
	Dy2B3qeUOlKtglEbD3Bg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3NeW-00000005ejt-3UPH;
	Mon, 07 Sep 2026 00:56:04 +0000
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3NeT-00000005ejX-1Ufh
	for linux-mtd@lists.infradead.org;
	Mon, 07 Sep 2026 00:56:04 +0000
Received: by mail-pj1-x1032.google.com with SMTP id 98e67ed59e1d1-3966791a6eeso3562414a91.3
        for <linux-mtd@lists.infradead.org>; Sun, 06 Sep 2026 17:56:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788742560; x=1789347360; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=sELXrw22H/IsIeG/7YwT9q2MiplIi3+BT1tFOGBMF6I=;
        b=Ib+OOjp5W9dJO3FoImngq6dz5njhqu7haezfTOlpyeCarj1UwzfOFouoC6Ls+ZcSiT
         m2T3dotVDAGcDTO0X84AovBFk5d/Qusqo4IHTagBbM510SVnuLcuFeolRByy6YZlYVzB
         7G1rIycx74o83L9HxRZ1CrTHfU3c5ZO/SzJW+NELNJqKuK4srR4yxI7K4ObLk5Oa4A3E
         057aPguWp/ziuQlHxOycThEkWZlYbat3ynV5k8wsixK60USTvay4WMMDI4gDw48+2req
         yuOSaWA8xxk8mxC3sblAosdSdZ9WHQkp9bOB9fLSa6//xAxiVLIVlgdp8O+AM2ClksJU
         zcYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788742560; x=1789347360;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sELXrw22H/IsIeG/7YwT9q2MiplIi3+BT1tFOGBMF6I=;
        b=gsHFUzC/555OGLxJZJpqyIygufwn/gzjN6ZwPrfFGWBXqo+BLgB6vj94t6hg0r8ySB
         8NC8Zuu1CEP9VZZSq/K2YDz7iEaME/BqK82sb8d90Hf91C865PYmWUHpb+2KwpZiJq7z
         BHFUNb1sN02QZn0Y5ArRIp79YM+Fh+cY4+4K2aW13qYLb7rlSKwt3NGgdTJmf7RYrFJt
         j7buNlbSC4k1kw8nxft3mCpCscjDOc9aV4GchZdkPZhn6t8O1xLmvtR8t/0cOaT7GI2A
         unEUAN3EUWhZmh9OgfCsEvGUQ/293DBkAjjSjtLhTM2B9TVTwU+TGk1NvnK1/QXlfc8c
         c7EQ==
X-Gm-Message-State: AFuF++l/T4o9vI7GMTKFC4Mz5X+dMrUFWeYx9S5ofbecGBLhpkotKdsE
	XdHqzhW47NqVxrqtGSz0aIjwGGM8oVreKyAi4ohgm+cgcA1MrHrFLnep1x65RQ==
X-Gm-Gg: AYBFou0uqiSIgIIsbat0mrL4HfNy/lbxH3vY2Am4U4M6HQTQTy3XgvznvsZ7knlSi2/
	VXmQlujmgaYPYU7KQaMnTOu2uFqJuCPSJGGmFTmuvDeAnSOEehEBPCbfS9R3WQVkqObgc3D2Y4b
	G0t2MzX12O6roS/g6kRWzkMaHdkzoSlDZiTCMJRHFFfx/K0XW8CIe2aGJ+S3tlXYdEhIE2GT3C+
	f0VbgGYONvkGn1+1T8aMscnOj2wbJbEh1n6RfTtxoLv6bjnVcIZzcsZ6+5suDtlo/tulGhXEpBM
	TOFL3Db09hVssy1KGRnS4+D8OpPD8vCerC5p0d+14jLqw2y53lorTCs3CGBXgzPQ2+wx5ACVSFS
	Lbo6HVS7jbw3dty5apmFW2vkTUZZ2aTBas7+VMGr0i5APFRwWVog/lo3qK1q+K1ljOi/01x/Jfn
	zG6OUKq11/bAbm8iSboqtNV7UTHod9+q+O3IEbL2OsAJ9aVlBAY7rKeeG9yLGrjxJLZpv2Dq+xF
	pByOa3Y3+9/v6RKRokrUIN7NWTev/AqX6HmjVxUDnfuueqp55eknbh3p0kY9k5I7gTC0+JJpUN9
	cLzF1B3r/g/wVYGxzkbMrbx4J/OAF+PQ0ilAcQ==
X-Received: by 2002:a17:90b:4c51:b0:38e:57a3:f218 with SMTP id 98e67ed59e1d1-39b26204e5bmr27718526a91.13.1788742560180;
        Sun, 06 Sep 2026 17:56:00 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e35])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39b08ca63b3sm23328017a91.11.2026.09.06.17.55.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Sep 2026 17:55:59 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-mtd@lists.infradead.org
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] mtd: rawnand: fsl_ifc: allocate shared ctrl with devm_kzalloc
Date: Sun,  6 Sep 2026 17:55:58 -0700
Message-ID: <20260907005558.229187-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260906_175601_420838_8B1E3CF2 
X-CRM114-Status: GOOD (  12.75  )
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

Allocate the shared fsl_ifc_nand_ctrl structure against the controller
device, which outlives all NAND child devices, so it is freed
automatically.  This drops the manual kfree() and the broken chip
counter that was decremented in remove() but never incremented
anywhere, leaking the structure and leaving the freed pointer in
ctrl->nand on re-probe.

Assisted-by: opencode:big-pickle
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/mtd/nand/raw/fsl_ifc_nand.c | 15 ++-------------
 1 file changed, 2 insertions(+), 13 deletions(-)

diff --git a/drivers/mtd/nand/raw/fsl_ifc_nand.c b/drivers/mtd/nand/raw/fsl_ifc_nand.c
index b34524726dec..db6bb0bb43e8 100644
--- a/drivers/mtd/nand/raw/fsl_ifc_nand.c
+++ b/drivers/mtd/nand/raw/fsl_ifc_nand.c
@@ -48,7 +48,6 @@ struct fsl_ifc_nand_ctrl {
 	unsigned int index;	/* Pointer to next byte to 'read'	*/
 	unsigned int oob;	/* Non zero if operating on OOB data	*/
 	unsigned int eccread;	/* Non zero for a full-page ECC read	*/
-	unsigned int counter;	/* counter for the initializations	*/
 	unsigned int max_bitflips;  /* Saved during READ0 cmd		*/
 };
 
@@ -1034,15 +1033,13 @@ static int fsl_ifc_nand_probe(struct platform_device *dev)
 
 	mutex_lock(&fsl_ifc_nand_mutex);
 	if (!ctrl->nand) {
-		ifc_nand_ctrl = kzalloc_obj(*ifc_nand_ctrl);
+		ifc_nand_ctrl = devm_kzalloc(ctrl->dev, sizeof(*ifc_nand_ctrl),
+					     GFP_KERNEL);
 		if (!ifc_nand_ctrl) {
 			mutex_unlock(&fsl_ifc_nand_mutex);
 			return -ENOMEM;
 		}
 
-		ifc_nand_ctrl->read_bytes = 0;
-		ifc_nand_ctrl->index = 0;
-		ifc_nand_ctrl->addr = NULL;
 		ctrl->nand = ifc_nand_ctrl;
 
 		nand_controller_init(&ifc_nand_ctrl->controller);
@@ -1122,14 +1119,6 @@ static void fsl_ifc_nand_remove(struct platform_device *dev)
 	nand_cleanup(chip);
 
 	fsl_ifc_chip_remove(priv);
-
-	mutex_lock(&fsl_ifc_nand_mutex);
-	ifc_nand_ctrl->counter--;
-	if (!ifc_nand_ctrl->counter) {
-		priv->ctrl->nand = NULL;
-		kfree(ifc_nand_ctrl);
-	}
-	mutex_unlock(&fsl_ifc_nand_mutex);
 }
 
 static const struct of_device_id fsl_ifc_nand_match[] = {
-- 
2.55.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
