Received: from smtp.nokia.com ([131.228.20.170] helo=mgw-ext11.nokia.com)
	by canuck.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1H9drg-0007ce-Pa
	for linux-mtd@lists.infradead.org; Wed, 24 Jan 2007 03:52:23 -0500
Received: from esebh105.NOE.Nokia.com (esebh105.ntc.nokia.com [172.21.138.211])
	by mgw-ext11.nokia.com (Switch-3.2.5/Switch-3.2.5) with ESMTP id
	l0O8nGta025324
	for <linux-mtd@lists.infradead.org>; Wed, 24 Jan 2007 10:49:24 +0200
Message-ID: <45B71E03.5040707@nokia.com>
Date: Wed, 24 Jan 2007 10:51:15 +0200
From: Adrian Hunter <ext-adrian.hunter@nokia.com>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Subject: [PATCH] [MTD] OneNAND: Amend write-verify to compare to original
	buffer
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


When write-verify is enabled (CONFIG_MTD_ONENAND_VERIFY_WRITE),
the data written is read back and compared.  The comparison
was being made between dataRAM buffers, but this does not
verify that the data made it to the dataRAM correctly in
the first place.  This patch amends write-verify to
compare back to the original buffer.  It also now verifies
sub-page writes.

Signed-off-by: Adrian Hunter <ext-adrian.hunter@nokia.com>
---
 drivers/mtd/onenand/onenand_base.c |   52 +++++++++++++++++++++--------------
 1 files changed, 31 insertions(+), 21 deletions(-)

diff --git a/drivers/mtd/onenand/onenand_base.c b/drivers/mtd/onenand/onenand_base.c
index 0249b4a..65acb85 100644
--- a/drivers/mtd/onenand/onenand_base.c
+++ b/drivers/mtd/onenand/onenand_base.c
@@ -909,41 +909,51 @@ static int onenand_verify_oob(struct mtd
 }
 
 /**
- * onenand_verify_page - [GENERIC] verify the chip contents after a write
- * @param mtd		MTD device structure
- * @param buf		the databuffer to verify
+ * onenand_verify - [GENERIC] verify the chip contents after a write
+ * @param mtd          MTD device structure
+ * @param buf          the databuffer to verify
+ * @param addr         offset to read from
+ * @param len          number of bytes to read and compare
  *
- * Check DataRAM area directly
  */
-static int onenand_verify_page(struct mtd_info *mtd, u_char *buf, loff_t addr)
+static int onenand_verify(struct mtd_info *mtd, const u_char *buf, loff_t addr, size_t len)
 {
 	struct onenand_chip *this = mtd->priv;
-	void __iomem *dataram0, *dataram1;
+	void __iomem *dataram;
 	int ret = 0;
+	int thislen, column;
 
-	/* In partial page write, just skip it */
-	if ((addr & (mtd->writesize - 1)) != 0)
-		return 0;
+	while (len != 0) {
+		thislen = min_t(int, mtd->writesize, len);
+		column = addr & (mtd->writesize - 1);
+		if (column + thislen > mtd->writesize)
+			thislen = mtd->writesize - column;
 
-	this->command(mtd, ONENAND_CMD_READ, addr, mtd->writesize);
+		this->command(mtd, ONENAND_CMD_READ, addr, mtd->writesize);
 
-	ret = this->wait(mtd, FL_READING);
-	if (ret)
-		return ret;
+		onenand_update_bufferram(mtd, addr, 0);
+
+		ret = this->wait(mtd, FL_READING);
+		if (ret)
+			return ret;
 
-	onenand_update_bufferram(mtd, addr, 1);
+		onenand_update_bufferram(mtd, addr, 1);
 
-	/* Check, if the two dataram areas are same */
-	dataram0 = this->base + ONENAND_DATARAM;
-	dataram1 = dataram0 + mtd->writesize;
+		dataram = this->base + ONENAND_DATARAM;
+		dataram += onenand_bufferram_offset(mtd, ONENAND_DATARAM);
 
-	if (memcmp(dataram0, dataram1, mtd->writesize))
-		return -EBADMSG;
+		if (memcmp(buf, dataram + column, thislen))
+			return -EBADMSG;
+
+		len -= thislen;
+		buf += thislen;
+		addr += thislen;
+	}
 
 	return 0;
 }
 #else
-#define onenand_verify_page(...)	(0)
+#define onenand_verify(...)		(0)
 #define onenand_verify_oob(...)		(0)
 #endif
 
@@ -1025,7 +1035,7 @@ static int onenand_write(struct mtd_info
 		}
 
 		/* Only check verify write turn on */
-		ret = onenand_verify_page(mtd, (u_char *) wbuf, to);
+		ret = onenand_verify(mtd, (u_char *) wbuf, to, thislen);
 		if (ret) {
 			DEBUG(MTD_DEBUG_LEVEL0, "onenand_write: verify failed %d\n", ret);
 			break;
-- 
1.4.3
