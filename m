Received: from mail-wi0-f177.google.com ([209.85.212.177])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1TBo4I-0003Zf-VY
 for linux-mtd@lists.infradead.org; Wed, 12 Sep 2012 14:37:31 +0000
Received: by wibhn17 with SMTP id hn17so1544583wib.0
 for <linux-mtd@lists.infradead.org>; Wed, 12 Sep 2012 07:37:28 -0700 (PDT)
From: Richard Genoud <richard.genoud@gmail.com>
To: David Woodhouse <dwmw2@infradead.org>,
 Artem Bityutskiy <dedekind1@gmail.com>
Subject: [MTD-UTILS] BUG: ubiformat fails on big partitions (>4Gio)
Date: Wed, 12 Sep 2012 16:37:19 +0200
Message-Id: <1347460639-3241-1-git-send-email-richard.genoud@gmail.com>
Cc: Richard Genoud <richard.genoud@gmail.com>, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The offset (which is 64bits when mtd-utils are not compile with
WITHOUT_LARGEFILE) is calculated like that:
offset = nb * size;
But nb and size are int, so on 32bits platforms, there's a possible
overflow.

So, it should be replace with:
offset = (off_t)nb * size;
If WITHOUT_LARGEFILE is defined, there still be an overflow, but it's
what we want, right ?

Cheney Chen tested an ubiformat on a NAND (5.9 GiB mtd part).

Reported-by: Cheney Chen <cheneychencl2012@gmail.com>
Tested-by: Cheney Chen <cheneychencl2012@gmail.com>
Signed-off-by: Richard Genoud <richard.genoud@gmail.com>
---
 ubi-utils/libubigen.c |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/ubi-utils/libubigen.c b/ubi-utils/libubigen.c
index 9eaa7f5..d2a949b 100644
--- a/ubi-utils/libubigen.c
+++ b/ubi-utils/libubigen.c
@@ -279,7 +279,7 @@ int ubigen_write_layout_vol(const struct ubigen_info *ui, int peb1, int peb2,
 	memset(outbuf + ui->data_offs + ui->vtbl_size, 0xFF,
 	       ui->peb_size - ui->data_offs - ui->vtbl_size);
 
-	seek = peb1 * ui->peb_size;
+	seek = (off_t) peb1 * ui->peb_size;
 	if (lseek(fd, seek, SEEK_SET) != seek) {
 		sys_errmsg("cannot seek output file");
 		goto out_free;
@@ -293,7 +293,7 @@ int ubigen_write_layout_vol(const struct ubigen_info *ui, int peb1, int peb2,
 		goto out_free;
 	}
 
-	seek = peb2 * ui->peb_size;
+	seek = (off_t) peb2 * ui->peb_size;
 	if (lseek(fd, seek, SEEK_SET) != seek) {
 		sys_errmsg("cannot seek output file");
 		goto out_free;
-- 
1.7.2.5
