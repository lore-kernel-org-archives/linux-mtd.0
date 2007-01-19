Received: from smtp.nokia.com ([131.228.20.171] helo=mgw-ext12.nokia.com)
	by canuck.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1H7urt-0007NM-0L
	for linux-mtd@lists.infradead.org; Fri, 19 Jan 2007 09:37:26 -0500
Message-ID: <45B0D75A.5080709@nokia.com>
Date: Fri, 19 Jan 2007 16:36:10 +0200
From: Adrian Hunter <ext-adrian.hunter@nokia.com>
MIME-Version: 1.0
To: ext Kyungmin Park <kyungmin.park@samsung.com>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Subject: [PATCH] [MTD] OneNAND: Free the bad block table when the device is
	released
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

OneNAND does 2 memory allocations for bad block information.
Only one of them was being freed.

Signed-off-by: Adrian Hunter <ext-adrian.hunter@nokia.com>
---
 drivers/mtd/onenand/onenand_base.c |    6 +++++-
 drivers/mtd/onenand/onenand_bbt.c  |    4 ++--
 2 files changed, 7 insertions(+), 3 deletions(-)

diff --git a/drivers/mtd/onenand/onenand_base.c b/drivers/mtd/onenand/onenand_base.c
index 0ade237..38aa019 100644
--- a/drivers/mtd/onenand/onenand_base.c
+++ b/drivers/mtd/onenand/onenand_base.c
@@ -2133,8 +2133,12 @@ #endif
 	del_mtd_device (mtd);
 
 	/* Free bad block table memory, if allocated */
-	if (this->bbm)
+	if (this->bbm) {
+		struct bbm_info *bbm = this->bbm;
+		if (bbm->bbt)
+			kfree(bbm->bbt);
 		kfree(this->bbm);
+	}
 	/* Buffer allocated by onenand_scan */
 	if (this->options & ONENAND_PAGEBUF_ALLOC)
 		kfree(this->page_buf);
diff --git a/drivers/mtd/onenand/onenand_bbt.c b/drivers/mtd/onenand/onenand_bbt.c
index 98f8fd1..90db8f5 100644
--- a/drivers/mtd/onenand/onenand_bbt.c
+++ b/drivers/mtd/onenand/onenand_bbt.c
@@ -168,8 +168,8 @@ static int onenand_isbad_bbt(struct mtd_
  * marked good / bad blocks and writes the bad block table(s) to
  * the selected place.
  *
- * The bad block table memory is allocated here. It must be freed
- * by calling the onenand_free_bbt function.
+ * The bad block table memory is allocated here. It is freed
+ * by the onenand_release function.
  *
  */
 int onenand_scan_bbt(struct mtd_info *mtd, struct nand_bbt_descr *bd)
-- 
1.4.3
