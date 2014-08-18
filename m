Received: from [59.151.112.132] (helo=heian.cn.fujitsu.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XJChP-0002cj-S1
 for linux-mtd@lists.infradead.org; Mon, 18 Aug 2014 02:29:32 +0000
From: Dongsheng Yang <yangds.fnst@cn.fujitsu.com>
To: <computersforpeace@gmail.com>, <dwmw2@infradead.org>
Subject: [PATCH] mtdtest: Check bbt at index of (eb + 1) when we access 2 EBs.
Date: Mon, 18 Aug 2014 10:27:59 +0800
Message-ID: <1408328879-22771-1-git-send-email-yangds.fnst@cn.fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
Cc: Dongsheng Yang <yangds.fnst@cn.fujitsu.com>, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

When we want to access 2 eraseblocks, we need to make sure the
two eraseblocks both are not bad.

Signed-off-by: Dongsheng Yang <yangds.fnst@cn.fujitsu.com>
---
 drivers/mtd/tests/stresstest.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/tests/stresstest.c b/drivers/mtd/tests/stresstest.c
index c9d42cc..076d409 100644
--- a/drivers/mtd/tests/stresstest.c
+++ b/drivers/mtd/tests/stresstest.c
@@ -60,7 +60,7 @@ again:
 	eb = prandom_u32();
 	/* Read or write up 2 eraseblocks at a time - hence 'ebcnt - 1' */
 	eb %= (ebcnt - 1);
-	if (bbt[eb])
+	if (bbt[eb] || bbt[eb + 1])
 		goto again;
 	return eb;
 }
-- 
1.8.4.2
