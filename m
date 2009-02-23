Received: from comal.ext.ti.com ([198.47.26.152])
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1LbVz6-0007SS-LS
	for linux-mtd@lists.infradead.org; Mon, 23 Feb 2009 08:16:19 +0000
Received: from dlep36.itg.ti.com ([157.170.170.91])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id n1N8G9xf009742
	for <linux-mtd@lists.infradead.org>; Mon, 23 Feb 2009 02:16:14 -0600
Received: from webmail.ti.com (localhost [127.0.0.1])
	by dlep36.itg.ti.com (8.13.8/8.13.8) with ESMTP id n1N8G6DB021639
	for <linux-mtd@lists.infradead.org>;
	Mon, 23 Feb 2009 02:16:08 -0600 (CST)
Message-ID: <58688.192.168.10.89.1235376968.squirrel@dbdmail.itg.ti.com>
Date: Mon, 23 Feb 2009 13:46:08 +0530 (IST)
Subject: [PATCH] [MTD] [NAND] nand_ecc.c: Bug fix in nand ecc
From: "vimal singh" <vimalsingh@ti.com>
To: linux-mtd@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain;charset=iso-8859-1
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

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
