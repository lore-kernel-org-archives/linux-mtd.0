Received: from mail-pa0-x231.google.com ([2607:f8b0:400e:c03::231])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Xlxu4-00046l-Ml
 for linux-mtd@lists.infradead.org; Wed, 05 Nov 2014 10:33:29 +0000
Received: by mail-pa0-f49.google.com with SMTP id lj1so516477pab.36
 for <linux-mtd@lists.infradead.org>; Wed, 05 Nov 2014 02:33:07 -0800 (PST)
From: Brian Norris <computersforpeace@gmail.com>
To: <linux-mtd@lists.infradead.org>
Subject: [PATCH] mtd: spi-nor: improve wait-till-ready timeout loop
Date: Wed,  5 Nov 2014 02:32:03 -0800
Message-Id: <1415183523-16265-1-git-send-email-computersforpeace@gmail.com>
Cc: Marek Vasut <marex@denx.de>, Brian Norris <computersforpeace@gmail.com>,
 Huang Shijie <shijie8@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

There are a few small issues with the timeout loop in
spi_nor_wait_till_ready():

 * The first operation should not be a reschedule; we should check the
   status register at least once to see if we're complete!

 * We should check the status register one last time after declaring the
   deadline has passed, to prevent a premature timeout erro (this is
   theoretically possible if we sleep for a long time after the previous
   status register check).

 * Add an error message, so it's obvious if we ever hit a timeout.

Signed-off-by: Brian Norris <computersforpeace@gmail.com>
---
 drivers/mtd/spi-nor/spi-nor.c | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
index 5e3a1d363895..d0dcaa1372ec 100644
--- a/drivers/mtd/spi-nor/spi-nor.c
+++ b/drivers/mtd/spi-nor/spi-nor.c
@@ -202,19 +202,24 @@ static int spi_nor_ready(struct spi_nor *nor)
 static int spi_nor_wait_till_ready(struct spi_nor *nor)
 {
 	unsigned long deadline;
-	int ret;
+	int timeout = 0, ret;
 
 	deadline = jiffies + MAX_READY_WAIT_JIFFIES;
 
-	do {
-		cond_resched();
+	while (!timeout) {
+		if (time_after_eq(jiffies, deadline))
+			timeout = 1;
 
 		ret = spi_nor_ready(nor);
 		if (ret < 0)
 			return ret;
 		if (ret)
 			return 0;
-	} while (!time_after_eq(jiffies, deadline));
+
+		cond_resched();
+	}
+
+	dev_err(nor->dev, "flash operation timed out\n");
 
 	return -ETIMEDOUT;
 }
-- 
1.9.1
