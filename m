Received: from mail-pa0-x236.google.com ([2607:f8b0:400e:c03::236])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1X9PTc-0006Tb-Fm
 for linux-mtd@lists.infradead.org; Tue, 22 Jul 2014 02:06:48 +0000
Received: by mail-pa0-f54.google.com with SMTP id fa1so10856041pad.27
 for <linux-mtd@lists.infradead.org>; Mon, 21 Jul 2014 19:06:27 -0700 (PDT)
From: Brian Norris <computersforpeace@gmail.com>
To: <linux-mtd@lists.infradead.org>
Subject: [PATCH] mtd: cfi_cmdset_0002: allow retry/timeout loop to exit
Date: Mon, 21 Jul 2014 19:06:19 -0700
Message-Id: <1405994779-19207-1-git-send-email-computersforpeace@gmail.com>
Cc: Bean Huo <beanhuo@outlook.com>, Brian Norris <computersforpeace@gmail.com>,
 Christian Riesch <christian.riesch@omicron.at>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The variable 'retries' is never modified, so if the reset operation
never is going to complete, we'll get stuck in an infinite loop.

It looks like the intention was to decrement 'retries' on every loop.
Untested.

Caught by Coverity.

Signed-off-by: Brian Norris <computersforpeace@gmail.com>
---
Untested

 drivers/mtd/chips/cfi_cmdset_0002.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/mtd/chips/cfi_cmdset_0002.c b/drivers/mtd/chips/cfi_cmdset_0002.c
index 5a4bfe33112a..6da141af9cba 100644
--- a/drivers/mtd/chips/cfi_cmdset_0002.c
+++ b/drivers/mtd/chips/cfi_cmdset_0002.c
@@ -2029,6 +2029,8 @@ static int cfi_amdstd_panic_wait(struct map_info *map, struct flchip *chip,
 
 			udelay(1);
 		}
+
+		retries--;
 	}
 
 	/* the chip never became ready */
-- 
1.9.1
