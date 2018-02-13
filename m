Received: from mail-pg0-x241.google.com ([2607:f8b0:400e:c05::241])
 by bombadil.infradead.org with esmtps (Exim 4.89 #1 (Red Hat Linux))
 id 1elelT-0002On-Rb
 for linux-mtd@lists.infradead.org; Tue, 13 Feb 2018 17:53:13 +0000
Received: by mail-pg0-x241.google.com with SMTP id g12so378063pgs.0
 for <linux-mtd@lists.infradead.org>; Tue, 13 Feb 2018 09:53:01 -0800 (PST)
From: Antonio Cardace <anto.cardace@gmail.com>
To: boris.brezillon@free-electrons.com
Cc: linux-mtd@lists.infradead.org, andriy.shevchenko@linux.intel.com,
 Antonio Cardace <anto.cardace@gmail.com>
Subject: [PATCH] mtd: nftl: use %*ph to print small buffer
Date: Tue, 13 Feb 2018 17:52:45 +0000
Message-Id: <20180213175245.17703-1-anto.cardace@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Use %*ph format to print small buffer as hex string.

Suggested-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Signed-off-by: Antonio Cardace <anto.cardace@gmail.com>
---
What about this one?

 drivers/mtd/nftlmount.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/mtd/nftlmount.c b/drivers/mtd/nftlmount.c
index 184c8fbfe465..a8bdc1455b50 100644
--- a/drivers/mtd/nftlmount.c
+++ b/drivers/mtd/nftlmount.c
@@ -122,8 +122,7 @@ static int find_boot_record(struct NFTLrecord *nftl)
 		if (memcmp(buf, "ANAND", 6)) {
 			printk(KERN_NOTICE "ANAND header found at 0x%x in mtd%d, but went away on reread!\n",
 			       block * nftl->EraseSize, nftl->mbd.mtd->index);
-			printk(KERN_NOTICE "New data are: %02x %02x %02x %02x %02x %02x\n",
-			       buf[0], buf[1], buf[2], buf[3], buf[4], buf[5]);
+			printk(KERN_NOTICE "New data are: %6ph\n", buf);
 			continue;
 		}
 #endif
-- 
2.15.1.354.g95ec6b1b3
