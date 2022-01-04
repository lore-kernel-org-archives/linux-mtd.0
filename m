Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FACAC433EF
	for <linux-mtd@archiver.kernel.org>; Tue,  4 Jan 2022 08:40:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JNMKhncpYCE4tBvWo764Zjb8SjCraL39qsVa+trg3g0=; b=bSNWmpmIfORg1I
	Ov6nJvwnynV0nYbcMkbaS/4VuGjZaRc/jcFa/ncrEKpPD7+WsnnUUzy2M7e1mmgEEEkODsSbhzDFZ
	xIkIhOAc559tnzXdi14uEbehTDuqm2jCo2em2AFhbNB9SLmD0A9kkrAxR6SXgJCRjmHeIEEhPdR6n
	tfUbTLP31Zp43HjTngnsKNp1z3iJzcdxCH94Qg4JtMcAFsN5ZLaBRq1dRHCDB8yBsd9oBV9KtW8Zv
	R0lv2hzKDuXAIFB3wi2Ezppg5dj5V6dtJ0JmwJcIEYhUuIzHpjOrXIPIl8PxTkuQyd1ZsoidUUm+D
	oAG88XyZCol38f8DvG4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n4fMU-00Alpq-Fc; Tue, 04 Jan 2022 08:40:06 +0000
Received: from relay5-d.mail.gandi.net ([217.70.183.197])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n4fJI-00Akhf-K0
 for linux-mtd@lists.infradead.org; Tue, 04 Jan 2022 08:36:50 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by relay5-d.mail.gandi.net (Postfix) with ESMTPSA id A13211C0006;
 Tue,  4 Jan 2022 08:36:45 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>,
 Pratyush Yadav <p.yadav@ti.com>, Michael Walle <michael@walle.cc>,
 <linux-mtd@lists.infradead.org>, Mark Brown <broonie@kernel.org>,
 <linux-spi@vger.kernel.org>
Cc: Julien Su <juliensu@mxic.com.tw>, Jaime Liao <jaimeliao@mxic.com.tw>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Xiangsheng Hou <xiangsheng.hou@mediatek.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [PATCH v9 07/13] mtd: spinand: Delay a little bit the dirmap creation
Date: Tue,  4 Jan 2022 09:36:25 +0100
Message-Id: <20220104083631.40776-8-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20220104083631.40776-1-miquel.raynal@bootlin.com>
References: <20220104083631.40776-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220104_003648_839493_3FE9C357 
X-CRM114-Status: GOOD (  11.70  )
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
