Received: from bear.ext.ti.com ([192.94.94.41])
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1Lox8z-0000eO-8b
	for linux-mtd@lists.infradead.org; Wed, 01 Apr 2009 09:54:07 +0000
Received: from dlep34.itg.ti.com ([157.170.170.115])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id n319rrCZ029897
	for <linux-mtd@lists.infradead.org>; Wed, 1 Apr 2009 04:53:58 -0500
Received: from webmail.ti.com (localhost [127.0.0.1])
	by dlep34.itg.ti.com (8.13.7/8.13.7) with ESMTP id n319rnPZ003508
	for <linux-mtd@lists.infradead.org>;
	Wed, 1 Apr 2009 04:53:51 -0500 (CDT)
Message-ID: <34437.192.168.10.89.1238579632.squirrel@dbdmail.itg.ti.com>
Date: Wed, 1 Apr 2009 15:23:52 +0530 (IST)
Subject: [resending][PATCH] [MTD] [NAND] nand_ecc.c: Bug fix in nand ecc
From: "vimal singh" <vimalsingh@ti.com>
To: linux-mtd@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain;charset=iso-8859-1
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

I do not see this patch on tree, yet.

------------------------------ Original Message -------------------------------
Subject: [PATCH] [MTD] [NAND] nand_ecc.c: Bug fix in nand ecc
From:    "vimal singh" <vimalsingh@ti.com>
Date:    Mon, February 23, 2009 1:46 pm
To:      linux-mtd@lists.infradead.org
-------------------------------------------------------------------------------

Type of 'byte_addr' needed to change for 512 byte ecc support.

Signed-off-by: Vimal Singh <vimalsingh@ti.com>
---

diff --git a/drivers/mtd/nand/nand_ecc.c b/drivers/mtd/nand/nand_ecc.c index
868147a..6b19058 100644
--- a/drivers/mtd/nand/nand_ecc.c
+++ b/drivers/mtd/nand/nand_ecc.c
@@ -429,7 +429,8 @@ int nand_correct_data(struct mtd_info *mtd, unsigned char
*buf,
 		      unsigned char *read_ecc, unsigned char *calc_ecc)
 {
 	unsigned char b0, b1, b2;
-	unsigned char byte_addr, bit_addr;
+	uint32_t byte_addr;
+	unsigned char bit_addr;
 	/* 256 or 512 bytes/ecc  */
 	const uint32_t eccsize_mult =
 			(((struct nand_chip *)mtd->priv)->ecc.size) >> 8;
