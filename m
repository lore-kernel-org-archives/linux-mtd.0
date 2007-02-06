Received: from smtp.nokia.com ([131.228.20.173] helo=mgw-ext14.nokia.com)
	by canuck.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1HERIO-0008N0-Lh
	for linux-mtd@lists.infradead.org; Tue, 06 Feb 2007 09:27:47 -0500
Received: from esebh106.NOE.Nokia.com (esebh106.ntc.nokia.com [172.21.138.213])
	by mgw-ext14.nokia.com (Switch-3.2.5/Switch-3.2.5) with ESMTP id
	l16ENjk0010763
	for <linux-mtd@lists.infradead.org>; Tue, 6 Feb 2007 16:23:50 +0200
Message-ID: <45C88FF2.9050807@nokia.com>
Date: Tue, 06 Feb 2007 16:25:54 +0200
From: Adrian Hunter <ext-adrian.hunter@nokia.com>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Subject: [PATCH] [MTD] OneNAND: Subpage write returned incorrect length written
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

>From 9559cd696b16e392572b34aa95b656637ac3241d Mon Sep 17 00:00:00 2001
From: Adrian Hunter <ext-adrian.hunter@nokia.com>
Date: Tue, 6 Feb 2007 16:20:41 +0200
Subject: [MTD] OneNAND: Subpage write returned incorrect length written

When a write is done, the length written is returned.  When a
single subpage is written the length returned should be the
subpage size, however the page size was being returned.

Signed-off-by: Adrian Hunter <ext-adrian.hunter@nokia.com>
---
 drivers/mtd/onenand/onenand_base.c |   20 +++++++++-----------
 1 files changed, 9 insertions(+), 11 deletions(-)

diff --git a/drivers/mtd/onenand/onenand_base.c b/drivers/mtd/onenand/onenand_base.c
index 553b24d..3d6f880 100644
--- a/drivers/mtd/onenand/onenand_base.c
+++ b/drivers/mtd/onenand/onenand_base.c
@@ -1051,40 +1051,37 @@ static int onenand_write(struct mtd_info
         }
 
 	column = to & (mtd->writesize - 1);
-	subpage = column || (len & (mtd->writesize - 1));
 
 	/* Grab the lock and see if the device is available */
 	onenand_get_device(mtd, FL_WRITING);
 
 	/* Loop until all data write */
 	while (written < len) {
-		int bytes = mtd->writesize;
-		int thislen = min_t(int, bytes, len - written);
+		int thislen = min_t(int, mtd->writesize - column, len - written);
 		u_char *wbuf = (u_char *) buf;
 
 		cond_resched();
 
-		this->command(mtd, ONENAND_CMD_BUFFERRAM, to, bytes);
+		this->command(mtd, ONENAND_CMD_BUFFERRAM, to, thislen);
 
 		/* Partial page write */
+		subpage = thislen < mtd->writesize;
 		if (subpage) {
-			bytes = min_t(int, bytes - column, (int) len);
 			memset(this->page_buf, 0xff, mtd->writesize);
-			memcpy(this->page_buf + column, buf, bytes);
+			memcpy(this->page_buf + column, buf, thislen);
 			wbuf = this->page_buf;
-			/* Even though partial write, we need page size */
-			thislen = mtd->writesize;
 		}
 
-		this->write_bufferram(mtd, ONENAND_DATARAM, wbuf, 0, thislen);
+		this->write_bufferram(mtd, ONENAND_DATARAM, wbuf, 0, mtd->writesize);
 		this->write_bufferram(mtd, ONENAND_SPARERAM, ffchars, 0, mtd->oobsize);
 
 		this->command(mtd, ONENAND_CMD_PROG, to, mtd->writesize);
 
+		ret = this->wait(mtd, FL_WRITING);
+
 		/* In partial page write we don't update bufferram */
-		onenand_update_bufferram(mtd, to, !subpage);
+		onenand_update_bufferram(mtd, to, !ret && !subpage);
 
-		ret = this->wait(mtd, FL_WRITING);
 		if (ret) {
 			DEBUG(MTD_DEBUG_LEVEL0, "onenand_write: write filaed %d\n", ret);
 			break;
@@ -1098,6 +1095,7 @@ static int onenand_write(struct mtd_info
 		}
 
 		written += thislen;
+
 		if (written == len)
 			break;
 
-- 
1.4.3
