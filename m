Received: from mail-ua0-x241.google.com ([2607:f8b0:400c:c08::241])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dsCVI-0007VZ-RM
 for linux-mtd@lists.infradead.org; Wed, 13 Sep 2017 18:35:22 +0000
Received: by mail-ua0-x241.google.com with SMTP id g47so299490uad.2
 for <linux-mtd@lists.infradead.org>; Wed, 13 Sep 2017 11:34:56 -0700 (PDT)
Message-ID: <59b97a4e.cf02b00a.d8b82.a310@mx.google.com>
Date: Wed, 13 Sep 2017 14:34:53 -0400
From: Arun Nagendran <arunrasppi@gmail.com>
To: gregkh@linuxfoundation.org
Cc: manonuevo@micron.com, linux-mtd@lists.infradead.org
Subject: [PATCH] Enable the read ECC before program the page
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
---
 drivers/staging/mt29f_spinand/mt29f_spinand.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/mt29f_spinand/mt29f_spinand.c b/drivers/staging/mt29f_spinand/mt29f_spinand.c
index a4e3ae8..202d222 100644
--- a/drivers/staging/mt29f_spinand/mt29f_spinand.c
+++ b/drivers/staging/mt29f_spinand/mt29f_spinand.c
@@ -496,8 +496,13 @@ static int spinand_program_page(struct spi_device *spi_nand,
 	if (!wbuf)
 		return -ENOMEM;
 
-	enable_read_hw_ecc = 0;
-	spinand_read_page(spi_nand, page_id, 0, CACHE_BUF, wbuf);
+	enable_read_hw_ecc = 1;
+	retval = spinand_read_page(spi_nand, page_id, 0, CACHE_BUF, wbuf);
+	if( retval < 0 )
+	{
+		dev_err(&spi_nand->dev, "ecc error on read page!!!\n");
+		return retval;
+	}
 
 	for (i = offset, j = 0; i < len; i++, j++)
 		wbuf[i] &= buf[j];
-- 
2.7.4
