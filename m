Received: from mail-pd0-x22e.google.com ([2607:f8b0:400e:c02::22e])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XrO4A-0004Tp-3U
 for linux-mtd@lists.infradead.org; Thu, 20 Nov 2014 09:30:18 +0000
Received: by mail-pd0-f174.google.com with SMTP id w10so2720249pde.5
 for <linux-mtd@lists.infradead.org>; Thu, 20 Nov 2014 01:29:55 -0800 (PST)
From: Brian Norris <computersforpeace@gmail.com>
To: <linux-mtd@lists.infradead.org>
Subject: [PATCH] mtd: oobtest: correct printf() format specifier for 'size_t'
Date: Thu, 20 Nov 2014 01:29:43 -0800
Message-Id: <1416475783-27380-1-git-send-email-computersforpeace@gmail.com>
Cc: Brian Norris <computersforpeace@gmail.com>, Sekhar Nori <nsekhar@ti.com>,
 Roger Quadros <rogerq@ti.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Fixes warning:

   drivers/mtd/tests/oobtest.c: In function 'memcmpshow':
   drivers/mtd/tests/oobtest.c:129: warning: format '%x' expects type 'unsigned int', but argument 3 has type 'size_t'

Signed-off-by: Brian Norris <computersforpeace@gmail.com>
Cc: Roger Quadros <rogerq@ti.com>
Cc: Sekhar Nori <nsekhar@ti.com>
---
I'll roll this into the change I just merged

 drivers/mtd/tests/oobtest.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/tests/oobtest.c b/drivers/mtd/tests/oobtest.c
index 1fd2cdad85f0..5e061186eab1 100644
--- a/drivers/mtd/tests/oobtest.c
+++ b/drivers/mtd/tests/oobtest.c
@@ -132,7 +132,7 @@ static size_t memcmpshow(loff_t addr, const void *cs, const void *ct, size_t cou
 	for (su1 = cs, su2 = ct; 0 < count; ++su1, ++su2, count--, i++) {
 		res = *su1 ^ *su2;
 		if (res) {
-			pr_info("error @addr[0x%lx:0x%x] 0x%x -> 0x%x diff 0x%x\n",
+			pr_info("error @addr[0x%lx:0x%zx] 0x%x -> 0x%x diff 0x%x\n",
 				(unsigned long)addr, i, *su1, *su2, res);
 			bitflips += hweight8(res);
 		}
-- 
2.2.0.rc2
