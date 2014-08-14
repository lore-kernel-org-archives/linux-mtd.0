Received: from mail-pa0-x22c.google.com ([2607:f8b0:400e:c03::22c])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XHoe6-0002DA-PB
 for linux-mtd@lists.infradead.org; Thu, 14 Aug 2014 06:36:24 +0000
Received: by mail-pa0-f44.google.com with SMTP id eu11so1078549pac.3
 for <linux-mtd@lists.infradead.org>; Wed, 13 Aug 2014 23:36:01 -0700 (PDT)
From: Brian Norris <computersforpeace@gmail.com>
To: <linux-mtd@lists.infradead.org>
Subject: [PATCH] mtd: cfi_cmdset_0002: check return code for get_chip()
Date: Wed, 13 Aug 2014 23:35:24 -0700
Message-Id: <1407998124-3166-1-git-send-email-computersforpeace@gmail.com>
Cc: Brian Norris <computersforpeace@gmail.com>,
 Christian Riesch <christian.riesch@omicron.at>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Untested

Coverity CID 1230633

Signed-off-by: Brian Norris <computersforpeace@gmail.com>
Cc: Christian Riesch <christian.riesch@omicron.at>
---
 drivers/mtd/chips/cfi_cmdset_0002.c |    4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/mtd/chips/cfi_cmdset_0002.c b/drivers/mtd/chips/cfi_cmdset_0002.c
index 6da141af9cba..c50d8cf0f60d 100644
--- a/drivers/mtd/chips/cfi_cmdset_0002.c
+++ b/drivers/mtd/chips/cfi_cmdset_0002.c
@@ -1434,6 +1434,10 @@ static int cfi_amdstd_otp_walk(struct mtd_info *mtd, loff_t from, size_t len,
 
 				mutex_lock(&chip->mutex);
 				ret = get_chip(map, chip, base, FL_LOCKING);
+				if (ret) {
+					mutex_unlock(&chip->mutex);
+					return ret;
+				}
 
 				/* Enter lock register command */
 				cfi_send_gen_cmd(0xAA, cfi->addr_unlock1,
-- 
1.7.9.5
