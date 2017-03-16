Received: from mailout.micron.com ([137.201.242.129])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1coP1S-0008SE-Px
 for linux-mtd@lists.infradead.org; Thu, 16 Mar 2017 06:36:33 +0000
From: Peter Pan <peterpandong@micron.com>
To: <boris.brezillon@free-electrons.com>, <richard@nod.at>,
 <computersforpeace@gmail.com>, <arnaud.mouiche@gmail.com>,
 <thomas.petazzoni@free-electrons.com>, <linux-mtd@lists.infradead.org>
CC: <peterpandong@micron.com>, <peterpansjtu@gmail.com>,
 <linshunquan1@hisilicon.com>
Subject: [PATCH v3 2/8] mtd: nand: add oob iterator in nand_for_each_page
Date: Thu, 16 Mar 2017 14:47:31 +0800
Message-ID: <1489646857-10112-3-git-send-email-peterpandong@micron.com>
In-Reply-To: <1489646857-10112-1-git-send-email-peterpandong@micron.com>
References: <1489646857-10112-1-git-send-email-peterpandong@micron.com>
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
 include/linux/mtd/nand.h | 28 +++++++++++++++++++++++++---
 1 file changed, 25 insertions(+), 3 deletions(-)

diff --git a/include/linux/mtd/nand.h b/include/linux/mtd/nand.h
index 4a812e6..822547e 100644
--- a/include/linux/mtd/nand.h
+++ b/include/linux/mtd/nand.h
@@ -87,6 +87,9 @@ struct nand_page_iter {
 	loff_t offs;
 	int page;
 	int pageoffs;
+	int ooboffs;
+	int oobsize;
+	size_t oobleft;
 };
 
 /**
@@ -194,6 +197,7 @@ static inline int nand_per_page_oobsize(struct nand_device *nand)
  * @iter: page iterator
  */
 static inline void nand_page_iter_init(struct nand_device *nand, loff_t offs,
+				       u32 ooboffs, size_t ooblen, u32 oobsize,
 				       struct nand_page_iter *iter)
 {
 	u64 page = offs;
@@ -201,6 +205,9 @@ static inline void nand_page_iter_init(struct nand_device *nand, loff_t offs,
 	iter->pageoffs = do_div(page, nand->memorg.pagesize);
 	iter->page = page;
 	iter->offs = offs;
+	iter->ooboffs = ooboffs;
+	iter->oobsize = oobsize;
+	iter->oobleft = ooblen;
 }
 
 /**
@@ -214,11 +221,26 @@ static inline void nand_page_iter_next(struct nand_device *nand,
 	iter->page++;
 	iter->offs += nand_page_size(nand) - iter->pageoffs;
 	iter->pageoffs = 0;
+	if (iter->oobleft)
+		iter->oobleft -= min_t(int, iter->oobsize - iter->ooboffs,
+				       iter->oobleft);
+}
+
+static inline bool nand_page_iter_end(struct nand_device *nand, loff_t offs,
+				      u32 len, struct nand_page_iter *iter)
+{
+	if (iter->offs < offs + len)
+		return false;
+	if (iter->oobleft)
+		return false;
+	return true;
 }
 
-#define nand_for_each_page(nand, start, len, iter)		\
-	for (nand_page_iter_init(nand, start, iter);		\
-	     (iter)->offs < (start) + (len);			\
+#define nand_for_each_page(nand, start, len, ooboffs, ooblen,	\
+			   oobsize, iter)	\
+	for (nand_page_iter_init(nand, start, ooboffs,		\
+				 ooblen, oobsize, iter);	\
+	     !nand_page_iter_end(nand, start, len, iter);		\
 	     nand_page_iter_next(nand, iter))
 
 /**
-- 
1.9.1
