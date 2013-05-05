Received: from mail-pb0-x22a.google.com ([2607:f8b0:400e:c01::22a])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UYuUi-0006al-Iq
 for linux-mtd@lists.infradead.org; Sun, 05 May 2013 08:40:33 +0000
Received: by mail-pb0-f42.google.com with SMTP id up7so1524201pbc.1
 for <linux-mtd@lists.infradead.org>; Sun, 05 May 2013 01:40:08 -0700 (PDT)
From: chenlibo.3@gmail.com
To: dwmw2@infradead.org
Subject: [PATCH] mtd: fix kfree bcm47xxsflash
Date: Sun,  5 May 2013 01:40:25 -0700
Message-Id: <1367743225-3484-1-git-send-email-libo.chen@huawei.com>
Cc: Libo Chen <libo.chen@huawei.com>, lizefan@huawei.com,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Libo Chen <libo.chen@huawei.com>

mtd is just member of bcm47xxsflash, so we should free bcm47xxsflash  not its member.

Signed-off-by: Libo Chen <libo.chen@huawei.com>
---
 drivers/mtd/devices/bcm47xxsflash.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/devices/bcm47xxsflash.c b/drivers/mtd/devices/bcm47xxsflash.c
index 9526628..4aa9141 100644
--- a/drivers/mtd/devices/bcm47xxsflash.c
+++ b/drivers/mtd/devices/bcm47xxsflash.c
@@ -76,7 +76,7 @@ static int bcm47xxsflash_bcma_probe(struct platform_device *pdev)
 	return 0;
 
 err_dev_reg:
-	kfree(&b47s->mtd);
+	kfree(b47s);
 out:
 	return err;
 }
-- 
1.8.1.2
