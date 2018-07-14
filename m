Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1feJjE-0003SU-FH
 for linux-mtd@lists.infradead.org; Sat, 14 Jul 2018 12:32:50 +0000
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Boris Brezillon <boris.brezillon@bootlin.com>,
 Richard Weinberger <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Marek Vasut <marek.vasut@gmail.com>
Cc: linux-mtd@lists.infradead.org,
	Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [PATCH] mtd: remove stale comment in mtd_oob_ops structure
Date: Sat, 14 Jul 2018 14:32:34 +0200
Message-Id: <20180714123234.16127-1-miquel.raynal@bootlin.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

A comment in the kernel doc of the mtd_oob_ops structure tells that it
is not possible to write more than one page with OOB. This was
probably true at some time in the past but today it is entirely wrong.

As one can see for instance in the nand_do_write_ops() helper available
in the NAND core, this implementation called by mtd->_write_oob()
simply loops over the pages until everything has been written.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 include/linux/mtd/mtd.h | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/include/linux/mtd/mtd.h b/include/linux/mtd/mtd.h
index a86c4fa93115..59578aab277a 100644
--- a/include/linux/mtd/mtd.h
+++ b/include/linux/mtd/mtd.h
@@ -66,10 +66,6 @@ struct mtd_erase_region_info {
  *		mode = MTD_OPS_PLACE_OOB or MTD_OPS_RAW)
  * @datbuf:	data buffer - if NULL only oob data are read/written
  * @oobbuf:	oob data buffer
- *
- * Note, it is allowed to read more than one OOB area at one go, but not write.
- * The interface assumes that the OOB write requests program only one page's
- * OOB area.
  */
 struct mtd_oob_ops {
 	unsigned int	mode;
-- 
2.14.1
