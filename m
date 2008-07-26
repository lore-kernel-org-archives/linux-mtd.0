Subject: [PATCH 2/3] [MTD] mtdoops: Add a magic number to logged kernel oops
From: Richard Purdie <rpurdie@rpsys.net>
To: linux-mtd <linux-mtd@lists.infradead.org>,
	David Woodhouse <dwmw2@infradead.org>
Content-Type: text/plain
Date: Sat, 26 Jul 2008 10:08:39 +0100
Message-Id: <1217063319.5463.17.camel@dax.rpnet.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Add a magic number to logged kernel oops messages so that they
can be more accurately detected rather than just having to rely
on the sequence number. This also allows easier detection of
saved crashes by userspace.

Signed-off-by: Richard Purdie <rpurdie@rpsys.net>
---
 drivers/mtd/mtdoops.c |   32 ++++++++++++++++++--------------
 1 files changed, 18 insertions(+), 14 deletions(-)

diff --git a/drivers/mtd/mtdoops.c b/drivers/mtd/mtdoops.c
index f40e457..6f6b2f3 100644
--- a/drivers/mtd/mtdoops.c
+++ b/drivers/mtd/mtdoops.c
@@ -33,6 +33,7 @@
 #include <linux/interrupt.h>
 #include <linux/mtd/mtd.h>
 
+#define MTDOOPS_KERNMSG_MAGIC 0x5d005d00
 #define OOPS_PAGE_SIZE 4096
 
 static struct mtdoops_context {
@@ -224,31 +225,33 @@ static void find_next_position(struct mtdoops_context *cxt)
 {
 	struct mtd_info *mtd = cxt->mtd;
 	int ret, page, maxpos = 0;
-	u32 count, maxcount = 0xffffffff;
+	u32 count[2], maxcount = 0xffffffff;
 	size_t retlen;
 
 	for (page = 0; page < cxt->oops_pages; page++) {
-		ret = mtd->read(mtd, page * OOPS_PAGE_SIZE, 4, &retlen, (u_char *) &count);
-		if ((retlen != 4) || ((ret < 0) && (ret != -EUCLEAN))) {
-			printk(KERN_ERR "mtdoops: Read failure at %d (%td of 4 read)"
+		ret = mtd->read(mtd, page * OOPS_PAGE_SIZE, 8, &retlen, (u_char *) &count[0]);
+		if ((retlen != 8) || ((ret < 0) && (ret != -EUCLEAN))) {
+			printk(KERN_ERR "mtdoops: Read failure at %d (%td of 8 read)"
 				", err %d.\n", page * OOPS_PAGE_SIZE, retlen, ret);
 			continue;
 		}
 
-		if (count == 0xffffffff)
+		if (count[1] != MTDOOPS_KERNMSG_MAGIC)
+			continue;
+		if (count[0] == 0xffffffff)
 			continue;
 		if (maxcount == 0xffffffff) {
-			maxcount = count;
+			maxcount = count[0];
 			maxpos = page;
-		} else if ((count < 0x40000000) && (maxcount > 0xc0000000)) {
-			maxcount = count;
+		} else if ((count[0] < 0x40000000) && (maxcount > 0xc0000000)) {
+			maxcount = count[0];
 			maxpos = page;
-		} else if ((count > maxcount) && (count < 0xc0000000)) {
-			maxcount = count;
+		} else if ((count[0] > maxcount) && (count[0] < 0xc0000000)) {
+			maxcount = count[0];
 			maxpos = page;
-		} else if ((count > maxcount) && (count > 0xc0000000)
+		} else if ((count[0] > maxcount) && (count[0] > 0xc0000000)
 					&& (maxcount > 0x80000000)) {
-			maxcount = count;
+			maxcount = count[0];
 			maxpos = page;
 		}
 	}
@@ -358,8 +361,9 @@ mtdoops_console_write(struct console *co, const char *s, unsigned int count)
 
 	if (cxt->writecount == 0) {
 		u32 *stamp = cxt->oops_buf;
-		*stamp = cxt->nextcount;
-		cxt->writecount = 4;
+		*stamp++ = cxt->nextcount;
+		*stamp = MTDOOPS_KERNMSG_MAGIC;
+		cxt->writecount = 8;
 	}
 
 	if ((count + cxt->writecount) > OOPS_PAGE_SIZE)
-- 
1.5.4.4
