Received: from e5.ny.us.ibm.com ([32.97.182.145])
	by pentafluge.infradead.org with esmtps (Exim 4.62 #1 (Red Hat Linux))
	id 1GQ3zZ-0004cz-T0
	for linux-mtd@lists.infradead.org; Wed, 20 Sep 2006 16:28:06 +0100
Received: from d01relay02.pok.ibm.com (d01relay02.pok.ibm.com [9.56.227.234])
	by e5.ny.us.ibm.com (8.13.8/8.12.11) with ESMTP id k8KFOsa8027222
	for <linux-mtd@lists.infradead.org>; Wed, 20 Sep 2006 11:24:54 -0400
Received: from d01av03.pok.ibm.com (d01av03.pok.ibm.com [9.56.224.217])
	by d01relay02.pok.ibm.com (8.13.6/8.13.6/NCO v8.1.1) with ESMTP id
	k8KFOsD4245734
	for <linux-mtd@lists.infradead.org>; Wed, 20 Sep 2006 11:24:54 -0400
Received: from d01av03.pok.ibm.com (loopback [127.0.0.1])
	by d01av03.pok.ibm.com (8.12.11.20060308/8.13.3) with ESMTP id
	k8KFOsg2010213
	for <linux-mtd@lists.infradead.org>; Wed, 20 Sep 2006 11:24:54 -0400
Subject: [PATCH] [MTD] NAND: Fix typo ndfc.c
From: Frank Haverkamp <haver@vnet.ibm.com>
To: David Woodhouse <dwmw2@infradead.org>
Content-Type: text/plain
Date: Wed, 20 Sep 2006 17:24:52 +0200
Message-Id: <1158765892.5120.11.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: Thomas Gleixner <tglx@linutronix.de>,
	MTD Mailinglist <linux-mtd@lists.infradead.org>
Reply-To: haver@vnet.ibm.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

[PATCH] [MTD] NAND: Fix typo ndfc.c

Due to this typo, a wrong ECC layout table is choosen.

Signed-off-by: Frank Haverkamp <haver@vnet.ibm.com>
---
 drivers/mtd/nand/ndfc.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

Index: mtd-2.6.git/drivers/mtd/nand/ndfc.c
===================================================================
--- mtd-2.6.git.orig/drivers/mtd/nand/ndfc.c	2006-09-14
16:30:18.000000000 +0200
+++ mtd-2.6.git/drivers/mtd/nand/ndfc.c	2006-09-20 17:11:54.000000000
+0200
@@ -168,7 +168,7 @@ static void ndfc_chip_init(struct ndfc_n
 	chip->ecc.mode = NAND_ECC_HW;
 	chip->ecc.size = 256;
 	chip->ecc.bytes = 3;
-	chip->ecclayout = mtd->pl_chip->ecclayout;
+	chip->ecclayout = chip->ecc.layout = mtd->pl_chip->ecclayout;
 	mtd->mtd.priv = chip;
 	mtd->mtd.owner = THIS_MODULE;
 }
