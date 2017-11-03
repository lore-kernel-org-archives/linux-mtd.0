Received: from gateway30.websitewelcome.com ([192.185.147.85])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1eAidj-00014s-Bk
 for linux-mtd@lists.infradead.org; Fri, 03 Nov 2017 20:32:33 +0000
Received: from cm14.websitewelcome.com (cm14.websitewelcome.com [100.42.49.7])
 by gateway30.websitewelcome.com (Postfix) with ESMTP id 16B4A562B
 for <linux-mtd@lists.infradead.org>; Fri,  3 Nov 2017 15:31:50 -0500 (CDT)
Date: Fri, 3 Nov 2017 15:31:47 -0500
From: "Gustavo A. R. Silva" <garsilva@embeddedor.com>
To: Han Xu <han.xu@nxp.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Richard Weinberger <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Marek Vasut <marek.vasut@gmail.com>,
 Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 "Gustavo A. R. Silva" <garsilva@embeddedor.com>
Subject: [PATCH] mtd: nand: gpmi: replace _manual_ swap with swap macro
Message-ID: <20171103203147.GA28309@embeddedor.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Make use of the swap macro and remove unnecessary variables swap.
This makes the code easier to read and maintain.

This code was detected with the help of Coccinelle.

Signed-off-by: Gustavo A. R. Silva <garsilva@embeddedor.com>
---
 drivers/mtd/nand/gpmi-nand/gpmi-nand.c | 16 ++++------------
 1 file changed, 4 insertions(+), 12 deletions(-)

diff --git a/drivers/mtd/nand/gpmi-nand/gpmi-nand.c b/drivers/mtd/nand/gpmi-nand/gpmi-nand.c
index 50f8d4a..9e365d4 100644
--- a/drivers/mtd/nand/gpmi-nand/gpmi-nand.c
+++ b/drivers/mtd/nand/gpmi-nand/gpmi-nand.c
@@ -1487,12 +1487,8 @@ static int gpmi_ecc_read_page_raw(struct mtd_info *mtd,
 	 * See the layout description for a detailed explanation on why this
 	 * is needed.
 	 */
-	if (this->swap_block_mark) {
-		u8 swap = tmp_buf[0];
-
-		tmp_buf[0] = tmp_buf[mtd->writesize];
-		tmp_buf[mtd->writesize] = swap;
-	}
+	if (this->swap_block_mark)
+		swap(tmp_buf[0], tmp_buf[mtd->writesize]);
 
 	/*
 	 * Copy the metadata section into the oob buffer (this section is
@@ -1615,12 +1611,8 @@ static int gpmi_ecc_write_page_raw(struct mtd_info *mtd,
 	 * See the layout description for a detailed explanation on why this
 	 * is needed.
 	 */
-	if (this->swap_block_mark) {
-		u8 swap = tmp_buf[0];
-
-		tmp_buf[0] = tmp_buf[mtd->writesize];
-		tmp_buf[mtd->writesize] = swap;
-	}
+	if (this->swap_block_mark)
+		swap(tmp_buf[0], tmp_buf[mtd->writesize]);
 
 	chip->write_buf(mtd, tmp_buf, mtd->writesize + mtd->oobsize);
 
-- 
2.7.4
