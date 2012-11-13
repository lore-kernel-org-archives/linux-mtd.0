Received: from mail-da0-f49.google.com ([209.85.210.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1TYGgd-0005pt-RL
 for linux-mtd@lists.infradead.org; Tue, 13 Nov 2012 13:37:58 +0000
Received: by mail-da0-f49.google.com with SMTP id q27so2938345daj.36
 for <linux-mtd@lists.infradead.org>; Tue, 13 Nov 2012 05:37:55 -0800 (PST)
From: Akinobu Mita <akinobu.mita@gmail.com>
To: linux-kernel@vger.kernel.org,
	akpm@linux-foundation.org
Subject: [PATCH v3 11/11] mtd: mtd_stresstest: use prandom_bytes()
Date: Tue, 13 Nov 2012 22:37:10 +0900
Message-Id: <1352813830-4624-12-git-send-email-akinobu.mita@gmail.com>
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

Signed-off-by: Akinobu Mita <akinobu.mita@gmail.com>
Cc: Artem Bityutskiy <dedekind1@gmail.com>
Cc: David Woodhouse <dwmw2@infradead.org>
Cc: linux-mtd@lists.infradead.org
---
* v3
- rename random32_get_bytes to prandom_bytes

 drivers/mtd/tests/mtd_stresstest.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/mtd/tests/mtd_stresstest.c b/drivers/mtd/tests/mtd_stresstest.c
index cb268ce..3edc79e 100644
--- a/drivers/mtd/tests/mtd_stresstest.c
+++ b/drivers/mtd/tests/mtd_stresstest.c
@@ -282,8 +282,7 @@ static int __init mtd_stresstest_init(void)
 	}
 	for (i = 0; i < ebcnt; i++)
 		offsets[i] = mtd->erasesize;
-	for (i = 0; i < bufsize; i++)
-		writebuf[i] = random32();
+	prandom_bytes(writebuf, bufsize);
 
 	err = scan_for_bad_eraseblocks();
 	if (err)
-- 
1.7.11.7
