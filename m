Received: from mga01.intel.com ([192.55.52.88])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1Rhgqh-0003QH-JP
 for linux-mtd@lists.infradead.org; Mon, 02 Jan 2012 12:18:44 +0000
From: Artem Bityutskiy <dedekind1@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 01/17] mtd: introduce mtd_has_oob helper
Date: Mon,  2 Jan 2012 14:20:31 +0200
Message-Id: <1325506847-23470-2-git-send-email-dedekind1@gmail.com>
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

We are working in the direction of making sure that MTD clients to not
use 'mtd->func' pointers directly. In some places we want to know if
OOB operations are supported by an MTD device. Introduce 'mtd_has_oob()'
helper for these purposes.

Signed-off-by: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
---
 drivers/mtd/mtdchar.c   |    2 +-
 drivers/mtd/sm_ftl.c    |    4 ++--
 include/linux/mtd/mtd.h |    5 +++++
 3 files changed, 8 insertions(+), 3 deletions(-)

diff --git a/drivers/mtd/mtdchar.c b/drivers/mtd/mtdchar.c
index 83b0c82..c501eec 100644
--- a/drivers/mtd/mtdchar.c
+++ b/drivers/mtd/mtdchar.c
@@ -1004,7 +1004,7 @@ static int mtdchar_ioctl(struct file *file, u_int cmd, u_long arg)
 			break;
 
 		case MTD_FILE_MODE_RAW:
-			if (!mtd->read_oob || !mtd->write_oob)
+			if (!mtd_has_oob(mtd))
 				return -EOPNOTSUPP;
 			mfi->mode = arg;
 
diff --git a/drivers/mtd/sm_ftl.c b/drivers/mtd/sm_ftl.c
index 4ec2af7..072ed59 100644
--- a/drivers/mtd/sm_ftl.c
+++ b/drivers/mtd/sm_ftl.c
@@ -645,8 +645,8 @@ int sm_get_media_info(struct sm_ftl *ftl, struct mtd_info *mtd)
 	if (!ftl->smallpagenand && mtd->oobsize < SM_OOB_SIZE)
 		return -ENODEV;
 
-	/* We use these functions for IO */
-	if (!mtd->read_oob || !mtd->write_oob)
+	/* We use OOB */
+	if (!mtd_has_oob(mtd))
 		return -ENODEV;
 
 	/* Find geometry information */
diff --git a/include/linux/mtd/mtd.h b/include/linux/mtd/mtd.h
index f0dd5a30..4787015 100644
--- a/include/linux/mtd/mtd.h
+++ b/include/linux/mtd/mtd.h
@@ -454,6 +454,11 @@ static inline uint32_t mtd_mod_by_ws(uint64_t sz, struct mtd_info *mtd)
 	return do_div(sz, mtd->writesize);
 }
 
+static inline int mtd_has_oob(const struct mtd_info *mtd)
+{
+	return mtd->read_oob && mtd->write_oob;
+}
+
 	/* Kernel-side ioctl definitions */
 
 struct mtd_partition;
-- 
1.7.7.3
