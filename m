Received: from mail-wy0-f177.google.com ([74.125.82.177])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1QKVvI-00029n-CM
	for linux-mtd@lists.infradead.org; Thu, 12 May 2011 13:27:25 +0000
Received: by mail-wy0-f177.google.com with SMTP id 28so1473623wyb.36
	for <linux-mtd@lists.infradead.org>;
	Thu, 12 May 2011 06:27:24 -0700 (PDT)
From: Jamie Iles <jamie@jamieiles.com>
To: linux-mtd@lists.infradead.org
Subject: [RFC PATCH 4/7] mtd/nand: convert to mtd_device_unregister()
Date: Thu, 12 May 2011 14:26:55 +0100
Message-Id: <1305206818-31752-5-git-send-email-jamie@jamieiles.com>
In-Reply-To: <1305206818-31752-1-git-send-email-jamie@jamieiles.com>
References: <1305206818-31752-1-git-send-email-jamie@jamieiles.com>
Cc: Jamie Iles <jamie@jamieiles.com>, dwmw2@infradead.org, dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

---
 drivers/mtd/nand/nand_base.c |    7 +------
 1 files changed, 1 insertions(+), 6 deletions(-)

diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
index c54a4cb..46be430 100644
--- a/drivers/mtd/nand/nand_base.c
+++ b/drivers/mtd/nand/nand_base.c
@@ -3539,12 +3539,7 @@ void nand_release(struct mtd_info *mtd)
 	if (chip->ecc.mode == NAND_ECC_SOFT_BCH)
 		nand_bch_free((struct nand_bch_control *)chip->ecc.priv);
 
-#ifdef CONFIG_MTD_PARTITIONS
-	/* Deregister partitions */
-	del_mtd_partitions(mtd);
-#endif
-	/* Deregister the device */
-	del_mtd_device(mtd);
+	mtd_device_unregister(mtd);
 
 	/* Free bad block table memory */
 	kfree(chip->bbt);
-- 
1.7.4.4
