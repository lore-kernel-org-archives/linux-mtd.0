Received: from mail-pb0-x22a.google.com ([2607:f8b0:400e:c01::22a])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1V9y2M-0006w2-DZ
 for linux-mtd@lists.infradead.org; Thu, 15 Aug 2013 13:56:27 +0000
Received: by mail-pb0-f42.google.com with SMTP id un15so745384pbc.15
 for <linux-mtd@lists.infradead.org>; Thu, 15 Aug 2013 06:56:04 -0700 (PDT)
From: Akinobu Mita <akinobu.mita@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH -next 2/4] mtd: tests: return -EIO when mtdtest_read() failed
 to read requested bytes
Date: Thu, 15 Aug 2013 22:55:07 +0900
Message-Id: <1376574909-7507-3-git-send-email-akinobu.mita@gmail.com>
In-Reply-To: <1376574909-7507-1-git-send-email-akinobu.mita@gmail.com>
References: <1376574909-7507-1-git-send-email-akinobu.mita@gmail.com>
Cc: Artem Bityutskiy <dedekind1@gmail.com>,
 Vikram Narayanan <vikram186@gmail.com>, Akinobu Mita <akinobu.mita@gmail.com>,
 Adrian Hunter <adrian.hunter@intel.com>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

mtdtest_read() returns -EINVAL if the number of bytes actually read
is smaller than the number of bytes requested.  But mtdtest_write()
returns -EIO in the similar error condition and returning -EIO seems
more appropriate than -EINVAL in this case.

Signed-off-by: Akinobu Mita <akinobu.mita@gmail.com>
Cc: Brian Norris <computersforpeace@gmail.com>
Cc: Vikram Narayanan <vikram186@gmail.com>
Cc: Adrian Hunter <adrian.hunter@intel.com>
Cc: Artem Bityutskiy <dedekind1@gmail.com>
Cc: David Woodhouse <dwmw2@infradead.org>
Cc: linux-mtd@lists.infradead.org
---
 drivers/mtd/tests/mtd_test.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/tests/mtd_test.c b/drivers/mtd/tests/mtd_test.c
index 9e63896..bda8c4d 100644
--- a/drivers/mtd/tests/mtd_test.c
+++ b/drivers/mtd/tests/mtd_test.c
@@ -91,7 +91,7 @@ int mtdtest_read(struct mtd_info *mtd, loff_t addr, size_t size, void *buf)
 	if (mtd_is_bitflip(err))
 		err = 0;
 	if (!err && read != size)
-		err = -EINVAL;
+		err = -EIO;
 
 	return err;
 }
-- 
1.8.3.1
