Received: from mga01.intel.com ([192.55.52.88])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1Rhgqn-0003Qp-8Z
 for linux-mtd@lists.infradead.org; Mon, 02 Jan 2012 12:18:50 +0000
From: Artem Bityutskiy <dedekind1@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 06/17] mtd: do not use mtd->read_oob directly
Date: Mon,  2 Jan 2012 14:20:36 +0200
Message-Id: <1325506847-23470-7-git-send-email-dedekind1@gmail.com>
In-Reply-To: <1325506847-23470-1-git-send-email-dedekind1@gmail.com>
References: <1325506847-23470-1-git-send-email-dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>

Instead of checking whether 'mtd->read_oob' is defined, just call
'mtd_read_oob()' and handle the '-EOPNOTSUPP' error which will be returned
if the function is undefined.

Additionally, make 'mtd_write_oob()' return '-EOPNOTSUPP' if the function
is undefined.

Signed-off-by: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
---
 drivers/mtd/mtdchar.c   |    9 ++-------
 include/linux/mtd/mtd.h |    4 ++++
 2 files changed, 6 insertions(+), 7 deletions(-)

diff --git a/drivers/mtd/mtdchar.c b/drivers/mtd/mtdchar.c
index 55f0961..287ff0d 100644
--- a/drivers/mtd/mtdchar.c
+++ b/drivers/mtd/mtdchar.c
@@ -452,13 +452,8 @@ static int mtdchar_readoob(struct file *file, struct mtd_info *mtd,
 	if (length > 4096)
 		return -EINVAL;
 
-	if (!mtd->read_oob)
-		ret = -EOPNOTSUPP;
-	else
-		ret = access_ok(VERIFY_WRITE, ptr,
-				length) ? 0 : -EFAULT;
-	if (ret)
-		return ret;
+	if (!access_ok(VERIFY_WRITE, ptr, length))
+		return -EFAULT;
 
 	ops.ooblen = length;
 	ops.ooboffs = start & (mtd->writesize - 1);
diff --git a/include/linux/mtd/mtd.h b/include/linux/mtd/mtd.h
index b729640..721a63f 100644
--- a/include/linux/mtd/mtd.h
+++ b/include/linux/mtd/mtd.h
@@ -320,6 +320,8 @@ static inline int mtd_read_oob(struct mtd_info *mtd, loff_t from,
 			       struct mtd_oob_ops *ops)
 {
 	ops->retlen = ops->oobretlen = 0;
+	if (!mtd->read_oob)
+		return -EOPNOTSUPP;
 	return mtd->read_oob(mtd, from, ops);
 }
 
@@ -327,6 +329,8 @@ static inline int mtd_write_oob(struct mtd_info *mtd, loff_t to,
 				struct mtd_oob_ops *ops)
 {
 	ops->retlen = ops->oobretlen = 0;
+	if (!mtd->write_oob)
+		return -EOPNOTSUPP;
 	return mtd->write_oob(mtd, to, ops);
 }
 
-- 
1.7.7.3
