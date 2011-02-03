Received: from smtp.nokia.com ([147.243.1.47] helo=mgw-sa01.nokia.com)
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1PkykU-0000Ds-Ub
	for linux-mtd@lists.infradead.org; Thu, 03 Feb 2011 12:57:24 +0000
From: Roman Tereshonkov <roman.tereshonkov@nokia.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH] mtd: onenand_base: onenand_verify bugfix for writepage
	non-aligned address
Date: Thu,  3 Feb 2011 14:56:51 +0200
Message-Id: <1296737811-22952-1-git-send-email-roman.tereshonkov@nokia.com>
Cc: kyungmin.park@samsung.com, Roman Tereshonkov <roman.tereshonkov@nokia.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

In onenand_verify function the address can be writepage non-aligned.
When a page is read for comparing the right offset should be used
for "this->verify_buf" to get the right matching with compared
"buf" buffer.

Signed-off-by: Roman Tereshonkov <roman.tereshonkov@nokia.com>
---
 drivers/mtd/onenand/onenand_base.c |   13 +++++++------
 1 files changed, 7 insertions(+), 6 deletions(-)

diff --git a/drivers/mtd/onenand/onenand_base.c b/drivers/mtd/onenand/onenand_base.c
index bac41ca..557a06e 100644
--- a/drivers/mtd/onenand/onenand_base.c
+++ b/drivers/mtd/onenand/onenand_base.c
@@ -1646,11 +1646,10 @@ static int onenand_verify(struct mtd_info *mtd, const u_char *buf, loff_t addr,
 	int ret = 0;
 	int thislen, column;
 
+	column = addr & (this->writesize - 1);
+
 	while (len != 0) {
-		thislen = min_t(int, this->writesize, len);
-		column = addr & (this->writesize - 1);
-		if (column + thislen > this->writesize)
-			thislen = this->writesize - column;
+		thislen = min_t(int, this->writesize - column, len);
 
 		this->command(mtd, ONENAND_CMD_READ, addr, this->writesize);
 
@@ -1662,14 +1661,16 @@ static int onenand_verify(struct mtd_info *mtd, const u_char *buf, loff_t addr,
 
 		onenand_update_bufferram(mtd, addr, 1);
 
-		this->read_bufferram(mtd, ONENAND_DATARAM, this->verify_buf, 0, mtd->writesize);
+		this->read_bufferram(mtd, ONENAND_DATARAM, this->verify_buf, 0,
+				     this->writesize);
 
-		if (memcmp(buf, this->verify_buf, thislen))
+		if (memcmp(buf, this->verify_buf + column, thislen))
 			return -EBADMSG;
 
 		len -= thislen;
 		buf += thislen;
 		addr += thislen;
+		column = 0;
 	}
 
 	return 0;
-- 
1.7.0.4
