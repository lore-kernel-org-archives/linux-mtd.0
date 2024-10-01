Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 614DECE7D1C
	for <linux-mtd@archiver.kernel.org>; Tue,  1 Oct 2024 20:33:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=SX0ROUiq2mQD5UkGnUzxXak9NZVe1ADxSbJRfPJG5Ys=; b=SKyeVN+Yrj6kh1
	OIpXzcRr9EuRaGb+xTkpJ8TsWgBauy1V4ObLEr0+lO6dueNZr911IJCwNLvAabXI/TiK6ty+TFAeU
	yrSAV16/fPSxeZAk2if4ZoGbVTrZWTd2UDq+d51p/ZDUKJeXq24zADa7hivDyhz3fNrNAUyPYahZu
	x5dLJgPWLupENXz7HOfZkClqduamt2VbZcmdMz5kMZBA+PUFSTYN2hLTuouo4iWLvMzxIbSx07p7z
	I3Shrb1Ovaxs+73m9Z0+jK2Atkqm3dLLL2YTBtRTcwBHBl2H7m4SYNBjiy1SHuNCzzcFNpeSyXPws
	txeF9kGfZIfk+oj/nQuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1svjYS-000000040ab-1my3;
	Tue, 01 Oct 2024 20:33:08 +0000
Received: from relay7-d.mail.gandi.net ([2001:4b98:dc4:8::227])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1svjXI-000000040TD-1etJ
	for linux-mtd@lists.infradead.org;
	Tue, 01 Oct 2024 20:31:58 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id AA34320005;
	Tue,  1 Oct 2024 20:31:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1727814712;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=AMRHhshq3KGKfk3yt2DF0Y9Caw0bFPcZ5M4ne6YT/Ec=;
	b=Z0Acy7hpMqdxi8/Fpq33SPDN2efoMGN139HcXh+EhrGC40f/d2WnEIT5/lEjq9uP5JFsDQ
	1cV8aFWY5t8tCp17KhdQ0Vb34oJTNjoGvbecBCr9/hb1iz4UAslpGulNPReRv0MyRUC+Aa
	qzCPI+Vji14YTuK9JyAOPsey0flq0e4COCfYV3EmiY13nDaKi2XESnIYFv8Wm58+0mJlya
	Xp3VlrUxH+Y9GQ04gQI/cgMG5AZApFtgSCx2E28Z/ZBeX0dCdQOFrkDCAkcbP33Gt108EL
	6jMALWi/jSQupdH1oxY2lnfEfC83LhbJF8Cyuht29QfPbHDZgLyJ21H4Xc2RWQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Pratyush Yadav <pratyush@kernel.org>,
	Michael Walle <michael@walle.cc>,
	<linux-mtd@lists.infradead.org>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	linux@treblig.org,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [PATCH] mtd: rawnand: atmel: Fix possible memory leak
Date: Tue,  1 Oct 2024 22:31:49 +0200
Message-ID: <20241001203149.387655-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241001_133156_776232_F6965A00 
X-CRM114-Status: GOOD (  11.14  )
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

The pmecc "user" structure is allocated in atmel_pmecc_create_user() and
was supposed to be freed with atmel_pmecc_destroy_user(), but this other
helper is never called. One solution would be to find the proper
location to call the destructor, but the trend today is to switch to
device managed allocations, which in this case fits pretty well.

Replace kzalloc() by devm_kzalloc() and drop the destructor entirely.

Reported-by: "Dr. David Alan Gilbert" <linux@treblig.org>
Closes: https://lore.kernel.org/all/ZvmIvRJCf6VhHvpo@gallifrey/
Fixes: f88fc122cc34 ("mtd: nand: Cleanup/rework the atmel_nand driver")
Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/mtd/nand/raw/atmel/pmecc.c | 8 +-------
 drivers/mtd/nand/raw/atmel/pmecc.h | 2 --
 2 files changed, 1 insertion(+), 9 deletions(-)

diff --git a/drivers/mtd/nand/raw/atmel/pmecc.c b/drivers/mtd/nand/raw/atmel/pmecc.c
index 4d7dc8a9c373..a22aab4ed4e8 100644
--- a/drivers/mtd/nand/raw/atmel/pmecc.c
+++ b/drivers/mtd/nand/raw/atmel/pmecc.c
@@ -362,7 +362,7 @@ atmel_pmecc_create_user(struct atmel_pmecc *pmecc,
 	size = ALIGN(size, sizeof(s32));
 	size += (req->ecc.strength + 1) * sizeof(s32) * 3;
 
-	user = kzalloc(size, GFP_KERNEL);
+	user = devm_kzalloc(pmecc->dev, size, GFP_KERNEL);
 	if (!user)
 		return ERR_PTR(-ENOMEM);
 
@@ -408,12 +408,6 @@ atmel_pmecc_create_user(struct atmel_pmecc *pmecc,
 }
 EXPORT_SYMBOL_GPL(atmel_pmecc_create_user);
 
-void atmel_pmecc_destroy_user(struct atmel_pmecc_user *user)
-{
-	kfree(user);
-}
-EXPORT_SYMBOL_GPL(atmel_pmecc_destroy_user);
-
 static int get_strength(struct atmel_pmecc_user *user)
 {
 	const int *strengths = user->pmecc->caps->strengths;
diff --git a/drivers/mtd/nand/raw/atmel/pmecc.h b/drivers/mtd/nand/raw/atmel/pmecc.h
index 7851c05126cf..cc0c5af1f4f1 100644
--- a/drivers/mtd/nand/raw/atmel/pmecc.h
+++ b/drivers/mtd/nand/raw/atmel/pmecc.h
@@ -55,8 +55,6 @@ struct atmel_pmecc *devm_atmel_pmecc_get(struct device *dev);
 struct atmel_pmecc_user *
 atmel_pmecc_create_user(struct atmel_pmecc *pmecc,
 			struct atmel_pmecc_user_req *req);
-void atmel_pmecc_destroy_user(struct atmel_pmecc_user *user);
-
 void atmel_pmecc_reset(struct atmel_pmecc *pmecc);
 int atmel_pmecc_enable(struct atmel_pmecc_user *user, int op);
 void atmel_pmecc_disable(struct atmel_pmecc_user *user);
-- 
2.43.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
