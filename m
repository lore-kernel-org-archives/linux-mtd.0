Received: from mail-ua0-x242.google.com ([2607:f8b0:400c:c08::242])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dstW4-0004ei-RW
 for linux-mtd@lists.infradead.org; Fri, 15 Sep 2017 16:30:58 +0000
Received: by mail-ua0-x242.google.com with SMTP id k23so815122uaf.3
 for <linux-mtd@lists.infradead.org>; Fri, 15 Sep 2017 09:30:35 -0700 (PDT)
Message-ID: <59bc0029.047d1f0a.d1552.1f29@mx.google.com>
Date: Fri, 15 Sep 2017 12:30:32 -0400
From: Arun Nagendran <arunrasppi@gmail.com>
To: gregkh@linuxfoundation.org
Cc: manonuevo@micron.com, linux-mtd@lists.infradead.org
Subject: [PATCH v2] staging: mt29f_spinand: Enable the read ECC before
 program the page
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Current program_page function did following operation:

1. read page (with ECC OFF)
2. modify the page
3. write the page (with ECC ON)

For some case(buggy flash Chip), while read the page without ECC ON,
we may read the page with bit flip error and modify that bad page without
knowing the bit flip error on that page.
also we re-calculate the hash for bad page and write it.
This could bring potential in-consistency problem with Flash data.

Verify this logic with GIGA DEVICE Part(GD5F2GQ4RCFIG):
we see this in-conststency problem wit Giga Device and fix on
this patch resovle that issue.

Signed-off-by: Arun Nagendran <arunrasppi@gmail.com>
---
Changes in v2:
  - Update the patch format and more cleaner way..
---
 drivers/staging/mt29f_spinand/mt29f_spinand.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/mt29f_spinand/mt29f_spinand.c b/drivers/staging/mt29f_spinand/mt29f_spinand.c
index 13eaf16..87595c5 100644
--- a/drivers/staging/mt29f_spinand/mt29f_spinand.c
+++ b/drivers/staging/mt29f_spinand/mt29f_spinand.c
@@ -496,8 +496,12 @@ static int spinand_program_page(struct spi_device *spi_nand,
 	if (!wbuf)
 		return -ENOMEM;
 
-	enable_read_hw_ecc = 0;
-	spinand_read_page(spi_nand, page_id, 0, CACHE_BUF, wbuf);
+	enable_read_hw_ecc = 1;
+	retval = spinand_read_page(spi_nand, page_id, 0, CACHE_BUF, wbuf);
+	if (retval < 0) {
+		dev_err(&spi_nand->dev, "ecc error on read page!!!\n");
+		return retval;
+	}
 
 	for (i = offset, j = 0; i < len; i++, j++)
 		wbuf[i] &= buf[j];
-- 
2.7.4
