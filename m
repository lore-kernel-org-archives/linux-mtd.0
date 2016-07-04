Received: from mail.sigma-star.at ([95.130.255.111])
 by bombadil.infradead.org with esmtp (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bKC0w-0003h7-Ub
 for linux-mtd@lists.infradead.org; Mon, 04 Jul 2016 22:06:52 +0000
From: Richard Weinberger <richard@nod.at>
To: linux-mtd@lists.infradead.org
Cc: boris.brezillon@free-electrons.com, computersforpeace@gmail.com,
 dwmw2@infradead.org, Richard Weinberger <richard@nod.at>
Subject: [PATCH 1/5] mtdpart: Propagate _get/put_device()
Date: Tue,  5 Jul 2016 00:06:19 +0200
Message-Id: <1467669983-12105-2-git-send-email-richard@nod.at>
In-Reply-To: <1467669983-12105-1-git-send-email-richard@nod.at>
References: <1467669983-12105-1-git-send-email-richard@nod.at>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

If the master device has callbacks for _get/put_device()
and this MTD has slaves a get_mtd_device() call on paritions
will never issue the registered callbacks.
Fix this by propagating _get/put_device() down.

Reviewed-by: Boris Brezillon <boris.brezillon@free-electrons.com>
Signed-off-by: Richard Weinberger <richard@nod.at>
---
 drivers/mtd/mtdpart.c | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/drivers/mtd/mtdpart.c b/drivers/mtd/mtdpart.c
index 1f13e32..ec852fa 100644
--- a/drivers/mtd/mtdpart.c
+++ b/drivers/mtd/mtdpart.c
@@ -317,6 +317,18 @@ static int part_block_markbad(struct mtd_info *mtd, loff_t ofs)
 	return res;
 }
 
+static int part_get_device(struct mtd_info *mtd)
+{
+	struct mtd_part *part = mtd_to_part(mtd);
+	return part->master->_get_device(part->master);
+}
+
+static void part_put_device(struct mtd_info *mtd)
+{
+	struct mtd_part *part = mtd_to_part(mtd);
+	part->master->_put_device(part->master);
+}
+
 static int part_ooblayout_ecc(struct mtd_info *mtd, int section,
 			      struct mtd_oob_region *oobregion)
 {
@@ -463,6 +475,12 @@ static struct mtd_part *allocate_partition(struct mtd_info *master,
 		slave->mtd._block_isbad = part_block_isbad;
 	if (master->_block_markbad)
 		slave->mtd._block_markbad = part_block_markbad;
+
+	if (master->_get_device)
+		slave->mtd._get_device = part_get_device;
+	if (master->_put_device)
+		slave->mtd._put_device = part_put_device;
+
 	slave->mtd._erase = part_erase;
 	slave->master = master;
 	slave->offset = part->offset;
-- 
2.7.3
