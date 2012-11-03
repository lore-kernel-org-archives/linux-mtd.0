Received: from mail-pa0-f49.google.com ([209.85.220.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1TUftm-0007dU-Jo
 for linux-mtd@lists.infradead.org; Sat, 03 Nov 2012 15:44:39 +0000
Received: by mail-pa0-f49.google.com with SMTP id bi5so2835547pad.36
 for <linux-mtd@lists.infradead.org>; Sat, 03 Nov 2012 08:44:38 -0700 (PDT)
From: Akinobu Mita <akinobu.mita@gmail.com>
To: linux-kernel@vger.kernel.org,
	akpm@linux-foundation.org
Subject: [PATCH v2 11/11] mtd: mtd_stresstest: use random32_get_bytes()
Date: Sun,  4 Nov 2012 00:43:42 +0900
Message-Id: <1351957422-23243-12-git-send-email-akinobu.mita@gmail.com>
In-Reply-To: <1351957422-23243-1-git-send-email-akinobu.mita@gmail.com>
References: <1351957422-23243-1-git-send-email-akinobu.mita@gmail.com>
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

Signed-off-by: Akinobu Mita <akinobu.mita@gmail.com>
Cc: Artem Bityutskiy <dedekind1@gmail.com>
Cc: David Woodhouse <dwmw2@infradead.org>
Cc: linux-mtd@lists.infradead.org
---
new patch from v2

 drivers/mtd/tests/mtd_stresstest.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/mtd/tests/mtd_stresstest.c b/drivers/mtd/tests/mtd_stresstest.c
index cb268ce..158d30f 100644
--- a/drivers/mtd/tests/mtd_stresstest.c
+++ b/drivers/mtd/tests/mtd_stresstest.c
@@ -282,8 +282,7 @@ static int __init mtd_stresstest_init(void)
 	}
 	for (i = 0; i < ebcnt; i++)
 		offsets[i] = mtd->erasesize;
-	for (i = 0; i < bufsize; i++)
-		writebuf[i] = random32();
+	random32_get_bytes(writebuf, bufsize);
 
 	err = scan_for_bad_eraseblocks();
 	if (err)
-- 
1.7.11.7
