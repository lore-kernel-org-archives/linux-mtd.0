Received: from ns.omicron.at ([212.183.10.25])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VRgsc-0007WO-1S
 for linux-mtd@lists.infradead.org; Thu, 03 Oct 2013 11:15:39 +0000
From: Christian Riesch <christian.riesch@omicron.at>
To: <linux-mtd@lists.infradead.org>
Subject: [RESEND PATCH 2/2] mtd: Fix the behavior of otp write if there is not
 enough room for data
Date: Thu, 3 Oct 2013 13:14:36 +0200
In-Reply-To: <1380798876-3321-1-git-send-email-christian.riesch@omicron.at>
References: <1380798876-3321-1-git-send-email-christian.riesch@omicron.at>
MIME-Version: 1.0
Content-Type: text/plain
Message-ID: <10b23e42-0ff3-4f70-8966-15aba66d5576@mary.at.omicron.at>
Cc: Amul Kumar Saha <amul.saha@samsung.com>,
 Artem Bityutskiy <artem.bityutskiy@linux.intel.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Christian Riesch <christian.riesch@omicron.at>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

An OTP write shall write as much data as possible to the OTP memory
and return the number of bytes that have actually been written.
If no data could be written at all due to lack of OTP memory,
return -ENOSPC.

Signed-off-by: Christian Riesch <christian.riesch@omicron.at>
Cc: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
Cc: Kyungmin Park <kyungmin.park@samsung.com>
Cc: Amul Kumar Saha <amul.saha@samsung.com>
---
 drivers/mtd/chips/cfi_cmdset_0001.c |   13 +++++++++++--
 drivers/mtd/devices/mtd_dataflash.c |   13 +++++--------
 drivers/mtd/mtdchar.c               |    7 +++++++
 drivers/mtd/onenand/onenand_base.c  |   11 ++++++++++-
 4 files changed, 33 insertions(+), 11 deletions(-)

diff --git a/drivers/mtd/chips/cfi_cmdset_0001.c b/drivers/mtd/chips/cfi_cmdset_0001.c
index 2378e2f..6efc22d 100644
--- a/drivers/mtd/chips/cfi_cmdset_0001.c
+++ b/drivers/mtd/chips/cfi_cmdset_0001.c
@@ -2387,8 +2387,17 @@ static int cfi_intelext_write_user_prot_reg(struct mtd_info *mtd, loff_t from,
 					    size_t len, size_t *retlen,
 					     u_char *buf)
 {
-	return cfi_intelext_otp_walk(mtd, from, len, retlen,
-				     buf, do_otp_write, 1);
+	int ret;
+
+	ret = cfi_intelext_otp_walk(mtd, from, len, retlen,
+				    buf, do_otp_write, 1);
+
+	/* if no data could be written due to lack of OTP memory,
+	   return ENOSPC */
+	if (!ret && len && !(*retlen))
+		return -ENOSPC;
+
+	return ret;
 }
 
 static int cfi_intelext_lock_user_prot_reg(struct mtd_info *mtd,
diff --git a/drivers/mtd/devices/mtd_dataflash.c b/drivers/mtd/devices/mtd_dataflash.c
index 09c69ce..5236d85 100644
--- a/drivers/mtd/devices/mtd_dataflash.c
+++ b/drivers/mtd/devices/mtd_dataflash.c
@@ -545,14 +545,11 @@ static int dataflash_write_user_otp(struct mtd_info *mtd,
 	struct dataflash	*priv = mtd->priv;
 	int			status;
 
-	if (len > 64)
-		return -EINVAL;
-
-	/* Strictly speaking, we *could* truncate the write ... but
-	 * let's not do that for the only write that's ever possible.
-	 */
-	if ((from + len) > 64)
-		return -EINVAL;
+	if ((from + len) > 64) {
+		len = 64 - from;
+		if (len <= 0)
+			return -ENOSPC;
+	}
 
 	/* OUT: OP_WRITE_SECURITY, 3 zeroes, 64 data-or-zero bytes
 	 * IN:  ignore all
diff --git a/drivers/mtd/mtdchar.c b/drivers/mtd/mtdchar.c
index 0edb0ca..db99031 100644
--- a/drivers/mtd/mtdchar.c
+++ b/drivers/mtd/mtdchar.c
@@ -323,6 +323,13 @@ static ssize_t mtdchar_write(struct file *file, const char __user *buf, size_t c
 		default:
 			ret = mtd_write(mtd, *ppos, len, &retlen, kbuf);
 		}
+		/* return -ENOSPC only if no data was written */
+		if ((ret == -ENOSPC) && (total_retlen)) {
+			ret = 0;
+			retlen = 0;
+			/* drop the remaining data */
+			count = 0;
+		}
 		if (!ret) {
 			*ppos += retlen;
 			total_retlen += retlen;
diff --git a/drivers/mtd/onenand/onenand_base.c b/drivers/mtd/onenand/onenand_base.c
index 419c538..9d47c2c 100644
--- a/drivers/mtd/onenand/onenand_base.c
+++ b/drivers/mtd/onenand/onenand_base.c
@@ -3316,7 +3316,16 @@ static int onenand_read_user_prot_reg(struct mtd_info *mtd, loff_t from,
 static int onenand_write_user_prot_reg(struct mtd_info *mtd, loff_t from,
 			size_t len, size_t *retlen, u_char *buf)
 {
-	return onenand_otp_walk(mtd, from, len, retlen, buf, do_otp_write, MTD_OTP_USER);
+	int ret;
+	ret = onenand_otp_walk(mtd, from, len, retlen, buf, do_otp_write,
+			       MTD_OTP_USER);
+
+	/* if no data could be written due to lack of OTP memory,
+	   return ENOSPC */
+	if (!ret && len && !(*retlen))
+		return -ENOSPC;
+
+	return ret;
 }
 
 /**
-- 
1.7.9.5
