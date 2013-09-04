Received: from mail-ie0-x230.google.com ([2607:f8b0:4001:c03::230])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VHHmN-0004mX-3a
 for linux-mtd@lists.infradead.org; Wed, 04 Sep 2013 18:26:12 +0000
Received: by mail-ie0-f176.google.com with SMTP id s9so1494668iec.35
 for <linux-mtd@lists.infradead.org>; Wed, 04 Sep 2013 11:25:47 -0700 (PDT)
From: Brian Norris <computersforpeace@gmail.com>
To: <linux-mtd@lists.infradead.org>
Subject: [PATCH 03/12] mtd: nandsim: don't call nand_default_bbt() directly
Date: Wed,  4 Sep 2013 11:25:17 -0700
Message-Id: <1378319126-24473-4-git-send-email-computersforpeace@gmail.com>
In-Reply-To: <1378319126-24473-1-git-send-email-computersforpeace@gmail.com>
References: <1378319126-24473-1-git-send-email-computersforpeace@gmail.com>
Cc: Brian Norris <computersforpeace@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

We want the default nand_chip.scan_bbt() function, so just use the
proper indirection.

Signed-off-by: Brian Norris <computersforpeace@gmail.com>
---
 drivers/mtd/nand/nandsim.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/nandsim.c b/drivers/mtd/nand/nandsim.c
index bdc1d15..fdcc5bd 100644
--- a/drivers/mtd/nand/nandsim.c
+++ b/drivers/mtd/nand/nandsim.c
@@ -2372,7 +2372,7 @@ static int __init ns_init_module(void)
 	if ((retval = init_nandsim(nsmtd)) != 0)
 		goto err_exit;
 
-	if ((retval = nand_default_bbt(nsmtd)) != 0)
+	if ((retval = chip->scan_bbt(nsmtd)) != 0)
 		goto err_exit;
 
 	if ((retval = parse_badblocks(nand, nsmtd)) != 0)
-- 
1.8.4
