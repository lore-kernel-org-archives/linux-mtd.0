Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.89 #1 (Red Hat Linux))
 id 1edk0f-0004H3-NU
 for linux-mtd@lists.infradead.org; Mon, 22 Jan 2018 21:52:11 +0000
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Boris Brezillon <boris.brezillon@free-electrons.com>,
 Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org
Cc: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Marek Vasut <marek.vasut@gmail.com>,
 Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>, Han Xu <han.xu@nxp.com>,
 Miquel Raynal <miquel.raynal@free-electrons.com>
Subject: [PATCH] mtd: nand: gpmi: Add missing nand_read_page_op() in
 gpmi_ecc_read_subpage()
Date: Mon, 22 Jan 2018 22:51:48 +0100
Message-Id: <20180122215148.4502-1-boris.brezillon@free-electrons.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

When a subpage read request accesses the ECC block containing the BBM,
a full page read is required. Commit 25f815f66a14 ("mtd: nand: force
drivers to explicitly send READ/PROG commands") changed the default
behavior by forcing drivers to manually issue the READ0 command.
Unfortunately, the full page read case in gpmi_ecc_read_subpage() has
been omitted and the nand_read_page_op() call has been moved too far
in the function leading to a situation where gpmi_ecc_read_page() is
called without a READ0 command.

Fix that by adding a call to nand_read_page_op() just before calling
gpmi_ecc_read_page() in the "access ECC block containing the BBM" case.

Fixes: 25f815f66a14 ("mtd: nand: force drivers to explicitly send READ/PROG commands")
Signed-off-by: Boris Brezillon <boris.brezillon@free-electrons.com>
---
 drivers/mtd/nand/gpmi-nand/gpmi-nand.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/mtd/nand/gpmi-nand/gpmi-nand.c b/drivers/mtd/nand/gpmi-nand/gpmi-nand.c
index b51db8c85405..3198f5f79a82 100644
--- a/drivers/mtd/nand/gpmi-nand/gpmi-nand.c
+++ b/drivers/mtd/nand/gpmi-nand/gpmi-nand.c
@@ -1215,6 +1215,7 @@ static int gpmi_ecc_read_subpage(struct mtd_info *mtd, struct nand_chip *chip,
 			dev_dbg(this->dev,
 				"page:%d, first:%d, last:%d, marker at:%d\n",
 				page, first, last, marker_pos);
+			nand_read_page_op(chip, page, 0, NULL, 0);
 			return gpmi_ecc_read_page(mtd, chip, buf, 0, page);
 		}
 	}
-- 
2.11.0
