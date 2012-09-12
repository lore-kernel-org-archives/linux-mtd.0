Received: from mail-wg0-f49.google.com ([74.125.82.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1TBo4o-0003gV-Sk
 for linux-mtd@lists.infradead.org; Wed, 12 Sep 2012 14:38:04 +0000
Received: by wgbdt14 with SMTP id dt14so989448wgb.18
 for <linux-mtd@lists.infradead.org>; Wed, 12 Sep 2012 07:38:01 -0700 (PDT)
From: Richard Genoud <richard.genoud@gmail.com>
To: David Woodhouse <dwmw2@infradead.org>,
 Artem Bityutskiy <dedekind1@gmail.com>
Subject: [MTD-UTILS] io_update test: correct lseek parameters order
Date: Wed, 12 Sep 2012 16:37:54 +0200
Message-Id: <1347460674-3536-1-git-send-email-richard.genoud@gmail.com>
Cc: Richard Genoud <richard.genoud@gmail.com>, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

There's a typo in lseek parameters order.

But, due to the value of SEEK_SET, this commit doesn't introduce a
change.

Signed-off-by: Richard Genoud <richard.genoud@gmail.com>
---
 tests/ubi-tests/io_update.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/tests/ubi-tests/io_update.c b/tests/ubi-tests/io_update.c
index 0259446..e8f0986 100644
--- a/tests/ubi-tests/io_update.c
+++ b/tests/ubi-tests/io_update.c
@@ -158,7 +158,7 @@ static int test_update1(struct ubi_vol_info *vol_info, int leb_change)
 		}
 
 		/* Check data */
-		if ((ret = lseek(fd, SEEK_SET, 0)) != 0) {
+		if ((ret = lseek(fd, 0, SEEK_SET)) != 0) {
 			failed("lseek");
 			errmsg("cannot seek to 0");
 			goto close;
-- 
1.7.2.5
