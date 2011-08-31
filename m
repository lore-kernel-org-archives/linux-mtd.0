Received: from mms2.broadcom.com ([216.31.210.18])
	by canuck.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
	id 1QyZvd-00059D-FV
	for linux-mtd@lists.infradead.org; Wed, 31 Aug 2011 01:49:22 +0000
From: "Brian Norris" <computersforpeace@gmail.com>
To: "Artem Bityutskiy" <dedekind1@gmail.com>
Subject: [PATCH 04/12] mtd: move mtd_oob_mode_t to shared kernel/user
 space
Date: Tue, 30 Aug 2011 18:45:39 -0700
Message-ID: <1314755147-17756-5-git-send-email-computersforpeace@gmail.com>
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

We will want to use the MTD_OOB_{PLACE,AUTO,RAW} modes in user-space
applications through the introduction of new ioctls, so we should make
this enum a shared type.

This enum is now anonymous and will be used in 8-bit fields (__u8 or
uint8_t).

Signed-off-by: Brian Norris <computersforpeace@gmail.com>
---
 drivers/mtd/onenand/onenand_base.c |    4 ++--
 include/linux/mtd/mtd.h            |   16 +---------------
 include/mtd/mtd-abi.h              |   15 +++++++++++++++
 3 files changed, 18 insertions(+), 17 deletions(-)

diff --git a/drivers/mtd/onenand/onenand_base.c b/drivers/mtd/onenand/onenand_base.c
index de98791..9edc8b1 100644
--- a/drivers/mtd/onenand/onenand_base.c
+++ b/drivers/mtd/onenand/onenand_base.c
@@ -1351,7 +1351,7 @@ static int onenand_read_oob_nolock(struct mtd_info *mtd, loff_t from,
 	struct mtd_ecc_stats stats;
 	int read = 0, thislen, column, oobsize;
 	size_t len = ops->ooblen;
-	mtd_oob_mode_t mode = ops->mode;
+	uint8_t mode = ops->mode;
 	u_char *buf = ops->oobbuf;
 	int ret = 0, readcmd;
 
@@ -2074,7 +2074,7 @@ static int onenand_write_oob_nolock(struct mtd_info *mtd, loff_t to,
 	u_char *oobbuf;
 	size_t len = ops->ooblen;
 	const u_char *buf = ops->oobbuf;
-	mtd_oob_mode_t mode = ops->mode;
+	uint8_t mode = ops->mode;
 
 	to += ops->ooboffs;
 
diff --git a/include/linux/mtd/mtd.h b/include/linux/mtd/mtd.h
index ff7bae0..3b2c678 100644
--- a/include/linux/mtd/mtd.h
+++ b/include/linux/mtd/mtd.h
@@ -68,20 +68,6 @@ struct mtd_erase_region_info {
 	unsigned long *lockmap;		/* If keeping bitmap of locks */
 };
 
-/*
- * oob operation modes
- *
- * MTD_OOB_PLACE:	oob data are placed at the given offset
- * MTD_OOB_AUTO:	oob data are automatically placed at the free areas
- *			which are defined by the ecclayout
- * MTD_OOB_RAW:		mode to read oob and data without doing ECC checking
- */
-typedef enum {
-	MTD_OOB_PLACE,
-	MTD_OOB_AUTO,
-	MTD_OOB_RAW,
-} mtd_oob_mode_t;
-
 /**
  * struct mtd_oob_ops - oob operation operands
  * @mode:	operation mode
@@ -102,7 +88,7 @@ typedef enum {
  * OOB area.
  */
 struct mtd_oob_ops {
-	mtd_oob_mode_t	mode;
+	uint8_t		mode;
 	size_t		len;
 	size_t		retlen;
 	size_t		ooblen;
diff --git a/include/mtd/mtd-abi.h b/include/mtd/mtd-abi.h
index 3bdda5c..af42c7a 100644
--- a/include/mtd/mtd-abi.h
+++ b/include/mtd/mtd-abi.h
@@ -45,6 +45,21 @@ struct mtd_oob_buf64 {
 	__u64 usr_ptr;
 };
 
+/*
+ * oob operation modes
+ *
+ * MTD_OOB_PLACE:       oob data are placed at the given offset (default)
+ * MTD_OOB_AUTO:        oob data are automatically placed at the free areas
+ *                      which are defined by the internal ecclayout
+ * MTD_OOB_RAW:         mode to read or write oob and data without doing ECC
+ *			checking
+ */
+enum {
+	MTD_OOB_PLACE = 0,
+	MTD_OOB_AUTO = 1,
+	MTD_OOB_RAW = 2,
+};
+
 #define MTD_ABSENT		0
 #define MTD_RAM			1
 #define MTD_ROM			2
-- 
1.7.5.4
