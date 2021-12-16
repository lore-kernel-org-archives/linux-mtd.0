Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75A50C433F5
	for <linux-mtd@archiver.kernel.org>; Thu, 16 Dec 2021 11:50:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JNMKhncpYCE4tBvWo764Zjb8SjCraL39qsVa+trg3g0=; b=CpdLp/ARUelgyR
	zLQ99GC4GvVRg2XwywVa+HP2dOcKmTzr0bz34GmvYxIRmn4LoV+7M72W1Fv/WR+acjJqFBw38c/sf
	+e7kcrUiFFapCDene9dLRnE6Jo2JhnIAeLo7gLFEp/uVqA3LLOb+CnjJsHdWCdwuIFGxhk5Qdi0SE
	VJew8GL9451/7N8oFbgmN0iUfktB/nw34O36fSnojy0E30lsSsjyOMT2eJhhObeV5jOe2vKqP1lv+
	gRbRhPK2LAE0TmKDEzgDV6zZf71PUwRO3Gk1SIMJjuXA5CchBwNsK3+uusv3mrpBOpzbWh0HbLpqH
	e6bfAMvbM2J6aWywL6dg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mxpGm-005HQt-04; Thu, 16 Dec 2021 11:49:56 +0000
Received: from relay4-d.mail.gandi.net ([217.70.183.196])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mxolN-005716-9f
 for linux-mtd@lists.infradead.org; Thu, 16 Dec 2021 11:17:31 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by relay4-d.mail.gandi.net (Postfix) with ESMTPSA id 295A4E0003;
 Thu, 16 Dec 2021 11:17:26 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Mark Brown <broonie@kernel.org>, <linux-spi@vger.kernel.org>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>,
 Pratyush Yadav <p.yadav@ti.com>, Michael Walle <michael@walle.cc>,
 <linux-mtd@lists.infradead.org>, Rob Herring <robh+dt@kernel.org>,
 <devicetree@vger.kernel.org>
Cc: Julien Su <juliensu@mxic.com.tw>, Jaime Liao <jaimeliao@mxic.com.tw>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [PATCH v6 17/28] mtd: spinand: Delay a little bit the dirmap creation
Date: Thu, 16 Dec 2021 12:16:43 +0100
Message-Id: <20211216111654.238086-18-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20211216111654.238086-1-miquel.raynal@bootlin.com>
References: <20211216111654.238086-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211216_031729_562216_81739CD6 
X-CRM114-Status: GOOD (  11.02  )
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

As we will soon tweak the dirmap creation to act a little bit
differently depending on the picked ECC engine, we need to initialize
dirmaps after ECC engines. This should not have any effect as dirmaps
are not yet used at this point.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/mtd/nand/spi/core.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/mtd/nand/spi/core.c b/drivers/mtd/nand/spi/core.c
index 7027c09925e2..715cad26fdef 100644
--- a/drivers/mtd/nand/spi/core.c
+++ b/drivers/mtd/nand/spi/core.c
@@ -1209,14 +1209,6 @@ static int spinand_init(struct spinand_device *spinand)
 	if (ret)
 		goto err_free_bufs;
 
-	ret = spinand_create_dirmaps(spinand);
-	if (ret) {
-		dev_err(dev,
-			"Failed to create direct mappings for read/write operations (err = %d)\n",
-			ret);
-		goto err_manuf_cleanup;
-	}
-
 	ret = nanddev_init(nand, &spinand_ops, THIS_MODULE);
 	if (ret)
 		goto err_manuf_cleanup;
@@ -1251,6 +1243,14 @@ static int spinand_init(struct spinand_device *spinand)
 	mtd->ecc_strength = nanddev_get_ecc_conf(nand)->strength;
 	mtd->ecc_step_size = nanddev_get_ecc_conf(nand)->step_size;
 
+	ret = spinand_create_dirmaps(spinand);
+	if (ret) {
+		dev_err(dev,
+			"Failed to create direct mappings for read/write operations (err = %d)\n",
+			ret);
+		goto err_cleanup_ecc_engine;
+	}
+
 	return 0;
 
 err_cleanup_ecc_engine:
-- 
2.27.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
