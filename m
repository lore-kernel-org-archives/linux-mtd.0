Received: from arroyo.ext.ti.com ([192.94.94.40])
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1MOvHW-0007MR-2q
	for linux-mtd@lists.infradead.org; Thu, 09 Jul 2009 15:11:48 +0000
Received: from dlep35.itg.ti.com ([157.170.170.118])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id n69FBNEv008345
	for <linux-mtd@lists.infradead.org>; Thu, 9 Jul 2009 10:11:28 -0500
Received: from webmail.ti.com (localhost [127.0.0.1])
	by dlep35.itg.ti.com (8.13.7/8.13.7) with ESMTP id n69FBKcd028920
	for <linux-mtd@lists.infradead.org>;
	Thu, 9 Jul 2009 10:11:21 -0500 (CDT)
Message-ID: <52073.192.168.10.89.1247152282.squirrel@dbdmail.itg.ti.com>
Date: Thu, 9 Jul 2009 20:41:22 +0530 (IST)
Subject: [PATCH] nand_base.c: removing repeated comment
From: "vimal singh" <vimalsingh@ti.com>
To: linux-mtd@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain;charset=iso-8859-1
Content-Transfer-Encoding: 8bit
References: 
In-Reply-To: 
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Removing repeated comment.

Singed-off-by: Vimal Singh <vimalsingh@ti.com>
---

diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c index
8c21b89..30c4c32 100644
--- a/drivers/mtd/nand/nand_base.c
+++ b/drivers/mtd/nand/nand_base.c
@@ -689,7 +689,6 @@ nand_get_device(struct nand_chip *chip, struct mtd_info
*mtd, int new_state)
 	spin_lock(lock);

 	/* Hardware controller shared among independend devices */
-	/* Hardware controller shared among independend devices */
 	if (!chip->controller->active)
 		chip->controller->active = chip;
