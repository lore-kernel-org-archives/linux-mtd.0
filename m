Received: from mail-pf0-x242.google.com ([2607:f8b0:400e:c00::242])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bGV4A-0007xB-5a
 for linux-mtd@lists.infradead.org; Fri, 24 Jun 2016 17:38:54 +0000
Received: by mail-pf0-x242.google.com with SMTP id i123so9834123pfg.3
 for <linux-mtd@lists.infradead.org>; Fri, 24 Jun 2016 10:38:33 -0700 (PDT)
From: Brian Norris <computersforpeace@gmail.com>
To: <linux-mtd@lists.infradead.org>
Cc: Brian Norris <computersforpeace@gmail.com>,
 Giorgio <giorgio.nicole@arcor.de>,
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Subject: [PATCH] mtd: spi-nor: fix wrong "fully unlocked" test
Date: Fri, 24 Jun 2016 10:38:14 -0700
Message-Id: <1466789894-17535-1-git-send-email-computersforpeace@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

In stm_unlock(), the test to determine whether we've fully unlocked the
flash checks for the lock length to be equal to the flash size. That is
a typo/think-o -- the condition actually means the flash is completely
*locked.* We should be using the inverse condition -- that the lock
length is 0 (i.e., no protection).

The result of this bug is that we never actually turn off the Status
Register Write Disable bit, even if the flash is completely unlocked.
Now we can.

Fixes: 47b8edbf0d43 ("mtd: spi-nor: disallow further writes to SR if WP# is low")
Reported-by: Giorgio <giorgio.nicole@arcor.de>
Signed-off-by: Brian Norris <computersforpeace@gmail.com>
Cc: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
---
 drivers/mtd/spi-nor/spi-nor.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
index a63922ed6385..14cf6ac8c0a5 100644
--- a/drivers/mtd/spi-nor/spi-nor.c
+++ b/drivers/mtd/spi-nor/spi-nor.c
@@ -661,7 +661,7 @@ static int stm_unlock(struct spi_nor *nor, loff_t ofs, uint64_t len)
 	status_new = (status_old & ~mask & ~SR_TB) | val;
 
 	/* Don't protect status register if we're fully unlocked */
-	if (lock_len == mtd->size)
+	if (lock_len == 0)
 		status_new &= ~SR_SRWD;
 
 	if (!use_top)
-- 
2.8.0.rc3.226.g39d4020
