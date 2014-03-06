Received: from ns.omicron.at ([212.183.10.25])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WLWiU-0004Y7-NA
 for linux-mtd@lists.infradead.org; Thu, 06 Mar 2014 11:44:00 +0000
From: Christian Riesch <christian.riesch@omicron.at>
To: <linux-mtd@lists.infradead.org>
Subject: [PATCH v3] mtd: Fix the behavior of OTP write if there is not enough
 room for data
Date: Thu, 6 Mar 2014 12:42:37 +0100
MIME-Version: 1.0
Content-Type: text/plain
Message-ID: <4cb7a3dd-9eac-41c5-8498-f2695f01576c@mary.at.omicron.at>
Cc: Brian Norris <computersforpeace@gmail.com>,
 Christian Riesch <christian.riesch@omicron.at>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

If a write to one time programmable memory (OTP) hits the end of this
memory area, no more data can be written. The count variable in
mtdchar_write() in drivers/mtd/mtdchar.c is not decreased anymore.
We are trapped in the loop forever, mtdchar_write() will never return
in this case.

The desired behavior of a write in such a case is described in [1]:
- Try to write as much data as possible, truncate the write to fit into
  the available memory and return the number of bytes that actually
  have been written.
- If no data could be written at all, return -ENOSPC.

This patch fixes the behavior of OTP write if there is not enough space
for all data:

1) mtd_write_user_prot_reg() in drivers/mtd/mtdcore.c is modified to
   return -ENOSPC if no data could be written at all.
2) mtdchar_write() is modified to handle -ENOSPC correctly. Exit if a
   write returned -ENOSPC and yield the correct return value, either
   then number of bytes that could be written, or -ENOSPC, if no data
   could be written at all.

Furthermore the patch harmonizes the behavior of the OTP memory write
in drivers/mtd/devices/mtd_dataflash.c with the other implementations
and the requirements from [1]. Instead of returning -EINVAL if the data
does not fit into the OTP memory, we try to write as much data as
possible/truncate the write.

[1] http://pubs.opengroup.org/onlinepubs/9699919799/functions/write.html

Signed-off-by: Christian Riesch <christian.riesch@omicron.at>
Cc: Brian Norris <computersforpeace@gmail.com>
---

Changes for v3:
- Moved logic for returning -ENOSPC from cfi_intelext_write_user_prot_reg,
  dataflash_write_user_otp, onenand_write_user_prot_reg to a common
  implementation in mtd_write_user_prot_reg, as requested by Brian Norris.
- Simplified the code in mtdchar_write as suggested by Brian.
- Added more comments, commit message.

 drivers/mtd/devices/mtd_dataflash.c |   16 ++++++++++------
 drivers/mtd/mtdchar.c               |    9 +++++++++
 drivers/mtd/mtdcore.c               |   12 +++++++++++-
 3 files changed, 30 insertions(+), 7 deletions(-)

diff --git a/drivers/mtd/devices/mtd_dataflash.c b/drivers/mtd/devices/mtd_dataflash.c
index c89f1c5..10b7608 100644
--- a/drivers/mtd/devices/mtd_dataflash.c
+++ b/drivers/mtd/devices/mtd_dataflash.c
@@ -543,14 +543,18 @@ static int dataflash_write_user_otp(struct mtd_info *mtd,
 	struct dataflash	*priv = mtd->priv;
 	int			status;
 
-	if (len > 64)
-		return -EINVAL;
+	if (from >= 64) {
+		/*
+		 * Attempting to write beyond the end of OTP memory,
+		 * no data can be written.
+		 */
+		*retlen = 0;
+		return 0;
+	}
 
-	/* Strictly speaking, we *could* truncate the write ... but
-	 * let's not do that for the only write that's ever possible.
-	 */
+	/* Truncate the write to fit into OTP memory. */
 	if ((from + len) > 64)
-		return -EINVAL;
+		len = 64 - from;
 
 	/* OUT: OP_WRITE_SECURITY, 3 zeroes, 64 data-or-zero bytes
 	 * IN:  ignore all
diff --git a/drivers/mtd/mtdchar.c b/drivers/mtd/mtdchar.c
index 250798c..7d4e7b9 100644
--- a/drivers/mtd/mtdchar.c
+++ b/drivers/mtd/mtdchar.c
@@ -324,6 +324,15 @@ static ssize_t mtdchar_write(struct file *file, const char __user *buf, size_t c
 		default:
 			ret = mtd_write(mtd, *ppos, len, &retlen, kbuf);
 		}
+
+		/*
+		 * Return -ENOSPC only if no data could be written at all.
+		 * Otherwise just return the number of bytes that actually
+		 * have been written.
+		 */
+		if ((ret == -ENOSPC) && (total_retlen))
+			break;
+
 		if (!ret) {
 			*ppos += retlen;
 			total_retlen += retlen;
diff --git a/drivers/mtd/mtdcore.c b/drivers/mtd/mtdcore.c
index 0a7d77e..d201fee 100644
--- a/drivers/mtd/mtdcore.c
+++ b/drivers/mtd/mtdcore.c
@@ -932,12 +932,22 @@ EXPORT_SYMBOL_GPL(mtd_read_user_prot_reg);
 int mtd_write_user_prot_reg(struct mtd_info *mtd, loff_t to, size_t len,
 			    size_t *retlen, u_char *buf)
 {
+	int ret;
+
 	*retlen = 0;
 	if (!mtd->_write_user_prot_reg)
 		return -EOPNOTSUPP;
 	if (!len)
 		return 0;
-	return mtd->_write_user_prot_reg(mtd, to, len, retlen, buf);
+	ret = mtd->_write_user_prot_reg(mtd, to, len, retlen, buf);
+	if (ret)
+		return ret;
+
+	/*
+	 * If no data could be written at all, we are out of memory and
+	 * must return -ENOSPC.
+	 */
+	return (*retlen) ? 0 : -ENOSPC;
 }
 EXPORT_SYMBOL_GPL(mtd_write_user_prot_reg);
 
-- 
1.7.9.5
