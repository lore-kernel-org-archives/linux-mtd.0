Received: from smtp.nokia.com ([131.228.20.170] helo=mgw-ext11.nokia.com)
	by canuck.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1H8v4D-0006E1-Bc
	for linux-mtd@lists.infradead.org; Mon, 22 Jan 2007 04:02:20 -0500
Message-ID: <45B47D48.70702@nokia.com>
Date: Mon, 22 Jan 2007 11:00:56 +0200
From: Adrian Hunter <ext-adrian.hunter@nokia.com>
MIME-Version: 1.0
To: kyungmin.park@samsung.com
Subject: Re: [PATCH] [MTD] OneNAND: Free the bad block table when the device
	is released
References: <27947815.92691169450602843.JavaMail.weblogic@ep_ml23>
In-Reply-To: <27947815.92691169450602843.JavaMail.weblogic@ep_ml23>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
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
@@ -2133,8 +2133,11 @@ #endif
 	del_mtd_device (mtd);
 
 	/* Free bad block table memory, if allocated */
-	if (this->bbm)
+	if (this->bbm) {
+		struct bbm_info *bbm = this->bbm;
+		kfree(bbm->bbt);
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
