Received: from willow.rfc1149.net ([2001:6f8:37a:2::2] helo=mail2.rfc1149.net)
	by canuck.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1IivrE-00005l-Oh
	for linux-mtd@lists.infradead.org; Fri, 19 Oct 2007 13:42:06 -0400
From: Samuel Tardieu <sam@rfc1149.net>
Date: Fri, 19 Oct 2007 19:26:35 +0200
Subject: [PATCH] eccbuf is statically defined and always evaluate to true
To: linux-mtd@lists.infradead.org
Message-Id: <20071019174155.80782C408E@mail2.rfc1149.net>
Cc: trivial@kernel.org, linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

---
 drivers/mtd/devices/doc2000.c     |    4 ++--
 drivers/mtd/devices/doc2001plus.c |    2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/mtd/devices/doc2000.c b/drivers/mtd/devices/doc2000.c
index c73e96b..e9ce241 100644
--- a/drivers/mtd/devices/doc2000.c
+++ b/drivers/mtd/devices/doc2000.c
@@ -632,7 +632,7 @@ static int doc_read(struct mtd_info *mtd, loff_t from, size_t len,
 			len = ((from | 0x1ff) + 1) - from;
 
 		/* The ECC will not be calculated correctly if less than 512 is read */
-		if (len != 0x200 && eccbuf)
+		if (len != 0x200)
 			printk(KERN_WARNING
 			       "ECC needs a full sector read (adr: %lx size %lx)\n",
 			       (long) from, (long) len);
@@ -896,7 +896,7 @@ static int doc_write(struct mtd_info *mtd, loff_t to, size_t len,
 		/* Let the caller know we completed it */
 		*retlen += len;
 
-		if (eccbuf) {
+		{
 			unsigned char x[8];
 			size_t dummy;
 			int ret;
diff --git a/drivers/mtd/devices/doc2001plus.c b/drivers/mtd/devices/doc2001plus.c
index 2b30b58..83be346 100644
--- a/drivers/mtd/devices/doc2001plus.c
+++ b/drivers/mtd/devices/doc2001plus.c
@@ -748,7 +748,7 @@ static int doc_write(struct mtd_info *mtd, loff_t to, size_t len,
 	WriteDOC(DoC_GetDataOffset(mtd, &fto), docptr, Mplus_FlashCmd);
 
 	/* On interleaved devices the flags for 2nd half 512 are before data */
-	if (eccbuf && before)
+	if (before)
 		fto -= 2;
 
 	/* issue the Serial Data In command to initial the Page Program process */
-- 
1.5.3.4
