Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1e3gzu-0004Qq-Ce
 for linux-mtd@lists.infradead.org; Sun, 15 Oct 2017 11:22:24 +0000
From: Marc Kleine-Budde <mkl@pengutronix.de>
To: linux-mtd@lists.infradead.org
Cc: Marc Kleine-Budde <mkl@pengutronix.de>
Subject: [PATCH] UBI: attach: check_corruption(): add missing newline at end
 of pr_err()
Date: Sun, 15 Oct 2017 13:21:57 +0200
Message-Id: <20171015112157.5803-1-mkl@pengutronix.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This patch adds the missing newline at the end of the pr_err()
statement, otherwise the first line of the PEB's hexdump will be
displayed in the line of the error message.

Signed-off-by: Marc Kleine-Budde <mkl@pengutronix.de>
---
 drivers/mtd/ubi/attach.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/ubi/attach.c b/drivers/mtd/ubi/attach.c
index 93ceea4f27d5..76d010445ba1 100644
--- a/drivers/mtd/ubi/attach.c
+++ b/drivers/mtd/ubi/attach.c
@@ -914,7 +914,7 @@ static int check_corruption(struct ubi_device *ubi, struct ubi_vid_hdr *vid_hdr,
 		pnum);
 	ubi_err(ubi, "this may be a non-UBI PEB or a severe VID header corruption which requires manual inspection");
 	ubi_dump_vid_hdr(vid_hdr);
-	pr_err("hexdump of PEB %d offset %d, length %d",
+	pr_err("hexdump of PEB %d offset %d, length %d\n",
 	       pnum, ubi->leb_start, ubi->leb_size);
 	ubi_dbg_print_hex_dump(KERN_DEBUG, "", DUMP_PREFIX_OFFSET, 32, 1,
 			       ubi->peb_buf, ubi->leb_size, 1);
-- 
2.14.2
