Received: from szxga03-in.huawei.com ([119.145.14.66])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZMuVa-0000oq-Fr
 for linux-mtd@lists.infradead.org; Wed, 05 Aug 2015 08:57:13 +0000
From: Sheng Yong <shengyong1@huawei.com>
To: <computersforpeace@gmail.com>
CC: <dwmw2@infradead.org>, <richard@nod.at>, <linux-mtd@lists.infradead.org>
Subject: [RFC PATCH 3/5] MTD: nandsim: fix page address size
Date: Wed, 5 Aug 2015 08:55:52 +0000
Message-ID: <1438764954-36976-4-git-send-email-shengyong1@huawei.com>
In-Reply-To: <1438764954-36976-1-git-send-email-shengyong1@huawei.com>
References: <1438764954-36976-1-git-send-email-shengyong1@huawei.com>
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

The page address size should be calculated according to chip size, but not
total size of NAND flash. So we add a new chipsz in nandsim geometry to
save the chip size, and use it to get page address size.

Signed-off-by: Sheng Yong <shengyong1@huawei.com>
---
 drivers/mtd/nand/nandsim.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/nand/nandsim.c b/drivers/mtd/nand/nandsim.c
index 5938be4..45100b37 100644
--- a/drivers/mtd/nand/nandsim.c
+++ b/drivers/mtd/nand/nandsim.c
@@ -359,6 +359,7 @@ struct nandsim {
 	/* NAND flash "geometry" */
 	struct {
 		uint64_t totsz;     /* total flash size, bytes */
+		uint32_t chipsz;    /* each chip size, bytes */
 		uint32_t secsz;     /* flash sector (erase block) size, bytes */
 		uint pgsz;          /* NAND flash page size, bytes */
 		uint oobsz;         /* page OOB area size, bytes */
@@ -700,6 +701,7 @@ static int init_nandsim(struct mtd_info *mtd)
 	/* Initialize the NAND flash parameters */
 	ns->busw = chip->options & NAND_BUSWIDTH_16 ? 16 : 8;
 	ns->geom.totsz    = mtd->size;
+	ns->geom.chipsz   = chip->chipsize;
 	ns->geom.pgsz     = mtd->writesize;
 	ns->geom.oobsz    = mtd->oobsize;
 	ns->geom.secsz    = mtd->erasesize;
@@ -727,7 +729,7 @@ static int init_nandsim(struct mtd_info *mtd)
 	}
 
 	if (ns->options & OPT_SMALLPAGE) {
-		if (ns->geom.totsz <= (32 << 20)) {
+		if (ns->geom.chipsz <= (32 << 20)) {
 			ns->geom.pgaddrbytes  = 3;
 			ns->geom.secaddrbytes = 2;
 		} else {
@@ -735,7 +737,7 @@ static int init_nandsim(struct mtd_info *mtd)
 			ns->geom.secaddrbytes = 3;
 		}
 	} else {
-		if (ns->geom.totsz <= (128 << 20)) {
+		if (ns->geom.chipsz <= (128 << 20)) {
 			ns->geom.pgaddrbytes  = 4;
 			ns->geom.secaddrbytes = 2;
 		} else {
-- 
1.8.3.4
