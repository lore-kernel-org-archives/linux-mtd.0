Received: from smtp.nokia.com ([147.243.128.24] helo=mgw-da01.nokia.com)
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1PmkQ4-0000Je-2z
	for linux-mtd@lists.infradead.org; Tue, 08 Feb 2011 10:03:37 +0000
From: Adrian Hunter <adrian.hunter@nokia.com>
To: David Woodhouse <dwmw2@infradead.org>
Subject: [PATCH 5/5] mtd: onenand_base: onenand_verify bugfix for writepage
	non-aligned address
Date: Tue,  8 Feb 2011 12:02:42 +0200
Message-Id: <1297159362-8407-6-git-send-email-adrian.hunter@nokia.com>
In-Reply-To: <1297159362-8407-1-git-send-email-adrian.hunter@nokia.com>
References: <1297159362-8407-1-git-send-email-adrian.hunter@nokia.com>
Cc: Kyungmin Park <kyungmin.park@samsung.com>,
	Adrian Hunter <adrian.hunter@nokia.com>,
	linux-mtd Mailing List <linux-mtd@lists.infradead.org>,
	Roman Tereshonkov <roman.tereshonkov@nokia.com>,
	Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Roman Tereshonkov <roman.tereshonkov@nokia.com>

In onenand_verify function the address can be writepage non-aligned.
When a page is read for comparing the right offset should be used
for "this->verify_buf" to get the right matching with compared
"buf" buffer.

Signed-off-by: Roman Tereshonkov <roman.tereshonkov@nokia.com>
Signed-off-by: Adrian Hunter <adrian.hunter@nokia.com>
---
 drivers/mtd/onenand/onenand_base.c |   10 +++++-----
 1 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/mtd/onenand/onenand_base.c b/drivers/mtd/onenand/onenand_base.c
index 38e6d76..4205b94 100644
--- a/drivers/mtd/onenand/onenand_base.c
+++ b/drivers/mtd/onenand/onenand_base.c
@@ -1648,11 +1648,10 @@ static int onenand_verify(struct mtd_info *mtd, const u_char *buf, loff_t addr,
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
 
@@ -1666,12 +1665,13 @@ static int onenand_verify(struct mtd_info *mtd, const u_char *buf, loff_t addr,
 
 		this->read_bufferram(mtd, ONENAND_DATARAM, this->verify_buf, 0, mtd->writesize);
 
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
