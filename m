Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48E19C433EF
	for <linux-mtd@archiver.kernel.org>; Fri, 17 Dec 2021 17:20:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JNMKhncpYCE4tBvWo764Zjb8SjCraL39qsVa+trg3g0=; b=3kzcYJ2W3Fj73s
	EDRczN+WuAFTEsC5CFGzh0Aq2Bf8Q0UglU7AD+Xi5AljI4bl6fifGtXEyU8QNYa22z5HcDJHkS4Z8
	CBKfA4BMpGiGV5wRn8g/3uq7Q5Vdylm4ybxzzXNWvKUiK5rOocAxftrvTIqpy4IpBKwjKHBnIJhEF
	kfTUNVpL7imG6x/9i+HAN5wBK6wLK3OQzMiDID0UfjhcBc7C8Km5KpPSdDvC47sJTliEZa0d1rcwS
	sQ0yw3XuaP/6FIGA9U45nzMB3AOHV61sxMdOGQYgBZ2lTiH8/OTDGIlnZbDNfWW/MFiafAmlF98N8
	K2GGsIXkDrmRyOfaKZiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1myGu8-00BS4o-P6; Fri, 17 Dec 2021 17:20:24 +0000
Received: from relay12.mail.gandi.net ([217.70.178.232])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1myFv7-00B7bx-99
 for linux-mtd@lists.infradead.org; Fri, 17 Dec 2021 16:17:22 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by relay12.mail.gandi.net (Postfix) with ESMTPSA id 7A289200013;
 Fri, 17 Dec 2021 16:17:17 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Mark Brown <broonie@kernel.org>, <linux-spi@vger.kernel.org>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>,
 Pratyush Yadav <p.yadav@ti.com>, Michael Walle <michael@walle.cc>,
 <linux-mtd@lists.infradead.org>
Cc: Julien Su <juliensu@mxic.com.tw>, Jaime Liao <jaimeliao@mxic.com.tw>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [PATCH v7 08/14] mtd: spinand: Delay a little bit the dirmap creation
Date: Fri, 17 Dec 2021 17:16:48 +0100
Message-Id: <20211217161654.367782-9-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20211217161654.367782-1-miquel.raynal@bootlin.com>
References: <20211217161654.367782-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211217_081721_541970_45D57E89 
X-CRM114-Status: GOOD (  10.69  )
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
