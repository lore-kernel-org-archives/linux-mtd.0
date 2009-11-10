Received: from ey-out-1920.google.com ([74.125.78.150])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1N7w8r-0004nQ-WE
	for linux-mtd@lists.infradead.org; Tue, 10 Nov 2009 19:12:42 +0000
Received: by ey-out-1920.google.com with SMTP id 4so517933eyg.2
	for <linux-mtd@lists.infradead.org>;
	Tue, 10 Nov 2009 11:12:35 -0800 (PST)
MIME-Version: 1.0
Sender: fszczerba@gmail.com
From: Frank Szczerba <frank@szczerba.net>
Date: Tue, 10 Nov 2009 14:12:14 -0500
Message-ID: <2711ec210911101112q1d4dcbd6k7b709243c94b305c@mail.gmail.com>
Subject: [PATCH] Fix OOB Read Errors with Atmel Hardware ECC
To: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset=ISO-8859-1
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

I am working on an AT91SAM9260-based board using a Samsung
STNAND256W3A flash device (256 Mbit, 8-bit bus, 512+16 pages, 16K
blocks). We are using the hardware ECC module in the AT91, and have a
YAFFS filesystem in part of the flash.

After changing to the hardware ECC we started to see corrupted
directories and lost files in the YAFFS filesystem on reboot. In
particular, filling the filesystem would reliably cause files to
disappear when the system was rebooted. This does not happen when
using MTD software ECC.

To recreate this issue:

# flash_eraseall /dev/mtd4
Erasing 16 Kibyte @ 700000 -- 100% complete.
# mount -t yaffs /dev/mtdblock4 /mnt/yaffs
# ls /mnt/yaffs
lost+found
# dd if=/dev/urandom bs=512 count=1  of=/mnt/yaffs/test1
1+0 records in
1+0 records out
# dd if=/dev/urandom bs=512 count=1  of=/mnt/yaffs/test2
1+0 records in
1+0 records out
# ls /mnt/yaffs
lost+found  test1       test2
# umount /mnt/yaffs
# mount -t yaffs /dev/mtdblock4 /mnt/yaffs
# ls /mnt/yaffs
lost+found  test1       test2
# dd if=/dev/zero bs=512 of=/mnt/yaffs/test3
dd: writing '/mnt/yaffs/test3': No space left on device
14147+0 records in
14146+0 records out
# ls -l /mnt/yaffs
drw-rw-rw-    1 root     root          512 Jan  1 00:02 lost+found
-rw-r--r--    1 root     root          512 Jan  1 00:01 test1
-rw-r--r--    1 root     root          512 Jan  1 00:02 test2
-rw-r--r--    1 root     root      7242752 Jan  1 00:03 test3
# umount /mnt/yaffs
# mount -t yaffs /dev/mtdblock4 /mnt/yaffs
# ls -l /mnt/yaffs
drw-rw-rw-    1 root     root          512 Jan  1 00:03 lost+found
-rw-r--r--    1 root     root      7242752 Jan  1 00:03
??????????????????????????????????????????????????????????????????????????????????????????????????????????

While investigating this, I made what I thought was a simple
optimization to the atmel_nand_read_page() function that seems to
actually fix this issue. I'm not 100% sure why this works, maybe
someone on the list will know.

Signed-off-by: Frank Szczerba <frank+mtd at szczerba.net>
---
 drivers/mtd/nand/atmel_nand.c |   26 +++++++++++++-------------
 1 files changed, 13 insertions(+), 13 deletions(-)

diff --git a/drivers/mtd/nand/atmel_nand.c b/drivers/mtd/nand/atmel_nand.c
index f8e9975..552ee9e 100644
--- a/drivers/mtd/nand/atmel_nand.c
+++ b/drivers/mtd/nand/atmel_nand.c
@@ -192,7 +192,6 @@ static int atmel_nand_calculate(struct mtd_info *mtd,
 {
 	struct nand_chip *nand_chip = mtd->priv;
 	struct atmel_nand_host *host = nand_chip->priv;
-	uint32_t *eccpos = nand_chip->ecc.layout->eccpos;
 	unsigned int ecc_value;

 	/* get the first 2 ECC bytes */
@@ -244,8 +243,10 @@ static int atmel_nand_read_page(struct mtd_info *mtd,
 	/* read the page */
 	chip->read_buf(mtd, p, eccsize);

+	ecc_pos = oob + eccpos[0];
+
 	/* move to ECC position if needed */
-	if (eccpos[0] != 0) {
+	if (ecc_pos != oob) {
 		/* This only works on large pages
 		 * because the ECC controller waits for
 		 * NAND_CMD_RNDOUTSTART after the
@@ -254,26 +255,25 @@ static int atmel_nand_read_page(struct mtd_info *mtd,
 		 */
 		chip->cmdfunc(mtd, NAND_CMD_RNDOUT,
 				mtd->writesize + eccpos[0], -1);
-	}

-	/* the ECC controller needs to read the ECC just after the data */
-	ecc_pos = oob + eccpos[0];
-	chip->read_buf(mtd, ecc_pos, eccbytes);
+        /* the ECC controller needs to read the ECC just after the data */
+        chip->read_buf(mtd, ecc_pos, eccbytes);
+
+        /* get back to oob start (end of page) */
+        chip->cmdfunc(mtd, NAND_CMD_RNDOUT, mtd->writesize, -1);
+    }
+
+    /* read the whole oob */
+    chip->read_buf(mtd, oob, mtd->oobsize);

 	/* check if there's an error */
-	stat = chip->ecc.correct(mtd, p, oob, NULL);
+	stat = chip->ecc.correct(mtd, p, ecc_pos, NULL);

 	if (stat < 0)
 		mtd->ecc_stats.failed++;
 	else
 		mtd->ecc_stats.corrected += stat;

-	/* get back to oob start (end of page) */
-	chip->cmdfunc(mtd, NAND_CMD_RNDOUT, mtd->writesize, -1);
-
-	/* read the oob */
-	chip->read_buf(mtd, oob, mtd->oobsize);
-
 	return 0;
 }

-- 
1.6.5.1


Frank Szczerba
