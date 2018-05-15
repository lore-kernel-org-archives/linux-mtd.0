Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fIbZd-0008O0-0I
 for linux-mtd@lists.infradead.org; Tue, 15 May 2018 15:09:25 +0000
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <boris.brezillon@bootlin.com>,
 Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>,
 linux-mtd@lists.infradead.org, Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Peter Pan <peterpansjtu@gmail.com>,
 Frieder Schrempf <frieder.schrempf@exceet.de>, Vignesh R <vigneshr@ti.com>,
 Xiangsheng Hou <xiangsheng.hou@mediatek.com>
Subject: [PATCH v7 1/5] mtd: nand: Pass mode information to nand_page_io_req
Date: Tue, 15 May 2018 17:08:21 +0200
Message-Id: <20180515150825.19835-2-boris.brezillon@bootlin.com>
In-Reply-To: <20180515150825.19835-1-boris.brezillon@bootlin.com>
References: <20180515150825.19835-1-boris.brezillon@bootlin.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The NAND sub-layers are likely to need the MTD_OPS_XXX mode information
in order to decide if they should enable/disable ECC or how they should
place the OOB bytes in the provided OOB buffer.

Add a field to nand_page_io_req to pass this information.

Signed-off-by: Boris Brezillon <boris.brezillon@bootlin.com>
---
 include/linux/mtd/nand.h | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/include/linux/mtd/nand.h b/include/linux/mtd/nand.h
index 792ea5c26329..abe975c87b90 100644
--- a/include/linux/mtd/nand.h
+++ b/include/linux/mtd/nand.h
@@ -86,6 +86,7 @@ struct nand_pos {
  * @ooboffs: the OOB offset within the page
  * @ooblen: the number of OOB bytes to read from/write to this page
  * @oobbuf: buffer to store OOB data in or get OOB data from
+ * @mode: one of the %MTD_OPS_XXX mode
  *
  * This object is used to pass per-page I/O requests to NAND sub-layers. This
  * way all useful information are already formatted in a useful way and
@@ -106,6 +107,7 @@ struct nand_page_io_req {
 		const void *out;
 		void *in;
 	} oobbuf;
+	int mode;
 };
 
 /**
@@ -599,6 +601,7 @@ static inline void nanddev_io_iter_init(struct nand_device *nand,
 {
 	struct mtd_info *mtd = nanddev_to_mtd(nand);
 
+	iter->req.mode = req->mode;
 	iter->req.dataoffs = nanddev_offs_to_pos(nand, offs, &iter->req.pos);
 	iter->req.ooboffs = req->ooboffs;
 	iter->oobbytes_per_page = mtd_oobavail(mtd, req);
-- 
2.14.1
