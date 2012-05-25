Received: from metis.ext.pengutronix.de ([2001:6f8:1178:4:290:27ff:fe1d:cc33])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SXv2P-0003Fj-Vw
 for linux-mtd@lists.infradead.org; Fri, 25 May 2012 13:58:43 +0000
From: Sascha Hauer <s.hauer@pengutronix.de>
To: linux-mtd@lists.infradead.org
Subject: [PATCH] mtd stresstest: Fix random number generation
Date: Fri, 25 May 2012 15:58:29 +0200
Message-Id: <1337954309-18178-1-git-send-email-s.hauer@pengutronix.de>
Cc: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>,
 Sascha Hauer <s.hauer@pengutronix.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

the random number generation in the mtd stresstest was changed from a
homebrew generator to random32. random32 generates unsigned random
numbers, but the values are assigned to signed integers. This results
in negative offsets, eraseblocks and writesized. Fix it by using unsigned
integers for these variables instead.

This is broken since:

commit d9c04f2ccc6db3bc4b80e969af66d486c42e77b0
Author: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
Date:   Fri May 18 18:44:53 2012 +0300

    mtd: tests: use random32 instead of home-brewed generator

    This is a clean-up patch which removes the own pseudo-random numbers generator
    from the speed- and stress-tests and makes them use the 'random32()' generator
    instead.

    Signed-off-by: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>

Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
---
 drivers/mtd/tests/mtd_stresstest.c |    6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/mtd/tests/mtd_stresstest.c b/drivers/mtd/tests/mtd_stresstest.c
index 52ea178..cb268ce 100644
--- a/drivers/mtd/tests/mtd_stresstest.c
+++ b/drivers/mtd/tests/mtd_stresstest.c
@@ -52,7 +52,7 @@ static int pgcnt;
 
 static int rand_eb(void)
 {
-	int eb;
+	unsigned int eb;
 
 again:
 	eb = random32();
@@ -65,7 +65,7 @@ again:
 
 static int rand_offs(void)
 {
-	int offs;
+	unsigned int offs;
 
 	offs = random32();
 	offs %= bufsize;
@@ -74,7 +74,7 @@ static int rand_offs(void)
 
 static int rand_len(int offs)
 {
-	int len;
+	unsigned int len;
 
 	len = random32();
 	len %= (bufsize - offs);
-- 
1.7.10
