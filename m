Received: from mga01.intel.com ([192.55.52.88])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1Rhgqq-0003Sw-Pn
 for linux-mtd@lists.infradead.org; Mon, 02 Jan 2012 12:18:54 +0000
From: Artem Bityutskiy <dedekind1@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 09/17] mtd: mtd->write_user_prot_reg directly
Date: Mon,  2 Jan 2012 14:20:39 +0200
Message-Id: <1325506847-23470-10-git-send-email-dedekind1@gmail.com>
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

Instead, just call 'mtd_write_user_prot_reg()' and check the '-EOPNOTSUPP' return
code.

Signed-off-by: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
---
 drivers/mtd/mtdchar.c   |    4 ----
 include/linux/mtd/mtd.h |    2 ++
 2 files changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/mtdchar.c b/drivers/mtd/mtdchar.c
index 4e8e5fb..25bbbc3 100644
--- a/drivers/mtd/mtdchar.c
+++ b/drivers/mtd/mtdchar.c
@@ -310,10 +310,6 @@ static ssize_t mtdchar_write(struct file *file, const char __user *buf, size_t c
 			ret = -EROFS;
 			break;
 		case MTD_FILE_MODE_OTP_USER:
-			if (!mtd->write_user_prot_reg) {
-				ret = -EOPNOTSUPP;
-				break;
-			}
 			ret = mtd_write_user_prot_reg(mtd, *ppos, len,
 						      &retlen, kbuf);
 			break;
diff --git a/include/linux/mtd/mtd.h b/include/linux/mtd/mtd.h
index e488cf9..7cd56d2 100644
--- a/include/linux/mtd/mtd.h
+++ b/include/linux/mtd/mtd.h
@@ -381,6 +381,8 @@ static inline int mtd_write_user_prot_reg(struct mtd_info *mtd, loff_t to,
 					  u_char *buf)
 {
 	*retlen = 0;
+	if (!mtd->write_user_prot_reg)
+		return -EOPNOTSUPP;
 	return mtd->write_user_prot_reg(mtd, to, len, retlen, buf);
 }
 
-- 
1.7.7.3
