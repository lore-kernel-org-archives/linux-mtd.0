Received: from mms1.broadcom.com ([216.31.210.17])
	by canuck.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
	id 1QtpuC-0001FM-89
	for linux-mtd@lists.infradead.org; Wed, 17 Aug 2011 23:52:16 +0000
From: "Brian Norris" <computersforpeace@gmail.com>
To: "Artem Bityutskiy" <dedekind1@gmail.com>
Subject: [RFC 4/5] mtd: move mtd_oob_mode_t to shared kernel/user space
Date: Wed, 17 Aug 2011 16:50:28 -0700
Message-ID: <1313625029-19546-5-git-send-email-computersforpeace@gmail.com>
In-Reply-To: <1313625029-19546-1-git-send-email-computersforpeace@gmail.com>
References: <1313625029-19546-1-git-send-email-computersforpeace@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Cc: Mike Frysinger <vapier.adi@gmail.com>, Kevin Cernekee <cernekee@gmail.com>,
	b35362@freescale.com, linux-mtd@lists.infradead.org,
	Brian Norris <computersforpeace@gmail.com>,
	David Woodhouse <dwmw2@infradead.org>, Matthew Creech <mlcreech@gmail.com>
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

Signed-off-by: Brian Norris <computersforpeace@gmail.com>
---
 include/linux/mtd/mtd.h |   14 --------------
 include/mtd/mtd-abi.h   |   14 ++++++++++++++
 2 files changed, 14 insertions(+), 14 deletions(-)

diff --git a/include/linux/mtd/mtd.h b/include/linux/mtd/mtd.h
index 46682ac..e089bce 100644
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
diff --git a/include/mtd/mtd-abi.h b/include/mtd/mtd-abi.h
index 2f7d45b..f850d9a 100644
--- a/include/mtd/mtd-abi.h
+++ b/include/mtd/mtd-abi.h
@@ -45,6 +45,20 @@ struct mtd_oob_buf64 {
 	__u64 usr_ptr;
 };
 
+/*
+ * oob operation modes
+ *
+ * MTD_OOB_PLACE:       oob data are placed at the given offset
+ * MTD_OOB_AUTO:        oob data are automatically placed at the free areas
+ *                      which are defined by the ecclayout
+ * MTD_OOB_RAW:         mode to read oob and data without doing ECC checking
+ */
+typedef enum {
+	MTD_OOB_PLACE,
+	MTD_OOB_AUTO,
+	MTD_OOB_RAW,
+} mtd_oob_mode_t;
+
 #define MTD_ABSENT		0
 #define MTD_RAM			1
 #define MTD_ROM			2
-- 
1.7.0.4
