Received: from mms2.broadcom.com ([216.31.210.18])
	by canuck.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
	id 1QyZvn-0005G6-SE
	for linux-mtd@lists.infradead.org; Wed, 31 Aug 2011 01:49:33 +0000
From: "Brian Norris" <computersforpeace@gmail.com>
To: "Artem Bityutskiy" <dedekind1@gmail.com>
Subject: [PATCH 06/12] mtd: rename MTD_MODE_* to MTD_FILE_MODE_*
Date: Tue, 30 Aug 2011 18:45:41 -0700
Message-ID: <1314755147-17756-7-git-send-email-computersforpeace@gmail.com>
In-Reply-To: <1314755147-17756-1-git-send-email-computersforpeace@gmail.com>
References: <1314755147-17756-1-git-send-email-computersforpeace@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Cc: Ricard Wanderlof <ricard.wanderlof@axis.com>,
	Kevin Cernekee <cernekee@gmail.com>, b35362@freescale.com,
	linux-mtd@lists.infradead.org, Brian Norris <computersforpeace@gmail.com>,
	David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

These modes hold their state only for the life of their file descriptor,
and they overlap functionality with the MTD_OPS_* modes. Particularly,
MTD_MODE_RAW and MTD_OPS_RAW cover the same function: to provide raw
(i.e., without ECC) access to the flash. In fact, although it may not be
clear, MTD_MODE_RAW implied that operations should enable the
MTD_OPS_RAW mode.

Thus, we should be specific on what each mode means. This is a start,
where MTD_FILE_MODE_* actually represents a "file mode," not necessarily
a true global MTD mode.

Signed-off-by: Brian Norris <computersforpeace@gmail.com>
---
 drivers/mtd/mtdchar.c |   36 ++++++++++++++++++------------------
 include/mtd/mtd-abi.h |    8 ++++----
 2 files changed, 22 insertions(+), 22 deletions(-)

diff --git a/drivers/mtd/mtdchar.c b/drivers/mtd/mtdchar.c
index 9b76438..4004f2b 100644
--- a/drivers/mtd/mtdchar.c
+++ b/drivers/mtd/mtdchar.c
@@ -211,13 +211,13 @@ static ssize_t mtd_read(struct file *file, char __user *buf, size_t count,loff_t
 		len = min_t(size_t, count, size);
 
 		switch (mfi->mode) {
-		case MTD_MODE_OTP_FACTORY:
+		case MTD_FILE_MODE_OTP_FACTORY:
 			ret = mtd->read_fact_prot_reg(mtd, *ppos, len, &retlen, kbuf);
 			break;
-		case MTD_MODE_OTP_USER:
+		case MTD_FILE_MODE_OTP_USER:
 			ret = mtd->read_user_prot_reg(mtd, *ppos, len, &retlen, kbuf);
 			break;
-		case MTD_MODE_RAW:
+		case MTD_FILE_MODE_RAW:
 		{
 			struct mtd_oob_ops ops;
 
@@ -302,10 +302,10 @@ static ssize_t mtd_write(struct file *file, const char __user *buf, size_t count
 		}
 
 		switch (mfi->mode) {
-		case MTD_MODE_OTP_FACTORY:
+		case MTD_FILE_MODE_OTP_FACTORY:
 			ret = -EROFS;
 			break;
-		case MTD_MODE_OTP_USER:
+		case MTD_FILE_MODE_OTP_USER:
 			if (!mtd->write_user_prot_reg) {
 				ret = -EOPNOTSUPP;
 				break;
@@ -313,7 +313,7 @@ static ssize_t mtd_write(struct file *file, const char __user *buf, size_t count
 			ret = mtd->write_user_prot_reg(mtd, *ppos, len, &retlen, kbuf);
 			break;
 
-		case MTD_MODE_RAW:
+		case MTD_FILE_MODE_RAW:
 		{
 			struct mtd_oob_ops ops;
 
@@ -368,13 +368,13 @@ static int otp_select_filemode(struct mtd_file_info *mfi, int mode)
 		if (!mtd->read_fact_prot_reg)
 			ret = -EOPNOTSUPP;
 		else
-			mfi->mode = MTD_MODE_OTP_FACTORY;
+			mfi->mode = MTD_FILE_MODE_OTP_FACTORY;
 		break;
 	case MTD_OTP_USER:
 		if (!mtd->read_fact_prot_reg)
 			ret = -EOPNOTSUPP;
 		else
-			mfi->mode = MTD_MODE_OTP_USER;
+			mfi->mode = MTD_FILE_MODE_OTP_USER;
 		break;
 	default:
 		ret = -EINVAL;
@@ -413,7 +413,7 @@ static int mtd_do_writeoob(struct file *file, struct mtd_info *mtd,
 	ops.ooblen = length;
 	ops.ooboffs = start & (mtd->writesize - 1);
 	ops.datbuf = NULL;
-	ops.mode = (mfi->mode == MTD_MODE_RAW) ? MTD_OPS_RAW :
+	ops.mode = (mfi->mode == MTD_FILE_MODE_RAW) ? MTD_OPS_RAW :
 		MTD_OPS_PLACE_OOB;
 
 	if (ops.ooboffs && ops.ooblen > (mtd->oobsize - ops.ooboffs))
@@ -458,7 +458,7 @@ static int mtd_do_readoob(struct file *file, struct mtd_info *mtd,
 	ops.ooblen = length;
 	ops.ooboffs = start & (mtd->writesize - 1);
 	ops.datbuf = NULL;
-	ops.mode = (mfi->mode == MTD_MODE_RAW) ? MTD_OPS_RAW :
+	ops.mode = (mfi->mode == MTD_FILE_MODE_RAW) ? MTD_OPS_RAW :
 		MTD_OPS_PLACE_OOB;
 
 	if (ops.ooboffs && ops.ooblen > (mtd->oobsize - ops.ooboffs))
@@ -849,7 +849,7 @@ static int mtd_ioctl(struct file *file, u_int cmd, u_long arg)
 		if (copy_from_user(&mode, argp, sizeof(int)))
 			return -EFAULT;
 
-		mfi->mode = MTD_MODE_NORMAL;
+		mfi->mode = MTD_FILE_MODE_NORMAL;
 
 		ret = otp_select_filemode(mfi, mode);
 
@@ -865,11 +865,11 @@ static int mtd_ioctl(struct file *file, u_int cmd, u_long arg)
 			return -ENOMEM;
 		ret = -EOPNOTSUPP;
 		switch (mfi->mode) {
-		case MTD_MODE_OTP_FACTORY:
+		case MTD_FILE_MODE_OTP_FACTORY:
 			if (mtd->get_fact_prot_info)
 				ret = mtd->get_fact_prot_info(mtd, buf, 4096);
 			break;
-		case MTD_MODE_OTP_USER:
+		case MTD_FILE_MODE_OTP_USER:
 			if (mtd->get_user_prot_info)
 				ret = mtd->get_user_prot_info(mtd, buf, 4096);
 			break;
@@ -893,7 +893,7 @@ static int mtd_ioctl(struct file *file, u_int cmd, u_long arg)
 	{
 		struct otp_info oinfo;
 
-		if (mfi->mode != MTD_MODE_OTP_USER)
+		if (mfi->mode != MTD_FILE_MODE_OTP_USER)
 			return -EINVAL;
 		if (copy_from_user(&oinfo, argp, sizeof(oinfo)))
 			return -EFAULT;
@@ -937,17 +937,17 @@ static int mtd_ioctl(struct file *file, u_int cmd, u_long arg)
 		mfi->mode = 0;
 
 		switch(arg) {
-		case MTD_MODE_OTP_FACTORY:
-		case MTD_MODE_OTP_USER:
+		case MTD_FILE_MODE_OTP_FACTORY:
+		case MTD_FILE_MODE_OTP_USER:
 			ret = otp_select_filemode(mfi, arg);
 			break;
 
-		case MTD_MODE_RAW:
+		case MTD_FILE_MODE_RAW:
 			if (!mtd->read_oob || !mtd->write_oob)
 				return -EOPNOTSUPP;
 			mfi->mode = arg;
 
-		case MTD_MODE_NORMAL:
+		case MTD_FILE_MODE_NORMAL:
 			break;
 		default:
 			ret = -EINVAL;
diff --git a/include/mtd/mtd-abi.h b/include/mtd/mtd-abi.h
index d30990e..1885aa9 100644
--- a/include/mtd/mtd-abi.h
+++ b/include/mtd/mtd-abi.h
@@ -200,10 +200,10 @@ struct mtd_ecc_stats {
  * Read/write file modes for access to MTD
  */
 enum mtd_file_modes {
-	MTD_MODE_NORMAL = MTD_OTP_OFF,
-	MTD_MODE_OTP_FACTORY = MTD_OTP_FACTORY,
-	MTD_MODE_OTP_USER = MTD_OTP_USER,
-	MTD_MODE_RAW,
+	MTD_FILE_MODE_NORMAL = MTD_OTP_OFF,
+	MTD_FILE_MODE_OTP_FACTORY = MTD_OTP_FACTORY,
+	MTD_FILE_MODE_OTP_USER = MTD_OTP_USER,
+	MTD_FILE_MODE_RAW,
 };
 
 #endif /* __MTD_ABI_H__ */
-- 
1.7.5.4
