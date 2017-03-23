Received: from mailout.micron.com ([137.201.242.129])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cqz6u-0000ux-Cw
 for linux-mtd@lists.infradead.org; Thu, 23 Mar 2017 09:32:53 +0000
From: Peter Pan <peterpandong@micron.com>
To: <boris.brezillon@free-electrons.com>, <richard@nod.at>,
 <computersforpeace@gmail.com>, <arnaud.mouiche@gmail.com>,
 <thomas.petazzoni@free-electrons.com>, <marex@denx.de>,
 <cyrille.pitchen@atmel.com>, <linux-mtd@lists.infradead.org>
CC: <peterpandong@micron.com>, <peterpansjtu@gmail.com>,
 <linshunquan1@hisilicon.com>
Subject: [PATCH v4 1/9] mtd: nand: add oob iterator in nand_for_each_page
Date: Thu, 23 Mar 2017 17:43:38 +0800
Message-ID: <1490262226-29092-2-git-send-email-peterpandong@micron.com>
In-Reply-To: <1490262226-29092-1-git-send-email-peterpandong@micron.com>
References: <1490262226-29092-1-git-send-email-peterpandong@micron.com>
MIME-Version: 1.0
Content-Type: text/plain
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Iterate nand pages by both page and oob operation.

Signed-off-by: Peter Pan <peterpandong@micron.com>
---
 include/linux/mtd/nand.h | 38 +++++++++++++++++++++++++++++++-------
 1 file changed, 31 insertions(+), 7 deletions(-)

diff --git a/include/linux/mtd/nand.h b/include/linux/mtd/nand.h
index c2197b4..54ded4c 100644
--- a/include/linux/mtd/nand.h
+++ b/include/linux/mtd/nand.h
@@ -84,9 +84,12 @@ struct nand_device {
  * @pageoffset: the offset within a page
  */
 struct nand_page_iter {
-	loff_t offs;
 	int page;
 	int pageoffs;
+	size_t dataleft;
+	int ooboffs;
+	int oobsize;
+	size_t oobleft;
 };
 
 /**
@@ -193,14 +196,19 @@ static inline int nand_per_page_oobsize(struct nand_device *nand)
  * @offs: absolute offset
  * @iter: page iterator
  */
-static inline void nand_page_iter_init(struct nand_device *nand, loff_t offs,
+static inline void nand_page_iter_init(struct nand_device *nand,
+				       loff_t offs, size_t len, u32 ooboffs,
+				       size_t ooblen, u32 oobsize,
 				       struct nand_page_iter *iter)
 {
 	u64 page = offs;
 
 	iter->pageoffs = do_div(page, nand->memorg.pagesize);
 	iter->page = page;
-	iter->offs = offs;
+	iter->dataleft = len;
+	iter->ooboffs = ooboffs;
+	iter->oobsize = oobsize;
+	iter->oobleft = ooblen;
 }
 
 /**
@@ -212,13 +220,29 @@ static inline void nand_page_iter_next(struct nand_device *nand,
 				       struct nand_page_iter *iter)
 {
 	iter->page++;
-	iter->offs += nand_page_size(nand) - iter->pageoffs;
 	iter->pageoffs = 0;
+	if (iter->dataleft)
+		iter->dataleft -= min_t (int,
+					 nand_page_size(nand) - iter->pageoffs,
+					 iter->dataleft);
+	if (iter->oobleft)
+		iter->oobleft -= min_t(int, iter->oobsize - iter->ooboffs,
+				       iter->oobleft);
+}
+
+static inline bool nand_page_iter_end(struct nand_device *nand,
+				      struct nand_page_iter *iter)
+{
+	if (iter->dataleft || iter->oobleft)
+		return false;
+	return true;
 }
 
-#define nand_for_each_page(nand, start, len, iter)		\
-	for (nand_page_iter_init(nand, start, iter);		\
-	     (iter)->offs < (start) + (len);			\
+#define nand_for_each_page(nand, start, len, ooboffs, ooblen,	\
+			   oobsize, iter)	\
+	for (nand_page_iter_init(nand, start, len, ooboffs,	\
+				 ooblen, oobsize, iter);	\
+	     !nand_page_iter_end(nand, iter);		\
 	     nand_page_iter_next(nand, iter))
 
 /**
-- 
1.9.1
