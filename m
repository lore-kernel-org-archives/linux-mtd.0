Received: from mga01.intel.com ([192.55.52.88])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1Rhgqr-0003TG-Pj
 for linux-mtd@lists.infradead.org; Mon, 02 Jan 2012 12:18:54 +0000
From: Artem Bityutskiy <dedekind1@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 10/17] mtd: do not use mtd->lock_user_prot_reg directly
Date: Mon,  2 Jan 2012 14:20:40 +0200
Message-Id: <1325506847-23470-11-git-send-email-dedekind1@gmail.com>
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

Instead, check the -EOPNOTSUPP return code of 'mtd_lock_user_prot_reg()'.

Signed-off-by: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
---
 drivers/mtd/mtdchar.c   |    2 --
 include/linux/mtd/mtd.h |    2 ++
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/mtdchar.c b/drivers/mtd/mtdchar.c
index 25bbbc3..2020a16 100644
--- a/drivers/mtd/mtdchar.c
+++ b/drivers/mtd/mtdchar.c
@@ -949,8 +949,6 @@ static int mtdchar_ioctl(struct file *file, u_int cmd, u_long arg)
 			return -EINVAL;
 		if (copy_from_user(&oinfo, argp, sizeof(oinfo)))
 			return -EFAULT;
-		if (!mtd->lock_user_prot_reg)
-			return -EOPNOTSUPP;
 		ret = mtd_lock_user_prot_reg(mtd, oinfo.start, oinfo.length);
 		break;
 	}
diff --git a/include/linux/mtd/mtd.h b/include/linux/mtd/mtd.h
index 7cd56d2..a994129 100644
--- a/include/linux/mtd/mtd.h
+++ b/include/linux/mtd/mtd.h
@@ -389,6 +389,8 @@ static inline int mtd_write_user_prot_reg(struct mtd_info *mtd, loff_t to,
 static inline int mtd_lock_user_prot_reg(struct mtd_info *mtd, loff_t from,
 					 size_t len)
 {
+	if (!mtd->lock_user_prot_reg)
+		return -EOPNOTSUPP;
 	return mtd->lock_user_prot_reg(mtd, from, len);
 }
 
-- 
1.7.7.3
