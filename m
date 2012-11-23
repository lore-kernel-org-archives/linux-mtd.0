Received: from mail-de.keymile.com ([195.8.104.1])
 by merlin.infradead.org with smtp (Exim 4.76 #1 (Red Hat Linux))
 id 1TbuI6-0005eT-Nt
 for linux-mtd@lists.infradead.org; Fri, 23 Nov 2012 14:31:42 +0000
From: Christian Herzig <christian.herzig@keymile.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH] mtd: tests/read: initialize buffer for whole next page
Date: Fri, 23 Nov 2012 15:31:26 +0100
Message-Id: <1353681086-9877-1-git-send-email-christian.herzig@keymile.com>
Cc: Christian Herzig <christian.herzig@keymile.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

fix: do block-buffer initialize for the whole next page to zero.

Signed-off-by: Christian Herzig <christian.herzig@keymile.com>
---
 drivers/mtd/tests/mtd_readtest.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/drivers/mtd/tests/mtd_readtest.c b/drivers/mtd/tests/mtd_readtest.c
index 121aba1..fbb74cb 100644
--- a/drivers/mtd/tests/mtd_readtest.c
+++ b/drivers/mtd/tests/mtd_readtest.c
@@ -51,7 +51,7 @@ static int read_eraseblock_by_page(int ebnum)
 	void *oobbuf = iobuf1;
 
 	for (i = 0; i < pgcnt; i++) {
-		memset(buf, 0 , pgcnt);
+		memset(buf, 0 , pgsize);
 		ret = mtd_read(mtd, addr, pgsize, &read, buf);
 		if (ret == -EUCLEAN)
 			ret = 0;
-- 
1.7.1
