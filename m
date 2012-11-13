Received: from mail-da0-f49.google.com ([209.85.210.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1TYGgZ-0005lP-A4
 for linux-mtd@lists.infradead.org; Tue, 13 Nov 2012 13:37:55 +0000
Received: by mail-da0-f49.google.com with SMTP id q27so2938282daj.36
 for <linux-mtd@lists.infradead.org>; Tue, 13 Nov 2012 05:37:51 -0800 (PST)
From: Akinobu Mita <akinobu.mita@gmail.com>
To: linux-kernel@vger.kernel.org,
	akpm@linux-foundation.org
Subject: [PATCH v3 09/11] mtd: mtd_speedtest: use prandom_bytes
Date: Tue, 13 Nov 2012 22:37:08 +0900
Message-Id: <1352813830-4624-10-git-send-email-akinobu.mita@gmail.com>
In-Reply-To: <1352813830-4624-1-git-send-email-akinobu.mita@gmail.com>
References: <1352813830-4624-1-git-send-email-akinobu.mita@gmail.com>
Cc: linux-mtd@lists.infradead.org, David Woodhouse <dwmw2@infradead.org>,
 Akinobu Mita <akinobu.mita@gmail.com>, Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Use prandom_bytes instead of equivalent local function.

Signed-off-by: Akinobu Mita <akinobu.mita@gmail.com>
Cc: Artem Bityutskiy <dedekind1@gmail.com>
Cc: David Woodhouse <dwmw2@infradead.org>
Cc: linux-mtd@lists.infradead.org
---
* v3
- rename random32_get_bytes to prandom_bytes

 drivers/mtd/tests/mtd_speedtest.c | 9 +--------
 1 file changed, 1 insertion(+), 8 deletions(-)

diff --git a/drivers/mtd/tests/mtd_speedtest.c b/drivers/mtd/tests/mtd_speedtest.c
index 42b0f74..73e205d 100644
--- a/drivers/mtd/tests/mtd_speedtest.c
+++ b/drivers/mtd/tests/mtd_speedtest.c
@@ -49,13 +49,6 @@ static int pgcnt;
 static int goodebcnt;
 static struct timeval start, finish;
 
-static void set_random_data(unsigned char *buf, size_t len)
-{
-	size_t i;
-
-	for (i = 0; i < len; ++i)
-		buf[i] = random32();
-}
 
 static int erase_eraseblock(int ebnum)
 {
@@ -396,7 +389,7 @@ static int __init mtd_speedtest_init(void)
 		goto out;
 	}
 
-	set_random_data(iobuf, mtd->erasesize);
+	prandom_bytes(iobuf, mtd->erasesize);
 
 	err = scan_for_bad_eraseblocks();
 	if (err)
-- 
1.7.11.7
