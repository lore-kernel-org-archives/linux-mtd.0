Received: from smtp.nokia.com ([131.228.20.171] helo=mgw-ext12.nokia.com)
	by pentafluge.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1IgEuM-0000pk-Qz
	for linux-mtd@lists.infradead.org; Fri, 12 Oct 2007 08:26:09 +0100
Message-ID: <470F1FFE.2090306@nokia.com>
Date: Fri, 12 Oct 2007 10:19:26 +0300
From: Adrian Hunter <ext-adrian.hunter@nokia.com>
MIME-Version: 1.0
To: ext Kyungmin Park <kmpark@infradead.org>
Subject: [PATCH] MTD: OneNAND: Synchronize block locking operations
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Ensure OneNAND's block locking operations are synchronized
like all other operations.

Signed-off-by: Adrian Hunter <ext-adrian.hunter@nokia.com>
---
 drivers/mtd/onenand/onenand_base.c |   18 ++++++++++++++----
 1 files changed, 14 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/onenand/onenand_base.c b/drivers/mtd/onenand/onenand_base.c
index b2c40f6..f633941 100644
--- a/drivers/mtd/onenand/onenand_base.c
+++ b/drivers/mtd/onenand/onenand_base.c
@@ -1904,7 +1904,12 @@ static int onenand_do_lock_cmd(struct mtd_info *mtd, loff_t ofs, size_t len, int
  */
 static int onenand_lock(struct mtd_info *mtd, loff_t ofs, size_t len)
 {
-	return onenand_do_lock_cmd(mtd, ofs, len, ONENAND_CMD_LOCK);
+	int ret;
+
+	onenand_get_device(mtd, FL_LOCKING);
+	ret = onenand_do_lock_cmd(mtd, ofs, len, ONENAND_CMD_LOCK);
+	onenand_release_device(mtd);
+	return ret;
 }
 
 /**
@@ -1917,7 +1922,12 @@ static int onenand_lock(struct mtd_info *mtd, loff_t ofs, size_t len)
  */
 static int onenand_unlock(struct mtd_info *mtd, loff_t ofs, size_t len)
 {
-	return onenand_do_lock_cmd(mtd, ofs, len, ONENAND_CMD_UNLOCK);
+	int ret;
+
+	onenand_get_device(mtd, FL_LOCKING);
+	ret = onenand_do_lock_cmd(mtd, ofs, len, ONENAND_CMD_UNLOCK);
+	onenand_release_device(mtd);
+	return ret;
 }
 
 /**
@@ -1979,7 +1989,7 @@ static int onenand_unlock_all(struct mtd_info *mtd)
 			loff_t ofs = this->chipsize >> 1;
 			size_t len = mtd->erasesize;
 
-			onenand_unlock(mtd, ofs, len);
+			onenand_do_lock_cmd(mtd, ofs, len, ONENAND_CMD_UNLOCK);
 		}
 
 		onenand_check_lock_status(this);
@@ -1987,7 +1997,7 @@ static int onenand_unlock_all(struct mtd_info *mtd)
 		return 0;
 	}
 
-	onenand_unlock(mtd, 0x0, this->chipsize);
+	onenand_do_lock_cmd(mtd, 0x0, this->chipsize, ONENAND_CMD_UNLOCK);
 
 	return 0;
 }
-- 
1.4.4.2
