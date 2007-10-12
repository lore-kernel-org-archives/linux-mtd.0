Received: from smtp.nokia.com ([131.228.20.172] helo=mgw-ext13.nokia.com)
	by pentafluge.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1IgF8G-0001KR-7G
	for linux-mtd@lists.infradead.org; Fri, 12 Oct 2007 08:40:31 +0100
Message-ID: <470F2369.3010103@nokia.com>
Date: Fri, 12 Oct 2007 10:34:01 +0300
From: Adrian Hunter <ext-adrian.hunter@nokia.com>
MIME-Version: 1.0
To: ext Kyungmin Park <kmpark@infradead.org>
Subject: [PATCH] MTD: OneNAND: Avoid deadlock in erase callback; release chip
	lock first.
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

When the erase callback performs some other action on the flash, it's
highly likely to deadlock unless we actually release the chip lock
before calling it.

This patch mirrors that same change already done for NAND.

Signed-off-by: Adrian Hunter <ext-adrian.hunter@nokia.com>
---
 drivers/mtd/onenand/onenand_base.c |    7 ++++---
 1 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/mtd/onenand/onenand_base.c b/drivers/mtd/onenand/onenand_base.c
index a8c426b..dd28355 100644
--- a/drivers/mtd/onenand/onenand_base.c
+++ b/drivers/mtd/onenand/onenand_base.c
@@ -1711,13 +1711,14 @@ static int onenand_erase(struct mtd_info *mtd, struct erase_info *instr)
 erase_exit:
 
 	ret = instr->state == MTD_ERASE_DONE ? 0 : -EIO;
-	/* Do call back function */
-	if (!ret)
-		mtd_erase_callback(instr);
 
 	/* Deselect and wake up anyone waiting on the device */
 	onenand_release_device(mtd);
 
+	/* Do call back function */
+	if (!ret)
+		mtd_erase_callback(instr);
+
 	return ret;
 }
 
-- 
1.4.4.2
